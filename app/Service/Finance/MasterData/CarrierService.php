<?php

declare(strict_types=1);

namespace App\Service\Finance\MasterData;

use App\Models\Operation\Master\Carrier;
use Illuminate\Database\Eloquent\Collection;

final class CarrierService
{
    public function getCarriers(): Collection
    {
        return Carrier::orderBy('carrier_code', 'ASC')->get();
    }
}
