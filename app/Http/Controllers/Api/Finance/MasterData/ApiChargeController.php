<?php

declare(strict_types=1);

namespace App\Http\Controllers\Api\Finance\MasterData;

use App\Functions\ResponseJson;
use App\Http\Controllers\Controller;
use App\Models\Finance\Charge;
use App\Service\Finance\MasterData\ChargeService;
use App\Service\Finance\MasterData\ChartOfAccountService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Response;

final class ApiChargeController extends Controller
{
    public function __construct(
        protected ChargeService $chargeService,
        protected ChartOfAccountService $coaService,
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

    public function getChargeForFilters(): JsonResponse
    {
        $charges = $this->coaService->getChartOfAccounts(withPaging: true);

        return ResponseJson::success(code: 200, message: __('crud.fetched', ['name' => 'Charge']), data: $charges);
    }
}
