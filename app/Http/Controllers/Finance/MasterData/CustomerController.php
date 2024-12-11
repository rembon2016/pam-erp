<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\MasterData;

use App\Functions\Utility;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use App\Http\Controllers\Controller;
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

        return view('pages.finance.master-data.customer.form', compact('data'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
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
    public function update(Request $request, string $id)
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
