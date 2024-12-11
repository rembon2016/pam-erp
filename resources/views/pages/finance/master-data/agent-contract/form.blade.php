@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="{!! $data['page'] !!}">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
        <x:layout.breadcrumb.item pageName="Agent Contract" href="{{ route('finance.master-data.agent-contract.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:form.wrapper action="{{ $data['action'] }}" method="{{ $data['method'] }}">
        <div class="row">
            <div class="col-md-6">
                <x:form.input label="Contract No" name="contract_no" placeholder="Type Number of Contract" type="text" required="true" :model="$agent_contract" />
            </div>
            <div class='col-md-6'>
                <x:form.select2 label="Customer" name="customer_id" placeholder="Select Customer" :model="$agent_contract" required="true">
                    @foreach ($customers as $customer)
                        <option value="{{ $customer->id }}" @selected(old('customer_id', $agent_contract?->customer_id))>{{ $customer->customer_name }}</option>
                    @endforeach
                </x:form.select2>
            </div>
            <div class="col-md-4">
                <x:form.input label="Contract Date" name="contract_date" placeholder="Select Date" type="date" required="true" :model="$agent_contract" />
            </div>
            <div class="col-md-4">
                <x:form.input label="Start Contract Date" name="contract_start" placeholder="Select Date" type="date" required="true" :model="$agent_contract" />
            </div>
            <div class="col-md-4">
                <x:form.input label="End Contract Date" name="contract_end" placeholder="Select Date" type="date" required="true" :model="$agent_contract" />
            </div>
            <div class="col-md-12">
                <x:form.input label="Document (Attachment)" name="contract_file" placeholder="Choose File" type="file" :model="$agent_contract" file="true" />
            </div>
            <div class="col-12">
                <x:form.textarea label="Description" name="contract_description" placeholder="Type Description of Contract" required="true" :model="$agent_contract" />
            </div>
        </div>
        <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
            <x:form.cancel-button href="{{ route('finance.master-data.agent-contract.index') }}" label="Cancel" />
            <x:form.submit-button label="Submit" />
        </div>
    </x:form.wrapper>
@endsection
