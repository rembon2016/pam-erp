<?php

declare(strict_types=1);

namespace App\Functions\Eloquent;

use App\Models\Finance\Currency;
use App\Models\Operation\Master\Port;
use App\Models\Finance\CustomerContract;
use App\Models\Operation\Master\Countries;

class CustomerContractHelper
{
    /**
     * Get service type label
     */
    public static function getServiceType(?string $type): string
    {
        return !empty($type) ? CustomerContract::SERVICES[$type] : 'N/A';
    }

    /**
     * Get country data
     */
    public static function getCountry(?int $countryId, ?string $column = null): Countries|string
    {
        if (!empty($column)) {
            return $countryId ? Countries::where('country_id', $countryId)->first()->{$column} : 'N/A';
        }

        return $countryId ? Countries::where('country_id', $countryId)->first() : 'N/A';
    }

    /**
     * Get currency formatted string
     */
    public static function getCurrency(?string $currencyId): string
    {
        if (!$currencyId) {
            return 'N/A';
        }

        $currency = Currency::find($currencyId);
        return $currency ? "{$currency->currency_code} - {$currency->currency_name}" : 'N/A';
    }

    /**
     * Get port information based on type
     */
    public static function getPort(?array $customerContract, string $type = 'origin'): string
    {
        if (empty($customerContract)) {
            return 'N/A';
        }

        $portId = "{$type}_port_id";
        $portField = "{$type}_port";
        $serviceType = $customerContract['service_type'] ?? null;

        // Return direct port name for non-sea/air services
        if ($serviceType && in_array($serviceType, CustomerContract::NON_SEA_AIR_SERVICES)) {
            return $customerContract[$portField] ?? 'N/A';
        }

        // Get port from database
        if (isset($customerContract[$portId])) {
            $port = Port::where('port_id', $customerContract[$portId])->first();
            if ($port) {
                return "{$port->port_code} - {$port->port_name}";
            }
        }

        return 'N/A';
    }
}
