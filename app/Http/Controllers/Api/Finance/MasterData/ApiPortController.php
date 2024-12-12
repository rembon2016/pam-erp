<?php

declare(strict_types=1);

namespace App\Http\Controllers\Api\Finance\MasterData;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use App\Http\Controllers\Controller;
use App\Service\Finance\MasterData\PortService;

final class ApiPortController extends Controller
{
    public function __construct(
        protected PortService $portService
    ) {}

    public function list($country_id)
    {
        return ResponseJson::success(
            Response::HTTP_OK,
            __('crud.fetched', ['name' => 'Port']),
            $this->portService->getPorts()
        );
    }
}
