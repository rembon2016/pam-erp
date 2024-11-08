<?php

declare(strict_types=1);

namespace App\Service\Auth;

use App\Functions\ObjectResponse;
use Illuminate\Support\Facades\Auth;

final class LoginService
{
    /**
     * Create a new class instance.
     */
    public function __construct() {}

    /**
     * Authenticate the user.
     *
     * @property string $email
     * @property string $password
     *
     * @param array $dto
     * @return object
     */
    public function authenticateUser(array $dto): object
    {
        return Auth::guard($dto['guard'])->attempt($dto)
            ? ObjectResponse::success(
                message: 'Successfully logged in.',
                statusCode: 200,
                data: Auth::guard('pam-erp')->user()
            )
            : ObjectResponse::error(
                message: 'Invalid email or password.',
                statusCode: 401
            );
    }
}
