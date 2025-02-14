<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\MasterData;

use Illuminate\View\View;
use App\Functions\Utility;
use Illuminate\Support\Arr;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use Barryvdh\DomPDF\Facade\Pdf;
use App\Models\Finance\Currency;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\Finance\AccountGroup;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Http\RedirectResponse;
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
    public function __construct(
        protected CustomerService $customerService
    ) {}

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $customerTypes = Arr::sort(
            array: array_merge(CustomerType::COLLECT, array(CustomerType::OFFICE))
        );

        return view('pages.finance.master-data.customer.index', compact('customerTypes'));
    }

    public function list()
    {
        $user = auth()->user();

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

                    $html = '<ul class="d-flex flex-column" style="list-style-type:none; margin:0;padding:0; row-gap: 5px;">';

                    foreach ($item->customerTypes as $customerType) {
                        $customerTypeName = empty($customerType) ? 'N/A' : e($customerType->name);
                        $html .= '<li><span class="badge badge-soft-success">'.$customerTypeName.'</span></li>';
                    }

                    $html .= '</ul>';

                    return $html;
                })
                ->addColumn('action', function ($item) use ($user) {
                    if ($user?->canany([
                        'finance.edit_master_customer',
                        'finance.delete_master_customer'
                    ])) {
                        $utilities = [];
                        if ($user?->can('finance.edit_master_customer')) $utilities['edit'] = route('finance.master-data.customer.edit', $item->id);
                        if ($user?->can('finance.delete_master_customer')) $utilities['delete'] = route('finance.master-data.customer.destroy', $item->id);

                        return Utility::generateTableActions($utilities);
                    }

                    return '';
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

        $currencies = Currency::select('id', 'currency_code', 'currency_name')
            ->orderBy('currency_name', 'asc')
            ->get();

        $countries = Countries::select('country_id', 'country_name')
            ->orderBy('country_name', 'asc')
            ->get();

        $accountGroups = $this->getTransformedAccountGroups();

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

        if (!$customerResponse->success) {
            return back()->with('toastError', $customerResponse->message);
        }

        $data = [
            'page' => 'Edit Customer',
            'action' => route('finance.master-data.customer.update', $id),
            'method' => 'PUT',
        ];

        $customerTypes = Arr::sort(CustomerType::COLLECT);
        $customerAddressTypes = CustomerAddress::COLLECT;

        $currencies = Currency::select('id', 'currency_code', 'currency_name')
            ->orderBy('currency_name')
            ->get();

        $countries = Countries::select('country_id', 'country_name')
            ->orderBy('country_name')
            ->get();

        $accountGroups = $this->getTransformedAccountGroups($customerResponse->data->load('customerAccounts')->customerAccounts->pluck('chart_of_account_id'));

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

    private function getTransformedAccountGroups(?Collection $selectedAccountIds = null): Collection
    {
        return DB::table('finance.chart_of_accounts as coa')
            ->select([
                'coa.id', 'coa.account_number', 'coa.account_name',
                'sag.id as sub_group_id', 'sag.name as sub_group_name', 'sag.code as sub_group_code',
                'ag.id as group_id', 'ag.name as group_name', 'ag.code as group_code'
            ])
            ->join('finance.sub_account_groups as sag', 'coa.sub_account_group_id', '=', 'sag.id')
            ->join('finance.account_groups as ag', 'sag.account_group_id', '=', 'ag.id')
            ->orderBy('ag.code')
            ->orderBy('sag.code')
            ->orderBy('coa.account_number')
            ->get()
            ->groupBy('group_id')
            ->map(fn($group) => [
                'id' => $group->first()->group_id,
                'name' => $group->first()->group_name,
                'code' => $group->first()->group_code,
                'subAccountGroups' => $group->groupBy('sub_group_id')
                    ->map(fn($subGroup) => [
                        'id' => $subGroup->first()->sub_group_id,
                        'name' => $subGroup->first()->sub_group_name,
                        'code' => $subGroup->first()->sub_group_code,
                        'chartOfAccounts' => $subGroup->map(fn($item) => [
                            'id' => $item->id,
                            'account_number' => $item->account_number,
                            'account_name' => $item->account_name,
                            'selected' => $selectedAccountIds ? $selectedAccountIds->contains($item->id) : false
                        ])->values()
                    ])->values()
            ])->values();
    }
}
