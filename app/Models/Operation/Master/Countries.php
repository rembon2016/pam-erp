<?php

namespace App\Models\Operation\Master;

use Illuminate\Database\Eloquent\Model;

class Countries extends Model
{

    protected $table = 'master.countries';
	public $timestamps = false;
	protected $primaryKey = 'country_id';
    static $rules = [
		'country_code' => 'required|max:5',
		'country_name' => 'required|max:150',
		'region_id' => 'numeric|required',
		'status' => 'numeric|required',
		'created_by' => 'nullable',
		'modified_by' => 'nullable',
	];
    protected $fillable = ['country_id','country_code','country_name','region_id','created_by','modified_by','status','date_modified'];

	public function region()
    {
        return $this->belongsTo(Region::class, 'region_id', 'region_id');
    }

}
