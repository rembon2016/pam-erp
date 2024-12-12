@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="Settings" pageName="{!! $data['page'] !!}">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Settings" />
        <x:layout.breadcrumb.item pageName="User" href="{{ route('settings.user.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:form.wrapper action="{{ $data['action'] }}" method="{{ $data['method'] }}">
        <div class="row">
            <div class='col-md-6'>
                <x:form.input label="First Name" name="first_name" placeholder="First Name" :model="$user" required="true" />
            </div>
            <div class='col-md-6'>
                <x:form.input label="Last Name" name="last_name" placeholder="Last Name" :model="$user" required="true" />
            </div>
            <div class='col-md-6'>
                <x:form.input label="Email" type="email" name="email" placeholder="Email" :model="$user" required="true" />
            </div>
              <div class='col-md-6'>
                <x:form.input label="Password" type="password" name="password" placeholder="Password" required="" />
            </div>

            <div class='col-md-12'>
                <x:form.select label="Role" name="role" defaultOption="Select Role" :model="$user" >
                    @foreach ($roles as $row)
                        <option value="{{ $row->id }}" @selected(old('role', $user?->roles->pluck('name')[0] ?? "") == $row->name)>{{ $row->name }}</option>
                    @endforeach
                </x:form.select>
            </div>

        </div>
        <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
            <x:form.cancel-button href="{{ route('settings.user.index') }}" label="Cancel" />
            <x:form.submit-button label="Submit" />
        </div>
    </x:form.wrapper>
@endsection
