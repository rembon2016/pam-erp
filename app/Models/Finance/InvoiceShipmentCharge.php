<?php

declare(strict_types=1);

namespace App\Models\Finance;

use App\Models\Finance\Invoice;
use App\Models\Finance\Currency;
use App\Models\Finance\InvoiceShipment;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;

final class InvoiceShipmentCharge extends Model
{
    use HasFactory, HasUuids;

    protected $table = 'finance.invoice_shipment_charge';
    protected $guarded = ['id'];
    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
    ];

    public function invoice()
    {
        return $this->belongsTo(Invoice::class, 'invoice_id', 'id');
    }

    public function invoiceShipment()
    {
        return $this->belongsTo(InvoiceShipment::class, 'invoice_shipment_id', 'id');
    }

    public function currency()
    {
        return $this->belongsTo(Currency::class, 'currency_id', 'id');
    }
}
