<?php

declare(strict_types=1);

namespace App\Models\Finance;

use App\Models\Finance\ServiceType;
use Illuminate\Database\Eloquent\Model;
use App\Models\Finance\AgentContractDocument;
use App\Models\History;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Factories\HasFactory;

final class AgentContract extends Model
{
    use HasFactory, HasUuids, SoftDeletes;

    /**
     * The database table name for the bank informations.
     *
     * @var string
     */
    protected $table = 'finance.agent_contract';

    /**
     * Indicates that all fields are guarded from mass assignment except for the 'id' field.
     *
     * @var array
     */
    protected $guarded = ['id'];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
        'contract_date' => 'date',
        'contract_start' => 'date',
        'contract_end' => 'date',
    ];

    public $incrementing = false;

    const FOLDER_NAME = 'agent-contract/file';

    /**
     * Get the URL for the contract file.
     *
     * This method returns the URL for the contract file associated with the AgentContract model.
     * It constructs the URL by combining the 'storage' path, the FOLDER_NAME constant, and the contract_file property.
     *
     * @return string The URL for the contract file.
     */
    public function getFileURL()
    {
        return asset('storage/'.self::FOLDER_NAME.'/'.$this->contract_file);
    }

    /**
     * Has One Relation With Customer
     *
     * This method defines a one-to-one relationship between the AgentContract model and the Customer model,
     * where the AgentContract model belongs to a single Customer model.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function customer(): HasOne
    {
        return $this->hasOne(Customer::class, 'id', 'customer_id');
    }

    /**
     * Has Many Relation With Agent Contract Service
     */
    public function serviceContract(): HasMany
    {
        return $this->hasMany(AgentContractService::class, 'agent_contract_id', 'id');
    }

    /**
     * Has Many Relation With Agent Contract Charge
     */
    public function contractAgentCharge(): HasMany
    {
        return $this->hasMany(AgentContractCharge::class, 'agent_contract_id', 'id');
    }

    /**
     * Has Many Relation With Agent Contract Document
     */
    public function documents(): HasMany
    {
        return $this->hasMany(AgentContractDocument::class, 'agent_contract_id', 'id');
    }

    public function serviceType(): HasOne
    {
        return $this->hasOne(ServiceType::class, 'id', 'service_type_id');
    }

    public function histories(): HasMany
    {
        return $this->hasMany(History::class, 'modelable_id', 'id');
    }
}
