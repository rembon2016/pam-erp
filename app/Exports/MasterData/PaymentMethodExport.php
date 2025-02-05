<?php

namespace App\Exports\MasterData;

use App\Service\Finance\MasterData\PaymentMethodService;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class PaymentMethodExport implements FromCollection, WithHeadings, WithMapping
{
    protected $paymentMethodService;

    public function __construct()
    {
        $this->paymentMethodService = new PaymentMethodService;
    }

    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        return $this->paymentMethodService->getPaymentMethods()->data->paymentMethods;
    }

    public function map($item): array
    {
        return [
            $item->payment_terms,
            $item->created_at?->format('d-m-Y H:i:s'),
        ];
    }

    public function headings(): array
    {
        return [
            'Payment Terms',
            'Date Created',
        ];
    }
}
