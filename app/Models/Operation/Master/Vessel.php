<?php

namespace App\Models\Operation\Master;

use Illuminate\Database\Eloquent\Model;

class Vessel extends Model
{

    protected $table = 'master.vessel';
    public $timestamps = false;
    protected $primaryKey = 'vessel_id';
    protected $keyType = 'string';
    static $rules = [
		'vessel_name' => 'required',];
    protected $fillable = ['vendor_id','vessel_id','vessel_code','vessel_name','vessel_origin','callsign','gross_registered_tonage','net_registered_tonage','lloyds_number','lov_status','note','created_by','modified_by','status','date_modified'];

    public function vendor(){
      return $this->belongsTo(Vendor::class, 'vendor_id', 'vendor_id');
    }

    protected $appends = ['type'];

	public function getTypeAttribute()
	{
		return "Carrier";
	}
}
