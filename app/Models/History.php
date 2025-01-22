<?php

declare(strict_types=1);

namespace App\Models;

use App\Models\Finance\CustomerContract;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

final class History extends Model
{
    use HasFactory, HasUuids;

    protected $table = 'finance.histories';

    protected $guarded = ['id'];

    protected function casts(): array
    {
        return [
            'payload' => 'array',
        ];
    }

    public function customerContract(): BelongsTo
    {
        return $this->belongsTo(CustomerContract::class, 'modelable_id', 'id');
    }
}
