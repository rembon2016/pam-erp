<?php

namespace App\Exports\MasterData;

use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromCollection;
use App\Service\Finance\MasterData\ChargeService;

class ChargeExport implements FromCollection, WithHeadings, WithMapping
{
    protected $chargeService;

    public function __construct()
    {
        $this->chargeService = new ChargeService();
    }

    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return $this->chargeService->getCharges();
    }

    public function map($item): array
    {
        return [
            $item->charge_code,
            $item->charge_name,
            $item->transport_type,
            $item->unit?->unit_name,
            $item->is_agreed_rate == 1 ? 'Yes' : 'No',
            $item->revenue_id,
            $item->cost_id,
        ];
    }

    public function headings(): array
    {
        return [
            'Charge Code',
            'Charge Name',
            'Transport Type',
            'Unit',
            'Agreed Rate Charge',
            'Revenue Account',
            'Cost Account',
        ];
    }

}
