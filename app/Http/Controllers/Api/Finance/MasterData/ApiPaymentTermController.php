<?php

declare(strict_types=1);

namespace App\Http\Controllers\Api\Finance\MasterData;

use App\Functions\ResponseJson;
use App\Http\Controllers\Controller;
use App\Models\Finance\PaymentMethod;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

final class ApiPaymentTermController extends Controller
{
    public function getPaymentTermForFilters(): JsonResponse
    {
        $paymentTerms = PaymentMethod::paginate(10);

        return ResponseJson::success(code: 200, message: __('crud.fetched', ['name' => 'Payment Term']), data: $paymentTerms);
    }
}
