<?php

namespace App\Operation\Models\Origin;

use Illuminate\Database\Eloquent\Model;

class SalesOffice extends Model
{
    protected $table = 'origin.si_sales_office';
    public $timestamps = false;
    protected $primaryKey = 'si_sales_office_id';
    protected $keyType = 'string';
    static $rules = [];
    protected $fillable = ['si_sales_office_id','job_id','sales_office_id','status','created_by','modified_by','sales_office_name'];
}
