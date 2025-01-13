<?php

declare(strict_types=1);

namespace App\Http\Controllers\Api\Finance\Costing\DubaiBusiness;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use App\Service\Finance\Costing\Dxb\FilterService as DxbFilterService;

final class ApiSeaExportController extends Controller
{
    public function __construct(protected DxbFilterService $dxbFilterService) {}

    public function getSeaData(?string $column): JsonResponse
    {
        if ($column == 'vessel') {
            $data = [
                'message' => __('crud.fetched', ['name' => 'Vessel']),
                'data' => $this->dxbFilterService->getVessel([
                    'job_order_type' => 'SEAEXPORT',
                ]),
            ];
        } elseif ($column == 'voyage') {
            $data = [
                'message' => __('crud.fetched', ['name' => 'Voyage']),
                'data' => $this->dxbFilterService->getVoyage([
                    'job_order_type' => 'SEAEXPORT',
                ]),
            ];
        } elseif ($column == 'origin') {
            $data = [
                'message' => __('crud.fetched', ['name' => 'Origin']),
                'data' => $this->dxbFilterService->getOrigin([
                    'job_order_type' => 'SEAEXPORT',
                ]),
            ];
        }

        return ResponseJson::success(
            code: Response::HTTP_OK,
            message: $data['message'],
            data: $data['data'],
        );
    }

    public function getVoyageByVessel(string $vesselId): JsonResponse
    {
        $voyageResponse = $this->dxbFilterService->getVoyage([
            'vessel_id' => $vesselId,
            'job_order_type' => 'SEAEXPORT',
        ]);

        return $voyageResponse->success
            ? ResponseJson::success(
                code: Response::HTTP_OK,
                message: __('crud.fetched', ['name' => 'Voyage']),
                data: $voyageResponse->data
            )
            : ResponseJson::error(
                code: Response::HTTP_NOT_FOUND,
                message: __('crud.not_found', ['name' => 'Voyage'])
            );
    }
}
