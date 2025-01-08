<?php

namespace App\Models\Operation\Origin;

use Illuminate\Database\Eloquent\Model;

class JobOrderVendor extends Model
{
    protected $table = 'origin.job_order_vendor';

    public $timestamps = false;

    protected $primaryKey = 'job_order_vendor_id';

    protected $keyType = 'string';

    public static $rules = [];

    protected $fillable = ['job_order_vendor_id', 'job_order_id', 'vendor_id', 'vendor_name', 'handlig_type', 'type'];
}
