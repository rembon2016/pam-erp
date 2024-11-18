<?php

namespace App\Models\Operation\Master;

use Illuminate\Database\Eloquent\Model;

class CustomerGroup extends Model
{
    protected $table = 'master.customer_group';
    public $timestamps = false;
    protected $primaryKey = 'customer_group_id';
    protected $keyType = 'string';
    static $rules = [];
    protected $fillable = ['customer_group_id','customer_group_name','customer_group_address','customer_group_email','customer_group_telp','customer_group_phone','customer_group_contact_person','customer_group_fax','created_by','modified_by','status','date_modified'];
    public function customer()
    {
        return $this->hasMany(Customer::class, 'customer_group_id', 'customer_group_id');
    }
}
