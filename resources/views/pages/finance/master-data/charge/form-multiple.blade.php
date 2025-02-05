@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="{!! $data['page'] !!}">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
        <x:layout.breadcrumb.item pageName="GL Charge Master" href="{{ route('finance.master-data.charge.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:form.wrapper action="{{ $data['action'] }}" method="{{ $data['method'] }}">
        <div class="row">
            <div class='col-md-4'>
                 <x:form.select2 label="Transport Type" name="transport_type_id" placeholder="Select Transport Type" required="true" :model="$charge">
                    @foreach ($service as $row)
                        <option value="{{ $row->id }}" @selected(old('transport_type_id', $charge->transport_type_id) == $row->id)>{{ $row->service_code }}</option>
                    @endforeach
                </x:form.select2>
            </div>
            <div class='col-md-4'>
                <x:form.select2 label="Unit" name="unit_id" placeholder="Select Unit" required="true" :model="$charge">
                    @foreach ($units as $unit)
                        <option value="{{ $unit->unit_id }}" @selected(old('unit_id', $charge->unit_id) == $unit->unit_id)>{{ $unit->unit_name }}</option>
                    @endforeach
                </x:form.select2>
            </div>
            <div class='col-md-4'>
                <x:form.select label="Agreed Rate Charge?" name="is_agreed_rate" required="true" :model="$charge">
                    <option value="1" @selected(old('is_agreed_rate', $charge->is_agreed_rate == 1))>Yes</option>
                    <option value="0" @selected(old('is_agreed_rate', $charge->is_agreed_rate == 0))>No</option>
                </x:form.select>
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


            <div class="col-12 my-3">
                <div class="d-flex w-100 align-items-center justify-content-between">
                    <h2>Charges</h2>
                    <button type="button" class="btn btn-success btn-icon btn-sm" data-type="add-dynamic-row">
                        <i class="bx bx-plus"></i>
                    </button>
                </div>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>
                                    <label for="" class="form-label required mb-0">Charge Code</label>
                                </th>
                                <th>
                                    <label for="" class="form-label required mb-0">Charge Name</label>
                                </th>
                                <th>&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody class="dynamic-row-wrapper" data-array-type="associative">
                            @php
                                $existingData = old('charges', [[
                                    "charge_code" => null,
                                    "charge_name" => null,
                                ]]);
                            @endphp

                            @foreach ($existingData as $index => $item)
                                <tr class="dynamic-row-item">
                                    <td>
                                        <input type="text" name="charges[{{ $index }}][charge_code]" id="" class="form-control @error('charges.{{ $index }}.charge_code') is-invalid @enderror" placeholder="Type Account Code" value="{{ $item['charge_code'] }}" required>
                                        @error('charges.{{ $index }}.charge_code')
                                            <div class="invalid-feedback">{{ $messages }}</div>
                                        @enderror
                                    </td>
                                    <td>
                                        <input type="text" name="charges[{{ $index }}][charge_name]" id="" class="form-control @error('charges.{{ $index }}.charge_name') is-invalid @enderror" placeholder="Type Account Name" value="{{ $item['charge_name'] }}" required>
                                        @error('charges.{{ $index }}.charge_name')
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
            <x:form.cancel-button href="{{ route('finance.master-data.charge.index') }}" label="Cancel" />
            <x:form.submit-button label="Submit" />
        </div>
    </x:form.wrapper>
@endsection
