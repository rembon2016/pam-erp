<?php

declare(strict_types=1);

namespace App\Constants\Customer;

final class CustomerAddress
{
    /**
     * Represents the 'Home Address' constant value.
     *
     * @var string
     */
    const HOME_ADDRESS = 'Home Address';

    /**
     * Represents the 'Office Address' constant value.
     *
     * @var string
     */
    const BUSINESS_ADDRESS = 'Business Address';

    /**
     * Represents the 'Billing Address' constant value.
     *
     * @var string
     */
    const BILLING_ADDRESS = 'Billing Address';

    /**
     * Represents the 'Shipping Address' constant value.
     *
     * @var string
     */
    const SHIPPING_ADDRESS = 'Shipping Address';

    /**
     * Represents the 'Civic Address' constant value.
     *
     * @var string
     */
    const CIVIC_ADDRESS = 'Civic Address';

    /**
     * Represents the 'Postal Address' constant value.
     *
     * @var string
     */
    const POSTAL_ADDRESS = 'Postal Address';

    /**
     * Represents the 'Service Address' constant value.
     *
     * @var string
     */
    const SERVICE_ADDRESS = 'Service Address';

    /**
     * Represents the 'Sub Address' constant value.
     *
     * @var string
     */
    const SUB_ADDRESS = 'Sub Address';

    /**
     * Represents the 'Military Address' constant value.
     *
     * @var string
     */
    const MILITARY_ADDRESS = 'Military Address';

    /**
     * Represents the 'Post Office Box Address' constant value.
     *
     * @var string
     */
    const POST_OFFICE_BOX_ADDRESS = 'Post Office Box Address';

    /**
     * Represents the 'Rural Route Address' constant value.
     *
     * @var string
     */
    const RURAL_ROUTE_ADDRESS = 'Rural Route Address';

    /**
     * Represents the 'Customer Address' constant value.
     *
     * @var array
     */
    const COLLECT = [
        self::HOME_ADDRESS,
        self::BUSINESS_ADDRESS,
        self::BILLING_ADDRESS,
        self::SHIPPING_ADDRESS,
        self::CIVIC_ADDRESS,
        self::POSTAL_ADDRESS,
        self::SERVICE_ADDRESS,
        self::SUB_ADDRESS,
        self::MILITARY_ADDRESS,
        self::POST_OFFICE_BOX_ADDRESS,
        self::RURAL_ROUTE_ADDRESS,
    ];
}
