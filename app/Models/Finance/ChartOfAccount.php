<?php

declare(strict_types=1);

namespace App\Models\Finance;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

final class ChartOfAccount extends Model
{
    use HasFactory, HasUuids;

    /**
     * The database table name for the chart of accounts.
     *
     * @var string
     */
    protected $table = 'finance.chart_of_accounts';

    /**
     * Indicates that the `id` column should be guarded and not mass assignable.
     *
     * @var array
     */
    protected $guarded = ['id'];

    /**
     * Get the account group that this chart of account belongs to.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function accountGroup(): BelongsTo
    {
        return $this->belongsTo(
            related: AccountGroup::class,
            foreignKey: 'account_group_id',
            ownerKey: 'id'
        );
    }

    /**
     * Get the sub-account group that this chart of account belongs to.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function subAccountGroup(): BelongsTo
    {
        return $this->belongsTo(
            related: SubAccountGroup::class,
            foreignKey: 'sub_account_group_id'
        );
    }

    /**
     * Get the parent account that this chart of account belongs to.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function parentAccount(): BelongsTo
    {
        return $this->belongsTo(
            related: self::class,
            foreignKey: 'parent_id'
        );
    }

    /**
     * Get the child accounts that belong to this chart of account.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function childAccounts(): HasMany
    {
        return $this->hasMany(
            related: self::class,
            foreignKey: 'parent_id'
        );
    }
}
