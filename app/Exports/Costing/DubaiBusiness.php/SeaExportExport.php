<?php

namespace App\Exports\Costing\DubaiBusiness;

use App\Models\Operation\Dxb\JobOrder;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromCollection;
use App\Functions\Convert;

class SeaExportExport implements FromCollection, WithHeadings, WithMapping
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return JobOrder::with(['detail', 'loading','costing'])->where('job_order_type','SEAEXPORT')->where('status','!=',3)->latest()->get();
    }

    public function map($item): array
    {
        $origin = $item->origin->city ?? "";
        $vessel = $item->loading->vessel_name ?? "";
        $voyage = $item->loading->voyage_number ?? "";
        $eta = Convert::date($item->eta) ?? "";
        $date = Convert::date($item->date_created) ?? "";
        $status = '';
        if(!empty($item->costing)){
            if($item->costing->status == 1){
               $status = 'Open';
            }else{
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
            $status
        ];
    }

    public function headings() : array
    {
        return [
            'Job Order Code',
            'Vessel',
            'Voyage',
            'ETA',
            'Origin',
            'Job Order Date',
            'Status'
        ];
    }
}
