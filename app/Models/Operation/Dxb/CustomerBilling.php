<?php

namespace App\Models\Operation\Dxb;

use App\Traits\Filterable;
use App\Models\Master\Countries;
use App\Models\Master\CustomerType;
use Illuminate\Database\Eloquent\Model;
use App\Models\Finance\CustomerContract;

class CustomerBilling extends Model
{
    use Filterable;
    protected $table = 'accounting.customer';
    public $timestamps = false;
    protected $primaryKey = 'customer_id';
    protected $keyType = 'string';
    static $rules = [];
    protected $fillable = ['customer_id','customer_name','customer_address','customer_email','customer_telp','customer_fax','customer_phone','customer_tax_id','customer_contact_person','country_id','created_by','modified_by','status','customer_type','customer_code','customer_group_id','iata_code','office_id','city','zip_code','vendor_id','type'];

    public function countries(){
		return $this->belongsTo(Countries::class, 'country_id', 'country_id');
	}

	public function group(){
		return $this->belongsTo(CustomerGroup::class, 'customer_group_id', 'customer_group_id');
	}

	public function customer_type_detail(){
		return $this->belongsTo(CustomerType::class, 'customer_type', 'customer_type_id');
	}

    public function customerContracts()
    {
        return $this->hasMany(CustomerContract::class, 'customer_id', 'finance_customer_id');
    }


}
