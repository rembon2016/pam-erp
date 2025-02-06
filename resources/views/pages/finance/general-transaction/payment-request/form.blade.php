@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="General Transaction" pageName="{!! $data['page'] !!}">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="General Transaction" />
        <x:layout.breadcrumb.item pageName="Payment Request"
            href="{{ route('finance.general-transaction.payment-request.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:form.wrapper action="{{ $data['action'] }}" method="{{ $data['method'] }}">
        <div class="row">
            <div class='col-md-3'>
                <x:form.input label="Payment Request Number" name="charge_name" placeholder="Payment Request Number" required="true" />
            </div>
            <div class='col-md-3'>
                <x:form.input type="date" label="Payment Request Date" name="charge_name" placeholder="Payment Request Date" required="true" />
            </div>
            <div class='col-md-3'>
                <x:form.input label="Creditor Journal Voucher Number" name="charge_name" placeholder="Creditor Journal Voucher Number" required="true" />
            </div>
            <div class='col-md-3'>
                <x:form.input type="date" label="Creditor Journal Voucher Date" name="charge_name" placeholder="Creditor Journal Voucher Date" required="true" />
            </div>
            <div class='col-md-3'>
                <x:form.select2 label="Payment Type" name="Payment Type" placeholder="Select Payment Type" required="true">
                    @foreach (['trade a', 'trade b'] as $row)
                        <option value="{{ $row }}">
                            {{ $row }}
                        </option>
                    @endforeach
                </x:form.select2>
            </div>
            <div class='col-md-3'>
                <x:form.input label="Account Code" name="charge_name" placeholder="Account Code" required="true" />
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
                <x:form.input label="Description" name="charge_name" placeholder="Description" required="true" />
            </div>
        </div>
        <div class="d-flex align-items-center w-100 justify-content-end mt-5" style="gap: 7.5px">
            <x:form.cancel-button href="{{ route('finance.master-data.charge.index') }}" label="Cancel" />
            <x:form.submit-button label="Submit" />
        </div>
    </x:form.wrapper>
@endsection
