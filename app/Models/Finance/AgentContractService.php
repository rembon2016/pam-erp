<?php

declare(strict_types=1);

namespace App\Models\Finance;

use App\Models\Operation\Master\Carrier;
use App\Models\Operation\Master\Countries;
use App\Models\Operation\Master\Port;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

final class AgentContractService extends Model
{
    use HasFactory, HasUuids;

    /**
     * The database table name for the bank informations.
     *
     * @var string
     */
    protected $table = 'finance.agent_contract_service';

    /**
     * Indicates that all fields are guarded from mass assignment except for the 'id' field.
     *
     * @var array
     */
    protected $guarded = ['id'];

    /**
     * Belongs to Relation with Service Type
     *
     * @return BelongsTo
     */
    public function serviceType()
    {
        return $this->belongsTo(ServiceType::class, 'service_type_id', 'id');
    }

    /**
     * Belongs to Relation with Country
     *
     * @return BelongsTo
     */
    public function porCountry()
    {
        return $this->belongsTo(Countries::class, 'por_country_id', 'country_id');
    }

    /**
     * Belongs to Relation with Country
     *
     * @return BelongsTo
     */
    public function fdcCountry()
    {
        return $this->belongsTo(Countries::class, 'fdc_country_id', 'country_id');
    }

    /**
     * Belongs to Relation with Port
     *
     * @return BelongsTo
     */
    public function porPort()
    {
        return $this->belongsTo(Port::class, 'por_port_id', 'port_id');
    }

    /**
     * Belongs to Relation with Port
     *
     * @return BelongsTo
     */
    public function fdcPort()
    {
        return $this->belongsTo(Port::class, 'fdc_port_id', 'port_id');
    }

    /**
     * Belongs to Relation with Carrier
     *
     * @return BelongsTo
     */
    public function carrier()
    {
        return $this->belongsTo(Carrier::class, 'carrier_id', 'carrier_id');
    }

    /**
     * Has Many Relation with Contract Agent Charge
     *
     * @return HasMany
     */
    public function contractAgentCharge()
    {
        return $this->hasMany(AgentContractCharge::class, 'agent_contract_service_id', 'id');
    }
}
