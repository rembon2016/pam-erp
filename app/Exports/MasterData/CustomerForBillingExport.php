<?php

namespace App\Exports\MasterData;

use App\Models\Finance\CustomerBilling;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class CustomerForBillingExport implements FromCollection, WithHeadings, WithMapping
{
    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        return CustomerBilling::orderBy('customer_name', 'ASC')->get();
    }

    public function map($item): array
    {
        return [
            $item->customer_code,
            $item->customer_name,
            $item->customer_email,
            $item->customer_telp,
            $item->customer_phone,
            $item->customer_contact_person,
            $item->group->customer_group_name,
            $item->countries->country_name,
        ];
    }

    public function headings(): array
    {
        return [
            'Customer Code',
            'Customer Name',
            'Customer Email',
            'Customer Telp',
            'Customer Phone',
            'Customer Contact Person',
            'Customer Group',
            'Country',
        ];
    }
}
