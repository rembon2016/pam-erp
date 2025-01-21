<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

final class History extends Model
{
    use HasFactory, HasUuids;

    protected $table = 'finance.histories';

    protected $guarded = ['id'];

    protected function casts(): array
    {
        return [
            'payload' => 'array',
        ];
    }
}
