<?php

namespace App\Operation\Models\Origin;

use Illuminate\Database\Eloquent\Model;
use App\Models\Operation\Master\Office;

class JobOrder extends Model
{
    protected $table = 'origin.job_order';
    public $timestamps = true;
    const CREATED_AT = 'date_created';
    const UPDATED_AT = 'date_modified';
    protected $primaryKey = 'job_order_id';
    protected $keyType = 'string';
    static $rules = [
		'status' => 'required',];
    protected $fillable = ['job_order_id','job_order_code','date_order','description','vessel_id','vessel_name_voyage','created_by','modified_by','job_order_type','status','origin_id','origin_name','eta_dubai','destination_charges','loading_plan_id','feeder_vessel_name','voyage_number_feeder'];

    public function detail()
    {
        return $this->hasMany(JobOrderDetail::class, 'job_order_id', 'job_order_id');
    }

    public function loading()
    {
        return $this->belongsTo(LoadingReport::class, 'loading_plan_id', 'loading_id');
    }

    public function ctd()
    {
        return $this->hasMany(ShippingInstruction::class, 'loading_id', 'loading_plan_id');
    }

    public function shipping()
    {
        //only origin_name
        return $this->hasOne(ShippingInstruction::class, 'loading_id', 'loading_plan_id')->select('loading_id','origin_name');
    }

    public function origin()
    {
        return $this->belongsTo(Office::class, 'origin_id', 'office_id');
    }

}