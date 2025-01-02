<?php

declare(strict_types=1);

namespace App\Models\Operation\Origin;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

final class AgreedRate extends Model
{
    use HasFactory;

    protected $table = 'origin.agreed_rate';
    protected $guarded = ['id'];
}
