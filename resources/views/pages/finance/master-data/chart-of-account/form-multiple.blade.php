@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="{!! $data['page'] !!}">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
        <x:layout.breadcrumb.item pageName="Chart of Account" href="{{ route('finance.master-data.chart-of-account.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:form.wrapper action="{{ $data['action'] }}" method="{{ $data['method'] }}">
        <div class="row">
            <div class='col-md-6'>
                <x:form.select2 label="GL Head Name" name="account_group_id" placeholder="Select Account Group" required="true">
                    @foreach ($accountGroups as $accountGroup)
                        <option value="{{ $accountGroup->id }}" @selected(old('account_group_id', @$coa->account_group_id) == $accountGroup->id)>{{ "{$accountGroup->code}: {$accountGroup->name}" }}</option>
                    @endforeach
                </x:form.select>
            </div>
            <div class='col-md-6'>
                <x:form.select2 label="Sub Account Group" name="sub_account_group_id" placeholder="Select Sub Account Group" required="true">
                    @foreach ($subAccountGroups as $subAccountGroup)
                        <option value="{{ $subAccountGroup->id }}" @selected(old('sub_accout_group_id', @$coa->sub_account_group_id) == $subAccountGroup->id)>{{ "{$subAccountGroup->code}: {$subAccountGroup->name}" }}</option>
                    @endforeach
                </x:form.select>
            </div>
            <div class='col-md-4'>
                <x:form.select label="Cash Flow ?" name="is_cashflow" defaultOption="Select Option" required="true">
                    <option value="1" @selected(!is_null(old('is_cashflow', @$coa->is_cashflow)) && old('is_cashflow', @$coa->is_cashflow) == 1)>Yes</option>
                    <option value="0" @selected(!is_null(old('is_cashflow', @$coa->is_cashflow)) && old('is_cashflow', @$coa->is_cashflow) == 0)>No</option>
                </x:form.select>
            </div>
            <div class='col-md-4' id="cashflow-type-box">
                <x:form.select label="Cash Flow Type" name="cashflow_type" defaultOption="Select Cash Flow Type" :disabled="@$coa->is_cashflow ? false : true">
                    @foreach ($cashflowTypes as $cashflowType)
                        <option value="{{ $cashflowType }}" @selected(old('cashflow_type', @$coa->cashflow_type) == $cashflowType)>
                            {{ Str::upper($cashflowType) . ' ACTIVITY' }}
                        </option>
                    @endforeach
                </x:form.select>
            </div>
            <div class='col-md-4'>
                <x:form.select label="Account Position" name="account_position" defaultOption="Select Account Position" :model="@$coa" required="true">
                    <option value="debit" @selected(old('account_position', @$coa->account_position) == 'debit')>Debit</option>
                    <option value="credit" @selected(old('account_position', @$coa->account_position) == 'credit')>Credit</option>
                </x:form.select>
            </div>

            <div class="col-12 my-3">
                <div class="d-flex w-100 align-items-center justify-content-between">
                    <h2>Accounts</h2>
                    <button type="button" class="btn btn-success btn-icon btn-sm" data-type="add-dynamic-row">
                        <i class="bx bx-plus"></i>
                    </button>
                </div>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>
                                    <label for="" class="form-label required mb-0">Account Code</label>
                                </th>
                                <th>
                                    <label for="" class="form-label required mb-0">Account Name</label>
                                </th>
                                <th>
                                    <label for="" class="form-label mb-0">Subledger Code</label>
                                </th>
                                <th>
                                    <label for="" class="form-label mb-0">Subledger Name</label>
                                </th>
                                <th>&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody class="dynamic-row-wrapper" data-array-type="associative">
                            @php
                                $existingData = old('accounts', [[
                                    "account_number" => null,
                                    "account_name" => null,
                                    "subledger_code" => null,
                                    "subledger_name" => null,
                                ]]);
                            @endphp

                            @foreach ($existingData as $index => $item)
                                <tr class="dynamic-row-item">
                                    <td>
                                        <input type="text" name="accounts[{{ $index }}][account_number]" id="" class="form-control @error('accounts.{{ $index }}.account_number') is-invalid @enderror" placeholder="Type Account Code" value="{{ $item['account_number'] }}" required>
                                        @error('accounts.{{ $index }}.account_number')
                                            <div class="invalid-feedback">{{ $messages }}</div>
                                        @enderror
                                    </td>
                                    <td>
                                        <input type="text" name="accounts[{{ $index }}][account_name]" id="" class="form-control @error('accounts.{{ $index }}.account_name') is-invalid @enderror" placeholder="Type Account Name" value="{{ $item['account_name'] }}" required>
                                        @error('accounts.{{ $index }}.account_name')
                                            <div class="invalid-feedback">{{ $messages }}</div>
                                        @enderror
                                    </td>
                                    <td>
                                        <input type="text" name="accounts[{{ $index }}][subledger_code]" id="" class="form-control @error('accounts.{{ $index }}.subledger_code') is-invalid @enderror" placeholder="Type Subledger Code" value="{{ $item['subledger_code'] }}">
                                        @error('accounts.{{ $index }}.subledger_code')
                                            <div class="invalid-feedback">{{ $messages }}</div>
                                        @enderror
                                    </td>
                                    <td>
                                        <input type="text" name="accounts[{{ $index }}][subledger_name]" id="" class="form-control @error('accounts.{{ $index }}.subledger_name') is-invalid @enderror" placeholder="Type Subledger Name" value="{{ $item['subledger_name'] }}">
                                        @error('accounts.{{ $index }}.subledger_name')
                                            <div class="invalid-feedback">{{ $messages }}</div>
                                        @enderror
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-icon btn-danger" data-type="delete-dynamic-row">
                                            <i class="bx bx-trash-alt"></i>
                                        </button>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
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
            $("#cashflow_type").removeAttr('disabled')
        } else {
            $("#cashflow_type").val("")
            $("#cashflow_type").attr('disabled', 'disabled');
        }
    }

    $(document).ready(function () {
        $('#is_cashflow').change(function () {
            toggleCashflowType($(this).val())
        })
    });
</script>
@endpush
