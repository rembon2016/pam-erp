<?php

declare(strict_types=1);

namespace App\Models;

use App\Models\Finance\Charge;
use App\Models\Finance\Currency;
use App\Models\Finance\Customer;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use App\Models\Operation\Master\Port;
use Illuminate\Database\Eloquent\Model;
use App\Models\Finance\CustomerContract;
use App\Models\Operation\Master\Countries;
use App\Models\Finance\CustomerContractCharge;
use App\Models\Finance\CustomerContractDocument;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use App\Models\Finance\CustomerContractChargeDetail;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Collection as EloquentCollection;
use Illuminate\Database\Eloquent\Relations\HasMany;

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

    public function childs(): HasMany
    {
        return $this->hasMany(self::class, 'parent_id', 'id');
    }
}
