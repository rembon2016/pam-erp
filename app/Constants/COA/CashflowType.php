<?php

declare(strict_types=1);

namespace App\Constants\COA;

final class CashflowType
{
    /**
     * Represents the operating activities cash flow type.
     *
     * @var string
     */
    const OPERATING_ACTIVITIES = 'operating';

    /**
     * Represents the financing activities cash flow type.
     *
     * @var string
     */
    const FINANCING_ACTIVITIES = 'financing';

    /**
     * Represents the investing activities cash flow type.
     *
     * @var string
     */
    const INVESTING_ACTIVITIES = 'investing';

    /**
     * Represents a collection of the different cash flow types.
     *
     * @var array
     */
    const COLLECT = [
        self::OPERATING_ACTIVITIES,
        self::FINANCING_ACTIVITIES,
        self::INVESTING_ACTIVITIES,
    ];
}
