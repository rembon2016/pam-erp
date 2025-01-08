<?php

namespace App\Models\Operation\Master;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Countries extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string|null
     */
    protected $table = 'master.countries';

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
    protected $primaryKey = 'country_id';

    /**
     * Indicates that all fields are guarded from mass assignment except for the 'id' field.
     *
     * @var array
     */
    protected $guarded = ['id'];

    /**
     * Get the region that the country belongs to.
     */
    public function region(): BelongsTo
    {
        return $this->belongsTo(
            related: Region::class,
            foreignKey: 'region_id',
            ownerKey: 'region_id'
        );
    }

    /**
     * Get the status of the countries.
     *
     * @return string The status of the port, either 'Active', 'In Active', or 'Deleted'.
     */
    public function getStatusLabel(): string
    {
        switch ($this->status) {
            case '1':
                return 'Active';
            case '2':
                return 'In Active';
            case '3':
                return 'Deleted';
            default:
                return 'Unknown';
        }
    }
}
