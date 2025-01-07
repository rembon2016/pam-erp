<?php

namespace App\Exports\MasterData;

use App\Service\Finance\MasterData\CustomerService;
use Maatwebsite\Excel\Concerns\FromCollection;

class CustomerExport implements FromCollection
{
    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        $customerService = new CustomerService;

        return $customerService->getCustomers()->get();
    }

    public function map($item): array
    {
        return [
            $item->customer_code,
            $item->customer_name,
            $item->eori_number,
            $item->credit_terms,
            $item->credit_limit,
            $item->overseas,
            $item->currency?->currency_name,
        ];
    }

    public function headings(): array
    {
        return [
            'Customer Code',
            'Customer Name',
            'EORI Number',
            'Credit Terms',
            'Credit Limit',
            'Overseas',
            'Currency',
        ];
    }
}
