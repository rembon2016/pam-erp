<?php

declare(strict_types=1);

namespace App\Http\Controllers\Api\Finance\Costing\DubaiBusiness;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use App\Service\Finance\Costing\Dxb\FilterService as DxbFilterService;

final class ApiAirImportController extends Controller
{
    public function __construct(protected DxbFilterService $dxbFilterService) {}

    public function getAirData(?string $column)
    {
        if ($column == 'carrier') {
            $data = [
                'message' => __('crud.fetched', ['name' => 'Carrier']),
                'data' => $this->dxbFilterService->getCarrier([
                    'job_order_type' => 'AIRIMPORT',
                ]),
            ];
        } else if ($column == 'mawb_number') {
            $data = [
                'message' => __('crud.fetched', ['name' => 'Mawb Number']),
                'data' => $this->dxbFilterService->getMawb([
                    'job_order_type' => 'AIRIMPORT',
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
