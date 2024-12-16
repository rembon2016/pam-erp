<?php

declare(strict_types=1);

namespace App\Models\Finance;

use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use App\Models\Operation\Master\CustomerBilling;
use App\Models\Finance\CustomerType as FinanceCustomerType;
use App\Traits\HandleTableTimestamps;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;

final class Customer extends Model
{
    use HasFactory, HasUuids, SoftDeletes;

    /**
     * The database table name for the bank informations.
     *
     * @var string
     */
    protected $table = 'finance.customer';

    /**
     * Indicates that all fields are guarded from mass assignment except for the 'id' field.
     *
     * @var array
     */
    protected $guarded = ['id'];

    /**
     * Eager loads the relationship for the Customer model.
     *
     * @var array
     */
    protected $with = ['customerTypes'];

    /**
     * Retrieves the currency associated with the current customer.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function currency(): BelongsTo
    {
        return $this->belongsTo(
            related: Currency::class,
            foreignKey: 'currency_id',
            ownerKey: 'id'
        );
    }

    /**
     * Retrieves the billing customer associated with the current customer.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function billingCustomer(): HasOne
    {
        return $this->hasOne(
            related: CustomerBilling::class,
            foreignKey: 'finance_customer_id',
            localKey: 'id'
        );
    }

    /**
     * Retrieves the customer types associated with the current customer.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function customerTypes(): HasMany
    {
        return $this->hasMany(
            related: FinanceCustomerType::class,
            foreignKey: 'customer_id',
            localKey: 'id',
        );
    }

    /**
     * Retrieves the customer address associated with the current customer.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function customerAddress(): HasOne
    {
        return $this->hasOne(
            related: CustomerAddress::class,
            foreignKey: 'customer_id',
            localKey: 'id',
        );
    }

    /**
     * Retrieves the customer VAT (Value Added Tax) information associated with the current customer.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function customerVat(): HasOne
    {
        return $this->hasOne(
            related: CustomerVat::class,
            foreignKey: 'customer_id',
            localKey: 'id'
        );
    }

    /**
     * Retrieves the customer emails associated with the current customer.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function customerEmails(): HasMany
    {
        return $this->hasMany(
            related: CustomerEmail::class,
            foreignKey: 'customer_id',
            localKey: 'id'
        );
    }

    /**
     * Retrieves the customer sales associated with the current customer.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function customerSales(): HasOne
    {
        return $this->hasOne(
            related: CustomerSales::class,
            foreignKey: 'customer_id',
            localKey: 'id'
        );
    }

    /**
     * Retrieves the customer bank associated with the current customer.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function customerBank(): HasOne
    {
        return $this->hasOne(
            related: CustomerBank::class,
            foreignKey: 'customer_id',
            localKey: 'id'
        );
    }

    /**
     * Retrieves the customer accounts associated with the current customer.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function customerAccounts(): HasMany
    {
        return $this->hasMany(
            related: CustomerAccount::class,
            foreignKey: 'customer_id',
            localKey: 'id'
        );
    }
}
