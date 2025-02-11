@extends('layout.main-layout')
@section('title', 'Change Password')

@section('body')

<x:layout.breadcrumb.wrapper module="Setting" pageName="Change Password">
    <x:layout.breadcrumb.item pageName="Home" href="/dashboard" />
</x:layout.breadcrumb.wrapper>


<div class="row">
    <div class="col-xl-3 col-md-4">
        <div class="card">
            <div class="card-body">
                <div class="widget settings-menu mb-0">
                    <ul>
                        <li class="nav-item">
                            <a href="{{ route('profile.index') }}" class="nav-link {{ Route::is('profile.index') ? 'active' : '' }}">
                                <i class="fe fe-user"></i> <span>Profile Settings</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('reset_password.index') }}"
                                class="nav-link {{ Route::is('reset_password.index') ? 'active' : '' }}">
                                <i class="fe fe-lock"></i> <span>Change Password</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xl-9 col-md-8">
        <x:form.wrapper action="{{ route('reset_password.update') }}" method="POST">
            <div class="row">
                <div class="col-md-12">
                    <x:form.input type="password" label="Old Password" name="old_password" placeholder="Old Password" required="true" />
                </div>
                <div class="col-md-12">
                    <x:form.input type="password" label="New Password" name="password" placeholder="New Password" required="true" />
                </div>
                <div class="col-md-12">
                    <x:form.input type="password" label="New Password Confirmation" name="password_confirmation" placeholder="New Password Confirmation" required="true" />
                </div>
            </div>
            <div class="d-flex align-items-center justify-content-end" style="gap: 7.5px">
                <x:form.cancel-button href="/dashboard" label="Cancel" />
                <x:form.submit-button label="Submit" />
            </div>
        </x:form.wrapper>
    </div>

</div>

@endsection
