<?php

namespace App\Exports\MasterData;

use App\Service\Finance\MasterData\CountryService;
use Maatwebsite\Excel\Concerns\FromCollection;

class CountryExport implements FromCollection
{
    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        $countryService = new CountryService;

        return $countryService->getCountries();
    }

    public function map($item): array
    {
        return [
            $item->country_name,
            $item->country_code,
            $item->region?->region_name,
        ];
    }

    public function headings(): array
    {
        return [
            'Country Name',
            'Country Code',
            'Region',
        ];
    }
}
