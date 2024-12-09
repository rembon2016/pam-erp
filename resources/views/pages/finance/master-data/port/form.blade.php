@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="{!! $data['page'] !!}">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
        <x:layout.breadcrumb.item pageName="Port" href="{{ route('finance.master-data.port.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:form.wrapper action="{{ $data['action'] }}" method="{{ $data['method'] }}">
        <div class="row">
            <div class='col-md-6'>
                <x:form.input label="Port Name" name="port_name" placeholder="Type Port Name" :model="@$port" required="true" />
            </div>
            <div class='col-md-6'>
                <x:form.input label="Port Code" name="port_code" placeholder="Type Port Code" :model="@$port" required="true" />
            </div>
            <div class='col-md-6'>
                <x:form.select2 label="Region Sector" name="region_sector" defaultOption="Select Region Sector" :model="@$port" required="true">
                    @foreach ($regions as $region)
                        <option value="{{ $region->region_id }}" @selected(old('region_sector', @$port->region_sector) == $region->region_id)>
                            {{ str($region->region_name)->upper() }}
                        </option>
                    @endforeach
                </x:form.select2>
            </div>
            <div class='col-md-6'>
                <x:form.input label="Edi Port Code" name="edi_port_code" placeholder="Type Edi Port Code" :model="@$port" />
            </div>
            <div class='col-md-4'>
                <x:form.select label="Transport Mode" name="transport_mode" defaultOption="Select Transport Mode" :model="@$port" required="true">
                    @foreach ($transportMode as $mode)
                        <option value="{{ $mode }}" @selected(old('transport_mode', @$port->transport_mode) == $mode)>
                            {{ $mode }}
                        </option>
                    @endforeach
                </x:form.select>
            </div>
            <div class='col-md-4'>
                <x:form.input label="Prefix" name="prefix" placeholder="Type Prefix" :model="@$port" required="true" />
            </div>
            <div class='col-md-4'>
                <x:form.select label="Is Dry Port" name="is_dry_port" defaultOption="Select Is Dry Port" :model="@$port" required="true">
                    <option value="1" @selected(old('is_dry_port', @$port->is_dry_port) == '1')>Yes</option>
                    <option value="0" @selected(old('is_dry_port', @$port->is_dry_port) == '0')>No</option>
                </x:form.select>
            </div>
            <div class='col-md-6'>
                <x:form.input label="Group Name" name="group_name" placeholder="Type Group Name" :model="@$port" />
            </div>
            <div class='col-md-6'>
                <x:form.input label="Sailing Day" name="sailing_day" placeholder="Type Sailing Day" :model="@$port" />
            </div>
            <div class='col-md-6'>
                <x:form.input label="Visibility" name="visibility" placeholder="Type Visibility" :model="@$port" />
            </div>
            <div class='col-md-6'>
                <x:form.input label="Customer Available" name="custom_available" placeholder="Type Customer Available" :model="@$port" />
            </div>
            <div class='col-md-6'>
                <x:form.input label="State Code" name="state_code" placeholder="Type State Code" :model="@$port" />
            </div>
            <div class='col-md-6'>
                <x:form.input label="Location Code" name="location_code" placeholder="Type Location Code" :model="@$port" />
            </div>
            <div class='col-md-6'>
                <x:form.select2 label="Country" name="country_id" defaultOption="Select Country" :model="@$port" required="true">
                    @foreach ($countries as $country)
                        <option value="{{ $country->country_id }}" @selected(old('country_id', @$port->country_id) == $country->country_id)>
                            {{ str($country->country_name)->upper() }}
                        </option>
                    @endforeach
                </x:form.select2>
            </div>
            <div class='col-md-6'>
                <x:form.input label="City" name="city" placeholder="Type City" :model="@$port" required="true" />
            </div>
            <div class='col-md-6'>
                <x:form.input label="Note" name="note" placeholder="Type Note" :model="@$port" />
            </div>
            <div class='col-md-6'>
                <x:form.select label="Status" name="status" defaultOption="Select Status" :model="@$port">
                    <option value="1" @selected(old('status', @$port->status) == '1')>Active</option>
                    <option value="2" @selected(old('status', @$port->status) == '2')>In Active</option>
                    <option value="3" @selected(old('status', @$port->status) == '3')>Deleted</option>
                </x:form.select>
            </div>
        </div>
        <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
            <x:form.cancel-button href="{{ route('finance.master-data.port.index') }}" label="Cancel" />
            <x:form.submit-button label="Submit" />
        </div>
    </x:form.wrapper>
@endsection
