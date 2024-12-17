<?php

declare(strict_types=1);

namespace App\Models\Finance;

use App\Models\Finance\Invoice;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;

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

    public function invoice()
    {
        return $this->belongsTo(Invoice::class, 'invoice_id', 'id');
    }
}
