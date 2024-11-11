<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

final class Account extends Model
{
    use HasFactory;

    protected $table = 'user.account';

    /**
     * Specifies that the `user_id` column should be guarded from mass assignment.
     *
     * @var array
     */
    protected $guarded = ['user_id'];

    /**
     * Specifies that the primary key column `user_id` should be treated as a string type.
     *
     * @var string
     */
    protected $primaryKey = 'user_id';

    /**
     * Specifies that the primary key column `user_id` should be treated as a string type.
     *
     * @var string
     */
    protected $keyType = 'string';
}
