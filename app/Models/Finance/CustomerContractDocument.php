<?php

declare(strict_types=1);

namespace App\Models\Finance;

use Illuminate\Database\Eloquent\Model;
use App\Models\Finance\CustomerContract;
use App\Traits\Eloquent\Historable;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;

final class CustomerContractDocument extends Model
{
    use HasFactory, HasUuids;

    protected $table = 'finance.customer_contract_document';
    protected $guarded = ['id'];

    public function contract()
    {
        return $this->hasOne(CustomerContract::class, 'id', 'customer_contract_id');
    }

    public function getFileURL()
    {
        return asset('storage/'.CustomerContract::FOLDER_NAME.'/'.$this->contract_file);
    }
}
