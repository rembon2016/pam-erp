<?php

namespace App\Models\Operation\Origin;

use Illuminate\Database\Eloquent\Model;
use App\Models\LoadingPlan;
class LoadingPlanDetail extends Model
{
    protected $table = 'origin.loading_plan_detail';
    public $timestamps = false;
    protected $primaryKey = 'loading_detail_id';
    protected $keyType = 'string';
    static $rules = [];
    protected $fillable = ['loading_detail_id',
        'loading_plan_id',
        'flight_number',
        'port_departure_id',
        'port_departure_name',
        'date_departure',
        'port_arival_id',
        'port_arival_name',
        'date_arival',
        'port_departure_code',
        'port_arival_code'
    ];

    protected static function boot()
    {
        parent::boot();

        static::updating(function ($model) {
            $original = $model->getOriginal();
            $changes = $model->getDirty();

            // Check if status is being updated to 3

            $model->logChanges('update', $original, $changes);

        });

        static::creating(function ($model) {
            $model->logChanges('create', null, $model->attributesToArray());
        });

        static::deleting(function ($model) {
            $original = $model->getOriginal();
            $model->logChanges('delete', $original, null);
        });
    }

    public function logChanges($action, $oldData, $newData)
    {
        if($action == 'create'){
            $lp = LoadingPlan::find($newData["loading_plan_id"]);
            $user = $lp->created_by;
            $ctd = $lp->loading_plan_number;
        }else{
            $lp = LoadingPlan::find($oldData["loading_plan_id"]);
            $user = $lp->modified_by ?? null;
            $ctd = $lp->loading_plan_number;
        }

        \App\Models\Log::create([
            'module' => 'Loading Plan',
            'detail_module'=>'Air Freight - Cross Air Detail',
            'method'=> $action,
            'data_old' => $oldData ? json_encode($oldData) : null,
            'data_new' => json_encode($newData),
            'date_created'=>\Carbon\Carbon::now(),
            'user'=>$user,
            'value'=>$ctd
        ]);
    }
}
