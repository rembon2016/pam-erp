<?php

namespace App\Models\Operation\Master;

use App\Models\Finance\Customer;
use App\Models\Finance\CustomerContract;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class CustomerBilling extends Model
{
    use HasUuids;

    /**
     * The database table name for the bank informations.
     *
     * @var string
     */
    protected $table = 'accounting.customer';

    /**
     * Indicates that this model does not have created_at and updated_at timestamp columns.
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * The primary key column for the model.
     *
     * @var string
     */
    protected $primaryKey = 'customer_id';

    /**
     * Indicates that all fields are guarded from mass assignment except for the 'id' field.
     *
     * @var array
     */
    protected $guarded = ['id'];

    /**
     * Get the country associated with the customer billing record.
     */
    public function countries(): BelongsTo
    {
        return $this->belongsTo(
            related: Countries::class,
            foreignKey: 'country_id',
            ownerKey: 'country_id'
        );
    }

    /**
     * Get the customer group associated with the customer billing record.
     */
    public function group(): BelongsTo
    {
        return $this->belongsTo(
            related: CustomerGroup::class,
            foreignKey: 'customer_group_id',
            ownerKey: 'customer_group_id'
        );
    }

    /**
     * Get the customer type detail associated with the customer billing record.
     */
    public function customerTypeDetail(): BelongsTo
    {
        return $this->belongsTo(
            related: CustomerType::class,
            foreignKey: 'customer_type',
            ownerKey: 'customer_type_id'
        );
    }

    public function customerContracts()
    {
        return $this->hasMany(CustomerContract::class, 'customer_id', 'finance_customer_id');
    }

    public function financeCustomer()
    {
        return $this->belongsTo(Customer::class, 'finance_customer_id', 'id');
    }
}
