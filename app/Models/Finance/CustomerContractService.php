<?php

declare(strict_types=1);

namespace App\Models\Finance;

use App\Models\Operation\Master\Port;
use Illuminate\Database\Eloquent\Model;
use App\Models\Finance\CustomerContract;
use App\Models\Operation\Master\Countries;
use App\Models\Finance\CustomerContractCharge;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;

final class CustomerContractService extends Model
{
    use HasFactory, HasUuids;

    protected $table = 'finance.customer_contract_service';
    protected $guarded = ['id'];

    public function charges()
    {
         return $this->hasMany(CustomerContractCharge::class, 'customer_contract_service_id', 'id');
    }

    public function originCountry()
    {
        return $this->hasOne(Countries::class, 'country_id', 'origin_country_id');
    }

    public function destinationCountry()
    {
        return $this->hasOne(Countries::class, 'country_id', 'destination_country_id');
    }

    public function portOrigin()
    {
        return $this->hasOne(Port::class, 'port_id', 'origin_port_id');
    }

    public function portDestination()
    {
        return $this->hasOne(Port::class, 'port_id', 'destination_port_id');
    }
    // Additional Functions that Related to Customer Contract
    public function getServiceType()
    {
        return !empty($this->service_type) ? CustomerContract::SERVICES[$this->service_type] : 'N/A';
    }

    public function getPortOrigin()
    {
        if (!empty($this->service_type)) {
            if (in_array($this->service_type, CustomerContract::NON_SEA_AIR_SERVICES)) {
                return $this->origin_port;
            } else {
                return !is_null($this->originPort) ? "{$this->originPort->port_code} - {$this->originPort->port_name}" : 'N/A';
            }
        }

        return "N/A";
    }

    public function getPortDestination()
    {
        if (!empty($this->service_type)) {
            if (in_array($this->service_type, CustomerContract::NON_SEA_AIR_SERVICES)) {
                return $this->destination_port;
            } else {
                return !is_null($this->destinationPort) ? "{$this->destinationPort->port_code} - {$this->destinationPort->port_name}" : 'N/A';
            }
        }

        return "N/A";
    }
}
