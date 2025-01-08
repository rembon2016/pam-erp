<?php

declare(strict_types=1);

namespace App\Models\Finance;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

final class InvoiceShipment extends Model
{
    use HasFactory, HasUuids;

    protected $table = 'finance.invoice_shipment';

    protected $guarded = ['id'];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
    ];

    public $incrementing = false;

    public function invoice()
    {
        return $this->belongsTo(Invoice::class, 'invoice_id', 'id');
    }

    public function invoiceShipmentCharge()
    {
        return $this->hasMany(InvoiceShipmentCharge::class, 'invoice_shipment_id', 'id');
    }
}
