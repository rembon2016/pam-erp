<?php

declare(strict_types=1);

namespace App\Service\Public;

use App\Functions\ObjectResponse;
use App\Models\Operation\Account;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

final class ChangePasswordService
{
    /**
     * Create a new class instance.
     */
    public function __construct() {}

    /**
     * Updates the password for the authenticated user's account.
     *
     * @param array $dto An array containing the new password.
     * @return object An object containing the updated user and account data, or an error message and trace.
     */
    public function updateAccountPassword(array $dto): object
    {
        try {
            $user = User::where('id', Auth::id())->first();
            $account = Account::where('username', $user->email)->first();

            if (!empty($account)) $account->update([
                'password' => bcrypt($dto['password'])
            ]);

            $user->update(['password' => bcrypt($dto['password'])]);

            return ObjectResponse::success(
                message: 'Password changed successfully',
                data: $user,
            );
        } catch (\Throwable $th) {
            return ObjectResponse::error(
                message: $th->getMessage(),
                errors: $th->getTrace()
            );
        }
    }
}
