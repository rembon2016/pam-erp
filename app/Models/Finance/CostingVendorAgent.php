<?php

declare(strict_types=1);

namespace App\Models\Finance;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\HandleTableTimestamps;
final class CostingVendorAgent extends Model
{
    use HasFactory,
        HasUuids,
        SoftDeletes,
        HandleTableTimestamps;

    protected $guarded = ['id'];
    protected $table = 'finance.costing_vendor_agent';
    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
    ];
}
