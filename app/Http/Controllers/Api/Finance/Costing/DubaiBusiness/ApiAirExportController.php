<?php

declare(strict_types=1);

namespace App\Http\Controllers\Api\Finance\Costing\DubaiBusiness;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use App\Service\Finance\Costing\Dxb\FilterService as DxbFilterService;
use App\Http\Controllers\Controller;

final class ApiAirExportController extends Controller
{
    public function __construct(protected DxbFilterService $dxbFilterService) {}

    public function getAirData(?string $column)
    {
        if ($column == 'carrier') {
            $data = [
                'message' => __('crud.fetched', ['name' => 'Carrier']),
                'data' => $this->dxbFilterService->getCarrier([
                    'job_order_type' => 'AIREXPORT',
                ]),
            ];
        } else if ($column == 'mawb_number') {
            $data = [
                'message' => __('crud.fetched', ['name' => 'Mawb Number']),
                'data' => $this->dxbFilterService->getMawb([
                    'job_order_type' => 'AIREXPORT',
                ]),
            ];
        }

        return ResponseJson::success(
            code: Response::HTTP_OK,
            message: $data['message'],
            data: $data['data'],
        );
    }
}
