<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\MasterData;

use Illuminate\View\View;
use App\Functions\Utility;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use App\Models\Operation\Master\CustomerBilling;
use App\Models\Operation\Master\CustomerGroup;
use App\Models\Operation\Master\Countries;
use App\Models\Operation\Master\CustomerType;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Http\RedirectResponse;
use Yajra\DataTables\Facades\DataTables;
use App\Exports\MasterData\CustomerForBillingExport;
use App\Service\Finance\MasterData\CustomerForBillingService;
use App\Http\Requests\Finance\MasterData\CustomerForBilling\StoreCustomerForBillingRequest;
use App\Http\Requests\Finance\MasterData\CustomerForBilling\UpdateCustomerForBillingRequest;

final class CustomerForBillingController extends Controller
{

/**
 * Constructs a new instance of the CurrencyController class, injecting the CustomerForBillingService dependency.
 *
 * @param CustomerForBillingService $customerService The service instance to be used by this controller.
 */
    public function __construct(
        protected CustomerForBillingService $customerService,
    ) {}

    /**
     * Display a listing of the resource.
     */
    public function index(): View
    {
        return view('pages.finance.master-data.customerforbilling.index');
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
            $customers = CustomerBilling::orderBy('customer_name', 'ASC')->get();
            return DataTables::of($customers)
                ->addIndexColumn()
                ->editColumn('country', function ($item) {
                    return $item->countries?->country_name ?? "";
                })
                ->editColumn('types', function ($item) {
                    return $item->customer_type_detail?->customer_type_name ?? "";
                })
                ->addColumn('action', function ($item) {
                    return Utility::generateTableActions([
                        'edit' => route('finance.master-data.customerforbilling.edit', $item->customer_id),
                        'delete' => route('finance.master-data.customerforbilling.destroy', $item->customer_id),
                    ]);
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
            'page' => 'Add Billing Customer',
            'action' => route('finance.master-data.customerforbilling.store'),
            'method' => 'POST',
         ];

        $customer = new CustomerBilling;
        $customergroup = CustomerGroup::where("status","!=",3)->get();
        $countries = Countries::where("status","!=",3)->get();
        $customer_type = CustomerType::where("status","!=",3)->get();

         return view('pages.finance.master-data.customerforbilling.form', compact('data', 'customer','customergroup','countries','customer_type'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreCustomerForBillingRequest $request): RedirectResponse
    {
        $response = $this->customerService->createCustomer($request->validated());

        return $response->success
            ? to_route('finance.master-data.customerforbilling.index')
                ->with('toastSuccess', $response->message)
            : back()
                ->with('toastError', $response->message)->withInput();
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id): View|RedirectResponse
    {
        $customer = CustomerBilling::where('customer_id', $id)->first();
        $customergroup = CustomerGroup::where("status","!=",3)->get();
        $countries = Countries::where("status","!=",3)->get();
        $customer_type = CustomerType::where("status","!=",3)->get();


        if (is_null($customer)) return to_route('finance.master-data.customerforbilling.index')->with(
            'toastError',
            __('crud.not_found', ['name' => 'Customer For Billing'])
        );

        $data = [
            'page' => 'Edit Billing Customer',
            'action' => route('finance.master-data.customerforbilling.update', $id),
            'method' => 'PUT',
         ];

         return view('pages.finance.master-data.currency.form', compact('data', 'customer','customergroup','countries','customer_type'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateCustomerForBillingRequest $request, string $id): RedirectResponse
    {
        $response = $this->customerService->updateCustomer($request->validated() + ['id' => $id]);

        return $response->success
            ? to_route('finance.master-data.customerforbilling.index')
                ->with('toastSuccess', $response->message)
            : back()
                ->with('toastError', $response->message)->withInput();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id): RedirectResponse
    {
        $response = $this->customerService->deleteCustomer(['id' => $id]);

        return $response->success
            ? to_route('finance.master-data.customerforbilling.index')
                ->with('toastSuccess', $response->message)
            : back()
                ->with('toastError', $response->message);
    }


    /**
     * Export the list of currencies to a CSV file.
     *
     * This method generates a CSV file containing the list of currencies ordered by currency code in ascending order.
     * The generated CSV file is then downloaded with the filename "list_currency_{timestamp}.csv".
     */
    public function exportCsv()
    {
        $file_name = 'list_customer_for_billing_' . time() . '.csv';
        return Excel::download(new CustomerForBillingExport, $file_name);
    }
}
