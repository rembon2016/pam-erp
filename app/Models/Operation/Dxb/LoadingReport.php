<?php

namespace App\Models\Operation\Dxb;

use App\Traits\Filterable;
use Illuminate\Database\Eloquent\Model;

class LoadingReport extends Model
{
    use Filterable;

    protected $table = 'dxb.loading_report';

    public $timestamps = false;

    protected $primaryKey = 'loading_id';

    protected $keyType = 'string';

    public static $rules = [];

    protected $fillable = ['loading_id',
        'shipping_line',
        'shipping_line_name',
        'booking_number',
        'qty_container',
        'bl_number',
        'origin_office_id',
        'status',
        'created_by',
        'modified_by',
        'vessel_name',
        'vessel_id',
        'date_modified',
        'vessel_id',
        'vessel_name',
        'etd',
        'eta',
        'voyage_number',
        'feeder_vessel_name',
        'voyage_number_feeder',
        'fcl_clossing_time',
        'loading_plan_number',
        'voyage_vessel_origin',
    ];

    public function detail()
    {
        return $this->hasMany(LoadingReportDetail::class, 'bl_id', 'loading_id');
    }

    public function shipment()
    {
        return $this->hasMany(ShippingInstruction::class, 'loading_id', 'loading_id');
    }
}
