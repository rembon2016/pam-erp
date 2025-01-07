<?php

namespace App\Models\Operation\Origin;

use Illuminate\Database\Eloquent\Model;

class HistoriJob extends Model
{
    protected $table = 'origin.histori_job';

    public $timestamps = false;

    protected $primaryKey = 'histori_id';

    protected $keyType = 'string';

    public static $rules = [];

    const CREATED_AT = 'date_created';

    protected $fillable = ['histori_id', 'job_id', 'status', 'location', 'tgl_aktual', 'created_by', 'gmt', 'role_id', 'status_id'];
}
