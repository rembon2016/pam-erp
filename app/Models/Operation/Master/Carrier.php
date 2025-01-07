<?php


namespace App\Models\Operation\Master;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use App\Models\Finance\Customer;

class Carrier extends Model
{
    use HasUuids;

    /**
     * The database table name for the bank informations.
     *
     * @var string
     */
    protected $table = 'master.carrier';

    /**
     * Indicates that this model does not have created_at and updated_at timestamp columns.
     *
     * @var bool
     */
	public $timestamps = false;

    /**
     * The primary key column for the model.
     *
     * @var string
     */
	protected $primaryKey = 'carrier_id';

    /**
     * Indicates that this model have a custom updated_at timestamp columns.
     *
     * @var string
     */
	const UPDATED_AT = 'date_modified';

    /**
     * Indicates that all fields are guarded from mass assignment except for the 'id' field.
     *
     * @var array
     */
    protected $guarded = ['id'];

    /**
     * Appends the specific attribute to the model.
     *
     * @var array
     */
	protected $appends = ['type'];

    /**
     * Accessor method that returns the customer type name for the carrier.
     *
     * @return string
     */
	public function getTypeAttribute()
	{
		return "Carrier";
	}

    public function financeCustomer()
    {
        return $this->belongsTo(Customer::class, 'finance_customer_id', 'id');
    }
}
