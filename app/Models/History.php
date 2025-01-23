<?php

declare(strict_types=1);

namespace App\Models;

use App\Models\Finance\Charge;
use App\Models\Finance\Currency;
use App\Models\Finance\Customer;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use App\Models\Operation\Master\Port;
use Illuminate\Database\Eloquent\Model;
use App\Models\Finance\CustomerContract;
use App\Models\Operation\Master\Countries;
use App\Models\Finance\CustomerContractCharge;
use App\Models\Finance\CustomerContractDocument;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use App\Models\Finance\CustomerContractChargeDetail;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Collection as EloquentCollection;

final class History extends Model
{
    use HasFactory, HasUuids;

    protected $table = 'finance.histories';

    protected $guarded = ['id'];

    protected function casts(): array
    {
        return [
            'payload' => 'array',
        ];
    }

    public function customerContract(): BelongsTo
    {
        return $this->belongsTo(CustomerContract::class, 'modelable_id', 'id');
    }

    // Temporary Logic

    /**
     * Get historical documents from history table
     */
    public function getHistoricalDocuments(string $contractId): Collection
    {
        return History::where('modelable_type', CustomerContractDocument::class)
            ->whereRaw("payload->>'customer_contract_id' = ?", [$contractId])
            ->orderByRaw("(payload->>'updated_at')::timestamp DESC")
            ->get()
            ->pluck('payload');
    }

    /**
     * Get historical charges from history table
     */
    public function getHistoricalCharges(string $contractId): Collection
    {
        // Ambil semua charge history
        $chargeHistories = History::where('modelable_type', CustomerContractCharge::class)
            ->whereRaw("payload->>'customer_contract_id' = ?", [$contractId])
            ->orderByRaw("(payload->>'updated_at')::timestamp DESC")
            ->get();

        // Ambil semua charge detail history yang terkait
        $chargeDetailHistories = History::where('modelable_type', CustomerContractChargeDetail::class)
            ->whereRaw("payload->>'customer_contract_id' = ?", [$contractId])
            ->get()
            ->groupBy(function($history) {
                return $history->payload['customer_contract_charge_id'];
            });

        // Gabungkan charges dengan detailsnya
        return $chargeHistories->map(function($chargeHistory) use ($chargeDetailHistories) {
            $charge = $chargeHistory->payload;
            $charge['details'] = $chargeDetailHistories->get($charge['id'], collect([]))
                ->pluck('payload')
                ->sortByDesc('updated_at')
                ->values();
            $charge['charges'] = Charge::where('id', $charge['charge_id'])->first();

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
