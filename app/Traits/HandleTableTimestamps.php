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
        if ($auth = Auth::user()) {

            // Action after eloquent model was created
            static::created(function ($model) use ($auth) {
                $model->created_by = $auth->email;
                $model->save();
            });

            // Action after eloquent model was updated
            static::updated(function ($model) use ($auth) {
                $model->updated_by = $auth->email;
                $model->save();
            });

            // Action after eloquent model was deleted
            static::deleted(function ($model) use ($auth) {
                $model->deleted_by = $auth->email;
                $model->save();
            });
        }
    }
}
