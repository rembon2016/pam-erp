<?php

namespace App\Models\Operation\Dxb;

use Illuminate\Database\Eloquent\Model;

class ControlOffice extends Model
{
    protected $table = 'dxb.control_office';

    public $timestamps = false;

    protected $primaryKey = 'control_id';

    protected $keyType = 'string';

    public static $rules = [];

    protected $fillable = ['control_id', 'job_id', 'office_id', 'office_name'];
}
