<?php

namespace App\Exports\MasterData;

use App\Models\Finance\ServiceType;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromCollection;

class ServiceTypeExport implements FromCollection, WithHeadings, WithMapping
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return ServiceType::orderBy('service_code', 'ASC')->get();
    }

    public function map($item): array
    {
        return [
            $item->service_code,
            $item->service_name,
        ];
    }

    public function headings(): array
    {
        return [
            'Service Code',
            'Service Name',
        ];
    }
}
