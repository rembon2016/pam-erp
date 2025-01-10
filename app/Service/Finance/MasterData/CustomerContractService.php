<?php

declare(strict_types=1);

namespace App\Service\Finance\MasterData;

use App\Functions\ObjectResponse;
use App\Functions\Utility;
use App\Models\Finance\CustomerContract;
use App\Traits\HandleUploadedFile;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;

final class CustomerContractService
{
    use HandleUploadedFile;

    public function __construct(
        protected CustomerService $customerService
    ) {}

    public function getCustomerContracts($filters = []): Collection
    {
        return CustomerContract::when(! empty($filters['customer']), function ($query) use ($filters) {
            return $query->where('customer_id', $filters['customer']);
        })->orderBy('contract_end', 'desc')->get();
    }

    public function getCustomerContractById(string $id): object
    {
        $data = CustomerContract::where('id', $id)->first();

        return ! is_null($data)
            ? ObjectResponse::success(__('crud.fetched', ['name' => 'Customer Contract']), Response::HTTP_OK, $data)
            : ObjectResponse::error(__('crud.not_found', ['name' => 'Customer Contract']), Response::HTTP_NOT_FOUND);
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

            $charges = collect($dto['charges']);
            unset($dto['charges']);

            if (! empty($dto['contract_file'])) {
                $dto['contract_file'] = $this->uploadFile(
                    file: $dto['contract_file'],
                    folderPrefix: CustomerContract::FOLDER_NAME
                );
            }

            $createdCustomerContract = CustomerContract::create($dto);
            $charges->each(fn ($charge) => $createdCustomerContract->charges()->create($charge));

            DB::commit();

            return ObjectResponse::success(
                __('crud.created', ['name' => 'Customer Contract']),
                Response::HTTP_CREATED,
                $createdCustomerContract
            );
        } catch (\Throwable $th) {
            DB::rollBack();

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
            $charges = collect($dto['charges']);
            $existingContractCharge = $charges->filter(fn ($charge) => ! empty($charge['customer_contract_charge_id']))->pluck('customer_contract_charge_id');
            unset($dto['charges']);

            if (! empty($dto['contract_file'])) {
                if (! is_null($getCustomerContractResponse->data->contract_file)) {
                    $dto['contract_file'] = $this->syncUploadFile(
                        file: $dto['contract_file'],
                        old_file_name: $getCustomerContractResponse->data->contract_file,
                        folderPrefix: CustomerContract::FOLDER_NAME
                    );
                } else {
                    $dto['contract_file'] = $this->uploadFile(
                        file: $dto['contract_file'],
                        folderPrefix: CustomerContract::FOLDER_NAME
                    );
                }
            } else {
                $dto['contract_file'] = $getCustomerContractResponse->data->contract_file;
            }

            $getCustomerContractResponse->data->update($dto);

            // Sync Customer Contract Charges
            $getCustomerContractResponse->data->charges()->whereNotIn('id', $existingContractCharge->toArray())->delete();
            $charges->each(function ($charge) use ($getCustomerContractResponse) {
                if (! empty($charge['customer_contract_charge_id'])) {
                    $customer_contract_charge_id = $charge['customer_contract_charge_id'];
                    unset($charge['customer_contract_charge_id']);
                    $getCustomerContractResponse->data->charges()->where('id', $customer_contract_charge_id)->update($charge);
                } else {
                    $getCustomerContractResponse->data->charges()->create($charge);
                }
            });

            DB::commit();

            return ObjectResponse::success(
                __('crud.updated', ['name' => 'Customer Contract']),
                Response::HTTP_OK,
                $getCustomerContractResponse->data
            );
        } catch (\Throwable $th) {
            DB::rollBack();

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
}
