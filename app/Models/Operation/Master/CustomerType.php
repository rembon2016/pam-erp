<?php

namespace App\Models\Operation\Master;

use Illuminate\Database\Eloquent\Model;

class CustomerType extends Model
{
    protected $table = 'master.customer_type';
    public $timestamps = false;
    protected $primaryKey = 'customer_type_id';
    protected $keyType = 'string';
    static $rules = [
		'status' => 'required',];
    protected $fillable = ['customer_type_id','customer_type_name','description','created_by','modified_by','status','date_modified'];
}
