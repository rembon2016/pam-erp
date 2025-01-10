<?php

declare(strict_types=1);

namespace App\Http\Controllers\Api\Finance\Costing;

use App\Functions\ResponseJson;
use App\Http\Controllers\Controller;
use App\Service\Finance\Costing\Origin\FilterService as OriginFilterService;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

final class ApiCrossAirController extends Controller
{
    public function __construct(protected OriginFilterService $originFilterService) {}

    public function getAirData(?string $column)
    {
        if ($column == 'carrier') {
            $data = [
                'message' => __('crud.fetched', ['name' => 'Carrier']),
                'data' => $this->originFilterService->getCarrier(request()),
            ];
        } else if ($column == 'mawb_number') {
            $data = [
                'message' => __('crud.fetched', ['name' => 'Mawb Number']),
                'data' => $this->originFilterService->getMawb(request()),
            ];
        }

        return ResponseJson::success(
            code: Response::HTTP_OK,
            message: $data['message'],
            data: $data['data'],
        );
    }
}
