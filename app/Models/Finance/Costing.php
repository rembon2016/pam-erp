<?php

declare(strict_types=1);

namespace App\Models\Finance;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

final class Costing extends Model
{
    use HasFactory,
        HasUuids,
        SoftDeletes;

    protected $guarded = ['id'];
    protected $table = 'finance.costing';
    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
    ];

    public function truck()
    {
        return $this->hasMany(CostingVendorTrucking::class, 'costing_id', 'id');
    }

    public function port()
    {
        return $this->hasOne(CostingVendorPort::class, 'costing_id', 'id');
    }

    public function agent()
    {
        return $this->hasMany(CostingVendorAgent::class, 'costing_id', 'id');
    }

    public function special()
    {
        return $this->hasMany(CostingSpecial::class, 'costing_id', 'id');
    }

    public function head()
    {
        return $this->hasMany(CostingHead::class, 'costing_id', 'id');
    }


}
