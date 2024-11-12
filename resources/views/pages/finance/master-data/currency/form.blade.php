@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="{!! $data['page'] !!}">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
        <x:layout.breadcrumb.item pageName="Currency" href="{{ route('finance.master-data.currency.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:form.wrapper action="{{ $data['action'] }}" method="{{ $data['method'] }}">
        <div class="row">
            <div class='col-md-6'>
                <x:form.input label="Currency Code" name="currency_code" placeholder="Type Code of Currency" :model="$currency" required="true" />
            </div>
            <div class='col-md-6'>
                <x:form.input label="Currency Name" name="currency_name" placeholder="Type Name of Currency" :model="$currency" required="true" />
            </div>
            <div class='col-md-4'>
                <x:form.input type="date" label="Currency Date" name="currency_date" placeholder="Select Date of Currency" :model="$currency" required="true" />
            </div>
            <div class='col-md-4'>
                <x:form.input type="number" label="Buy Rate" name="buy_rate" placeholder="0" :model="$currency" required="true" />
            </div>
            <div class='col-md-4'>
                <x:form.input type="number" label="Sell Rate" name="sell_rate" placeholder="0" :model="$currency" required="true" />
            </div>
            <div class='col-md-12'>
                <x:form.textarea label="Notes" name="notes" placeholder="Type Notes..." :model="$currency" />
            </div>
        </div>
        <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
            <x:form.cancel-button href="{{ route('finance.master-data.currency.index') }}" label="Cancel" />
            <x:form.submit-button label="Submit" />
        </div>
    </x:form.wrapper>
@endsection
