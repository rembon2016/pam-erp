<?php

declare(strict_types=1);

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

final class LoginController extends Controller
{
    /**
     * Renders the login view.
     *
     * @return \Illuminate\View\View
     */
    public function login(): View
    {
        return view('auth.login');
    }

    public function authenticate(): RedirectResponse
    {
        //
    }
}
