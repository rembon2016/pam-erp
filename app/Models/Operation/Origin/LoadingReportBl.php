<?php

namespace App\Operation\Models\Origin;

use Illuminate\Database\Eloquent\Model;
use App\Models\LoadingReport;
class LoadingReportBl extends Model
{
    protected $table = 'origin.loading_report_bl';
    public $timestamps = false;
    protected $primaryKey = 'loading_report_bl_id';
    protected $keyType = 'string';
    static $rules = [];
    protected $fillable = ['loading_report_bl_id','bl_number','loading_id','created_by','modified_by','status','feeder_vessel_name','voyage_number_feeder','fcl_closing_time'];

    function detail(){
        return $this->hasMany(LoadingReportDetail::class, 'loading_report_bl_id', 'loading_report_bl_id');
    }

    function shipping(){
        return $this->hasMany(ShippingInstruction::class, 'loading_report_bl_id', 'loading_report_bl_id')->where("status","!=",3);
    }

    protected static function boot()
    {
        parent::boot();

        static::updating(function ($model) {
            $original = $model->getOriginal();
            $changes = $model->getDirty();

            // Check if status is being updated to 3

            if (isset($changes['status']) && $changes['status'] == 3) {
                $model->logChanges('delete', $original, $changes);
            } else {
                $model->logChanges('update', $original, $changes);
            }

        });

        static::creating(function ($model) {
            $model->logChanges('create', null, $model->attributesToArray());
        });
    }

    public function logChanges($action, $oldData, $newData)
    {
        if($action == 'create'){
            $lp = LoadingReport::find($newData["loading_id"]);
            $user = $newData["created_by"];
            $ctd = $lp->loading_plan_number;
        }else{
            $lp = LoadingReport::find($oldData["loading_id"]);
            $user = $newData["modified_by"] ?? $oldData["modified_by"] ?? null;
            $ctd = $lp->loading_plan_number;
        }

        \App\Models\Log::create([
            'module' => 'Loading Plan',
            'detail_module'=>'SEA Freight BL',
            'method'=> $action,
            'data_old' => $oldData ? json_encode($oldData) : null,
            'data_new' => json_encode($newData),
            'date_created'=>\Carbon\Carbon::now(),
            'user'=>$user,
            'value'=>$ctd
        ]);
    }

}
