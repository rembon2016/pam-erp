<?php

namespace App\Exports\MasterData;

use App\Service\Finance\MasterData\FixedAssetService;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithMapping;

class FixedAssetExport implements FromCollection, WithHeadings, WithMapping
{
    protected $fixedAssetService;

    public function __construct() {
        $this->fixedAssetService = new FixedAssetService();
    }

    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return $this->fixedAssetService->getFixedAssets();
    }

    public function map($item): array
    {
        return [
            $item->asset_code,
            $item->asset_name,
            $item->type?->type_name,
            $item->acquisition_date?->format('d-m-Y'),
            $item->purchase_price,
            $item->useful_life,
            $item->status?->status_name,
            $item->notes,
        ];
    }

    public function headings(): array
    {
        return [
            'Asset Code',
            'Asset Name',
            'Asset Type',
            'Acquisition Date',
            'Purchase Price',
            'Useful Life',
            'Status',
            'Notes',
        ];
    }
}
