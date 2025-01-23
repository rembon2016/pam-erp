<?php

declare(strict_types=1);

namespace App\Traits\Eloquent;

use App\Models\Finance\CustomerContract;
use App\Models\History;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Model;

trait Historable
{
    /**
     * @var array
     */
    protected static array $authorizedParentClass = [
        'App\Models\Finance\CustomerContract'
    ];

    /**
     * @var bool
     */
    protected static bool $updateTriggered = false;

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
            static::updating(function (Model $model) {
                static::$updateTriggered = true;
            });

            static::updated(function (Model $model) {
                self::recordHistory($model);
            });
        }

        if (in_array('delete', static::$historableActions)) {
            static::deleting(function (Model $model) {
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
     * @return void
     */
    public function forceRecordHistory(): void
    {
        if (!static::$updateTriggered) {
            self::recordHistory($this);
            static::$updateTriggered = false;
        }
    }

    /**
     * @return mixed
     */
    protected static function recordHistory(Model $model, ?string $parentId = null)
    {
        $historyId = Str::uuid();

        if (in_array(self::class, static::$authorizedParentClass)) {

            $exists = DB::table('finance.histories')
                ->where([
                    'modelable_type' => self::class,
                    'modelable_id' => $model->getKey(),
                    'parent_id' => null
                ])
                ->exists();

            if (!$exists) {
                DB::table('finance.histories')->insert([
                    'id' => $historyId,
                    'modelable_type' => self::class,
                    'modelable_id' => $model->getKey(),
                    'payload' => json_encode($model->getOriginal()),
                    'parent_id' => null,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);

                return $historyId;
            }
        }

        $parentHistory = DB::table('finance.histories')
            ->where([
                'modelable_type' => CustomerContract::class,
                'modelable_id' => $model->customer_contract_id ?? $model->getKey(),
                'parent_id' => null
            ])
            ->orderBy('created_at', 'desc')
            ->first();

        DB::table('finance.histories')->insert([
            'id' => $historyId,
            'modelable_type' => self::class,
            'modelable_id' => $model->getKey(),
            'payload' => json_encode($model->getOriginal()),
            'parent_id' => $parentHistory?->id,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        return $historyId;
    }
}
