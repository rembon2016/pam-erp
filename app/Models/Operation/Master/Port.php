<?php

declare(strict_types=1);

namespace App\Models\Operation\Master;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Facades\Auth;

final class Port extends Model
{
    use HasFactory, HasUuids;

    protected static function booted()
    {
        self::creating(function ($model) {
            $model->date_created = now();
            $model->created_by = Auth::user()->email;
        });

        self::updating(function ($model) {
            $model->date_modified = now();
            $model->modified_by = Auth::user()->email;
        });
    }

    /**
     * The database table name for the bank informations.
     *
     * @var string
     */
    protected $table = 'master.port';

    /**
     * The primary key column for the model.
     *
     * @var string
     */
    protected $primaryKey = 'port_id';

    /**
     * Indicates that all fields are guarded from mass assignment except for the 'id' field.
     *
     * @var array
     */
    protected $guarded = ['id'];

    /**
     * Indicates that this model does not have created_at and updated_at timestamp columns.
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * Constant representing the 'SEA' transport mode.
     *
     * @var string
     */
    const SEA_TRANSPORT_MODE = 'SEA';

    /**
     * Constant representing the 'AIR' transport mode.
     *
     * @var string
     */
    const AIR_TRANSPORT_MODE = 'AIR';

    /**
     * Constant representing the transport mode.
     *
     * @var array
     */
    const TRANSPORT_MODE = [self::SEA_TRANSPORT_MODE, self::AIR_TRANSPORT_MODE];

    /**
     * Get the country that the port belongs to.
     */
    public function country(): BelongsTo
    {
        return $this->belongsTo(
            related: Countries::class,
            foreignKey: 'country_id'
        );
    }

    /**
     * Get the status of the port.
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
