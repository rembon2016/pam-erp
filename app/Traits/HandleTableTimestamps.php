<?php

declare(strict_types=1);

namespace App\Traits;

use Illuminate\Support\Facades\Auth;

trait HandleTableTimestamps
{
    /**
     * Handles the creation, update, and deletion of Eloquent models by automatically
     * setting the `created_by`, `updated_by`, and `deleted_by` fields with the email
     * of the authenticated user.
     *
     * This trait should be used on Eloquent models that need to track the user who
     * performed certain actions on the model.
     */
    public static function bootHandleTableTimestamps()
    {
        // Action after eloquent model was created
        static::created(function ($model) {
            $model->created_by ??= Auth::user()->email;
            $model->save();
        });

        // Action after eloquent model was updated
        static::updating(function ($model) {
            $model->updated_by ??= Auth::user()->email;
            $model->save();
        });

        // Action after eloquent model was deleted
        static::deleted(function ($model) {
            $model->deleted_by ??= Auth::user()->email;
            $model->save();
        });
    }
}
