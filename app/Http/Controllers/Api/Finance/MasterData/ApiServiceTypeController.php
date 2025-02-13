<?php

declare(strict_types=1);

namespace App\Http\Controllers\Api\Finance\MasterData;

use App\Functions\ResponseJson;
use App\Http\Controllers\Controller;
use App\Models\Finance\ServiceType;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

final class ApiServiceTypeController extends Controller
{
    public function getServiceTypeForFilters(): JsonResponse
    {
        $serviceTypes = ServiceType::select('id', 'service_code', 'service_name')->paginate(10);

        return ResponseJson::success(code: 200, message: __('crud.fetched', ['name' => 'Service Type']), data: $serviceTypes);
    }
}
