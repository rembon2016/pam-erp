<?php

declare(strict_types=1);

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Service\Auth\LoginService;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

final class LoginController extends Controller
{
    /**
     * Constructs the LoginController with the provided LoginService.
     *
     * @param LoginService $loginService The service responsible for handling login functionality.
     */
    public function __construct(
        protected LoginService $loginService
    ) {}

    /**
     * Renders the login view.
     *
     * @return \Illuminate\View\View
     */
    public function login(): View
    {
        return view('auth.login');
    }

    /**
     * Authenticates the user based on the provided login request.
     *
     * @param LoginRequest $request The login request containing the user's credentials.
     * @return RedirectResponse A redirect response based on the authentication result.
     */
    public function authenticate(LoginRequest $request): RedirectResponse
    {
        $response = $this->loginService->authenticateUser(dto: $request->validated());

        return $response->success
            ? redirect()->route('dashboard')
            : redirect()->back()->with('toastError', $response->message);
    }
}
