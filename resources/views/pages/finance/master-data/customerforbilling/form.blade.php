@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="{!! $data['page'] !!}">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
        <x:layout.breadcrumb.item pageName="Billing Customer" href="{{ route('finance.master-data.customerforbilling.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:form.wrapper action="{{ $data['action'] }}" method="{{ $data['method'] }}">
        <div class="row">
            <div class='col-md-4'>
                <x:form.input label="Billing Customer Name" name="customer_name" placeholder="Billing Customer Name" :model="$customer" required="true" />
            </div>
            <div class='col-md-4'>
                <x:form.input label="Billing Customer Code" name="customer_code" placeholder="Billing Customer Code" :model="$customer"  />
            </div>

            <div class='col-md-4'>
                <x:form.select label="Billing Customer Group" name="customer_group_id" defaultOption="Select Billing Customer Group" :model="$customer" >
                    @foreach ($customergroup as $row)
                        <option value="{{ $row->customer_group_id }}" @selected(old('customer_group_id', $customer?->customer_group_id) == $row->customer_group_id)>{{ $row->customer_group_name }}</option>
                    @endforeach
                </x:form.select>
            </div>

            <div class='col-md-12'>
                <x:form.textarea label="Billing Customer Address" name="customer_address" placeholder="Billing Customer Address" :model="$customer" required="true" />
            </div>

             <div class='col-md-6'>
                <x:form.input label="Billing Customer Email" name="customer_email" placeholder="Billing Customer Email" :model="$customer"  />
            </div>

            <div class='col-md-6'>
                <x:form.input label="Billing Customer Telp" name="customer_telp" placeholder="Billing Customer Telp" :model="$customer"  />
            </div>

            <div class='col-md-6'>
                <x:form.input label="Billing Customer Phone" name="customer_phone" placeholder="Billing Customer Phone" :model="$customer"  />
            </div>

            <div class='col-md-6'>
                <x:form.input label="Billing Customer Tax ID" name="customer_tax_id" placeholder="Billing Customer Tax ID" :model="$customer"  />
            </div>

            <div class='col-md-6'>
                <x:form.input label="Billing Customer Contact Center" name="customer_contact_person" placeholder="Billing Customer Contact Center" :model="$customer"  />
            </div>

            <div class='col-md-6'>
               <x:form.select label="Billing Customer Type" name="customer_type" defaultOption="Select Billing Customer Type" :model="$customer" >
                    @foreach ($customer_type as $row)
                        <option value="{{ $row->customer_type_id }}" @selected(old('customer_type', $customer?->customer_type) == $row->customer_type_id)>{{ $row->customer_type_name }}</option>
                    @endforeach
                </x:form.select>
            </div>

            <div class='col-md-12'>
               <x:form.select label="Country" name="country_id" defaultOption="Select Country" :model="$customer" required="true">
                    @foreach ($countries as $row)
                        <option value="{{ $row->country_id }}" @selected(old('country_id', $customer?->country_id) == $row->country_id)>{{ $row->country_name }}</option>
                    @endforeach
                </x:form.select>
            </div>

        </div>
        <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
            <x:form.cancel-button href="{{ route('finance.master-data.customerforbilling.index') }}" label="Cancel" />
            <x:form.submit-button label="Submit" />
        </div>
    </x:form.wrapper>
@endsection
