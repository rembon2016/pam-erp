<?php

declare(strict_types=1);

namespace App\Service\Public;

use App\Models\User;
use App\Functions\ObjectResponse;
use Illuminate\Support\Facades\Auth;

final class ProfileService
{
    /**
     * Create a new class instance.
     */
    public function __construct() {}

    /**
     * Updates the user's profile with the provided data transfer object (DTO).
     *
     * @param array $dto An associative array containing the updated profile data.
     * @return \App\Functions\ObjectResponse A response object indicating the success or failure of the update operation.
     */
    public function updateUserProfile(array $dto)
    {
        try {
            $profile = User::where('id', Auth::id())
                ->update($dto);

            return ObjectResponse::success(
                message: 'User Profile Successfully Updated',
                data: $profile
            );

        } catch (\Throwable $th) {
            return ObjectResponse::error(
                message: $th->getMessage(),
                errors: $th->getTrace()
            );
        }
    }
}
