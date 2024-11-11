<?php

declare(strict_types=1);

namespace App\Service\Auth;

use App\Functions\ObjectResponse;
use Illuminate\Support\Facades\Auth;

final class LogoutService
{
    /**
     * Create a new class instance.
     */
    public function __construct() {}

    /**
     * Invalidates the current session and logs out the user.
     *
     * @return \App\Functions\ObjectResponse A response object indicating the success or failure of the logout operation.
     */
    public function invalidatingSession()
    {
        try {
            Auth::logout();
            request()->session()->invalidate();
            request()->session()->regenerateToken();

            return ObjectResponse::success(
                message: 'Successfully Logout',
                statusCode: 200,
                data: null
            );
        } catch (\Throwable $th) {
            return ObjectResponse::error(
                message: $th->getMessage(),
                errors: $th->getTrace()
            );
        }
    }
}
