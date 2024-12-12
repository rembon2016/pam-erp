<?php

declare(strict_types=1);

namespace App\Models\Finance;

use App\Models\Finance\Customer;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
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
        'contract_end' => 'date'
    ];

    const FOLDER_NAME = 'agent-contract/file';

    public function getFileURL()
    {
        return asset('storage/' . self::FOLDER_NAME . '/' . $this->contract_file);
    }

    public function customer()
    {
        return $this->hasOne(Customer::class, 'id', 'customer_id');
    }
}
