<?php

namespace App\Models\Operation\Dxb;

use Illuminate\Database\Eloquent\Model;

class Dimension extends Model
{
    protected $table = 'dxb.dimension';
    public $timestamps = false;
    protected $primaryKey = 'dimension_id';
    protected $keyType = 'string';
    static $rules = [];
    protected $fillable = ['dimension_id','job_id','no_pcs','unit','length','width','height','volume_cbm','volume_weight'];
}
