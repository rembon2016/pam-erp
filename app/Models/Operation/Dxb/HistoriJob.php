<?php

namespace App\Operation\Models\Dxb;

use Illuminate\Database\Eloquent\Model;

class HistoriJob extends Model
{
    protected $table = 'dxb.histori_job';
    public $timestamps = false;
    protected $primaryKey = 'histori_id';
    protected $keyType = 'string';
    static $rules = [];
    const CREATED_AT = 'date_created';
    protected $fillable = ['histori_id','job_id','status','location','tgl_aktual','created_by','gmt','status_id'];

    public function link()
    {
        return $this->belongsTo(Status::class, 'status_id', 'status_id');
    }
}