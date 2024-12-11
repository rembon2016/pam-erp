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
use Illuminate\Database\Eloquent\SoftDeletes;

final class Customer extends Model
{
    use HasFactory, HasUuids, HandleTableTimestamps, SoftDeletes;

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
     * Represents the 'Trucking Company' constant value.
     *
     * @var string
     */
    const TRUCKING_COMPANY = 'Trucking Company';

    /**
     * Represents the 'Shipper' constant value.
     *
     * @var string
     */
    const SHIPPER = 'Shipper';

    /**
     * Represents the 'Warehouse' constant value.
     *
     * @var string
     */
    const WAREHOUSE = 'Warehouse';

    /**
     * Represents the 'Corporate' constant value.
     *
     * @var string
     */
    const CORPORATE = 'Corporate';

    /**
     * Represents the 'Forwarder' constant value.
     *
     * @var string
     */
    const FORWARDER = 'Forwarder';

    /**
     * Represents the 'Handling Agent' constant value.
     *
     * @var string
     */
    const HANDLING_AGENT = 'Handling Agent';

    /**
     * Represents the 'Custom Stop' constant value.
     *
     * @var string
     */
    const CUSTOM_STOP = 'Custom Stop';

    /**
     * Represents the 'T1 Custom Clearance' constant value.
     *
     * @var string
     */
    const CUSTOM_CLEARANCE = 'T1 Custom Clearance';

    /**
     * Represents the 'Carrier Agent' constant value.
     *
     * @var string
     */
    const CARRIER_AGENT = 'Carrier Agent';

    /**
     * Represents the 'Final Delivery' constant value.
     *
     * @var string
     */
    const FINAL_DELIVERY = 'Final Delivery';

    /**
     * Represents the 'Transporter' constant value.
     *
     * @var string
     */
    const TRANSPORTER = 'Transporter';

    /**
     * Represents the 'Supplier' constant value.
     *
     * @var string
     */
    const SUPPLIER = 'Supplier';

    /**
     * Represents the 'Shipping Line' constant value.
     *
     * @var string
     */
    const SHIPPING_LINE = 'Shipping Line';

    /**
     * Represents the 'Consignee' constant value.
     *
     * @var string
     */
    const CONSIGNEE = 'Consignee';

    /**
     * Represents the 'Notify Party' constant value.
     *
     * @var string
     */
    const NOTIFY_PARTY = 'Notify Party';

    /**
     * Represents the 'T1 Sub Address' constant value.
     *
     * @var string
     */
    const SUB_ADDRESS = 'T1 Sub Address';

    /**
     * Represents the 'Billing Customer' constant value.
     *
     * @var string
     */
    const BILLING_CUSTOMER = 'Billing Customer';

    /**
     * Represents the 'Customer Types' constant value.
     *
     * @var array
     */
    const CUSTOMER_TYPES = [
        self::TRUCKING_COMPANY,
        self::SHIPPER,
        self::WAREHOUSE,
        self::CORPORATE,
        self::FORWARDER,
        self::HANDLING_AGENT,
        self::CUSTOM_STOP,
        self::CUSTOM_CLEARANCE,
        self::CARRIER_AGENT,
        self::FINAL_DELIVERY,
        self::TRANSPORTER,
        self::SUPPLIER,
        self::SHIPPING_LINE,
        self::CONSIGNEE,
        self::NOTIFY_PARTY,
        self::SUB_ADDRESS,
        self::BILLING_CUSTOMER
    ];

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
}
