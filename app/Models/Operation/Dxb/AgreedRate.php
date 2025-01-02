<?php

declare(strict_types=1);

namespace App\Models\Operation\Dxb;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

final class AgreedRate extends Model
{
    use HasFactory;

    protected $table = 'dxb.agreed_rate';
    protected $guarded = ['id'];
}
