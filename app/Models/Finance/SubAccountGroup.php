<?php

declare(strict_types=1);

namespace App\Models\Finance;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

final class SubAccountGroup extends Model
{
    use HasFactory, HasUuids;

    /**
     * The database table name for the sub-account groups.
     *
     * @var string
     */
    protected $table = 'finance.sub_account_groups';

    /**
     * Indicates that all fields are guarded from mass assignment except for the 'id' field.
     *
     * @var array
     */
    protected $guarded = ['id'];

    /**
     * Get the account group that this sub-account group belongs to.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function accountGroup(): BelongsTo
    {
        return $this->belongsTo(
            related: AccountGroup::class,
            foreignKey: 'account_group_id'
        );
    }

    /**
     * Get the chart of accounts that belong to this sub-account group.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function chartOfAccounts(): HasMany
    {
        return $this->hasMany(
            related: ChartOfAccount::class,
            foreignKey: 'sub_account_group_id'
        );
    }

    public function getCollectibleAccountNumber(): mixed
    {
        $accountGroupCode = $this->with('accountGroup')->first()->code;
        $subAccountGroupCode = $this->code;

        return "{$accountGroupCode}.{$subAccountGroupCode}";
    }
}
