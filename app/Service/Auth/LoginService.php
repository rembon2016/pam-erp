<?php

declare(strict_types=1);

namespace App\Service\Auth;

use App\Functions\ObjectResponse;
use App\Models\Operation\Account;
use App\Models\User;
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
     */
    public function authenticateUser(array $dto): object
    {
        $this->registeringNewUser(email: $dto['email']);

        return Auth::attempt($dto)
            ? ObjectResponse::success(
                message: 'Successfully logged in.',
                statusCode: 200,
                data: Auth::user()
            )
            : ObjectResponse::error(
                message: 'Invalid email or password.',
                statusCode: 401
            );
    }

    /**
     * Authenticate the user without password.
     */
    public function authenticateWithoutPassword(array $dto): object
    {
        $decodedEmail = base64_decode($dto['email']);

        $this->registeringNewUser(email: $decodedEmail);
        $account = Account::where('username', $decodedEmail)->first();
        $user = User::where('email', $account->username)->first();

        if (empty($account)) {
            return ObjectResponse::error(
                message: 'Invalid email or password.',
                statusCode: 401
            );
        }

        Auth::login($user);

        return ObjectResponse::success(
            message: 'Successfully logged in.',
            statusCode: 200,
            data: Auth::user()
        );
    }

    /**
     * Registers a new user based on the provided email address.
     *
     * @param  string  $email  The email address to use for the new user.
     * @return \App\Models\User|bool The newly created user, or the existing user if one was found.
     */
    private function registeringNewUser($email)
    {
        $account = Account::where('username', $email)->first();

        if (! empty($account)) {
            $user = User::where('email', $account->username)->first();

            return ! empty($user)
                ?: User::create([
                    'email' => $account->username,
                    'password' => $account->password,
                    'email_verified_at' => now(),
                    'type' => 'operation',
                ]);
        }
    }
}
