@extends('layout.app')

@push('css')
<style>
    body {
        overflow-x: hidden;
    }

    /* .tableChargeForm, .tableChargeForm td, .tableChargeForm th {
        border: 1px solid #ddd;
    }

    .tableServiceForm, .tableServiceForm td, .tableServiceForm th {
        border: 1px solid #ddd;
    } */

    .tableServiceForm, .tableChargeForm {
        display: flex;
        flex-direction: column;
        flex-wrap: nowrap;
    }

    .tableServiceForm {
        overflow-x: hidden;
    }

    .tableChargeForm {
        margin: 0 15px;
    }

    .tableServiceForm :is(.form-control) {
        padding: 0.5rem 0.75rem;
        font-size: 1rem;
    }

    .tableServiceForm :is(.form-select) {
        padding: 0.5rem 3rem 0.5rem 0.75rem;
        font-size: 1rem;
    }

    .tableServiceForm .tableServiceForm-content::-webkit-scrollbar, .tableChargeForm::-webkit-scrollbar {
        height: 3px;
        width: 3px;
    }

    .tableServiceForm .tableServiceForm-content::-webkit-scrollbar-track, .tableChargeForm::-webkit-scrollbar-tra{
        background-color: #000;
    }

    .tableServiceForm .tableServiceForm-content {
        overflow-x: scroll;
        border: 1px solid #ddd;
        border-radius: 5px;
    }

    .tableServiceForm :is(.tableServiceForm-heading, .tableServiceForm-body .tableServiceForm-body-row), .tableChargeForm :is(.tableChargeForm-heading, .tableChargeForm-body .tableChargeForm-body-row), .tableChargeDetailForm :is(.tableChargeDetailForm-heading, .tableChargeDetailForm-body .tableChargeDetailForm-body-row) {
        display: flex;
        flex-direction: row;
        flex-wrap: nowrap;
        white-space: nowrap;
        flex: 0 0 auto;
    }

    .tableServiceForm .tableServiceForm-box, .tableChargeForm .tableChargeForm-box, .tableChargeDetailForm .tableChargeDetailForm-box {
        flex: 1;
        /* border: 1px solid #ededed; */
        min-width: 200px;
        padding: 5px;
    }

    .tableChargeForm .tableChargeForm-box .tableChargeForm-heading-text, .tableChargeDetailForm .tableChargeDetailForm-box .tableChargeDetailForm-heading-text {
        font-size: 12px;
    }
</style>
@endpush

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
            <div class="col-12 mb-10">
                <div class="d-flex align-items-center justify-content-between mb-5">
                    <h4 class="mb-5 mt-5">Add Services</h4>
                    <div>
                        <button type="button" id="addServices" class="btn btn-icon btn-success rounded" style="height: 30px; width: 30px;">
                            <i class="fa fa-plus pe-0"></i>
                        </button>
                        <button type="button" id="removeServices" class="btn btn-icon btn-warning rounded" style="height: 30px; width: 30px;" disabled>
                            <i class="fa fa-minus pe-0"></i>
                        </button>
                    </div>
                </div>
                @include('pages.finance.master-data.agent-contract.service-contract-form')
            </div>
        </div>
        <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
            <x:form.cancel-button href="{{ route('finance.master-data.agent-contract.index') }}" label="Cancel" />
            <x:form.submit-button label="Submit" />
        </div>
    </x:form.wrapper>
@endsection

@include('pages.finance.master-data.agent-contract.contract-agent-form-jquery')
