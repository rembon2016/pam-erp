<?php

declare(strict_types=1);

namespace App\Models\Operation\Master;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

final class Unit extends Model
{
    use HasFactory;

    /**
     * The database table associated with the model.
     *
     * @var string
     */
    protected $table = 'master.unit';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $guarded = ['id'];

    /**
     * The primary key for the database table.
     *
     * @var string
     */
    protected $primaryKey = 'unit_id';

    /**
     * Indicates that the model does not have created_at and updated_at timestamp columns.
     *
     * @var bool
     */
    public $timestamps = false;
}
