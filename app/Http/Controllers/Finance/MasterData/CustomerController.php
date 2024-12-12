<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\MasterData;

use App\Constants\Customer\CustomerAddress;
use App\Constants\Customer\CustomerType;
use App\Functions\ObjectResponse;
use App\Functions\Utility;
use App\Models\Finance\Customer;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use App\Http\Controllers\Controller;
use App\Http\Requests\Finance\MasterData\Customer\StoreCustomerRequest;
use App\Http\Requests\Finance\MasterData\Customer\UpdateCustomerRequest;
use App\Models\Finance\AccountGroup;
use App\Models\Finance\ChartOfAccount;
use App\Models\Finance\Currency;
use App\Models\Operation\Master\Countries;
use App\Service\Finance\MasterData\CustomerService;
use Yajra\DataTables\Facades\DataTables;

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
        return view('pages.finance.master-data.customer.index');
    }

    public function list()
    {
        if (request()->ajax()) {
            return DataTables::of($this->customerService->getCustomers())
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

         $customerTypes = CustomerType::COLLECT;
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
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateCustomerRequest $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
