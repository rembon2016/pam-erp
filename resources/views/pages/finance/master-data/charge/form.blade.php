@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="{!! $data['page'] !!}">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
        <x:layout.breadcrumb.item pageName="GL Charge Master" href="{{ route('finance.master-data.charge.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:form.wrapper action="{{ $data['action'] }}" method="{{ $data['method'] }}">
        <div class="row">
            <div class='col-md-6'>
                <x:form.input label="Charge Code" name="charge_code" placeholder="Type Code of Charge" :model="$charge" required="true" />
            </div>
            <div class='col-md-6'>
                <x:form.input label="Charge Name" name="charge_name" placeholder="Type Name of Charge" :model="$charge" required="true" />
            </div>
            <div class='col-md-6'>
                <x:form.input label="Transport Type" name="transport_type" placeholder="Type of Transport" :model="$charge" required="true" />
            </div>
            <div class='col-md-6'>
                <x:form.select2 label="Unit" name="unit_id" placeholder="Select Unit" required="true" :model="$charge">
                    @foreach ($units as $unit)
                        <option value="{{ $unit->unit_id }}" @selected(old('unit_id', $charge->unit_id) == $unit->unit_id)>{{ $unit->unit_name }}</option>
                    @endforeach
                </x:form.select2>
            </div>
            <div class='col-md-6'>
                <x:form.select2 label="Revenue Account Name" name="revenue_id" placeholder="Select Account" required="true" :model="$charge">
                    @foreach ($accounts as $account)
                        <option value="{{ $account->id }}" @selected(old('revenue_id', $charge->revenue_id) == $account->id)>{{ "{$account->code}: {$account->account_name}" }}</option>
                    @endforeach
                </x:form.select2>
            </div>
            <div class='col-md-6'>
                <x:form.select2 label="Cost Account Name" name="cost_id" placeholder="Select Account" required="true" :model="$charge">
                    @foreach ($accounts as $account)
                        <option value="{{ $account->id }}" @selected(old('cost_id', $charge->cost_id) == $account->id)>{{ "{$account->code}: {$account->account_name}" }}</option>
                    @endforeach
                </x:form.select2>
            </div>
        </div>
        <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
            <x:form.cancel-button href="{{ route('finance.master-data.charge.index') }}" label="Cancel" />
            <x:form.submit-button label="Submit" />
        </div>
    </x:form.wrapper>
@endsection
