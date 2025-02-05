<?php

declare(strict_types=1);

namespace App\Service\Finance\MasterData;

use Illuminate\Http\Response;
use App\Functions\ObjectResponse;
use Illuminate\Database\Eloquent\Builder;
use App\Models\Operation\Master\Countries;
use Illuminate\Database\Eloquent\Collection;

final class CountryService
{
    /**
     * Create a new class instance.
     */
    public function __construct()
    {
        //
    }

    public function getCountries($filters = [])
    {
        $countries = Countries::when(! empty($filters['country_code']), function ($query) use ($filters) {
            return $query->where('country_code', $filters['country_code']);
        })->when(! empty($filters['country_name']), function ($query) use ($filters) {
            return $query->where('country_name', $filters['country_name']);
        })->whereNotIn('status', ['2', '3'])->orderBy('country_name', 'asc');

        $totalRecords = Countries::count();
        $filteredRecords = $countries->count();

        return ObjectResponse::success(
            message: __('crud.fetched', ['name' => 'Country']),
            statusCode: Response::HTTP_OK,
            data: (object) [
                'countries' => $countries->get(),
                'countryDatatables' => $countries->skip(request()->get('start', 0))
                    ->take(request()->get('length', 10))
                    ->orderBy('date_created', 'DESC')
                    ->get(),
                'totalRecords' => $totalRecords,
                'filteredRecords' => $filteredRecords
            ]
        );
    }

    public function getCountryById(int $id): object
    {
        $country = Countries::where('country_id', $id)->first();

        return ! empty($country)
            ? ObjectResponse::success(message: __('crud.fetched', ['name' => 'Country']), data: $country)
            : ObjectResponse::error(message: __('crud.not_found', ['name' => 'Country']));
    }

    public function createCountry(array $dto): object
    {
        $country = Countries::create($dto);

        return ObjectResponse::success(
            message: __('crud.created', ['name' => 'Country']),
            data: $country
        );
    }

    public function updateCountry(array $dto, int $id): object
    {
        try {
            $country = $this->getCountryById(id: $id);
            $country->data->update($dto);

            return ObjectResponse::success(
                message: __('crud.updated', ['name' => 'Country']),
                data: $country
            );
        } catch (\Throwable $th) {
            return ObjectResponse::error(
                message: $th->getMessage(),
                errors: $th->getTrace()
            );
        }
    }

    public function deleteCountry(int $id): object
    {
        try {
            $country = $this->getCountryById(id: $id);
            $country->data->delete();

            return ObjectResponse::success(
                message: __('crud.deleted', ['name' => 'Country']),
                data: $country
            );
        } catch (\Throwable $th) {
            return ObjectResponse::error(
                message: $th->getMessage(),
                errors: $th->getTrace()
            );
        }
    }
}
