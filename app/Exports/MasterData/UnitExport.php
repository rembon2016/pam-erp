<?php

namespace App\Exports\MasterData;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\FromCollection;
use App\Service\Finance\MasterData\UnitService;

class UnitExport implements FromCollection
{
    protected $unitService;

    public function __construct()
    {
        $this->unitService = new UnitService();
    }

    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection(): Collection
    {
        return $this->unitService->getUnitCollections();
    }

    /**
     * Maps the given item to an array containing the unit code and unit name.
     *
     * @param mixed $item The item to be mapped.
     * @return array An array containing the unit code and unit name.
     */
    public function map($item): array
    {
        return [
            $item->unit_name,
            $item->description,
        ];
    }

    /**
     * Returns the column headings for the Excel export.
     *
     * @return array The column headings.
     */
    public function headings(): array
    {
        return [
            'Unit Code',
            'Unit Name',
        ];
    }
}
