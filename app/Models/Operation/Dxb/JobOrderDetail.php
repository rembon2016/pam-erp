<?php

namespace App\Models\Operation\Dxb;

use Illuminate\Database\Eloquent\Model;

class JobOrderDetail extends Model
{
    protected $table = 'dxb.job_order_detail';

    public $timestamps = false;

    protected $primaryKey = 'job_order_detail_id';

    protected $keyType = 'string';

    public static $rules = [];

    protected $fillable = ['job_order_detail_id', 'job_order_id', 'ctd_number', 'job_id'];

    public function order()
    {
        return $this->belongsTo(Order::class, 'job_id', 'job_id');
    }
}
