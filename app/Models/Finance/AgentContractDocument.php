<?php

declare(strict_types=1);

namespace App\Models\Finance;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

final class AgentContractDocument extends Model
{
    use HasFactory, HasUuids;

    protected $table = 'finance.agent_contract_document';
    protected $guarded = ['id'];

    public function contract()
    {
        return $this->hasOne(AgentContract::class, 'id', 'agent_contract_id');
    }

    public function getFileURL()
    {
        return asset('storage/' . AgentContract::FOLDER_NAME . '/' . $this->contract_file);
    }
}
