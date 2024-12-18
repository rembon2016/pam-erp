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
        if (Auth::check()) {
            $userEmail = Auth::user()->email;

            // Action after eloquent model was created
            static::created(function ($model) use ($userEmail) {
                $model->created_by = $userEmail;
                $model->save();
            });

            // Action after eloquent model was updated
            static::updating(function ($model) use ($userEmail) {
                $model->updated_by = $userEmail;
                $model->save();
            });

            // Action after eloquent model was deleted
            static::deleted(function ($model) use ($userEmail) {
                $model->deleted_by = $userEmail;
                $model->save();
            });
        }
    }
}
