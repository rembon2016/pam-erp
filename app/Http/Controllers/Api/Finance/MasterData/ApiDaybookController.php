<?php

declare(strict_types=1);

namespace App\Http\Controllers\Api\Finance\MasterData;

use App\Functions\ResponseJson;
use App\Http\Controllers\Controller;
use App\Models\Finance\Daybook;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

final class ApiDaybookController extends Controller
{
    public function getDaybookForFilters(): JsonResponse
    {
        $daybooks = Daybook::select('id', 'code', 'name')->paginate(10);

        return ResponseJson::success(code: 200, message: __('crud.fetched', ['name' => $daybooks]), data: $daybooks);
    }
}
