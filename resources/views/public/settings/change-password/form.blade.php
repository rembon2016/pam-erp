@extends('layout.app')

@section('body')

<x:layout.breadcrumb.wrapper module="Setting" pageName="Change Password">
    <x:layout.breadcrumb.item pageName="Home" href="/dashboard" />
</x:layout.breadcrumb.wrapper>

<x:form.wrapper action="{{ route('reset_password.update') }}" method="POST">
    <div class="row">
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

@endsection
