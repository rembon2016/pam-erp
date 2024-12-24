<?php

declare(strict_types=1);

namespace App\Http\Controllers\Api\Finance\MasterData;

use App\Functions\ResponseJson;
use App\Http\Controllers\Controller;
use App\Service\Finance\MasterData\CustomerService;
use Illuminate\Http\Request;

final class ApiCustomerController extends Controller
{
    public function __construct(
        protected CustomerService $customerService
    ) {}

    /**
     * Display a listing of the resource.
     */
    public function getBillingCustomers()
    {
        $customerResponse = $this->customerService->getBillingCustomers();

        return ResponseJson::success(code: 200, message: __('crud.fetched', ['name' => 'Customer']), data: $customerResponse);
    }
}
