{{-- <!DOCTYPE html>
<html lang="en">
	<head><base href="../../../">
		<title>PDS PAM ERP</title>
		<meta charset="utf-8" />
		<meta name="description" content="The best Enterprise Resource Planning " />
		<meta name="keywords" content="PAM, Pamcargo, PAMCARGO, PDS, PDS ERP, ERP" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta property="og:locale" content="en_US" />
		<meta property="og:type" content="article" />
		<meta property="og:title" content="PDS ERP Application" />
		<meta property="og:url" content="https://keenthemes.com/metronic" />
		<meta property="og:site_name" content="PDS ERP" />

        @include('layout.style')

	</head>
	<body data-kt-name="metronic" id="kt_body" class="app-blank app-blank bgi-size-cover bgi-position-center bgi-no-repeat">
		<div class="d-flex flex-column flex-root" id="kt_app_root">
			<style>body { background-image: url('{{ asset('assets/media/auth/bg4.png') }}'); } [data-theme="dark"] body { background-image: url('assets/media/auth/bg4-dark.jpg'); }</style>
			<div class="d-flex flex-column flex-column-fluid flex-lg-row">
				<div class="d-flex flex-center w-lg-50 pt-15 pt-lg-0 px-10">
					<div class="d-flex flex-column">
						<a href="../../demo1/dist/index.html" class="mb-7">
							<img alt="Logo" src="{{ asset('assets/media/auth/logo.png') }}" />
						</a>
					</div>
				</div>
				<div class="d-flex flex-center w-lg-50 p-10">
					<div class="card rounded-3 w-md-550px">
						<div class="card-body p-10 p-lg-20">
							<form class="form w-100"  id="kt_sign_in_form"  method="POST" action="{{ route('auth.authenticate') }}">
								@csrf
								<div class="text-center mb-11">
									<h1 class="text-dark fw-bolder mb-3">Sign In</h1>
									<div class="text-gray-500 fw-semibold fs-6">Please signin to enter PAMCARGO Dashboard</div>
								</div>
								<div class="fv-row mb-8">
									<input type="text" placeholder="Email" name="email" autocomplete="off" class="form-control bg-transparent" autofocus />
								</div>
								<div class="fv-row mb-3">
									<input type="password" placeholder="Password" name="password" autocomplete="off" class="form-control bg-transparent" />
								</div>
								<div class="d-flex flex-stack flex-wrap gap-3 fs-base fw-semibold mb-8">
									<div></div>
									<a href="../../demo1/dist/authentication/layouts/creative/reset-password.html" class="link-primary">Forgot Password ?</a>
								</div>
								<div class="d-grid mb-10">
									<button type="submit"  class="btn btn-primary">
										<span class="indicator-label">Sign In</span>
										<span class="indicator-progress">
										<span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
        @include('layout.script')
	</body>
</html> --}}


@extends('layout.main-layout')
@section('title', 'Login')

@section('body')

<div class="login-wrapper">
    <div class="container">

        <img class="img-fluid logo-dark mb-2 logo-color" src="{{ asset('assets/logos/pam-long.png') }}" alt="Logo">
        <img class="img-fluid logo-light mb-2" src="{{ asset('assets/logos/pam-long.png') }}" alt="Logo">
        <div class="loginbox">

            <div class="login-right">
                <div class="login-right-wrap">
                    <h1>Login</h1>
                    <p class="account-subtitle">Access to our dashboard</p>

                    <form method="post" action="{{ route('auth.authenticate') }}">
                        @csrf
                        <div class="input-block mb-3">
                            <label class="form-control-label">Email Address</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email">
                            <div class="text-danger pt-2">
                                @error('email')
                                    {{ $message }}
                                @enderror
                            </div>
                        </div>
                        <div class="input-block mb-3">
                            <label class="form-control-label">Password</label>
                            <div class="pass-group">
                                <input type="password" class="form-control pass-input" id="password" name="password" placeholder="Enter your password">
                                <span class="fa-solid fa-eye-slash toggle-password"></span>
                                <div class="text-danger pt-2">
                                    @error('password')
                                        {{ $message }}
                                    @enderror
                                </div>
                            </div>
                        </div>
                        {{-- <div class="input-block mb-3">
                            <div class="row justify-content-end">
                                <div class="col-6 text-end">
                                    <a class="forgot-link" href="{{ url('forgot-password') }}">Forgot Password ?</a>
                                </div>
                            </div>
                        </div> --}}
                        <button class="btn btn-lg  btn-primary w-100" type="submit">Login</button>
                        {{-- <div class="login-or">
                            <span class="or-line"></span>
                            <span class="span-or">or</span>
                        </div>
                        <!-- Social Login -->
                        <div class="social-login mb-3">
                            <span>Login with</span>
                            <a href="#" class="facebook"><i class="fab fa-facebook-f"></i></a><a href="#"
                                class="google"><i class="fab fa-google"></i></a>
                        </div>
                        <!-- /Social Login -->
                        <div class="text-center dont-have">Don't have an account yet? <a
                                href="{{ url('register') }}">Register</a></div> --}}
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection
