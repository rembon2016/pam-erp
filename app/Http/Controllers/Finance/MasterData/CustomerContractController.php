<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\MasterData;

use Illuminate\View\View;
use App\Functions\Utility;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use App\Models\Operation\Master\Unit;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Storage;
use App\Models\Finance\CustomerContract;
use Yajra\DataTables\Facades\DataTables;
use App\Models\Finance\CustomerContractDocument;
use App\Service\Finance\MasterData\ChargeService;
use App\Exports\MasterData\CustomerContractExport;
use App\Service\Finance\MasterData\CountryService;
use App\Service\Finance\MasterData\CurrencyService;
use App\Service\Finance\MasterData\CustomerService;
use App\Models\Finance\CustomerContractChargeDetail;
use App\Service\Finance\MasterData\CustomerContractService;
use App\Http\Requests\Finance\MasterData\CustomerContract\StoreCustomerContractRequest;
use App\Http\Requests\Finance\MasterData\CustomerContract\UpdateCustomerContractRequest;

final class CustomerContractController extends Controller
{
    public function __construct(
        protected CustomerContractService $customerContractService,
        protected ChargeService $chargeService,
        protected CurrencyService $currencyService,
        protected CustomerService $customerService,
        protected CountryService $countryService
    ) {}

    /**
     * Display a listing of the resource.
     */
    public function index(): View
    {
        $customers = $this->customerService->getCustomers()->get();

        return view('pages.finance.master-data.customer-contract.index', compact('customers'));
    }

    /**
     * Display a listing of the resource history.
     *
     * @param string $id
     * @return View
     */
    public function history(string $id): View
    {
        return view('pages.finance.master-data.customer-contract.history', compact('id'));
    }

    /**
     * Retrieves a list of all roles and returns a JSON response for use in a data table.
     *
     * This method fetches all the roles from the database and returns a JSON response that can be used to populate a data table. The response includes an action column that contains a "View" button for each role.
     */
    public function list(): JsonResponse
    {
        if (request()->ajax()) {
            return DataTables::of($this->customerContractService->getCustomerContracts(
                filters: request()->query(),
                get_data: false
            ))
            ->addIndexColumn()
            ->addColumn('action', function ($item) {
                return Utility::generateTableActions([
                    'detail' => route('finance.master-data.customer-contract.detail', $item->id),
                    'edit' => route('finance.master-data.customer-contract.edit', $item->id),
                    'download-link' => route('finance.master-data.customer-contract.download', $item->id),
                    'history' => route('finance.master-data.customer-contract.history', $item->id),
                ]);
            })
            ->editColumn('contract_no', function ($item) {
                $is_expired = now()->gt($item->contract_end);
                $contract_no = $is_expired
                    ? "<span class='badge badge-danger badge-lg'>{$item->contract_no}</span>"
                    : $item->contract_no;

                return $contract_no;
            })
            ->addColumn('customer_code', function ($item) {
                return $item->customer?->customer_code;
            })
            ->editColumn('customer_id', function ($item) {
                return $item->customer?->customer_name;
            })
            ->editColumn('contract_start', function ($item) {
                return $item->contract_start?->format('d/m/Y');
            })
            ->editColumn('contract_end', function ($item) {
                return $item->contract_end?->format('d/m/Y');
            })
            ->rawColumns(['action', 'contract_no'])
            ->toJson();
        }

        return ResponseJson::error(
            Response::HTTP_UNAUTHORIZED,
            'Access Unauthorized',
        );
    }

    /**
     * Retrieves a list of all customer contract history and returns a JSON response for use in a data table.
     *
     * @param string $id
     * @return JsonResponse
     */
    public function listHistory(string $id): JsonResponse
    {
        if (request()->ajax()) {
            return DataTables::of($this->customerContractService->getCustomerContractHistories($id))
            ->addIndexColumn()
            ->addColumn('action', function ($item) use ($id) {
                return Utility::generateTableActions([
                    'detail' => route('finance.master-data.customer-contract.history-detail', ['id' => $id, 'history' => $item['id']])
                ]);
            })
            ->editColumn('contract_no', function ($item) {
                $is_expired = now()->gt($item['contract_end']);
                $contract_no = $is_expired
                    ? "<span class='badge badge-danger badge-lg'>{$item['contract_no']}</span>"
                    : $item['contract_no'];

                return $contract_no;
            })
            ->addColumn('customer_code', function ($item) {
                return $item['customer']['customer_code'];
            })
            ->editColumn('customer_id', function ($item) {
                return $item['customer']['customer_name'];
            })
            ->editColumn('contract_start', function ($item) {
                return \Carbon\Carbon::parse($item['contract_start'])->format('d/m/Y');
            })
            ->editColumn('contract_end', function ($item) {
                return \Carbon\Carbon::parse($item['contract_end'])->format('d/m/Y');
            })
            ->addColumn('updated_date', function ($item) {
                return \Carbon\Carbon::parse($item['updated_at'])->format('d/m/Y H:i:s');
            })
            ->rawColumns(['action', 'contract_no'])
            ->toJson();
        }

        return ResponseJson::error(
            Response::HTTP_UNAUTHORIZED,
            'Access Unauthorized',
        );
    }

    public function show(string $id)
    {
        $getCustomerContractResponse = $this->customerContractService->getCustomerContractById($id);
        return $getCustomerContractResponse->success
            ? view('pages.finance.master-data.customer-contract.detail', [
                'customer_contract' => $getCustomerContractResponse->data,
            ]) : to_route('finance.master-data.customer-contract.index')->with('toastError', $getCustomerContractResponse->message);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(): View
    {
        $data = [
            'page' => 'Add Customer Contract',
            'action' => route('finance.master-data.customer-contract.store'),
            'method' => 'POST',
        ];

        $customer_contract = new CustomerContract;
        $customers = $this->customerService->getCustomers([
            'is_exists_customer' => true
        ])->get();
        $charges = $this->chargeService->getCharges([
            'is_agreed_rate' => true,
        ]);
        $currencies = $this->currencyService->getCurrencies();
        $units = Unit::orderBy('unit_name', 'asc')->get();
        $services = CustomerContract::SERVICES;
        $countries = $this->countryService->getCountries();
        $container_types = CustomerContractChargeDetail::CONTAINER_TYPES;

        return view('pages.finance.master-data.customer-contract.form', compact('data', 'customer_contract', 'customers', 'charges', 'currencies', 'units', 'services', 'countries', 'container_types'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreCustomerContractRequest $request): RedirectResponse
    {
        $requestDTO = $request->validated();
        $requestDTO['unit_id'] = Unit::select('unit_id')->where('unit_name', 'KG')->first()?->unit_id;
        $createCustomerContractResponse = $this->customerContractService->createCustomerContract(
            dto: $requestDTO
        );

        return $createCustomerContractResponse->success
            ? to_route('finance.master-data.customer-contract.index')->with('toastSuccess', $createCustomerContractResponse->message)
            : back()->with('toastError', $createCustomerContractResponse->message)->withInput();
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id): View|RedirectResponse
    {
        $getCustomerContractResponse = $this->customerContractService->getCustomerContractById($id);
        if (! $getCustomerContractResponse->success) {
            return to_route('finance.master-data.customer-contract.index')->with('toastError', $getCustomerContractResponse->message);
        }

        $customers = $this->customerService->getCustomers([
            'is_exists_customer' => true
        ])->get();
        $charges = $this->chargeService->getCharges([
            'is_agreed_rate' => true,
        ]);
        $currencies = $this->currencyService->getCurrencies();
        $units = Unit::orderBy('unit_name', 'asc')->get();
        $services = CustomerContract::SERVICES;
        $countries = $this->countryService->getCountries();
        $container_types = CustomerContractChargeDetail::CONTAINER_TYPES;

        $data = [
            'page' => 'Edit Customer Contract',
            'action' => route('finance.master-data.customer-contract.update', $id),
            'method' => 'PUT',
        ];

        return view('pages.finance.master-data.customer-contract.form', [
            'data' => $data,
            'customer_contract' => $getCustomerContractResponse->data,
            'customers' => $customers,
            'charges' => $charges,
            'currencies' => $currencies,
            'units' => $units,
            'services' => $services,
            'countries' => $countries,
            'container_types' => $container_types
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateCustomerContractRequest $request, string $id): RedirectResponse
    {
        $requestDTO = $request->validated();
        $updateCustomerContractResponse = $this->customerContractService->updateCustomerContract(
            id: $id,
            dto: $requestDTO
        );

        return $updateCustomerContractResponse->success
            ? to_route('finance.master-data.customer-contract.index')->with('toastSuccess', $updateCustomerContractResponse->message)
            : back()->with('toastError', $updateCustomerContractResponse->message)->withInput();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id): RedirectResponse
    {
        $deleteCustomerContractResponse = $this->customerContractService->deleteCustomerContract(
            id: $id,
        );

        return to_route('finance.master-data.customer-contract.index')->with(
            $deleteCustomerContractResponse->success ? 'toastSuccess' : 'toastError',
            $deleteCustomerContractResponse->message
        );
    }

    public function exportPdf()
    {
        $data = $this->customerContractService->getCustomerContracts();
        $pdf = Pdf::loadView('exports.pdf.customer-contract', compact('data'));
        $file_name = 'list_customer_contract_'.time().'.pdf';

        return $pdf->download($file_name);
    }

    public function exportExcel()
    {
        $file_name = 'list_customer_contract_'.time().'.xlsx';

        return Excel::download(new CustomerContractExport, $file_name);
    }

    public function exportCsv()
    {
        $file_name = 'list_customer_contract_'.time().'.csv';

        return Excel::download(new CustomerContractExport, $file_name);
    }

    public function deleteDocument(string $document_id): JsonResponse
    {
        try {
            $document = CustomerContractDocument::findOrFail($document_id);
            $document->delete();

            $folderPrefix = CustomerContract::FOLDER_NAME;

            if (Storage::disk('public')->exists("{$folderPrefix}/".$document->contract_file)) {
                Storage::disk('public')->delete("{$folderPrefix}/".$document->contract_file);
            }

            return ResponseJson::success(
                code: Response::HTTP_OK,
                message: __('crud.deleted', ['name' => 'Customer Contract Document'])
            );
        } catch (\Throwable $th) {
            return ResponseJson::error(
                code: Response::HTTP_INTERNAL_SERVER_ERROR,
                message: __('crud.error_delete', ['name' => 'Customer Contract Document']),
                errors: $th->getTraceAsString()
            );
        }
    }

    public function download(string $id)
    {
        try {
            return $this->customerContractService->download($id);
        } catch (\Throwable $th) {
            dd($th);
            return to_route('finance.master-data.customer-contract.index')->with('toastError', $th->getMessage());
        }
    }
}
