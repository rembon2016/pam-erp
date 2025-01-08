<?php

namespace App\Exports\Costing\DubaiBusiness;

use App\Functions\Convert;
use App\Models\Operation\Dxb\JobOrder;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class AirImportExport implements FromCollection, WithHeadings, WithMapping
{
    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        return JobOrder::with(['detail', 'loadingplan', 'costing'])->where('job_order_type', 'AIRIMPORT')->where('status', '!=', 3)->latest()->get();
    }

    public function map($item): array
    {

        $mawb = $item->loadingplan->mawb_number ?? '';
        $carrier = $item->loadingplan->carrier_name ?? '';
        $etd = Convert::date($item->lpdetail->date_departure) ?? '';
        $eta = Convert::date($item->lparrival->date_arival) ?? '';
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
            $mawb,
            $carrier,
            $etd,
            $eta,
            $date,
            $status,
        ];
    }

    public function headings(): array
    {
        return [
            'Job Order Code',
            'MAWB Number',
            'Carrier',
            'ETD',
            'ETA',
            'Job Order Date',
            'Status',
        ];
    }
}
