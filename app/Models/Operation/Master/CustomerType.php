<?php

namespace App\Models\Operation\Master;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Model;

class CustomerType extends Model
{
    use HasUuids;

    /**
     * The database table name for the bank informations.
     *
     * @var string
     */
    protected $table = 'master.customer_type';

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
    protected $primaryKey = 'customer_type_id';

    /**
     * Indicates that all fields are guarded from mass assignment except for the 'id' field.
     *
     * @var array
     */
    protected $guarded = ['id'];
}
