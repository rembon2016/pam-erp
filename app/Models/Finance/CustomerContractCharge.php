<?php

declare(strict_types=1);

namespace App\Models\Finance;

use App\Models\Finance\Charge;
use Illuminate\Database\Eloquent\Model;
use App\Models\Finance\CustomerContract;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use App\Models\Finance\CustomerContractChargeDetail;
use App\Traits\Eloquent\Historable;
use Illuminate\Database\Eloquent\Factories\HasFactory;

final class CustomerContractCharge extends Model
{
    use HasFactory, HasUuids, Historable;

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

    protected static ?array $historableActions = ['create', 'update'];

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
}
