<?php

namespace App\Exports\MasterData;

use App\Models\Currency;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromCollection;

class CurrencyExport implements FromCollection, WithHeadings, WithMapping
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return Currency::orderBy('currency_code', 'ASC')->get();
    }

    public function map($item): array
    {
        return [
            $item->currency_code,
            $item->currency_name,
            $item->currency_date?->format('d-m-Y'),
            $item->buy_rate,
            $item->sell_rate,
            $item->notes,
        ];
    }

    public function headings(): array
    {
        return [
            'Currency Code',
            'Currency Name',
            'Currency Date',
            'Buy Rate',
            'Sell Rate',
            'Notes',
        ];
    }
}
