<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\MasterData;

use App\Service\Finance\MasterData\CustomerService;
use Illuminate\View\View;
use App\Functions\Utility;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use Barryvdh\DomPDF\Facade\Pdf;
use App\Models\Finance\Customer;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use App\Models\Operation\Master\Unit;
use Illuminate\Http\RedirectResponse;
use App\Models\Finance\CustomerContract;
use Yajra\DataTables\Facades\DataTables;
use App\Service\Finance\MasterData\ChargeService;
use App\Exports\MasterData\CustomerContractExport;
use App\Service\Finance\MasterData\CurrencyService;
use App\Service\Finance\MasterData\CustomerContractService;
use App\Http\Requests\Finance\MasterData\CustomerContract\StoreCustomerContractRequest;
use App\Http\Requests\Finance\MasterData\CustomerContract\UpdateCustomerContractRequest;

final class CustomerContractController extends Controller
{
    public function __construct(
        protected CustomerContractService $customerContractService,
        protected ChargeService $chargeService,
        protected CurrencyService $currencyService,
        protected CustomerService $customerService
    ) {}

    /**
     * Display a listing of the resource.
     */
    public function index(): View
    {
        return view('pages.finance.master-data.customer-contract.index');
    }

    /**
     * Retrieves a list of all roles and returns a JSON response for use in a data table.
     *
     * This method fetches all the roles from the database and returns a JSON response that can be used to populate a data table. The response includes an action column that contains a "View" button for each role.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function list(): JsonResponse
    {
        if (request()->ajax()) {
            return DataTables::of($this->customerContractService->getCustomerContracts())
                ->addIndexColumn()
                ->addColumn('action', function ($item) {
                    return Utility::generateTableActions([
                        // 'edit' => route('finance.master-data.customer-contract.edit', $item->id),
                        // 'delete' => route('finance.master-data.customer-contract.destroy', $item->id),
                        'download' => '/',
                    ]);
                })
                ->addColumn('customer_code', function ($item) {
                    return $item->customer?->customer_code;
                })
                ->editColumn('customer_id', function ($item) {
                    return $item->customer?->customer_name;
                })
                ->editColumn('contract_start', function ($item) {
                    return $item->contract_start?->format("d/m/Y");
                })
                ->editColumn('contract_end', function ($item) {
                    return $item->contract_end?->format("d/m/Y");
                })
                ->rawColumns(['action'])
                ->toJson();
        }

        return ResponseJson::error(
            Response::HTTP_UNAUTHORIZED,
            'Access Unauthorized',
        );
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
        $customers = $this->customerService->getCustomers();
        $charges = $this->chargeService->getCharges();
        $currencies = $this->currencyService->getCurrencies();
        $units = Unit::orderBy('unit_name', 'asc')->get();

         return view('pages.finance.master-data.customer-contract.form', compact('data', 'customer_contract', 'customers', 'charges', 'currencies', 'units'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreCustomerContractRequest $request): RedirectResponse
    {
        $requestDTO = $request->validated();
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
        if (!$getCustomerContractResponse->success) return to_route('finance.master-data.customer-contract.index')->with('toastError', $getCustomerContractResponse->message);

        $customers = $this->customerService->getCustomers();
        $charges = $this->chargeService->getCharges();
        $currencies = $this->currencyService->getCurrencies();
        $units = Unit::orderBy('unit_name', 'asc')->get();

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
        $file_name = 'list_customer_contract_' . time() . '.pdf';

        return $pdf->download($file_name);
    }

    public function exportExcel()
    {
        $file_name = 'list_customer_contract_' . time() . '.xlsx';
        return Excel::download(new CustomerContractExport, $file_name);
    }

    public function exportCsv()
    {
        $file_name = 'list_customer_contract_' . time() . '.csv';
        return Excel::download(new CustomerContractExport, $file_name);
    }
}