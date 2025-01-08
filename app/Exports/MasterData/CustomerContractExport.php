<?php

namespace App\Exports\MasterData;

use App\Service\Finance\MasterData\CustomerContractService;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class CustomerContractExport implements FromCollection, WithHeadings, WithMapping
{
    protected $customerContractService;

    public function __construct()
    {
        $this->customerContractService = new CustomerContractService;
    }

    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        return $this->customerContractService->getCustomerContracts();
    }

    public function map($item): array
    {
        return [
            $item->contract_no,
            $item->customer?->customer_code,
            $item->customer?->customer_name,
            $item->contract_start?->format('d/m/Y'),
            $item->contract_end?->format('d/m/Y'),
            $item->contract_description,
        ];
    }

    public function headings(): array
    {
        return [
            'Contract No',
            'Customer Code',
            'Customer Name',
            'Contract Validity From',
            'Contract Validity To',
            'Description',
        ];
    }
}
