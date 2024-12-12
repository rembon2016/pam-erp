<?php

declare(strict_types=1);

namespace App\Constants\Customer;

final class CustomerType
{
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
    const COLLECT = [
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
}
