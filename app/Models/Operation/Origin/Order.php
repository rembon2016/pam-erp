<?php

namespace App\Models\Operation\Origin;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
	const MEASUREMENT_CONST = 166.66;

    protected $table = 'origin.si_order';
    public $timestamps = false;
    protected $primaryKey = 'order_id';
    protected $keyType = 'string';
	protected $appends = ["chargeableWeight"];
    static $rules = [

    ];
    protected $fillable = ['order_id','job_id','qty','hs_code','pkgs','net_weight','gross_weight','measurement','dimension','description_of_goods','create_by','modified_by','status','notes',
      'si_doc','packing_list_doc','com_invoices_doc','bil_doc','coo_doc','ctd_doc','order_doc','other_doc',
	  'final_alert_doc','container_loading_doc','msds_doc','cft_doc','test_report_doc','mawb_doc','cargo_manifest','loading_image','prof_delivered','image_delivered','file_bebas','attachment_goods','additional_description',
	  'chw','vol_weight'
	];

	public function shipping()
    {
        return $this->belongsTo(ShippingInstruction::class, 'job_id', 'job_id');
    }

	public function getChargeableWeightAttribute()
    {
		return $this->chw;
        //return $this->_get_chargable_weight($this->gross_weight, $this->measurement);
    }

	private function _get_chargable_weight($gross_weight, $measurement){
		// thousand = "."; Decimal = ","
		//$measurement = str_replace(".","" , $measurement ?? 0);
		//$measurement = str_replace(",",".", $measurement);

		// thousand = ","; Decimal = "."
		$measurement = floatval(str_replace(",","", $measurement));

		$measurement+= 0;
		$gross_weight = (!empty($gross_weight) ? $gross_weight : 0);
		$measurement_calc = self::MEASUREMENT_CONST * (!empty($measurement) ? $measurement : 0);
		$comma = $measurement_calc - (int) $measurement_calc;
		if($comma >= 0.5){
			$measurement_calc = ((int) $measurement_calc) + 1;
		}else if($comma > 0.0){
			$measurement_calc = ((int) $measurement_calc) + 0.5;
		}
		return ($measurement_calc > $gross_weight ? $measurement_calc :$gross_weight);
	}

}
