@extends('layout.app')

@section('body')

<x:layout.breadcrumb.wrapper module="Setting" pageName="Profile Settings">
    <x:layout.breadcrumb.item pageName="Home" href="/dashboard" />
</x:layout.breadcrumb.wrapper>

<x:form.wrapper action="{{ route('profile.update') }}" method="POST">
    <div class="row">
        <div class="col-md-6">
            <x:form.input label="First Name" name="first_name" placeholder="First Name" :model="$user" required="true" />
        </div>
        <div class="col-md-6">
            <x:form.input label="Last Name" name="last_name" placeholder="Last Name" :model="$user" required="true" />
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <x:form.input label="Email Address" name="email" placeholder="Email Address" type="email" required="true" :model="$user" />
        </div>
    </div>
    <div class="d-flex align-items-center justify-content-end" style="gap: 7.5px">
        <x:form.cancel-button href="/dashboard" label="Cancel" />
        <x:form.submit-button label="Submit" />
    </div>
</x:form.wrapper>


@endsection
