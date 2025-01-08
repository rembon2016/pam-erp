<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Spatie\Permission\Models\Role as SpatieRole;

final class Role extends SpatieRole
{
    use HasFactory, HasUuids;

    /**
     * The database table name for the roles.
     *
     * @var string
     */
    protected $table = 'usrs.roles';

    /**
     * Indicates that the `id` column should be guarded from mass assignment.
     *
     * @var array
     */
    protected $guarded = ['id'];
}
