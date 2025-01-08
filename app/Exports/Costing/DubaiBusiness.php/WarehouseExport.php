<?php

namespace App\Exports\Costing\DubaiBusiness;

use App\Functions\Convert;
use App\Models\Operation\Dxb\JobOrder;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class WarehouseExport implements FromCollection, WithHeadings, WithMapping
{
    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        return JobOrder::with(['detail', 'costing'])->where('job_order_type', 'WAREHOUSE')->where('status', '!=', 3)->latest()->get();
    }

    public function map($item): array
    {
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
            $item->loading_plan_number,
            $date,
            $status,
        ];
    }

    public function headings(): array
    {
        return [
            'Job Order Code',
            'CTD No',
            'Job Order Date',
            'Status',
        ];
    }
}
