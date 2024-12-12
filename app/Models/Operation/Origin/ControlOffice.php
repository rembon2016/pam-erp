<?php

namespace App\Operation\Models\Origin;

use Illuminate\Database\Eloquent\Model;

class ControlOffice extends Model
{
    protected $table = 'origin.control_office';
    public $timestamps = false;
    protected $primaryKey = 'control_id';
    protected $keyType = 'string';
    static $rules = [];
    protected $fillable = ['control_id','job_id','office_id','office_name'];


}
