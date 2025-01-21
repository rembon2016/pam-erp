<?php

declare(strict_types=1);

namespace App\Traits\Eloquent;

use App\Models\History;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Relations\HasMany;

trait Historable
{
    /**
     * @return void
     */
    public static function bootHistorable(): void
    {
        static::updated(function ($model) {
            $primaryKeyName = app(self::class)->getKeyName();
            DB::insert("INSERT INTO finance.histories(id, modelable_type, modelable_id, payload, created_at, updated_at) VALUES(?, ?, ?, ?, ?, ?)", [
                Str::uuid(),
                self::class,
                $model->{$primaryKeyName},
                json_encode($model->getOriginal()),
                now(),
                now()
            ]);
        });
    }

    /**
     * @return HasMany
     */
    public function histories(): HasMany
    {
        return $this->hasMany(History::class, 'modelable_id', app(self::class)->getKeyName());
    }
}
