<?php

namespace App\Models\Operation\Master;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Vendor extends Model
{
    /**
     * The database table name for the bank informations.
     *
     * @var string
     */
    protected $table = 'master.vendor';

    protected $keyType = 'string';

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
    protected $primaryKey = 'vendor_id';

    /**
     * Indicates that all fields are guarded from mass assignment except for the 'id' field.
     *
     * @var array
     */
    protected $fillable = ['id'];

    /**
     * Appends the specific attribute to the model.
     *
     * @var array
     */
    protected $appends = ['type'];

    /**
     * Accessor method that returns the customer type name for the vendor.
     *
     * @return string
     */
    public function getTypeAttribute(): string
    {
        return $this->customer_type->customer_type_name ?? "";
    }

    /**
     * Retrieves the customer type detail for the vendor.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function customerTypeDetail(): BelongsTo
    {
        return $this->belongsTo(
            related: CustomerType::class,
            foreignKey: 'vendor_type_id',
            ownerKey: 'customer_type_id'
        );
    }
}
