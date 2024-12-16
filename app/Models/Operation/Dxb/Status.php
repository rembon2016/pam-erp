<?php

namespace App\Models\Operation\Dxb;

use Illuminate\Database\Eloquent\Model;
use App\Traits\Filterable;

class Status extends Model
{
	use Filterable;

    protected $table = 'dxb.status';
    public $timestamps = false;
    protected $primaryKey = 'status_id';
    protected $keyType = 'string';
    static $rules = [
		'status_name' => 'required',];
    protected $fillable = ['status_id','status_name','created_by','modified_by','role_id','shipment_type','date_modified'];
}
