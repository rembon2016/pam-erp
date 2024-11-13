<?php

declare(strict_types=1);

namespace App\Http\Controllers\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;

final class LoginSSOController extends Controller
{
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

        $token = base64_encode($response->object()->access_token.".3hJ7k2N5pQ8rXsZ1");

        return redirect()
            ->to(config('app.frontend_url')."dashboard?token={$token}");
    }
}
