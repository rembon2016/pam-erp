<?php

namespace App\Models\Operation\Origin;

use Illuminate\Database\Eloquent\Model;

class OrderDetail extends Model
{
    protected $table = 'origin.si_order_detail';
    public $timestamps = false;
    protected $primaryKey = 'si_order_detail';
    protected $keyType = 'string';
    static $rules = [
		'si_order_detail' => 'required',];
    protected $fillable = ['si_order_detail','job_id','order_number','style_number','art_number','created_by','modified_by','status','hs_code','container_number','description'];
    public function shipping()
    {
        return $this->belongsTo(ShippingInstruction::class, 'job_id', 'job_id');
    }

    public function loading()
    {
        return $this->belongsTo(LoadingReportDetail::class, 'container_number', 'container_number');
    }

    public function order()
    {
        return $this->belongsTo(Order::class, 'job_id', 'job_id');
    }
}
