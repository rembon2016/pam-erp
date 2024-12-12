<?php

namespace App\Models\Operation\Master;

use App\Models\Master\Countries;
use App\Models\Master\CustomerType;
use Illuminate\Database\Eloquent\Model;
use App\Traits\Filterable;

class Customer extends Model
{
	use Filterable;
    protected $table = 'master.customer';
	public $timestamps = false;
	protected $primaryKey = 'customer_id';
	protected $keyType = 'string';
    static $rules = [
		'customer_name' => 'required',
		'customer_type' => 'required',
		'status' => 'required',];
    protected $fillable = ['customer_id','customer_name','customer_address','customer_email','customer_telp','customer_fax','customer_phone','customer_tax_id','customer_contact_person','country_id','customer_type','created_by','modified_by','status','date_modified','customer_code','customer_group_id','iata_code'];

	public function countries(){
		return $this->belongsTo(Countries::class, 'country_id', 'country_id');
	}

	public function customer_type_detail(){
		return $this->belongsTo(CustomerType::class, 'customer_type', 'customer_type_id');
	}
}
