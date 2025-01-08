<?php

namespace App\Exports\MasterData;

use App\Service\Finance\MasterData\PortService;
use Maatwebsite\Excel\Concerns\FromCollection;

class PortExport implements FromCollection
{
    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        $portService = new PortService;

        return $portService->getPorts();
    }

    public function map($item): array
    {
        return [
            $item->port_name,
            $item->port_code,
            $item->country?->country_name,
            $item->transport_mode,
        ];
    }

    public function headings(): array
    {
        return [
            'Port Name',
            'Port Code',
            'Country',
            'Transport Mode',
        ];
    }
}
