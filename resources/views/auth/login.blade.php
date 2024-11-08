<!DOCTYPE html>
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
</html>
