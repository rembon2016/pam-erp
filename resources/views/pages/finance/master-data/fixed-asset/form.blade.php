@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="{!! $data['page'] !!}">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
        <x:layout.breadcrumb.item pageName="Fixed Asset" href="{{ route('finance.master-data.fixed-asset.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:form.wrapper action="{{ $data['action'] }}" method="{{ $data['method'] }}">
        <div class="row">
            <div class='col-md-4'>
                <x:form.input label="Asset Code" name="asset_code" placeholder="Type Code of Asset" :model="$fixed_asset" required="true" />
            </div>
            <div class='col-md-4'>
                <x:form.input label="Asset Name" name="asset_name" placeholder="Type Name of Asset" :model="$fixed_asset" required="true" />
            </div>
            <div class='col-md-4'>
                <x:form.select label="Asset Type" name="fixed_asset_type_id" defaultOption="Select Asset Type" :model="$fixed_asset" required="true">
                    @foreach ($types as $type)
                        <option value="{{ $type->id }}" @selected(old('fixed_asset_type_id', $fixed_asset?->fixed_asset_type_id) == $type->id)>{{ $type->type_name }}</option>
                    @endforeach
                </x:form.select>
            </div>
            <div class='col-md-6'>
                <x:form.input type="date" label="Acquisition Date" name="acquisition_date" placeholder="Select Acquisition Date" :model="$fixed_asset" required="true" />
            </div>
            <div class='col-md-6'>
                <x:form.input type="number" label="Purchase Price" name="purchase_price" placeholder="0" :model="$fixed_asset" required="true" />
            </div>
            <div class='col-md-6'>
                <x:form.input label="Asset Useful Life" name="useful_life" placeholder="Type Useful Life of Asset" :model="$fixed_asset" required="true" />
            </div>
            <div class='col-md-6'>
                <x:form.select label="Status" name="fixed_asset_status_id" defaultOption="Select Status" :model="$fixed_asset" required="true">
                    @foreach ($statuses as $tstatus)
                        <option value="{{ $tstatus->id }}" @selected(old('fixed_asset_status_id', $fixed_asset?->fixed_asset_status_id) == $tstatus->id)>{{ $tstatus->status_name }}</option>
                    @endforeach
                </x:form.select>
            </div>
            <div class='col-md-12'>
                <x:form.textarea label="Notes" name="notes" placeholder="Type Notes..." :model="$fixed_asset" />
            </div>
        </div>
        <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
            <x:form.cancel-button href="{{ route('finance.master-data.fixed-asset.index') }}" label="Cancel" />
            <x:form.submit-button label="Submit" />
        </div>
    </x:form.wrapper>
@endsection
