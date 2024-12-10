<?php

declare(strict_types=1);

namespace App\Models\Finance;

use App\Models\Finance\Customer;
use Illuminate\Database\Eloquent\Model;
use Haruncpi\LaravelIdGenerator\IdGenerator;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Finance\CustomerContractCharge;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;

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
        'contract_end' => 'date'
    ];

    public $incrementing = false;
    const FOLDER_NAME = 'customer-contract/file';

    public function getFileURL()
    {
        return asset('storage/' . self::FOLDER_NAME . '/' . $this->contract_file);
    }

    public function charges()
    {
        return $this->hasMany(CustomerContractCharge::class, 'customer_contract_id', 'id');
    }

    public function customer()
    {
        return $this->hasOne(Customer::class, 'id', 'customer_id');
    }
}
