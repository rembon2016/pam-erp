<?php

declare(strict_types=1);

namespace App\Http\Controllers\Api\Finance\MasterData;

use App\Functions\ResponseJson;
use App\Http\Controllers\Controller;
use App\Models\Operation\Master\Unit;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

final class ApiUnitController extends Controller
{
    public function getUnitForFilters(): JsonResponse
    {
        $units = Unit::select('unit_id', 'unit_name', 'description', 'status')
            ->whereNotIn('status', ['2', '3'])
            ->paginate(10);

        return ResponseJson::success(code: 200, message: __('crud.fetched', ['name' => 'Unit']), data: $units);
    }
}
