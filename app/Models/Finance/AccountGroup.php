<?php

declare(strict_types=1);

namespace App\Models\Finance;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

final class AccountGroup extends Model
{
    use HasFactory, HasUuids;

    /**
     * The database table name for the account groups.
     *
     * @var string
     */
    protected $table = 'finance.account_groups';

    /**
     * Indicates that all fields are guarded from mass assignment except for the 'id' field.
     *
     * @var array
     */
    protected $guarded = ['id'];

    /**
     * Get the sub-account groups associated with this account group.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function subAccountGroups(): HasMany
    {
        return $this->hasMany(
            related: SubAccountGroup::class,
            foreignKey: 'account_group_id'
        );
    }

    /**
     * Get the chart of accounts associated with this account group.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function chartOfAccounts(): HasMany
    {
        return $this->hasMany(
            related: ChartOfAccount::class,
            foreignKey: 'account_group_id',
            localKey: 'id'
        );
    }
}
