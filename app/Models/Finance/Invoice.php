<?php

declare(strict_types=1);

namespace App\Models\Finance;

use App\Models\Finance\InvoiceShipment;
use Illuminate\Database\Eloquent\Model;
use App\Models\Finance\InvoiceShipmentCharge;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Operation\Master\CustomerBilling;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;

final class Invoice extends Model
{
    use HasFactory, HasUuids, SoftDeletes;

    protected $table = 'finance.invoice';
    protected $guarded = ['id'];
    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
        'invoice_date' => 'date',
        'invoice_due_date' => 'date',
    ];

    public $incrementing = false;

    public function invoiceShipment()
    {
        return $this->hasMany(InvoiceShipment::class, 'invoice_id', 'id');
    }

    public function invoiceShipmentCharge()
    {
        return $this->hasMany(InvoiceShipmentCharge::class, 'invoice_id', 'id');
    }

    public function customer()
    {
        return $this->hasOne(CustomerBilling::class, 'customer_id', 'customer_billing_id');
    }
}
