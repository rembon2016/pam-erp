<?php

declare(strict_types=1);

namespace App\Http\Controllers\Auth;

use App\Functions\ResponseJson;
use Illuminate\Http\Response;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Service\Auth\LoginService;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;
use App\Http\Requests\Auth\LoginSSORequest;

final class LoginSSOController extends Controller
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
     * Redirects the user to the operation dashboard after logging in via SSO.
     *
     * This method sends a POST request to the SSO API to authenticate the user, and
     * then generates a token based on the returned access token. The user is then
     * redirected to the frontend dashboard URL with the generated token as a query
     * parameter.
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function redirectToOperation()
    {
        $response = Http::asForm()->post('http://203.175.10.178:8070/api/login/email', [
            'username' => Auth::user()->email,
        ]);

        $salt = Str::random(20);
        $token = base64_encode($response->object()->access_token."|{$salt}");

        return redirect()
            ->to(config('app.frontend_url')."redirect?auth={$token}");
    }

    /**
     * Redirects the user to the ERP dashboard after logging in via SSO.
     *
     * @param \App\Http\Requests\Auth\LoginSSORequest $request
     * @return mixed|\Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse
     */
    public function redirectToErp(LoginSSORequest $request)
    {
        $this->loginService->authenticateWithoutPassword(dto: $request->only('email'));

        return redirect()->route('dashboard')
            ->with('toastSuccess', __('Successfully logged in.'));
    }
}
