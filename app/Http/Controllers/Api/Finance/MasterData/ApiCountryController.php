<?php

declare(strict_types=1);

namespace App\Http\Controllers\Api\Finance\MasterData;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use App\Http\Controllers\Controller;
use App\Service\Finance\MasterData\CountryService;

final class ApiCountryController extends Controller
{
    public function __construct(
        protected CountryService $countryService
    ) {}

    public function list()
    {
        return ResponseJson::success(
            Response::HTTP_OK,
            __('crud.fetched', ['name' => 'Country']),
            $this->countryService->getCountries()
        );
    }
}
