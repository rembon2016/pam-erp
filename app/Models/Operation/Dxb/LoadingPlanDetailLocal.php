<?php

namespace App\Models\Operation\Dxb;

use Illuminate\Database\Eloquent\Model;

class LoadingPlanDetailLocal extends Model
{
    protected $table = 'dxb.loading_plan_detail_local';

    public $timestamps = false;

    protected $primaryKey = 'loading_detail_id';

    protected $keyType = 'string';

    public static $rules = [];

    protected $fillable = ['loading_detail_id', 'loading_plan_id', 'flight_number', 'port_departure_id', 'port_departure_name', 'date_departure', 'port_arival_id', 'port_arival_name', 'date_arival', 'port_departure_code', 'port_arival_code', 'carrier_id', 'carrier_name'];
}
