<?php

declare(strict_types=1);

namespace App\Service\Finance\MasterData;

use App\Functions\Utility;
use Illuminate\Http\Response;
use App\Functions\ObjectResponse;
use App\Models\Finance\Charge;
use App\Models\Finance\Customer;
use App\Traits\HandleUploadedFile;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use App\Models\Finance\CustomerContract;
use App\Models\Finance\CustomerContractCharge;
use App\Models\Finance\CustomerContractChargeDetail;
use App\Models\Finance\CustomerContractDocument;
use App\Models\History;
use App\Traits\Eloquent\Historable;
use PhpOffice\PhpWord\TemplateProcessor;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Contracts\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection as SupportCollection;
use App\Models\Finance\CustomerContractService as EloquentCustomerContractService;

final class CustomerContractService
{
    use HandleUploadedFile, Historable;

    public function __construct(
        protected CustomerService $customerService
    ) {}

    public function getCustomerContracts($filters = [], bool $get_data = true): Collection|Builder
    {
        $data = CustomerContract::with('histories')->when(! empty($filters['customer']), function ($query) use ($filters) {
            return $query->where('customer_id', $filters['customer']);
        })->orderBy('contract_end', 'desc');

        if ($get_data) $data = $data->get();

        return $data;
    }

    public function getCustomerContractById(string $id, ?array $select = ['*']): object
    {
        $data = CustomerContract::select($select)->with('services', 'services.portOrigin', 'services.portDestination', 'services.charges', 'services.charges.rates', 'histories')->where('id', $id)->first();

        return ! is_null($data)
            ? ObjectResponse::success(__('crud.fetched', ['name' => 'Customer Contract']), Response::HTTP_OK, $data)
            : ObjectResponse::error(__('crud.not_found', ['name' => 'Customer Contract']), Response::HTTP_NOT_FOUND);
    }

    public function getCustomerContractHistories(string $id): SupportCollection
    {
        $customerContract = $this->getCustomerContractById(id: $id);
        $histories = $customerContract->data->histories;

        return collect(Arr::sortDesc($histories->pluck('payload'), fn ($payload) => $payload['updated_at']))
            ->map(function ($history, $key) use ($id, $histories) {
                return array_merge($history, [
                    'history_id' => $histories[$key]->id,
                    'customer' => Customer::where('id', $history['customer_id'])->first(),
                    'customer_contract_charge' => $this->getRelatableHistoryData(
                        model_props: [
                            'class' => CustomerContractCharge::class,
                            'primary_value' => $id,
                            'relation_key' => 'customer_contract_id'
                        ],
                        with_mapping: function ($payload) {
                            return array_merge($payload, [
                                'charge' => Charge::where('id', $payload['charge_id'])->first(),
                            ]);
                        }
                    ),
                ]);
            });
    }

    private function getRelatableHistoryData(?array $model_props = [], mixed $with_mapping = null)
    {
        $histories = History::where('modelable_type', $model_props['class'])
            ->get()
            ->pluck('payload')
            ->filter(function ($item) use ($model_props) {
                return $item[$model_props['relation_key']] == $model_props['primary_value'];
            });

        if (!empty($with_mapping)) {
            $histories = $histories->map($with_mapping);
        }

        return $histories;
    }

    public function createCustomerContract(array $dto): object
    {
        DB::beginTransaction();
        try {
            $getCustomerResponse = $this->customerService->getCustomerById($dto['customer_id']);
            if (! $getCustomerResponse->success) {
                return $getCustomerResponse;
            }

            $dto['contract_no'] = CustomerContract::generateUniqueCodeByCustomer($getCustomerResponse->data);

            $services = collect($dto['services']);
            $contract_files = !empty($dto['contract_file']) ? $dto['contract_file'] : [];
            unset($dto['services'], $dto['contract_file']);

            $createdCustomerContract = CustomerContract::create($dto);

            if (count($contract_files) > 0) {
                collect($contract_files)->each(function ($file) use ($createdCustomerContract) {
                    $file_name = $this->uploadFile(
                        file: $file,
                        folderPrefix: CustomerContract::FOLDER_NAME,
                        is_encrypted: false
                    );

                    $createdCustomerContract->documents()->create([
                        'contract_file' => $file_name
                    ]);
                });
            }

            // Create Customer Contract Services, Charges and Rates
            $services->each(function ($service) use ($createdCustomerContract) {
                $charges = collect($service['charges']);
                unset($service['charges']);

                $createdCustomerContractService = $createdCustomerContract->services()->create($service);

                // Create Customer Contract Charges and Rates
                $charges->each(function ($charge) use ($createdCustomerContract, $createdCustomerContractService) {
                    $rates = collect($charge['rates']);
                    $charge['customer_contract_id'] = $createdCustomerContract->id;
                    unset($charge['rates']);

                    $createdCustomerContractCharge = $createdCustomerContractService->charges()->create($charge);

                    // Create Customer Contract Charge Rates
                    $rates->each(function ($rate) use ($createdCustomerContract, $createdCustomerContractCharge) {
                        $rate['customer_contract_id'] = $createdCustomerContract->id;
                        $createdCustomerContractCharge->rates()->create($rate);
                    });
                });
            });

            DB::commit();

            return ObjectResponse::success(
                __('crud.created', ['name' => 'Customer Contract']),
                Response::HTTP_CREATED,
                $createdCustomerContract
            );
        } catch (\Throwable $th) {
            DB::rollBack();
            dd($th);

            return ObjectResponse::error(
                __('crud.error_create', ['name' => 'Customer Contract']),
                Response::HTTP_INTERNAL_SERVER_ERROR,
                $th->getTrace()
            );
        }
    }

    public function updateCustomerContract(string $id, array $dto): object
    {
        $getCustomerContractResponse = $this->getCustomerContractById($id);
        if (! $getCustomerContractResponse->success) {
            return $getCustomerContractResponse;
        }

        DB::beginTransaction();
        try {
            $services = collect($dto['services']);
            $contract_files = !empty($dto['contract_file']) ? $dto['contract_file'] : [];
            $existingContractService = $services->filter(fn ($charge) => ! empty($charge['customer_contract_service_id']))->pluck('customer_contract_service_id');
            unset($dto['services'], $dto['contract_file']);

            $getCustomerContractResponse->data->update($dto);

            $parentHistoryId = $this->recordHistory([
                'modelable_type' => $getCustomerContractResponse->data::class,
                'modelable_id' => $getCustomerContractResponse->data->id,
                'payload' => $getCustomerContractResponse->data->getOriginal(),
            ]);

            if (count($contract_files) > 0) {
                collect($contract_files)->each(function ($file) use ($getCustomerContractResponse, $parentHistoryId) {
                    $file_name = $this->uploadFile(
                        file: $file,
                        folderPrefix: CustomerContract::FOLDER_NAME,
                        is_encrypted: false
                    );

                    $customerContractDocument = $getCustomerContractResponse->data->documents()->create([
                        'contract_file' => $file_name
                    ]);

                    $this->recordHistory([
                        'modelable_type' => CustomerContractDocument::class,
                        'modelable_id' => $customerContractDocument->id,
                        'payload' => $customerContractDocument->getOriginal(),
                        'parent_id' => $parentHistoryId
                    ]);
                });
            } else {
                if ($getCustomerContractResponse->data->documents->count() > 0) {
                    foreach ($getCustomerContractResponse->data->documents as $document) {
                        $this->recordHistory([
                            'modelable_type' => CustomerContractDocument::class,
                            'modelable_id' => $document->id,
                            'payload' => $document->getOriginal(),
                            'parent_id' => $parentHistoryId
                        ]);
                    }
                }
            }

            // Sync Customer Contract Services, Charges and Rates
            $getCustomerContractResponse->data->services()->whereNotIn('id', $existingContractService->toArray())->delete();
            $services->each(function ($service) use ($getCustomerContractResponse, $parentHistoryId) {
                $charges = collect($service['charges']);
                $existingContractCharge = $charges->filter(fn ($charge) => ! empty($charge['customer_contract_charge_id']))->pluck('customer_contract_charge_id');
                unset($service['charges']);

                // Update or Create Customer Contract Service
                if (!empty($service['customer_contract_service_id'])) {
                    $customer_contract_service_id = $service['customer_contract_service_id'];
                    unset($service['customer_contract_service_id']);

                    $contractService = $getCustomerContractResponse->data->services()->where('id', $customer_contract_service_id)->first();

                    if ($contractService) {
                        $contractService->fill($service)->save();

                        $this->recordHistory([
                            'modelable_type' => EloquentCustomerContractService::class,
                            'modelable_id' => $contractService->id,
                            'payload' => $contractService->getOriginal(),
                            'parent_id' => $parentHistoryId
                        ]);
                    }
                } else {
                    $contractService = $getCustomerContractResponse->data->services()->create($service);
                    $customer_contract_service_id = $contractService->id;
                    $this->recordHistory([
                        'modelable_type' => EloquentCustomerContractService::class,
                        'modelable_id' => $customer_contract_service_id,
                        'payload' => $contractService,
                        'parent_id' => $parentHistoryId
                    ]);
                }

                // Sync Customer Contract Charges and Rates
                $contractService->charges()->whereNotIn('id', $existingContractCharge->toArray())->delete();
                $charges->each(function ($charge) use ($getCustomerContractResponse, $contractService, $parentHistoryId) {
                    $charge['customer_contract_id'] = $getCustomerContractResponse->data->id;
                    $rates = collect($charge['rates']);
                    $existingChargeDetail = $rates->filter(fn ($rate) => ! empty($rate['customer_contract_charge_detail_id']))->pluck('customer_contract_charge_detail_id');
                    unset($charge['rates']);

                    // Update or Create Customer Contract Charge
                    if (!empty($charge['customer_contract_charge_id'])) {
                        $customer_contract_charge_id = $charge['customer_contract_charge_id'];
                        unset($charge['customer_contract_charge_id']);

                        $contractCharge = CustomerContractCharge::where('id', $customer_contract_charge_id)->first();

                        if ($contractCharge) {
                            $contractCharge->fill($charge)->save();
                            $this->recordHistory([
                                'modelable_type' => CustomerContractCharge::class,
                                'modelable_id' => $contractCharge->id,
                                'payload' => $contractCharge->getOriginal(),
                                'parent_id' => $parentHistoryId
                            ]);
                        }
                    } else {
                        $contractCharge = $contractService->charges()->create($charge);
                        $customer_contract_charge_id = $contractCharge->id;
                        $this->recordHistory([
                            'modelable_type' => CustomerContractCharge::class,
                            'modelable_id' => $customer_contract_charge_id,
                            'payload' => $contractCharge,
                            'parent_id' => $parentHistoryId
                        ]);
                    }


                    // Sync Customer Contract Charge Rates/Details
                    $contractCharge->rates()->where('customer_contract_charge_id', $customer_contract_charge_id)->whereNotIn('id', $existingChargeDetail->toArray())->delete();
                    $rates->each(function ($rate) use ($contractCharge, $getCustomerContractResponse, $parentHistoryId) {
                        $rate['customer_contract_id'] = $getCustomerContractResponse->data->id;

                        // Update or Create Customer Contrac Charge Rate/Detail
                        if (!empty($rate['customer_contract_charge_detail_id'])) {
                            $customer_contract_charge_detail_id = $rate['customer_contract_charge_detail_id'];
                            unset($rate['customer_contract_charge_detail_id']);

                            $customer_contract_charge_detail = $contractCharge
                                ->rates()->where('id', $customer_contract_charge_detail_id)->first();

                            if ($customer_contract_charge_detail) {
                                $customer_contract_charge_detail->fill($rate)->save();
                                $this->recordHistory([
                                    'modelable_type' => $customer_contract_charge_detail::class,
                                    'modelable_id' => $customer_contract_charge_detail->id,
                                    'payload' => $customer_contract_charge_detail->getOriginal(),
                                    'parent_id' => $parentHistoryId
                                ]);
                            }

                        } else {
                            $contract_charge_detail = $contractCharge->rates()->create($rate);
                            $this->recordHistory([
                                'modelable_type' => CustomerContractChargeDetail::class,
                                'modelable_id' => $contract_charge_detail->id,
                                'payload' => $contract_charge_detail,
                                'parent_id' => $parentHistoryId
                            ]);
                        }
                    });
                });
            });

            DB::commit();

            return ObjectResponse::success(
                __('crud.updated', ['name' => 'Customer Contract']),
                Response::HTTP_OK,
                $getCustomerContractResponse->data
            );
        } catch (\Throwable $th) {
            DB::rollBack();
            dd($th);

            return ObjectResponse::error(
                __('crud.error_update', ['name' => 'Customer Contract']),
                Response::HTTP_INTERNAL_SERVER_ERROR,
                $th->getTrace()
            );
        }
    }

    public function deleteCustomerContract(string $id): object
    {
        $getCustomerContractResponse = $this->getCustomerContractById($id);
        if (! $getCustomerContractResponse->success) {
            return $getCustomerContractResponse;
        }

        try {
            $getCustomerContractResponse->data->delete();

            return ObjectResponse::success(
                __('crud.deleted', ['name' => 'Customer Contract']),
                Response::HTTP_OK,
            );
        } catch (\Throwable $th) {
            return ObjectResponse::error(
                __('crud.error_delete', ['name' => 'Customer Contract']),
                Response::HTTP_INTERNAL_SERVER_ERROR,
                $th->getTrace()
            );
        }
    }

    public function download(string $id)
    {
        $getCustomerContractResponse = $this->getCustomerContractById($id);
        if (! $getCustomerContractResponse->success) {
            throw new \Exception($getCustomerContractResponse->message);
        }

        try {
            // Preparing Data to be replaced in Quotation Template
            $formatted_contract_no = str_replace("/", "-", $getCustomerContractResponse->data->contract_no);
            $templateData = [
                'contract_no' => $getCustomerContractResponse->data->contract_no,
                'customer_name' => $getCustomerContractResponse->data->customer->customer_name,
                'contract_date' => $getCustomerContractResponse->data->contract_start?->format('d-M-Y'),
                'attn_name' => $getCustomerContractResponse->data->customer->customer_name,
            ];

            // Load Quotation Template
            $template_file_name = "template-quotation.docx";
            $templatePath = storage_path("templates/{$template_file_name}");
            $templateProcessor = new TemplateProcessor($templatePath);

            // Replacing Placeholder Text with Template Data
            foreach ($templateData as $key => $value) {
                $templateProcessor->setValue($key, $value);
            }

            $tariff_data = $this->generateTariffPlaceholder($getCustomerContractResponse->data);
            $templateProcessor->cloneRowAndSetValues('description', $tariff_data);

            // Save Quotation Result
            $word_file_name = "Quotation-{$formatted_contract_no}.docx";
            $output_directory = storage_path("app/public/" . CustomerContract::FOLDER_QUOTATION);
            if (!File::exists($output_directory)) {
                File::makeDirectory($output_directory, 0755, true);
            }

            $word_final_path =  $output_directory . "/{$word_file_name}";
            $templateProcessor->saveAs($word_final_path);

            return response()->download($word_final_path);
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    private function generateTariffPlaceholder(CustomerContract $customerContract): array
    {
        $tariffs = [];

        foreach ($customerContract->charges as $charge) {
            foreach ($charge->rates as $rate) {
                $qty = 1;
                if ($rate->unit_code == 'KG') {
                    $qty = "{$rate->from}-{$rate->to}";
                } elseif ($rate->unit_code == 'CONTAINER') {
                    $qty = $rate->container_type;
                }

                $tariffs[] = [
                    'description' => $charge->charge->charge_name,
                    'price' => $rate->rate,
                    'curr' => $customerContract->currency->currency_code,
                    'calc' => $rate->unit_code,
                    'qty' => $qty,
                ];
            }
        }

        return $tariffs;
    }
}
