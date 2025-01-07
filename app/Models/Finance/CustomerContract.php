<?php

declare(strict_types=1);

namespace App\Models\Finance;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

final class CustomerContract extends Model
{
    use HasFactory, HasUuids, SoftDeletes;

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

    const FOLDER_NAME = 'customer-contract/file';

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

    public function charge()
    {
        return $this->hasOne(Charge::class, 'id', 'charge_id');
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
}
