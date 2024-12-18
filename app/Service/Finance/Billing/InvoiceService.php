<?php

declare(strict_types=1);

namespace App\Service\Finance\Billing;

use App\Models\Finance\Invoice;
use Illuminate\Database\Eloquent\Collection;

final class InvoiceService
{
    public function getInvoices(array $filters = []): Collection
    {
        return Invoice::orderBy('invoice_no', 'DESC')->get();
    }

    public function createInvoice(array $dto): object
    {
        dd($dto);
    }
}
