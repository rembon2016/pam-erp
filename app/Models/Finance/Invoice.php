<?php

declare(strict_types=1);

namespace App\Models\Finance;

use App\Models\Operation\Master\CustomerBilling;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

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

    const SERVICE_TYPES = [
        'SEAAIR' => 'Sea Air',
        'AIR' => 'Cross Air',
        'SEAIMPORT' => 'Sea Import',
        'SEAEXPORT' => 'Sea Export',
        'AIRIMPORT' => 'Air Import',
        'AIREXPORT' => 'Air Export',
        'WAREHOUSE' => 'Warehouse',
        'TRUCKING' => 'Trucking',
        'COURIER' => 'Courier',
    ];

    const CANCEL_STATUS = 'Cancel';

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
