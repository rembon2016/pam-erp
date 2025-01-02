<?php

namespace App\Models\Operation\Dxb;

use App\Traits\Filterable;
use App\Models\Master\Port;
use App\Models\Master\Office;
use App\Models\Dxb\HistoriJob;
use App\Models\Dxb\LoadingPlan;
use App\Models\Dxb\LoadingPlanDxb;
use App\Models\Master\LocalCustomer;
use Illuminate\Support\Facades\Http;
use Illuminate\Database\Eloquent\Model;
use App\Models\Operation\Dxb\AgreedRate;
use App\Models\Operation\Dxb\CustomerBilling;

class ShippingInstruction extends Model
{
	use Filterable;
	protected $connection = 'pgsql';
    protected $table = 'dxb.shipping_instruction';
    public $timestamps = false;
    protected $primaryKey = 'job_id';
    protected $keyType = 'string';
    static $rules = [];
    protected $fillable = ['job_id','to_consignee','from_shipper','origin_id','port_of_loading','port_of_destination','feeder_vessel_id','mother_vessel_id','permit_no','permit_date','permit_approval_no','shipment_by','loading_type','freight_term','incoterm','notify_of_party','cargo_redines_date','status_shipment','estimated_time_departure','actual_time_departure','time_closing_mother','time_closing_feeder','transit_via','metode_shipment','consigne_name','consignee_address','shipper_name','shipper_address','origin_name','port_loading_name','port_destination_name','mother_vessel_name','feeder_vessel_name','ctd_number','status','created_by','modified_by','voyage_number_mother','voyage_number_feeder','actual_time_departur_feeder','loading_id','notes','status_shipment_id','eta_dubai','sales_office','sales_office_name','komoditi_id','komoditi_name','date_modified','loading_plan_dxb','carrier_id_seaair','carrier_name_seair','closing_time_seaair','etd_flight_seaair','eta_flight_seaair','flight_number_seaair','notes_hub','notes_destination','in_order_to','port_destionation_code','port_loading_code','invoices_status','delivery_place_id','delivery_name','delivery_address','t1_id','t1_name','t1_address','custom_stop_id','custom_stop_name','custom_stop_address','etd_first','voyage_vessel_origin','notify_party_address','port_destination_code','destination_agent_id','destination_agent_name','destination_agent_address',
        'amount_of_insurance','declare_value_forcariage','declare_value_forcustom','handling_information', 'customer_group_id', 'customer_group_name'
    ];
    protected $appends = ['pod_code','teus'];
    public function order()
    {
        return $this->belongsTo(Order::class, 'job_id', 'job_id');
    }

    public function billingCustomer()
    {
        return $this->belongsTo(CustomerBilling::class, 'customer_id', 'customer_id');
    }

    public function agreedRates()
    {
        return $this->hasMany(AgreedRate::class, 'job_id', 'job_id');
    }

    public function consignee()
    {
        return $this->belongsTo(LocalCustomer::class, 'to_consignee', 'customer_id');
    }

    public function shipper()
    {
        return $this->belongsTo(LocalCustomer::class, 'from_shipper', 'customer_id');
    }

    public function origin()
    {
        return $this->belongsTo(Office::class, 'origin_id', 'office_id');
    }

    public function loadingplan()
    {
        return $this->belongsTo(LoadingPlanLocal::class, 'loading_id', 'plan_id');
    }

    public function loadingreport()
    {
        return $this->belongsTo(LoadingReport::class, 'loading_id', 'loading_id');
    }

    function loadingreportdetail(){
        return $this->hasMany(LoadingReportDetail::class, 'bl_id', 'loading_id');
    }

    public function loading_plan(){
        return $this->hasOne(LoadingPlanLocal::class, 'plan_id', 'loading_id');
    }


    public function control()
    {
        return $this->hasMany(ControlOffice::class, 'job_id', 'job_id');
    }


    public function destination()
    {
        return $this->belongsTo(Port::class, 'port_of_destination', 'port_id');
    }

    public function loading()
    {
        return $this->belongsTo(Port::class, 'port_of_loading', 'port_id');
    }

    public function order_detail()
    {
        return $this->hasMany(OrderDetail::class, 'job_id', 'job_id');
    }

    public function loadingplandetail()
    {
        return $this->belongsTo(LoadingPlanDetailLocal::class, 'loading_id', 'loading_plan_id')->orderBy("date_arival", "DESC");
    }

    public function arrived()
    {
        return $this->hasOne(HistoriJob::class, 'job_id', 'job_id')->whereIn('status_id',[13,27,41,55,61,69,76])->where("is_deleted",0)->latest();
    }

    function lpdetail(){
        return $this->hasOne(LoadingPlanDetailLocal::class, 'loading_plan_id', 'loading_id')
                    ->orderBy('date_departure', 'asc');
    }

    function lparrival(){
        return $this->hasOne(LoadingPlanDetailLocal::class, 'loading_plan_id', 'loading_id')
                    ->orderBy('date_arival', 'desc');
    }


    public function getDimensionSumVolumeCbmAttribute($value)
    {
        return (float)$value;
    }

    public function dimension()
    {
        return $this->hasMany(Dimension::class, 'job_id', 'job_id');
    }

    function reference(){
        return $this->hasMany(ShippingInstruction::class, 'reference_id', 'job_id')
                ->orderBy('ctd_number', 'asc');
    }

    public function salesoffice()
    {
        return $this->hasMany(SalesOffice::class, 'job_id', 'job_id');
    }

    public function salesperson()
    {
        return $this->hasMany(SalesPerson::class, 'job_id', 'job_id');
    }

    public function bl()
    {
        return $this->belongsTo(LoadingReportBl::class, 'loading_id', 'loading_id');
    }

    public function billing()
    {
        return $this->hasOne(CustomerBilling::class, 'customer_id', 'customer_id');
    }


    public function getTeusAttribute(){
        return $this->loadingreportdetail->sum('teus');
    }
    public function getPodCodeAttribute()
    {
        // if($this->port_destination_code == null && !empty($this->port_of_destination)){
        //     $dest = Http::get(env('API_MASTER').'api/port/'.$this->port_of_destination)->json()["data"];
        //     if(isset($dest["port_code"])){
        //         ShippingInstruction::where("job_id",$this->job_id)->update(["port_destination_code"=>$dest["port_code"]]);
        //         return $dest["port_code"];
        //     }else{
        //         return "";
        //     }
        // }else{
            return $this->port_destination_code;
        //}
    }

    public function getDaysClosedAttribute(){
        try{
        if($this->status_shipment_id == 39 || $this->status_shipment_id == 25 || $this->status_shipment_id == 35){
            $type = $this->metode_shipment;
            if($type == "SEAIMPORT"){
                $departed = HistoriJob::where('job_id',$this->job_id)->where("status_id",'9')->where('is_deleted','!=',1)->first();
                $close = HistoriJob::where('job_id',$this->job_id)->where("status_id",'13')->where('is_deleted','!=',1)->first();
            }else if($type == "SEAEXPORT"){
                $departed = HistoriJob::where('job_id',$this->job_id)->where("status_id",'23')->where('is_deleted','!=',1)->first();
                $close = HistoriJob::where('job_id',$this->job_id)->where("status_id",'27')->where('is_deleted','!=',1)->first();
            }else if($type == "AIRIMPORT"){
                $departed = HistoriJob::where('job_id',$this->job_id)->where("status_id",'36')->where('is_deleted','!=',1)->first();
                $close = HistoriJob::where('job_id',$this->job_id)->where("status_id",'41')->where('is_deleted','!=',1)->first();
            }else if($type == "AIREXPORT"){
                $departed = HistoriJob::where('job_id',$this->job_id)->where("status_id",'50')->where('is_deleted','!=',1)->first();
                $close = HistoriJob::where('job_id',$this->job_id)->where("status_id",'55')->where('is_deleted','!=',1)->first();
            }else if($type == "WAREHOUSE"){
                $departed = HistoriJob::where('job_id',$this->job_id)->where("status_id",'59')->where('is_deleted','!=',1)->first();
                $close = HistoriJob::where('job_id',$this->job_id)->where("status_id",'61')->where('is_deleted','!=',1)->first();
            }else if($type == "TRUCKING"){
                $departed = HistoriJob::where('job_id',$this->job_id)->where("status_id",'65')->where('is_deleted','!=',1)->first();
                $close = HistoriJob::where('job_id',$this->job_id)->where("status_id",'69')->where('is_deleted','!=',1)->first();
            }else if($type == "COURIER"){
                $departed = HistoriJob::where('job_id',$this->job_id)->where("status_id",'73')->where('is_deleted','!=',1)->first();
                $close = HistoriJob::where('job_id',$this->job_id)->where("status_id",'76')->where('is_deleted','!=',1)->first();
            }


                $tgl_departed = $this->changeDate($departed->tgl_aktual,$departed->gmt);
                $tgl_close = $this->changeDate($close->tgl_aktual,$close->gmt);


                $days = isset($tgl_departed) && isset($tgl_close) ?
                (new \DateTime(date('Y-m-d', strtotime($tgl_close))))
                    ->diff(new \DateTime(date('Y-m-d', strtotime($tgl_departed))))
                    ->days : null;
                $arr = [
                    "days"=>$days,
                    "tgl_departed"=>$tgl_departed,
                    "tgl_close"=>$tgl_close,
                    "tgl_departed_original"=>$departed->tgl_aktual,
                    "tgl_close_original"=>$close->tgl_aktual,
                    "gmt_close"=>$close->gmt,
                    "gmt_departed"=>$departed->gmt,
                    "user"=>$close->created_by
                ];
                return $arr;

        }else{
            return null;
        }
    } catch (\Throwable $e) {
            // Log the error and return a user-friendly error message

            return null;
        }

    }

    public function changeDate($tgl_aktual,$gmt){
        $gmt = strtoupper($gmt);
        $carbonDate = \Carbon\Carbon::parse($tgl_aktual, $gmt);
        $dates = $carbonDate->setTimezone('GMT+4')->toDateTimeString();

        return $dates;
    }

}
