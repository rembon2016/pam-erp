@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="{!! $data['page'] !!}">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
        <x:layout.breadcrumb.item pageName="Chart of Account" href="{{ route('finance.master-data.chart-of-account.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:form.wrapper action="{{ $data['action'] }}" method="{{ $data['method'] }}">
        <div class="row">
            <div class='col-md-4'>
                <x:form.input label="Account No" name="account_no" placeholder="Type Number of Account" :model="$coa" required="true" />
            </div>
            <div class='col-md-4'>
                <x:form.input label="Account Name" name="account_name" placeholder="Type Name of Account" :model="$coa" required="true" />
            </div>
            <div class='col-md-4'>
                <x:form.input label="Subledger Code" name="subledger_code" placeholder="Type Code of Subledger" :model="$coa" required="true" />
            </div>
            <div class='col-md-4'>
                <x:form.input label="Subledger Name" name="subledger_name" placeholder="Type Name of Subledger" :model="$coa" required="true" />
            </div>
            <div class='col-md-4'>
                <x:form.select label="Account Group" name="account_group_id" defaultOption="Select Account Group" :model="$coa" required="true">
                    @foreach ($account_groups as $account_group)
                        <option value="{{ $account_group->id }}" @selected(old('account_group_id', $coa?->account_group_id == $account_group->id))>{{ "{$account_group->code}: {$account_group->name}" }}</option>
                    @endforeach
                </x:form.select>
            </div>
            <div class='col-md-4'>
                <x:form.select label="Sub Account Group" name="sub_account_group_id" defaultOption="Sub Select Account Group" :model="$coa" required="true">
                    @foreach ($sub_account_groups as $sub_accout_group)
                        <option value="{{ $sub_accout_group->id }}" @selected(old('sub_accout_group_id', $coa?->sub_accout_group_id == $sub_accout_group->id))>{{ "{$sub_accout_group->code}: {$sub_accout_group->name}" }}</option>
                    @endforeach
                </x:form.select>
            </div>
            <div class='col-md-4'>
                <x:form.select label="Cash Flow ?" name="is_cashflow" defaultOption="Select Option" :model="$coa" required="true">
                    <option value="1" @selected(!is_null(old('is_cashflow', $coa?->is_cashflow)) && old('is_cashflow', $coa?->is_cashflow) == 1)>Yes</option>
                    <option value="0" @selected(!is_null(old('is_cashflow', $coa?->is_cashflow)) && old('is_cashflow', $coa?->is_cashflow) == 0)>No</option>
                </x:form.select>
            </div>
            <div class='col-md-4' id="cashflow-type-box" style="display: none;">
                <x:form.select label="Cash Flow Type" name="cash_flow_type" defaultOption="Select Cash Flow Type" :model="$coa" required="true">
                    <option value="1" @selected(!is_null(old('is_cashflow', $coa?->is_cashflow)) && old('is_cashflow', $coa?->is_cashflow) == 1)>Operating</option>
                    <option value="2" @selected(!is_null(old('is_cashflow', $coa?->is_cashflow)) && old('is_cashflow', $coa?->is_cashflow) == 2)>Investing</option>
                    <option value="2" @selected(!is_null(old('is_cashflow', $coa?->is_cashflow)) && old('is_cashflow', $coa?->is_cashflow) == 2)>Financing</option>
                </x:form.select>
            </div>
        </div>
        <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
            <x:form.cancel-button href="{{ route('finance.master-data.chart-of-account.index') }}" label="Cancel" />
            <x:form.submit-button label="Submit" />
        </div>
    </x:form.wrapper>
@endsection

@push('js')
<script>
    function toggleCashflowType(is_cashflow) {
        if (is_cashflow == 1) {
            $("#cashflow-type-box").show();
        } else {
            $("#cashflow-type-box").hide();
        }
    }

    $(document).ready(function () {
        const is_cashflow = $("#is_cashflow").val();
        toggleCashflowType(is_cashflow);

        $("#is_cashflow").change(function () {
            toggleCashflowType($(this).val());
        })
    });
</script>
@endpush
