<?php

declare(strict_types=1);

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
// use Laravel\Sanctum\HasApiTokens;

use App\Traits\HandleTableTimestamps;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Spatie\Permission\Traits\HasRoles;

final class User extends Authenticatable
{
    use HasFactory,
        Notifiable,
        SoftDeletes,
        // HandleTableTimestamps,
        HasRoles,
        HasUuids;

    /**
     * The database table name for the User model.
     */
    protected $table = 'usrs.users';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $guarded = ['id'];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
        ];
    }

    /**
     * admin role
     *
     * @var string
     */
    const ADMIN_ROLE = 'admin';

    /**
     * human resources role
     *
     * @var string
     */
    const HR_ROLE = 'human_resource';

    /**
     * accounting role
     *
     * @var string
     */
    const ACCOUNTING_ROLE = 'accounting';

    /**
     * finance role
     *
     * @var string
     */
    const FINANCE_ROLE = 'finance';

    /**
     * sales team role
     *
     * @var string
     */
    const SALES_ROLE = 'sales_team';

    /**
     * list of roles
     *
     * @var array
     */
    CONST ROLES = [
        self::ADMIN_ROLE, self::HR_ROLE, self::ACCOUNTING_ROLE,
        self::SALES_ROLE, self::FINANCE_ROLE
    ];
}
