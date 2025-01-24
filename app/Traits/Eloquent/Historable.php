<?php

declare(strict_types=1);

namespace App\Traits\Eloquent;

use App\Models\History;
use Illuminate\Support\Str;
use App\Models\Finance\Charge;
use App\Models\Finance\Currency;
use App\Models\Finance\Customer;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use App\Models\Operation\Master\Port;
use App\Models\Finance\CustomerContract;
use App\Models\Operation\Master\Countries;
use App\Models\Finance\CustomerContractCharge;
use App\Models\Finance\CustomerContractDocument;
use App\Models\Finance\CustomerContractChargeDetail;

trait Historable
{
    /**
     * @return mixed
     */
    protected static function recordHistory(?array $dto = [])
    {
        return DB::table('finance.histories')->insertGetId([
            'id' => Str::uuid(),
            'modelable_type' => $dto['modelable_type'],
            'modelable_id' => $dto['modelable_id'],
            'payload' => json_encode($dto['payload']),
            'parent_id' => $dto['parent_id'] ?? null,
            'created_at' => now(),
            'updated_at' => now(),
        ]);
    }

    /**
     * Get historical documents from history table
     */
    public function getHistoricalDocuments(string $historyId): Collection
    {
        $documents = History::where([
            'modelable_type' => CustomerContractDocument::class,
            'parent_id' => $historyId,
        ])
        ->orderByRaw("(payload->>'created_at')::timestamp DESC")
        ->get()
        ->pluck('payload');

        return $documents;
    }

    /**
     * Get historical charges from history table
     */
    public function getHistoricalCharges(string $historyId): Collection
    {
        $charges = History::where([
            'modelable_type' => CustomerContractCharge::class,
            'parent_id' => $historyId
        ])->get();

        return $charges->map(function($chargeHistory) {
            $charge = $chargeHistory->payload;

            // Get details where customer_contract_charge_id matches modelable_id
            $details = History::where([
                'modelable_type' => CustomerContractChargeDetail::class,
                'parent_id' => $chargeHistory->parent_id
            ])
            ->whereRaw("payload->>'customer_contract_charge_id' = ?", [$chargeHistory->modelable_id])
            ->orderByRaw("(payload->>'updated_at')::timestamp DESC")
            ->get()
            ->pluck('payload');

            $charge['details'] = $details;
            $charge['charges'] = Charge::find($charge['charge_id']);

            return $charge;
        });
    }

    /**
     * Get customer data
     */
    public function getCustomer(?string $customerId): ?Customer
    {
        return $customerId ? Customer::find($customerId) : null;
    }

    /**
     * Get service type label
     */
    public function getServiceType(?string $type): string
    {
        return !empty($type) ? CustomerContract::SERVICES[$type] : 'N/A';
    }

    /**
     * Get country data
     */
    public function getCountry(?int $countryId): ?Countries
    {
        return $countryId ? Countries::where('country_id', $countryId)->first() : 'N/A';
    }

    /**
     * Get currency formatted string
     */
    public function getCurrency(?string $currencyId): string
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
    public function getPort(?array $customerContract, string $type = 'origin'): string
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
