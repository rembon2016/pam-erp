<?php


namespace App\Models\Operation\Master;

use Illuminate\Database\Eloquent\Model;

class Carrier extends Model
{

    protected $table = 'master.carrier';
	public $timestamps = false;
	protected $primaryKey = 'carrier_id';
	protected $keyType = 'string';
	const UPDATED_AT = 'date_modified';
    static $rules = [
		'carrier_name' => 'required',
		'status' => 'required',];
    protected $fillable = ['carrier_id','carrier_code','carrier_name','carrier_type','type','carrier_no','scac','us_custom_scac','iata_carrier','edi_line_code','pan_no','lov_status','created_by','modified_by','status','date_modified','vendor_code'];

	protected $appends = ['type'];

	public function getTypeAttribute()
	{
		return "Carrier";
	}
}
