@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="General Transaction" pageName="{!! $data['page'] !!}">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="General Transaction" />
        <x:layout.breadcrumb.item pageName="Debit Note for Revenue"
            href="{{ route('finance.general-transaction.debit-note.index', ['type' => 'revenue']) }}" />
    </x:layout.breadcrumb.wrapper>

    <x:form.wrapper action="{{ $data['action'] }}" method="{{ $data['method'] }}">
        <div class="row">
            <div class='col-md-3'>
                <x:form.select2 label="Customer/Party Name" name="Customer/Party Name" placeholder="Select Customer/Party Name" required="true">
                    @foreach (['customerparty a', 'customerparty b'] as $row)
                        <option value="{{ $row }}">
                            {{ $row }}
                        </option>
                    @endforeach
                </x:form.select2>
            </div>
            <div class='col-md-3'>
                <x:form.select2 label="Trade/Non Trade" name="Trade/Non Trade" placeholder="Select Trade/Non Trade" required="true">
                    @foreach (['trade a', 'trade b'] as $row)
                        <option value="{{ $row }}">
                            {{ $row }}
                        </option>
                    @endforeach
                </x:form.select2>
            </div>
            <div class='col-md-3'>
                <x:form.input label="Credit/Debit Number" name="charge_name" placeholder="Credit/Debit Number" required="true" />
            </div>
            <div class='col-md-3'>
                <x:form.select2 label="Daybook Code" name="Daybook Code" placeholder="Select Daybook Code" required="true">
                    @foreach (['daybook a', 'daybook b'] as $row)
                        <option value="{{ $row }}">
                            {{ $row }}
                        </option>
                    @endforeach
                </x:form.select2>
            </div>
            <div class='col-md-3'>
                <x:form.input label="Amount" name="charge_name" placeholder="Amount" required="true" />
            </div>
            <div class='col-md-3'>
                <x:form.input label="Job Order No." name="charge_name" placeholder="Job Order No." required="true" />
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
