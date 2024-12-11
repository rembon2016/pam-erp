@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="{!! $data['page'] !!}">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
        <x:layout.breadcrumb.item pageName="Customer Contract" href="{{ route('finance.master-data.customer-contract.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:form.wrapper action="{{ $data['action'] }}" method="{{ $data['method'] }}">
        <div class="row">
            <div class='col-12'>
                <x:form.select2 label="Customer" name="customer_id" placeholder="Select Customer" :model="$customer_contract" required="true">
                    @foreach ($customers as $customer)
                        <option value="{{ $customer->id }}" @selected(old('customer_id', $customer_contract?->customer_id))>{{ $customer->customer_name }}</option>
                    @endforeach
                </x:form.select2>
            </div>
            <div class="col-md-4">
                <x:form.input label="Contract Validity From" name="contract_start" placeholder="Select Date" type="date" :model="$customer_contract" required="true" />
            </div>
            <div class="col-md-4">
                <x:form.input label="Contract Validity To" name="contract_end" placeholder="Select Date" type="date" :model="$customer_contract" required="true" />
            </div>
            <div class="col-md-4">
                <x:form.input label="Attachment" name="contract_file" placeholder="Choose File" type="file" :model="$customer_contract" file="true" />
            </div>
            <div class="col-12 dynamic-row-wrapper mx-0 mb-5" data-array-type="associative">
                <div class="d-flex align-items-center justify-content-between gap-2 mb-5">
                    <h5 class="mb-0">Charges</h5>
                    <button type="button" class="btn btn-success btn-icon btn-sm" data-type="add-dynamic-row">
                        <i class="bx bx-plus"></i>
                    </button>
                </div>
                @php
                    $existingCharges = old('charges', $customer_contract->charges?->toArray());
                    if (count($existingCharges) < 1) {
                        $existingCharges = [
                                [
                                    'id' => null,
                                    "charge_id" => null,
                                    "currency_id" => null,
                                    "rate" => null,
                                    "unit_id" => null
                                ]
                        ];
                    }
                @endphp
                @foreach ($existingCharges as $index => $item)
                    <div class="dynamic-row-item row mb-3">
                        <input type="hidden" name="charges[{{ $index }}][customer_contract_charge_id]" value="{{ $item['id'] }}">

                        <div class="col-3">
                            <label for="charge_id" class="form-label required">Charge</label>
                            <select name="charges[{{ $index }}][charge_id]" id="charge_id" class="form-select @error('charges.{{ $index }}.charge_id') is-invalid @enderror" required>
                                <option value="">Select Charge</option>
                                @foreach ($charges as $charge)
                                    <option value="{{ $charge->id }}" @selected($item['charge_id'] == $charge->id)>{{ $charge->charge_name }}</option>
                                @endforeach
                            </select>
                            @error('charges.{{ $index }}.charge_id')
                                <div class="invalid-feedback">{{ $messages }}</div>
                            @enderror
                        </div>
                        <div class="col-3">
                            <label for="currency_id" class="form-label required">Currency</label>
                            <select name="charges[{{ $index }}][currency_id]" id="currency_id" class="form-select @error('charges.{{ $index }}.currency_id') is-invalid @enderror" required>
                                <option value="">Select Currency</option>
                                @foreach ($currencies as $currency)
                                    <option value="{{ $currency->id }}" @selected($item['currency_id'] == $currency->id)>{{ $currency->currency_name }}</option>
                                @endforeach
                            </select>
                            @error('charges.{{ $index }}.currency_id')
                                <div class="invalid-feedback">{{ $messages }}</div>
                            @enderror
                        </div>
                        <div class="col-2">
                            <label for="rate" class="form-label required">Rate</label>
                            <input type="number" name="charges[{{ $index }}][rate]" id="rate" class="@error('charges.{{ $index }}.rate') is-invalid @enderror form-control" value="{{ $item['rate'] }}" min="0" placeholder="0" required>
                            @error('charges.{{ $index }}.rate')
                                <div class="invalid-feedback">{{ $messages }}</div>
                            @enderror
                        </div>
                        <div class="col-3">
                            <label for="unit_id" class="form-label required">Unit</label>
                            <select name="charges[{{ $index }}][unit_id]" id="unit_id" class="form-select @error('charges.{{ $index }}.unit_id') is-invalid @enderror" required>
                                <option value="">Select Unit</option>
                                @foreach ($units as $unit)
                                    <option value="{{ $unit->unit_id }}" @selected($item['unit_id'] == $unit->unit_id)>{{ "{$unit->description} ({$unit->unit_name})" }}</option>
                                @endforeach
                            </select>
                            @error('charges.{{ $index }}.unit_id')
                                <div class="invalid-feedback">{{ $messages }}</div>
                            @enderror
                        </div>
                        <div class="col-1 d-flex flex-column align-items-end">
                            <label for="" class="form-label d-block">&nbsp;</label>
                            <button type="button" class="btn btn-icon btn-danger" data-type="delete-dynamic-row">
                                <i class="bx bx-trash-alt"></i>
                            </button>
                        </div>
                    </div>
                @endforeach
            </div>
            <div class="col-12">
                <x:form.textarea label="Description" name="contract_description" placeholder="Type Description of Contract" required="true" :model="$customer_contract" />
            </div>
        </div>
        <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
            <x:form.cancel-button href="{{ route('finance.master-data.customer-contract.index') }}" label="Cancel" />
            <x:form.submit-button label="Submit" />
        </div>
    </x:form.wrapper>
@endsection
