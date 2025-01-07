<?php

declare(strict_types=1);

namespace App\Models\Finance;

use App\Models\Operation\Master\Unit;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

final class Charge extends Model
{
    use HasFactory,
        HasUuids,
        SoftDeletes;

    protected $table = 'finance.charges';

    protected $guarded = ['id'];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
    ];

    public function unit()
    {
        return $this->hasOne(Unit::class, 'unit_id', 'unit_id');
    }

    public function cost()
    {
        return $this->hasOne(ChartOfAccount::class, 'id', 'cost_id');
    }

    public function revenue()
    {
        return $this->hasOne(ChartOfAccount::class, 'id', 'revenue_id');
    }
}
