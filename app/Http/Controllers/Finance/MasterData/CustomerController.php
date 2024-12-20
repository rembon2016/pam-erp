<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\MasterData;

use Illuminate\View\View;
use App\Functions\Utility;
use Illuminate\Support\Arr;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use Barryvdh\DomPDF\Facade\Pdf;
use App\Models\Finance\Currency;
use App\Models\Finance\Customer;
use App\Functions\ObjectResponse;
use App\Http\Controllers\Controller;
use App\Models\Finance\AccountGroup;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Http\RedirectResponse;
use App\Models\Finance\ChartOfAccount;
use App\Constants\Customer\CustomerType;
use Yajra\DataTables\Facades\DataTables;
use App\Exports\MasterData\CustomerExport;
use App\Models\Operation\Master\Countries;
use App\Constants\Customer\CustomerAddress;
use App\Service\Finance\MasterData\CustomerService;
use App\Http\Requests\Finance\MasterData\Customer\StoreCustomerRequest;
use App\Http\Requests\Finance\MasterData\Customer\UpdateCustomerRequest;

final class CustomerController extends Controller
{
    public function __construct (
        protected CustomerService $customerService
    ) {}

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $customers = $this->customerService->getCustomers()->get();
        $customerTypes = Arr::sort(CustomerType::COLLECT);

        return view('pages.finance.master-data.customer.index', compact('customers', 'customerTypes'));
    }

    public function list()
    {
        if (request()->ajax()) {
            return DataTables::of($this->customerService->getCustomers(request()->query()))
                ->addIndexColumn()
                ->addColumn('customer_type', function ($item) {

                    $html = '<ul style="list-style-type:none; margin:0;padding:0;">';

                    foreach ($item->customerTypes as $customerType) {
                        $customerTypeName = empty($customerType) ? 'N/A' : e($customerType->name);
                        $html .= '<li><span class="badge bg-success">' . $customerTypeName . '</span></li>';
                    }

                    $html .= '</ul>';

                    return $html;
                })
                ->addColumn('contact_person', function ($item) {
                    return '-';
                })
                ->addColumn('contact_no', function ($item) {
                    return '-';
                })
                ->addColumn('bank_account_no', function ($item) {
                    return '-';
                })
                ->addColumn('bank_name', function ($item) {
                    return '-';
                })
                ->addColumn('action', function ($item) {
                    return Utility::generateTableActions([
                        'edit' => route('finance.master-data.customer.edit', $item->id),
                        'delete' => route('finance.master-data.customer.destroy', $item->id),
                    ]);
                })
                ->rawColumns(['customer_type', 'action'])
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
        $file_name = 'list_customer_' . time() . '.pdf';

        return $pdf->download($file_name);
    }

    public function exportExcel()
    {
        $file_name = 'list_customer_' . time() . '.xlsx';
        return Excel::download(new CustomerExport, $file_name);
    }

    public function exportCsv()
    {
        $file_name = 'list_customer_' . time() . '.csv';
        return Excel::download(new CustomerExport, $file_name);
    }
}
