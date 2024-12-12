<?php

namespace App\Operation\Models\Origin;

use Illuminate\Database\Eloquent\Model;
use App\Models\Operation\Master\Office;
class JobOrderAir extends Model
{
    protected $table = 'origin.job_order_air';
    public $timestamps = true;
    const CREATED_AT = 'date_created';
    const UPDATED_AT = 'date_modified';
    protected $primaryKey = 'job_order_id';
    protected $keyType = 'string';
    static $rules = [];
    protected $fillable = ['job_order_id','job_order_code','date_order','description','loading_plan_id','loading_plan_number','created_by','modified_by','job_order_type','status','destination_charges','origin_id','origin_name'];

    public function loadingplan()
    {
        return $this->belongsTo(LoadingPlan::class, 'loading_plan_id', 'plan_id');
    }

    public function detail()
    {
        return $this->hasMany(JobOrderDetail::class, 'job_order_id', 'job_order_id');
    }

    public function shipping()
    {
        //only origin_name
        return $this->hasOne(ShippingInstruction::class, 'loading_id', 'loading_plan_id')->select('origin_name','loading_id');
    }

    public function origin()
    {
        return $this->belongsTo(Office::class, 'origin_id', 'office_id');

    }
}
