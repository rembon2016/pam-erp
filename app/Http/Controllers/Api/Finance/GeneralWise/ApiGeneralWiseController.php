<?php

declare(strict_types=1);

namespace App\Http\Controllers\Api\Finance\GeneralWise;

use App\Functions\ResponseJson;
use App\Http\Controllers\Controller;
use App\Service\Finance\GeneralWise\GeneralWiseService;
use Illuminate\Http\JsonResponse;

final class ApiGeneralWiseController extends Controller
{
    public function __construct(
        protected GeneralWiseService $generalWiseService
    ) {}

    public function vessel(): JsonResponse
    {
        return ResponseJson::fromObject(
            $this->generalWiseService->getVessels(request()->query())
        );
    }

    public function voyage(): JsonResponse
    {
        return ResponseJson::fromObject(
            $this->generalWiseService->getVoyages(request()->query())
        );
    }

    public function origin(): JsonResponse
    {
        return ResponseJson::fromObject(
            $this->generalWiseService->getOrigins(request()->query())
        );
    }
}
