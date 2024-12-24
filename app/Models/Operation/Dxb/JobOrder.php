<?php

namespace App\Models\Operation\Dxb;

use Illuminate\Database\Eloquent\Model;
use App\Models\Operation\Master\Office;
use App\Models\Finance\Costing;
class JobOrder extends Model
{
    protected $table = 'dxb.job_order';
    public $timestamps = false;
    protected $primaryKey = 'job_order_id';
    protected $keyType = 'string';
    static $rules = [
		'status' => 'required',];
    protected $fillable = ['job_order_id','job_order_code','date_order','description','vessel_id','vessel_name_voyage','created_by','modified_by','job_order_type','status','origin_id','origin_name','eta_dubai','destination_charges','mawb_number','dxb','etd_dubai','port_name_sea_export','loading_plan_id','feeder_vessel_name','voyage_number_feeder','loading_plan_number'];


    public function loadingplan()
    {
        return $this->belongsTo(LoadingPlanLocal::class, 'loading_plan_id', 'plan_id');
    }

    public function costing()
    {
        return $this->belongsTo(Costing::class, 'job_order_id', 'job_order_id');
    }
    public function detail()
    {
        return $this->hasMany(JobOrderDetail::class, 'job_order_id', 'job_order_id');
    }

    public function vendor()
    {
        return $this->hasMany(JobOrderVendor::class, 'job_order_id', 'job_order_id');
    }
    public function doc()
    {
        return $this->hasMany(JobOrderDocument::class, 'job_order_id', 'job_order_id');
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

    function lpdetail(){
        return $this->hasOne(LoadingPlanDetailLocal::class, 'loading_plan_id', 'loading_plan_id')
                    ->orderBy('date_departure', 'asc');
    }

    function lparrival(){
        return $this->hasOne(LoadingPlanDetailLocal::class, 'loading_plan_id', 'loading_plan_id')
                    ->orderBy('date_arival', 'desc');
    }

}
