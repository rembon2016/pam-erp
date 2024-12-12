<?php

namespace App\Models\Operation\Origin;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class HistoriJob extends Model
{
    protected $table = 'origin.histori_job';
    public $timestamps = false;
    protected $primaryKey = 'histori_id';
    protected $keyType = 'string';
    static $rules = [];
    const CREATED_AT = 'date_created';
    protected $fillable = ['histori_id','job_id','status','location','tgl_aktual','created_by','gmt','role_id','status_id'];

}
