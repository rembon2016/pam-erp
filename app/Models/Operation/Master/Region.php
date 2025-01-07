<?php

namespace App\Models\Operation\Master;

use Illuminate\Database\Eloquent\Model;

class Region extends Model
{
    protected $table = 'master.region';

    public $timestamps = false;

    protected $primaryKey = 'region_id';

    public static $rules = [
        'region_name' => 'required',
        'status' => 'required|numeric',
    ];

    protected $fillable = ['region_id', 'region_name', 'region_code', 'created_by', 'modified_by', 'status', 'date_modified'];
}
