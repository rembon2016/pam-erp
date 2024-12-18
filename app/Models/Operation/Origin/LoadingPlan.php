<?php

namespace App\Models\Operation\Origin;

use Illuminate\Database\Eloquent\Model;
use App\Traits\Filterable;
class LoadingPlan extends Model
{
    use Filterable;
    protected $table = 'origin.loading_plan';
    public $timestamps = false;
    protected $primaryKey = 'plan_id';
    protected $keyType = 'string';
    static $rules = [];
    protected $fillable = ['plan_id','carrier_id','carrier_name','mawb_number','created_by','modified_by','status','origin_office_id','date_modified','closing_time','loading_plan_number'];

    function shipping(){
        return $this->hasMany(ShippingInstruction::class, 'loading_id', 'plan_id');
    }

}
