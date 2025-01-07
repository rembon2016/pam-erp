<?php

namespace App\Exports\MasterData;

use App\Service\Finance\MasterData\DaybookService;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class DaybookExport implements FromCollection, WithHeadings, WithMapping
{
    protected $daybookService;

    public function __construct()
    {
        $this->daybookService = new DaybookService;
    }

    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        return $this->daybookService->getDaybooks();
    }

    public function map($item): array
    {
        return [
            $item->code,
            $item->name,
            $item->type,
            $item->description,
        ];
    }

    public function headings(): array
    {
        return [
            'Daybook Code',
            'Daybook Name',
            'Type',
            'Description',
        ];
    }
}
