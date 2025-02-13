<?php

declare(strict_types=1);

namespace App\Http\Controllers\Api\Finance\MasterData;

use App\Functions\ResponseJson;
use App\Http\Controllers\Controller;
use App\Models\Finance\Customer;
use App\Service\Finance\MasterData\CustomerService;
use Illuminate\Http\JsonResponse;

final class ApiCustomerController extends Controller
{
    public function __construct(
        protected CustomerService $customerService
    ) {}

    public function getCustomers(): JsonResponse
    {
        $customers = $this->customerService->getCustomers()->data->customers;

        return ResponseJson::success(code: 200, message: __('crud.fetched', ['name' => 'Customer']), data: $customers);
    }

    public function getCustomerForFilters(): JsonResponse
    {
        $customers = Customer::select('id', 'customer_code', 'customer_name')->paginate(50);

        return ResponseJson::success(code: 200, message: __('crud.fetched', ['name' => 'Customer']), data: $customers);
    }

    /**
     * Display a listing of the resource.
     */
    public function getBillingCustomers()
    {
        $customerResponse = $this->customerService->getBillingCustomers(
            columns: [],
            filters: request()->query()
        );

        return ResponseJson::success(code: 200, message: __('crud.fetched', ['name' => 'Customer']), data: $customerResponse);
    }
}
