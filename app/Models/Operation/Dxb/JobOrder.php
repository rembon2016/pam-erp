<?php

namespace App\Models\Operation\Dxb;

use Illuminate\Database\Eloquent\Model;

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
        return $this->belongsTo(LoadingPlanLocal::class, 'mawb_number', 'mawb_number');
    }

}
