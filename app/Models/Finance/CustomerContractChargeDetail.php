<?php

declare(strict_types=1);

namespace App\Models\Finance;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

final class CustomerContractChargeDetail extends Model
{
    use HasFactory, HasUuids;

    protected $table = 'finance.customer_contract_charge_detail';
    protected $guarded = ['id'];

    const CONTAINER_TYPES = [
        '20 FT',
        '20 FT GOH',
        '40 FT',
        '40 FT GOH',
        '40 FT HC',
        '40 FT HC GOH',
        '45 FT',
        '45 FT GOH',
    ];
}
