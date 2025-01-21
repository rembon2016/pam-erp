<?php

declare(strict_types=1);

namespace App\Traits\Eloquent;

use App\Models\History;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Model;

trait Historable
{
    /**
     * @return void
     */
    public static function bootHistorable(): void
    {
        // Pastikan property historableActions ada
        if (!property_exists(static::class, 'historableActions')) {
            throw new \Exception('$'."historableActions property must be declared inside the model " . static::class);
        }

        if (in_array('create', static::$historableActions)) {
            static::created(function (Model $model) {
                self::recordHistory($model);
            });
        }

        if (in_array('update', static::$historableActions)) {
            static::updated(function (Model $model) {
                self::recordHistory($model);
            });
        }

        if (in_array('delete', static::$historableActions)) {
            static::deleted(function (Model $model) {
                self::recordHistory($model);
            });
        }
    }

    /**
     * @return HasMany
     */
    public function histories(): HasMany
    {
        return $this->hasMany(History::class, 'modelable_id', app(self::class)->getKeyName());
    }

    /**
     * @return bool
     */
    protected static function recordHistory(Model $model)
    {
        DB::insert("INSERT INTO finance.histories(id, modelable_type, modelable_id, payload, created_at, updated_at) VALUES(?, ?, ?, ?, ?, ?)", [
            Str::uuid(),
            self::class,
            $model->getKey(),
            json_encode($model->getOriginal()),
            now(),
            now()
        ]);
    }
}
