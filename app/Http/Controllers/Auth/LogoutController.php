<?php

declare(strict_types=1);

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Service\Auth\LogoutService;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

final class LogoutController extends Controller
{
    /**
     * Constructs a new instance of the LogoutController class, injecting the LogoutService dependency.
     *
     * @param LogoutService $logoutService The service responsible for invalidating the user's session.
     */
    public function __construct(
        protected LogoutService $logoutService,
    ) {}

    /**
     * Invalidates the current session and redirects the user to the login page.
     *
     * @return RedirectResponse A redirect response to the login page on success, or back to the current page with an error message on failure.
     */
    public function logout(): RedirectResponse
    {
        $response = $this->logoutService->invalidatingSession();

        return $response->success
            ? redirect()->route('auth.login')
            : redirect()->back()->with('toastError', $response->message);
    }
}
