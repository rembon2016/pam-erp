<?php

declare(strict_types=1);

namespace App\Http\Controllers\Api\Finance\MasterData;

use App\Functions\ResponseJson;
use App\Http\Controllers\Controller;
use App\Models\Finance\Currency;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

final class ApiCurrencyController extends Controller
{
    public function getCurrencyForFilters(): JsonResponse
    {
        $currencies = Currency::select('id', 'currency_code', 'currency_name')->paginate(10);

        return ResponseJson::success(code: 200, message: __('crud.fetched', ['name' => 'Currency']), data: $currencies);
    }
}
