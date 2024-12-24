<?php

declare(strict_types=1);

namespace App\Models\Finance;

use App\Models\Finance\Charge;
use App\Models\Operation\Master\Unit;
use Illuminate\Database\Eloquent\Model;
use App\Models\Finance\AgentContractService;
use App\Models\Finance\AgentContractChargeDetail;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

final class AgentContractCharge extends Model
{
    use HasFactory, HasUuids;

    /**
     * The database table name for the bank informations.
     *
     * @var string
     */
    protected $table = 'finance.agent_contract_charge';

    /**
     * Indicates that all fields are guarded from mass assignment except for the 'id' field.
     *
     * @var array
     */
    protected $guarded = ['id'];


    /**
     * Belongs to Relation with Charge
     *
     * @return BelongsTo
     */
    public function contract()
    {
        return $this->belongsTo(AgentContract::class, 'agent_contract_id', 'id');
    }


    /**
     * Belongs to Relation with Charge
     *
     * @return BelongsTo
     */
    public function serviceContract()
    {
        return $this->belongsTo(AgentContractService::class, 'agent_contract_service_id', 'id');
    }

    /**
     * Belongs to Relation with Charge
     *
     * @return BelongsTo
     */
    public function charge()
    {
        return $this->belongsTo(Charge::class, 'charge_id', 'id');
    }

    /**
     * Belongs to Relation with Unit
     *
     * @return BelongsTo
     */
    public function unit()
    {
        return $this->belongsTo(Unit::class, 'unit_id', 'unit_id');
    }

    public function chargeDetails()
    {
        return $this->hasMany(AgentContractChargeDetail::class, 'agent_contract_charge_id', 'id');
    }
}
