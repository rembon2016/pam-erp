@extends('layout.main-layout')

@section('title')
    {{ $data['page'] }}
@endsection

@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="{!! $data['page'] !!}">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
        <x:layout.breadcrumb.item pageName="Country" href="{{ route('finance.master-data.country.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:form.wrapper action="{{ $data['action'] }}" method="{{ $data['method'] }}">
        <div class="row">
            <div class='col-md-6'>
                <x:form.input label="Country Name" name="country_name" placeholder="Type Country Name" :model="@$country" required="true" />
            </div>
            <div class='col-md-6'>
                <x:form.input label="Country Code" name="country_code" placeholder="Type Country Code" :model="@$country" required="true" />
            </div>
            <div class='col-md-6'>
                <x:form.select2 label="Region" name="region_id" defaultOption="Select Region" :model="@$country" required="true">
                    @foreach ($regions as $region)
                        <option value="{{ $region->region_id }}" @selected(old('region_id', @$country->region_id) == $region->region_id)>
                            {{ str($region->region_name)->upper() }}
                        </option>
                    @endforeach
                </x:form.select2>
            </div>
            <div class='col-md-6'>
                <x:form.select label="Status" name="status" defaultOption="Select Status" :model="@$port">
                    <option value="1" @selected(old('status', @$country->status) == '1')>Active</option>
                    <option value="2" @selected(old('status', @$country->status) == '2')>In Active</option>
                    <option value="3" @selected(old('status', @$country->status) == '3')>Deleted</option>
                </x:form.select>
            </div>
        </div>
        <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
            <x:form.cancel-button href="{{ route('finance.master-data.country.index') }}" label="Cancel" />
            <x:form.submit-button label="Submit" />
        </div>
    </x:form.wrapper>
@endsection
