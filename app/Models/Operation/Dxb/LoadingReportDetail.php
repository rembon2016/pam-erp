<?php

namespace App\Models\Operation\Dxb;

use Illuminate\Database\Eloquent\Model;

class LoadingReportDetail extends Model
{
    protected $table = 'dxb.loading_report_detail';

    public $timestamps = false;

    protected $primaryKey = 'detail_bl_id';

    protected $keyType = 'string';

    public static $rules = [];

    protected $fillable = ['detail_bl_id',
        'bl_id',
        'container_number',
        'seal_number',
        'container_type',
        'status',
    ];

    protected $appends = [
        'teus',
    ];

    public function loading()
    {
        return $this->belongsTo(LoadingReport::class, 'bl_id', 'loading_id');
    }

    public function bl()
    {
        return $this->belongsTo(LoadingReportBl::class, 'loading_report_bl_id', 'loading_report_bl_id');
    }

    public function getTeusAttribute($value)
    {
        if (! isset($this->container_type)) {
            return 0;
        }
        $sub = substr($this->container_type, 0, 2);
        if ($sub == '20') {
            return 1;
        } elseif ($sub >= '40') {
            return 2;
        } else {
            return 0;
        }
    }
}
