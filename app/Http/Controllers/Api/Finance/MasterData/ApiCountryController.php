<?php

declare(strict_types=1);

namespace App\Http\Controllers\Api\Finance\MasterData;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use App\Http\Controllers\Controller;
use App\Models\Operation\Master\Countries;
use App\Service\Finance\MasterData\CountryService;
use Illuminate\Http\JsonResponse;

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

    public function getCountryForFilters(): JsonResponse
    {
        $countries = Countries::select('country_id', 'country_code', 'country_name')->paginate(10);

        return ResponseJson::success(code: 200, message: __('crud.fetched', ['name' => 'Country']), data: $countries);
    }
}
