<?php

declare(strict_types=1);

namespace App\Models\Finance;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

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

    public function getFileURL()
    {
        return asset('storage/'.self::FOLDER_NAME.'/'.$this->contract_file);
    }

    public function customer()
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
}
