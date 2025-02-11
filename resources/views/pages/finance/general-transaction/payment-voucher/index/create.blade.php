@extends('layout.main-layout')

@section('title')
    {{ $data['page'] }}
@endsection

@section('body')
    <x:layout.breadcrumb.wrapper module="General Transaction" pageName="{!! $data['page'] !!}">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="General Transaction" />
        <x:layout.breadcrumb.item pageName="Payment Voucher"
            href="{{ route('finance.general-transaction.payment-voucher.index', ['type' => 'index']) }}" />
    </x:layout.breadcrumb.wrapper>

    <x:form.wrapper action="{{ $data['action'] }}" method="{{ $data['method'] }}">
        <div class="row">
            <div class='col-md-3'>
                <x:form.select2 label="Daybook Code" name="Daybook Code" placeholder="Select Daybook Code" required="true">
                    @foreach (['customerparty a', 'customerparty b'] as $row)
                        <option value="{{ $row }}">
                            {{ $row }}
                        </option>
                    @endforeach
                </x:form.select2>
            </div>
            <div class='col-md-3'>
                <x:form.select2 label="Customer" name="Customer" placeholder="Select Customer" required="true">
                    @foreach (['trade a', 'trade b'] as $row)
                        <option value="{{ $row }}">
                            {{ $row }}
                        </option>
                    @endforeach
                </x:form.select2>
            </div>
            <div class='col-md-3'>
                <x:form.input label="Payment Voucher No." name="charge_name" placeholder="Payment Voucher No." required="true" />
            </div>
            <div class='col-md-3'>
                <x:form.input type="date" label="Payment Voucher Date" name="charge_name" placeholder="Payment Voucher Date" required="true" />
            </div>
            <div class='col-md-3'>
                <x:form.input label="Credit Note Number" name="charge_name" placeholder="Credit Note Number" required="true" />
            </div>
            <div class='col-md-3'>
                <x:form.input type="date" label="Credit Note Date" name="charge_name" placeholder="Credit Note Date" required="true" />
            </div>
            <div class='col-md-3'>
                <x:form.input type="date" label="Credit Note Due Date" name="charge_name" placeholder="Credit Note Due Date" required="true" />
            </div>
            <div class='col-md-3'>
                <x:form.select2 label="Currency" name="Currency" placeholder="Select Currency" required="true">
                    @foreach (['daybook a', 'daybook b'] as $row)
                        <option value="{{ $row }}">
                            {{ $row }}
                        </option>
                    @endforeach
                </x:form.select2>
            </div>
            <div class='col-md-3'>
                <x:form.input label="Credit Note Amount" name="charge_name" placeholder="Credit Note Amount" required="true" />
            </div>
            <div class='col-md-3'>
                <x:form.input label="Approved Amount" name="charge_name" placeholder="Approved Amount" required="true" />
            </div>
            <div class='col-md-3'>
                <x:form.input label="Difference Amount" name="charge_name" placeholder="Difference Amount" required="true" />
            </div>
            <div class='col-md-3'>
                <x:form.input type="file" label="Upload Document" name="charge_name" placeholder="Upload Document" required="true" />
            </div>
            <div class='col-md-3'>
                <x:form.input label="Description" name="charge_name" placeholder="Description" required="true" />
            </div>
        </div>
        <div class="d-flex align-items-center w-100 justify-content-end mt-5" style="gap: 7.5px">
            <x:form.cancel-button href="{{ route('finance.master-data.charge.index') }}" label="Cancel" />
            <x:form.submit-button label="Submit" />
        </div>
    </x:form.wrapper>
@endsection
