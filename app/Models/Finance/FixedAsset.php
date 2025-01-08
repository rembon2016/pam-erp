<?php

declare(strict_types=1);

namespace App\Models\Finance;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\SoftDeletes;

final class FixedAsset extends Model
{
    use HasFactory,
        HasUuids,
        SoftDeletes;

    protected $table = 'finance.fixed_assets';

    protected $guarded = ['id'];

    protected $casts = [
        'acquisition_date' => 'datetime',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
    ];

    public function type(): HasOne
    {
        return $this->hasOne(FixedAssetType::class, 'id', 'fixed_asset_type_id');
    }

    public function status(): HasOne
    {
        return $this->hasOne(FixedAssetStatus::class, 'id', 'fixed_asset_status_id');
    }
}
