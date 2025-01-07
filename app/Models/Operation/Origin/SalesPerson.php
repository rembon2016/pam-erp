<?php

namespace App\Models\Operation\Origin;

use Illuminate\Database\Eloquent\Model;

class SalesPerson extends Model
{
    protected $table = 'origin.si_sales_person';

    public $timestamps = false;

    protected $primaryKey = 'si_sales_person_id';

    protected $keyType = 'string';

    public static $rules = [];

    protected $fillable = ['si_sales_person_id', 'job_id', 'sales_person_id', 'status', 'created_by', 'modified_by', 'sales_person_name'];
}
