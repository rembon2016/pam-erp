<?php

declare(strict_types=1);

namespace App\Models\Finance;

use Illuminate\Database\Eloquent\Model;
use App\Models\Finance\CustomerContract;
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

    public function rates()
    {
        return $this->hasMany(CustomerContractChargeDetail::class, 'customer_contract_charge_id', 'id');
    }

    public function customerContract()
    {
        return $this->hasOne(CustomerContract::class, 'id', 'customer_contract_id');
    }
}
