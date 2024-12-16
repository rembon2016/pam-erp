<?php

namespace App\Models\Operation\Dxb;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Cache;
class LoadingPlanDxb extends Model
{
    protected $table = 'dxb.loading_plan';
    public $timestamps = false;
    protected $primaryKey = 'plan_id';
    protected $keyType = 'string';
    static $rules = [];
    protected $fillable = ['plan_id','carrier_id','carrier_name','mawb_number','created_by','modified_by','status','origin_office_id','date_modified','closing_time','flight_number','etd','eta','loading_plan_number','destination_agent_id','destination_agent_name','notes','shipper_id','shipper_name','shipper_address','consignee_id','consignee_name','consignee_address','description','handling_information','iata_code','freight_term','incoterm','job_order_no'];
}
