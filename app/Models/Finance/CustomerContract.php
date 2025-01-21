<?php

declare(strict_types=1);

namespace App\Models\Finance;

use App\Models\Operation\Master\Port;
use Illuminate\Database\Eloquent\Model;
use App\Models\Operation\Master\Countries;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Finance\CustomerContractDocument;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use App\Models\Finance\CustomerContractChargeDetail;
use App\Traits\Eloquent\Historable;
use Illuminate\Database\Eloquent\Factories\HasFactory;

final class CustomerContract extends Model
{
    use HasFactory, HasUuids, SoftDeletes, Historable;

    /**
     * The database table name for the bank informations.
     *
     * @var string
     */
    protected $table = 'finance.customer_contract';

    /**
     * Indicates that all fields are guarded from mass assignment except for the 'id' field.
     *
     * @var array
     */
    protected $guarded = ['id'];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
        'contract_start' => 'date',
        'contract_end' => 'date',
    ];

    public $incrementing = false;

    protected static ?array $historableActions = ['update'];

    const FOLDER_NAME = 'customer-contract/file';
    const FOLDER_QUOTATION = 'customer-contract/quotations';

    const CROSS_AIR = 'air';
    const SEA_AIR = 'sea_air';
    const SEA_IMPORT = 'sea_import';
    const SEA_EXPORT = 'sea_export';
    const AIR_IMPORT = 'air_import';
    const AIR_EXPORT = 'air_export';
    const WAREHOUSE = 'warehouse';
    const TRUCKING = 'trucking';
    const COURIER = 'courier';

    const SERVICES = [
        self::CROSS_AIR => 'Cross Air',
        self::SEA_AIR => 'Sea Air',
        self::SEA_IMPORT => 'Sea Import',
        self::SEA_EXPORT => 'Sea Export',
        self::AIR_IMPORT => 'Air Import',
        self::AIR_EXPORT => 'Air Export',
        self::WAREHOUSE => 'Warehouse',
        self::TRUCKING => 'Trucking',
        self::COURIER => 'Courier',
    ];

    const DUBAI_BUSINESS_SERVICES = [
        self::SEA_IMPORT => 'Sea Import',
        self::SEA_EXPORT => 'Sea Export',
        self::AIR_IMPORT => 'Air Import',
        self::AIR_EXPORT => 'Air Export',
        self::WAREHOUSE => 'Warehouse',
        self::TRUCKING => 'Trucking',
        self::COURIER => 'Courier',
    ];

    const NON_SEA_AIR_SERVICES = [
        self::WAREHOUSE => 'Warehouse',
        self::TRUCKING => 'Trucking',
        self::COURIER => 'Courier',
    ];

    public function getFileURL()
    {
        return asset('storage/'.self::FOLDER_NAME.'/'.$this->contract_file);
    }

    public function currency()
    {
        return $this->hasOne(Currency::class, 'id', 'currency_id');
    }

    public function charges()
    {
        return $this->hasMany(CustomerContractCharge::class, 'customer_contract_id', 'id');
    }

    public function rates()
    {
        return $this->hasMany(CustomerContractChargeDetail::class, 'customer_contract_id', 'id');
    }

    public function documents()
    {
        return $this->hasMany(CustomerContractDocument::class, 'customer_contract_id', 'id');
    }

    public function charge()
    {
        return $this->hasOne(Charge::class, 'id', 'charge_id');
    }

    public function originCountry()
    {
        return $this->hasOne(Countries::class, 'country_id', 'origin_country_id');
    }

    public function destinationCountry()
    {
        return $this->hasOne(Countries::class, 'country_id', 'destination_country_id');
    }

    public function originPort()
    {
        return $this->hasOne(Port::class, 'port_id', 'origin_port_id');
    }

    public function destinationPort()
    {
        return $this->hasOne(Port::class, 'port_id', 'destination_port_id');
    }

    public function getChargeRate($quantity)
    {
        $rate = $this->charges()->where('from', '<=', $quantity)
            ->where('to', '>=', $quantity)
            ->first();

        // Jika tidak ada, cari nilai paling mendekati (di bawah atau di atas rentang)
        if (! $rate) {
            if ($quantity < $this->charges()->min('from')) {
                // Quantity di bawah rentang, ambil nilai terkecil
                $rate = $this->charges()->orderBy('from', 'asc')->first();
            } else {
                // Quantity di atas rentang, ambil nilai terbesar
                $rate = $this->charges()->orderBy('to', 'desc')->first();
            }
        }

        return $rate;
    }

    public function customer()
    {
        return $this->hasOne(Customer::class, 'id', 'customer_id');
    }

    public static function generateUniqueCodeByCustomer(Customer $customer): string
    {
        $customer_code = $customer->customer_code;
        $countOfContract = self::where('customer_id', $customer->id)->count('id');
        $lastNumber = $countOfContract + 1;

        $nextNumber = str_pad("$lastNumber", 4, '0', STR_PAD_LEFT);
        $contract_number = "{$customer_code}/{$nextNumber}";

        return $contract_number;
    }

    // Additional Functions that Related to Customer Contract
    public function getServiceType()
    {
        return !empty($this->service_type) ? self::SERVICES[$this->service_type] : 'N/A';
    }

    public function getPortOrigin()
    {
        if (!empty($this->service_type)) {
            if (in_array($this->service_type, self::NON_SEA_AIR_SERVICES)) {
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
            if (in_array($this->service_type, self::NON_SEA_AIR_SERVICES)) {
                return $this->destination_port;
            } else {
                return !is_null($this->destinationPort) ? "{$this->destinationPort->port_code} - {$this->destinationPort->port_name}" : 'N/A';
            }
        }

        return "N/A";
    }

    public function getCurrency()
    {
        return !is_null($this->currency) ? "{$this->currency->currency_code} - {$this->currency->currency_name}" : 'N/A';
    }
}
