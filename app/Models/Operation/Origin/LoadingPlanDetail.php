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


}
