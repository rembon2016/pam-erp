<?php

declare(strict_types=1);

namespace App\Models\Finance;

use App\Models\Finance\Charge;
use Illuminate\Database\Eloquent\Model;
use App\Models\Finance\CustomerContract;
use App\Models\Finance\CustomerContractService;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use App\Models\Finance\CustomerContractChargeDetail;
use Illuminate\Database\Eloquent\Factories\HasFactory;

final class CustomerContractCharge extends Model
{
    use HasFactory, HasUuids;

    /**
     * The database table name for the bank informations.
     *
     * @var string
     */
    protected $table = 'finance.customer_contract_charge';

    /**
     * Indicates that all fields are guarded from mass assignment except for the 'id' field.
     *
     * @var array
     */
    protected $guarded = ['id'];

    protected $appends = [
        'unit_id'
    ];

    public function charge()
    {
        return $this->hasOne(Charge::class, 'id', 'charge_id');
    }

    public function rates()
    {
        return $this->hasMany(CustomerContractChargeDetail::class, 'customer_contract_charge_id', 'id');
    }

    public function customerContract()
    {
        return $this->hasOne(CustomerContract::class, 'id', 'customer_contract_id');
    }

    public function service()
    {
        return $this->hasOne(CustomerContractService::class, 'id', 'customer_contract_service_id');
    }

    public function getChargeRate($quantity, $shippingInstruction = null)
    {
        if ($this->unit_code == "KG") {
            $rate = $this->rates()->select('rate')->where('from', '<=', $quantity)
                ->where('to', '>=', $quantity)
                ->first();

            // Jika tidak ada, cari nilai paling mendekati (di bawah atau di atas rentang)
            if (! $rate) {
                if ($quantity < $this->rates()->select('rate')->min('from')) {
                    // Quantity di bawah rentang, ambil nilai terkecil
                    $rate = $this->rates()->select('rate')->orderBy('from', 'asc')->first();
                } else {
                    // Quantity di atas rentang, ambil nilai terbesar
                    $rate = $this->rates()->select('rate')->orderBy('to', 'desc')->first();
                }
            }

            $chargeRate = $rate?->rate ?? 0;

            return (object) [
                'rate' => $chargeRate,
                'amount' => ($shippingInstruction?->order_sum_chw ?? 0) * $chargeRate,
            ];
        } elseif ($this->unit_code == "CONTAINER") {
            $containers = $shippingInstruction->loadingreportdetail;
            $chargeRate = 0;
            foreach ($containers as $container) {
                $rate = $this->rates()->select('rate')->where('container_type', $container->container_type)->first();
                $chargeRate += $rate?->rate ?? 0;
            }

            return (object) [
                'rate' => $chargeRate,
                'amount' => $chargeRate * 1,
            ];
        } elseif ($this->unit_code == "SHIPMENT") {
            $chargeRate = $this->rates->first()?->rate ?? 0;
            $totalShipment = 1;

            return (object) [
                'rate' => $chargeRate,
                'amount' => $chargeRate * $totalShipment,
            ];
        } else {
            return (object) [
                'rate' => 0,
                'amount' => 0,
            ];
        }
    }

    public function getUnitIdAttribute()
    {
        return $this->charge?->unit_id;
    }

    public function getUnitCodeAttribute()
    {
        return $this->charge?->unit?->unit_name;
    }
}
