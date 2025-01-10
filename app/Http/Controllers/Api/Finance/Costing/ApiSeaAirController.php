<?php

declare(strict_types=1);

namespace App\Http\Controllers\Api\Finance\Costing;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use App\Service\Finance\Costing\Origin\FilterService as OriginFilterService;
use App\Models\Operation\Origin\JobOrder;

final class ApiSeaAirController extends Controller
{
    public function __construct(protected OriginFilterService $originFilterService) {}

    public function getSeaData(?string $column): JsonResponse
    {
        if ($column == 'vessel') {
            $data = [
                'message' => __('crud.fetched', ['name' => 'Vessel']),
                'data' => $this->originFilterService->getVessel()->data,
            ];
        } elseif ($column == 'voyage') {
            $data = [
                'message' => __('crud.fetched', ['name' => 'Voyage']),
                'data' => $this->originFilterService->getVoyage()->data,
            ];
        } elseif ($column == 'origin') {
            $data = [
                'message' => __('crud.fetched', ['name' => 'Origin']),
                'data' => $this->originFilterService->getOrigin()->data,
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
        $voyageResponse = $this->originFilterService->getVoyage(['vessel_id' => $vesselId]);

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
