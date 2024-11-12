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
        $response = Http::asForm()->post('https://api-user-new-demo.logi-chain.com/api/login', [
            'username' => Auth::user()->email,
            'password' => 'Ambonpati71',
        ]);

        $token = base64_encode($response->collect()['access_token']);

        return redirect()
            ->to(config('app.frontend_url')."dashboard?token={$token}");
    }
}
