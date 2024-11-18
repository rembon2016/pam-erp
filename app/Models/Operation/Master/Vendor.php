<?php

namespace App\Models\Operation\Master;

use Illuminate\Database\Eloquent\Model;

class Vendor extends Model
{

    protected $table = 'master.vendor';
    public $timestamps = false;
    protected $primaryKey = 'vendor_id';
    protected $keyType = 'string';
    static $rules = [];
    protected $fillable = ['vendor_id','vendor_name','vendor_address','vendor_cp','vendor_email','vendor_phone','vendor_telp','created_date','created_by','modified_by','status','vendor_type_id','country_id','date_modified','segment','vendor_code'];
    protected $appends = ['type'];

    public function getTypeAttribute()
    {
        return $this->customer_type->customer_type_name ?? "";
    }
}
