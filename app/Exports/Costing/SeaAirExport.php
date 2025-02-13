<?php

namespace App\Exports\Costing;

use App\Functions\Convert;
use App\Models\Operation\Origin\JobOrder;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class SeaAirExport implements FromCollection, WithHeadings, WithMapping
{
    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        return JobOrder::with(['detail', 'loading', 'costing'])->where('status', '!=', 3)->latest()->get();
    }

    public function map($item): array
    {
        $origin = $item->origin->city ?? '';
        $vessel = $item->loading->vessel_name ?? '';
        $voyage = $item->loading->voyage_number ?? '';
        $eta = Convert::date($item->eta) ?? '';
        $date = Convert::date($item->date_created) ?? '';
        $status = '';
        if (! empty($item->costing)) {
            if ($item->costing->status == 1) {
                $status = 'Open';
            } else {
                $status = 'Closed';
            }
        }

        return [
            $item->job_order_code,
            $vessel,
            $voyage,
            $eta,
            $origin,
            $date,
            $status,
        ];
    }

    public function headings(): array
    {
        return [
            'Job Order Code',
            'Vessel',
            'Voyage',
            'ETA',
            'Origin',
            'Job Order Date',
            'Status',
        ];
    }
}
