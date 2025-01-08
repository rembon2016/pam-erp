<?php

namespace App\Models\Operation\Origin;

use App\Models\Dxb\LoadingPlanDxb;
use App\Models\Dxb\LoadingPlanDxbDetail;
use App\Models\Master\Customer;
use App\Models\Operation\Master\CustomerBilling;
use App\Models\Operation\Master\Office;
use App\Models\Operation\Master\Port;
use App\Models\Origin\HistoriJob;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Http;

class ShippingInstruction extends Model
{
    protected $connection = 'pgsql';

    protected $table = 'origin.shipping_instruction';

    public $timestamps = false;

    protected $primaryKey = 'job_id';

    protected $keyType = 'string';

    public static $rules = [];

    protected $fillable = ['job_id', 'to_consignee', 'from_shipper', 'origin_id', 'port_of_loading', 'port_of_destination', 'feeder_vessel_id', 'mother_vessel_id', 'permit_no', 'permit_date', 'permit_approval_no', 'shipment_by', 'loading_type', 'freight_term', 'incoterm', 'notify_of_party', 'cargo_redines_date', 'status_shipment', 'estimated_time_departure', 'actual_time_departure', 'time_closing_mother', 'time_closing_feeder', 'transit_via', 'metode_shipment', 'consigne_name', 'consignee_address', 'shipper_name', 'shipper_address', 'origin_name', 'port_loading_name', 'port_destination_name', 'mother_vessel_name', 'feeder_vessel_name', 'ctd_number', 'status', 'created_by', 'modified_by', 'voyage_number_mother', 'voyage_number_feeder', 'actual_time_departur_feeder', 'loading_id', 'notes', 'status_shipment_id', 'eta_dubai', 'sales_office', 'sales_office_name', 'komoditi_id', 'komoditi_name', 'date_modified', 'loading_plan_dxb', 'carrier_id_seaair', 'carrier_name_seair', 'closing_time_seaair', 'etd_flight_seaair', 'eta_flight_seaair', 'flight_number_seaair', 'notes_hub', 'notes_destination', 'in_order_to', 'port_destionation_code', 'port_loading_code', 'invoices_status', 'delivery_place_id', 'delivery_name', 'delivery_address', 't1_id', 't1_name', 't1_address', 'custom_stop_id', 'custom_stop_name', 'custom_stop_address', 'etd_first', 'voyage_vessel_origin', 'notify_party_address', 'port_destination_code', 'destination_agent_id', 'destination_agent_name', 'destination_agent_address',
        'amount_of_insurance', 'declare_value_forcariage', 'declare_value_forcustom', 'handling_information', 'customer_group_id', 'customer_group_name',
    ];

    protected $appends = ['pod_code', 'teus', 'teus_new', 'days_closed'];

    public function jobOrderDetail()
    {
        return $this->hasOne(JobOrderDetail::class, 'job_id', 'job_id');
    }

    public function jobOrder()
    {
        return $this->hasOneThrough(
            JobOrder::class,
            JobOrderDetail::class,
            'job_id',
            'job_order_id',
            'job_id',
            'job_order_id'
        );
    }

    public function jobOrderAir()
    {
        return $this->hasOneThrough(
            JobOrderAir::class,
            JobOrderDetail::class,
            'job_id',
            'job_order_id',
            'job_id',
            'job_order_id'
        );
    }

    public function billingCustomer()
    {
        return $this->belongsTo(CustomerBilling::class, 'customer_id', 'customer_id');
    }

    public function agreedRates()
    {
        return $this->hasMany(AgreedRate::class, 'job_id', 'job_id');
    }

    public function salesoffice()
    {
        return $this->hasMany(SalesOffice::class, 'job_id', 'job_id');
    }

    public function salesperson()
    {
        return $this->hasMany(SalesPerson::class, 'job_id', 'job_id');
    }

    public function order()
    {
        return $this->belongsTo(Order::class, 'job_id', 'job_id');
    }

    public function consignee()
    {
        return $this->belongsTo(Customer::class, 'to_consignee', 'customer_id');
    }

    public function shipper()
    {
        return $this->belongsTo(Customer::class, 'from_shipper', 'customer_id');
    }

    public function origin()
    {
        return $this->belongsTo(Office::class, 'origin_id', 'office_id');
    }

    public function loadingplan()
    {
        return $this->belongsTo(LoadingPlan::class, 'loading_id', 'plan_id');
    }

    public function loadingreport()
    {
        return $this->belongsTo(LoadingReport::class, 'loading_id', 'loading_id');
    }

    public function loadingreportdetail()
    {
        return $this->hasMany(LoadingReportDetail::class, 'bl_id', 'loading_id');
    }

    public function reference()
    {
        return $this->hasMany(ShippingInstruction::class, 'reference_id', 'job_id')
            ->orderBy('ctd_number', 'asc');
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

    public function getDimensionSumVolumeCbmAttribute($value)
    {
        return (float) $value;
    }

    public function dimension()
    {
        return $this->hasMany(Dimension::class, 'job_id', 'job_id');
    }

    public function departed()
    {
        return $this->hasOne(HistoriJob::class, 'job_id', 'job_id')->whereIn('status_id', [16, 7])->where('is_deleted', 0)->latest();
    }

    public function arrived()
    {
        return $this->hasOne(HistoriJob::class, 'job_id', 'job_id')->whereIn('status_id', [30])->where('is_deleted', 0)->latest();
    }

    public function loadingdxb()
    {
        return $this->belongsTo(LoadingPlanDxb::class, 'loading_plan_dxb', 'plan_id');
    }

    public function partner()
    {
        return $this->hasMany(Patner::class, 'job_id', 'job_id');
    }

    public function billing()
    {
        return $this->hasOne(Billing::class, 'customer_id', 'customer_id');
    }

    public function dxbdetail()
    {
        return $this->hasOne(LoadingPlanDxbDetail::class, 'loading_plan_id', 'loading_plan_dxb')
            ->orderBy('date_departure', 'asc');
    }

    public function dxbarrival()
    {
        return $this->hasOne(LoadingPlanDxbDetail::class, 'loading_plan_id', 'loading_plan_dxb')
            ->orderBy('date_arival', 'desc');
    }

    public function lpdetail()
    {
        return $this->hasOne(LoadingPlanDetail::class, 'loading_plan_id', 'loading_id')
            ->orderBy('date_departure', 'asc');
    }

    public function lparrival()
    {
        return $this->hasOne(LoadingPlanDetail::class, 'loading_plan_id', 'loading_id')
            ->orderBy('date_arival', 'desc');
    }

    public function bl()
    {
        return $this->belongsTo(LoadingReportBl::class, 'loading_id', 'loading_id');
    }

    public function getTeusAttribute()
    {
        return $this->loadingreportdetail->sum('teus');
    }

    public function getTeusNewAttribute()
    {
        return $this->loadingreportdetail->sum('teus');
    }

    public function loadingplandetail()
    {
        return $this->belongsTo(LoadingPlanDetail::class, 'loading_id', 'loading_plan_id')->orderBy('date_arival', 'DESC');
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

    public function getDaysClosedAttribute()
    {
        try {
            if ($this->status_shipment_id == 39 || $this->status_shipment_id == 25) {
                $type = $this->metode_shipment;
                if ($type == 'SEAAIR') {
                    $departed = HistoriJob::where('job_id', $this->job_id)->where('status_id', '7')->where('is_deleted', '!=', 1)->first();

                    $cek = ControlOffice::where('job_id', $this->job_id)->exists();
                    if ($cek) {
                        $cekconsignee = HistoriJob::where('job_id', $this->job_id)->where('status_id', '38')->where('is_deleted', '!=', 1);
                        if ($cekconsignee->exists()) {
                            $close = $cekconsignee->first();
                        } else {
                            $cekhis = HistoriJob::where('job_id', $this->job_id)->where('status_id', '39')->where('is_deleted', '!=', 1);
                            if ($cekhis->exists()) {
                                $close = $cekhis->first();
                            } else {
                                $close = HistoriJob::where('job_id', $this->job_id)->where('status_id', '35')->where('is_deleted', '!=', 1)->first();
                            }
                        }
                    } else {
                        $cekconsignee = HistoriJob::where('job_id', $this->job_id)->where('status_id', '38')->where('is_deleted', '!=', 1);
                        if ($cekconsignee->exists()) {
                            $close = $cekconsignee->first();
                        } else {
                            $cekhis = HistoriJob::where('job_id', $this->job_id)->where('status_id', '35')->where('is_deleted', '!=', 1);
                            if ($cekhis->exists()) {
                                $close = $cekhis->first();
                            } else {
                                $close = HistoriJob::where('job_id', $this->job_id)->where('status_id', '39')->where('is_deleted', '!=', 1)->first();
                            }
                        }
                    }

                    $tgl_departed = $this->changeDate($departed->tgl_aktual, $departed->gmt);
                    $tgl_close = $this->changeDate($close->tgl_aktual, $close->gmt);

                    $days = isset($tgl_departed) && isset($tgl_close) ?
                    (new \DateTime(date('Y-m-d', strtotime($tgl_close))))
                        ->diff(new \DateTime(date('Y-m-d', strtotime($tgl_departed))))
                        ->days : null;
                    $arr = [
                        'days' => $days,
                        'tgl_departed' => $tgl_departed,
                        'tgl_close' => $tgl_close,
                        'tgl_departed_original' => $departed->tgl_aktual,
                        'tgl_close_original' => $close->tgl_aktual,
                        'gmt_close' => $close->gmt,
                        'gmt_departed' => $departed->gmt,
                        'user' => $close->created_by,
                    ];

                    return $arr;

                } else {
                    $departed = HistoriJob::where('job_id', $this->job_id)->where('status_id', '16')->where('is_deleted', '!=', 1)->first();
                    $cek = ControlOffice::where('job_id', $this->job_id)->exists();
                    if ($cek) {
                        $cekconsignee = HistoriJob::where('job_id', $this->job_id)->where('status_id', '24')->where('is_deleted', '!=', 1);
                        if ($cekconsignee->exists()) {
                            $close = $cekconsignee->first();
                        } else {
                            $cekhis = HistoriJob::where('job_id', $this->job_id)->where('status_id', '25')->where('is_deleted', '!=', 1);
                            if ($cekhis->exists()) {
                                $close = $cekhis->first();
                            } else {
                                $close = HistoriJob::where('job_id', $this->job_id)->where('status_id', '21')->where('is_deleted', '!=', 1)->first();
                            }
                        }
                    } else {
                        $cekconsignee = HistoriJob::where('job_id', $this->job_id)->where('status_id', '24')->where('is_deleted', '!=', 1);
                        if ($cekconsignee->exists()) {
                            $close = $cekconsignee->first();
                        } else {
                            $cekhis = HistoriJob::where('job_id', $this->job_id)->where('status_id', '21')->where('is_deleted', '!=', 1);
                            if ($cekhis->exists()) {
                                $close = $cekhis->first();
                            } else {
                                $close = HistoriJob::where('job_id', $this->job_id)->where('status_id', '25')->where('is_deleted', '!=', 1)->first();
                            }
                        }
                    }
                    $tgl_departed = $this->changeDate($departed->tgl_aktual, $departed->gmt);
                    $tgl_close = $this->changeDate($close->tgl_aktual, $close->gmt);
                    $days = isset($tgl_departed) && isset($tgl_close) ?
                    (new \DateTime(date('Y-m-d', strtotime($tgl_close))))
                        ->diff(new \DateTime(date('Y-m-d', strtotime($tgl_departed))))
                        ->days : null;
                    $arr = [
                        'days' => $days,
                        'tgl_departed' => $tgl_departed,
                        'tgl_close' => $tgl_close,
                        'tgl_departed_original' => $departed->tgl_aktual,
                        'tgl_close_original' => $close->tgl_aktual,
                        'gmt_close' => $close->gmt,
                        'gmt_departed' => $departed->gmt,
                        'user' => $close->created_by,
                    ];

                    return $arr;
                }

            } else {
                return null;
            }
        } catch (\Throwable $e) {
            // Log the error and return a user-friendly error message

            return null;
        }

    }

    public function changeDate($tgl_aktual, $gmt)
    {
        $gmt = strtoupper($gmt);
        $carbonDate = \Carbon\Carbon::parse($tgl_aktual, $gmt);
        $dates = $carbonDate->setTimezone('GMT+4')->toDateTimeString();

        return $dates;
    }
}
