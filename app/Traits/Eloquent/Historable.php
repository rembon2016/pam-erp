<?php

declare(strict_types=1);

namespace App\Traits\Eloquent;

use App\Models\Finance\AgentContractCharge;
use App\Models\Finance\AgentContractChargeDetail;
use App\Models\Finance\AgentContractDocument;
use App\Models\Finance\AgentContractService;
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
use App\Models\Finance\CustomerContractService;

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

    // Customer Contract Sections
    public function getContractService(string $historyId): Collection
    {
        $contractServices = History::where([
            'modelable_type' => CustomerContractService::class,
            'parent_id' => $historyId
        ])
        ->orderByRaw("(payload->>'created_at')::timestamp DESC")
        ->get()
        ->pluck('payload');

        return $contractServices->map(function ($service) use ($historyId) {
            return array_merge($service, [
                'charges' => $this->getHistoricalCharges($historyId, $service['id'])
            ]);
        });
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
    public function getHistoricalCharges(string $historyId, string $contractServiceId): Collection
    {
        $charges = History::where([
            'modelable_type' => CustomerContractCharge::class,
            'parent_id' => $historyId,
        ])
        ->whereRaw("payload->>'customer_contract_service_id' = ?", [$contractServiceId])
        ->get();

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

    // AgentContract Service
    public function getAgentContractService(string $historyId): Collection
    {
        $contractServices = History::where([
            'modelable_type' => AgentContractService::class,
            'parent_id' => $historyId
        ])
        ->orderByRaw("(payload->>'created_at')::timestamp DESC")
        ->get()
        ->pluck('payload');

        return $contractServices->map(function ($service) use ($historyId) {
            return array_merge($service, [
                'charges' => $this->getAgentHistoricalCharges($historyId, $service['id'])
            ]);
        });
    }

    /**
     * Get historical charges from history table
     */
    public function getAgentHistoricalCharges(string $historyId, string $contractServiceId): Collection
    {
        $charges = History::where([
            'modelable_type' => AgentContractCharge::class,
            'parent_id' => $historyId,
        ])
        ->whereRaw("payload->>'agent_contract_service_id' = ?", [$contractServiceId])
        ->get();

        return $charges->map(function($chargeHistory) {
            $charge = $chargeHistory->payload;

            $details = History::where([
                'modelable_type' => AgentContractChargeDetail::class,
                'parent_id' => $chargeHistory->parent_id
            ])
            ->whereRaw("payload->>'agent_contract_charge_id' = ?", [$chargeHistory->modelable_id])
            ->orderByRaw("(payload->>'updated_at')::timestamp DESC")
            ->get()
            ->pluck('payload');

            $charge['details'] = $details;
            $charge['charges'] = Charge::find($charge['charge_id']);

            return $charge;
        });
    }

    /**
     * Get historical documents from history table
     */
    public function getAgentHistoricalDocuments(string $historyId): Collection
    {
        $documents = History::where([
            'modelable_type' => AgentContractDocument::class,
            'parent_id' => $historyId,
        ])
        ->orderByRaw("(payload->>'created_at')::timestamp DESC")
        ->get()
        ->pluck('payload');

        return $documents;
    }

}
