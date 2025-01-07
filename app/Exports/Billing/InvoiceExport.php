<?php

namespace App\Exports\Billing;

use App\Service\Finance\Billing\InvoiceService;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class InvoiceExport implements FromCollection, WithHeadings, WithMapping
{
    protected $invoiceService;

    public function __construct()
    {
        $this->invoiceService = new InvoiceService;
    }

    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        return $this->invoiceService->getInvoices();
    }

    public function map($item): array
    {
        return [
            $item->invoice_no,
            $item->invoice_date?->format('d/m/Y'),
            $item->invoice_due_date?->format('d/m/Y'),
            $item->customer?->customer_name,
            $item->total,
            $item->total,
            $item->is_approved == 1 ? 'Approved' : '',
            $item->status,
        ];
    }

    public function headings(): array
    {
        return [
            'Invoice No',
            'Invoice Date',
            'Invoice Due Date',
            'Customer Name',
            'Amount in USD',
            'Amount in AED',
            'Approval',
            'Status',
        ];
    }
}
