<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\MasterData;

use App\Constants\Customer\CustomerAddress;
use App\Constants\Customer\CustomerType;
use App\Exports\MasterData\CustomerExport;
use App\Functions\ResponseJson;
use App\Functions\Utility;
use App\Http\Controllers\Controller;
use App\Http\Requests\Finance\MasterData\Customer\StoreCustomerRequest;
use App\Http\Requests\Finance\MasterData\Customer\UpdateCustomerRequest;
use App\Models\Finance\AccountGroup;
use App\Models\Finance\Currency;
use App\Models\Operation\Master\Countries;
use App\Service\Finance\MasterData\CustomerService;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Response;
use Illuminate\Support\Arr;
use Illuminate\View\View;
use Maatwebsite\Excel\Facades\Excel;
use Yajra\DataTables\Facades\DataTables;

final class CustomerController extends Controller
{
    public function __construct(
        protected CustomerService $customerService
    ) {}

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $customers = $this->customerService->getCustomers()->data->customers;
        $customerTypes = Arr::sort(
            array: array_merge(CustomerType::COLLECT, array(CustomerType::OFFICE))
        );

        return view('pages.finance.master-data.customer.index', compact('customers', 'customerTypes'));
    }

    public function list()
    {
        $customerResponse = $this->customerService->getCustomers(request()->query());
        if (request()->ajax()) {
            return DataTables::of($customerResponse->data->customerDatatables)
                ->addIndexColumn()
                ->with([
                    'draw' => request()->query('draw'),
                    'recordsTotal' => $customerResponse->data->totalRecords,
                    'recordsFiltered' => $customerResponse->data->filteredRecords,
                ])
                ->addColumn('customer_type', function ($item) {

                    $html = '<ul style="list-style-type:none; margin:0;padding:0;">';

                    foreach ($item->customerTypes as $customerType) {
                        $customerTypeName = empty($customerType) ? 'N/A' : e($customerType->name);
                        $html .= '<li><span class="badge bg-success">'.$customerTypeName.'</span></li>';
                    }

                    $html .= '</ul>';

                    return $html;
                })
                ->addColumn('action', function ($item) {
                    return Utility::generateTableActions([
                        'edit' => route('finance.master-data.customer.edit', $item->id),
                        'delete' => route('finance.master-data.customer.destroy', $item->id),
                    ]);
                })
                ->rawColumns(['customer_type', 'action'])
                ->setTotalRecords($customerResponse->data->totalRecords)
                ->setFilteredRecords($customerResponse->data->filteredRecords)
                ->skipPaging()
                ->make(true);
        }

        return ResponseJson::error(
            Response::HTTP_UNAUTHORIZED,
            'Access Unauthorized',
        );
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $data = [
            'page' => 'Add Customer',
            'action' => route('finance.master-data.customer.store'),
            'method' => 'POST',
        ];

        $customerTypes = Arr::sort(CustomerType::COLLECT);
        $customerAddressTypes = CustomerAddress::COLLECT;
        $currencies = Currency::orderBy('currency_name', 'asc')->get();
        $countries = Countries::orderBy('country_name', 'asc')->get();
        $accountGroups = AccountGroup::orderBy('code', 'asc')->get();

        return view('pages.finance.master-data.customer.form', compact('data', 'customerTypes', 'currencies', 'customerAddressTypes', 'countries', 'accountGroups'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreCustomerRequest $request)
    {
        $customerResponse = $this->customerService->createCustomer(dto: $request->validated());

        return $customerResponse->success
            ? to_route('finance.master-data.customer.index')
                ->with('toastSuccess', $customerResponse->message)
            : back()
                ->with('toastError', $customerResponse->message);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id): RedirectResponse|View
    {
        $customerResponse = $this->customerService->getCustomerById(id: $id);

        $data = [
            'page' => 'Edit Customer',
            'action' => route('finance.master-data.customer.update', $id),
            'method' => 'PUT',
        ];

        $customerTypes = Arr::sort(CustomerType::COLLECT);
        $customerAddressTypes = CustomerAddress::COLLECT;
        $currencies = Currency::orderBy('currency_name', 'asc')->get();
        $countries = Countries::orderBy('country_name', 'asc')->get();
        $accountGroups = AccountGroup::orderBy('code', 'asc')->get();

        return $customerResponse->success
            ? view('pages.finance.master-data.customer.form', [
                'data' => $data,
                'customer' => $customerResponse->data,
                'customerTypes' => $customerTypes,
                'customerAddressTypes' => $customerAddressTypes,
                'currencies' => $currencies,
                'countries' => $countries,
                'accountGroups' => $accountGroups,
            ])
            : back()->with('toastError', $customerResponse->message);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateCustomerRequest $request, string $id)
    {
        $customerResponse = $this->customerService->updateCustomer(dto: $request->validated(), id: $id);

        return $customerResponse->success
            ? to_route('finance.master-data.customer.index')
                ->with('toastSuccess', $customerResponse->message)
            : back()
                ->with('toastError', $customerResponse->message);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $customerResponse = $this->customerService->deleteCustomer(id: $id);

        return $customerResponse->success
            ? to_route('finance.master-data.customer.index')
                ->with('toastSuccess', $customerResponse->message)
            : back()
                ->with('toastError', $customerResponse->message);
    }

    public function exportPdf()
    {
        $data = $this->customerService->getCustomers();
        $pdf = Pdf::loadView('exports.pdf.customer', compact('data'));
        $file_name = 'list_customer_'.time().'.pdf';

        return $pdf->download($file_name);
    }

    public function exportExcel()
    {
        $file_name = 'list_customer_'.time().'.xlsx';

        return Excel::download(new CustomerExport, $file_name);
    }

    public function exportCsv()
    {
        $file_name = 'list_customer_'.time().'.csv';

        return Excel::download(new CustomerExport, $file_name);
    }
}
