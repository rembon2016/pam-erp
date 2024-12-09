<?php

declare(strict_types=1);

namespace App\Models\Finance;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

final class CustomerContract extends Model
{
    use HasFactory, HasUuids;

    /**
     * The database table name for the bank informations.
     *
     * @var string
     */
    protected $table = 'finance.customer_contract';

    /**
     * Indicates that all fields are guarded from mass assignment except for the 'id' field.
     *
     * @var array
     */
    protected $guarded = ['id'];
}
