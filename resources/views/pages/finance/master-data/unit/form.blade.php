@extends('layout.main-layout')

@section('title')
    {{ $data['page'] }}
@endsection

@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="{!! $data['page'] !!}">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
        <x:layout.breadcrumb.item pageName="Service Type" href="{{ route('finance.master-data.service-type.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:form.wrapper action="{{ $data['action'] }}" method="{{ $data['method'] }}">
        <div class="row">
            <div class='col-md-6 mb-10'>
                <x:form.input label="Unit Code" name="unit_name" placeholder="Type Code of Unit" :model="$unit" required="true" />
            </div>
            <div class='col-md-6 mb-10'>
                <x:form.input label="Unit Name" name="description" placeholder="Type Name of Unit" :model="$unit" required="true" />
            </div>
        </div>
        <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
            <x:form.cancel-button href="{{ route('finance.master-data.unit.index') }}" label="Cancel" />
            <x:form.submit-button label="Submit" />
        </div>
    </x:form.wrapper>
@endsection
