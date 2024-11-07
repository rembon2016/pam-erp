<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Permission\Models\Permission as SpatiePermission;

final class Permission extends SpatiePermission
{
    use HasFactory, HasUuids;

    /**
     * The database table name for the permissions.
     *
     * @var string
     */
    protected $table = 'usr.permissions';

    /**
     * Indicates that the `id` column should be guarded from mass assignment.
     *
     * @var array
     */
    protected $guarded = ['id'];
}
