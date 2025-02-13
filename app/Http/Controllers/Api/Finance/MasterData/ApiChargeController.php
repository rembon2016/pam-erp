<?php

declare(strict_types=1);

namespace App\Http\Controllers\Api\Finance\MasterData;

use App\Functions\ResponseJson;
use App\Http\Controllers\Controller;
use App\Service\Finance\MasterData\ChargeService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Response;

final class ApiChargeController extends Controller
{
    public function __construct(
        protected ChargeService $chargeService
    ) {}

    public function list(): JsonResponse
    {
        return ResponseJson::success(
            Response::HTTP_OK,
            __('crud.fetched', ['name' => 'Charge']),
            $this->chargeService->getCharges(request()->query())->data->charges
        );
    }

    public function show(string $id): JsonResponse
    {
        return ResponseJson::fromObject(
            response: $this->chargeService->getChargeById($id)
        );
    }
}
