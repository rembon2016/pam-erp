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
            <div class="col-md-6">
                <x:form.select2 label="Charge Name" name="charge_id" placeholder="Select Charge" :model="$customer_contract" required="true">
                    @foreach ($charges as $charge)
                        <option value="{{ $charge->id }}" @selected(old('charge_id', $customer_contract?->charge_id) == $charge->id)>{{ $charge->charge_name }}</option>
                    @endforeach
                </x:form.select2>
            </div>
            <div class="col-md-6">
                <x:form.select2 label="Currency" name="currency_id" placeholder="Select Currency" :model="$customer_contract" required="true">
                    @foreach ($currencies as $currency)
                        <option value="{{ $currency->id }}" @selected(old('currency_id', $customer_contract?->currency_id) == $currency->id)>{{ $currency->currency_name }}</option>
                    @endforeach
                </x:form.select2>
            </div>

            <div class="d-flex align-items-center justify-content-between gap-2 mb-2 mt-3">
                <h5 class="mb-0">Charge Rates</h5>
                <button type="button" class="btn btn-success btn-icon btn-sm" data-type="add-dynamic-row">
                    <i class="bx bx-plus"></i>
                </button>
            </div>

            <div class="table-responsive">
                <table class="table table-bordered table-striped table-sm">
                    <thead>
                        <tr>
                            <th>
                                <label for="" class="form-label required mb-0">Quantity</label>
                            </th>
                            <th>
                                <label for="" class="form-label required mb-0">Rate</label>
                            </th>
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody class="dynamic-row-wrapper" data-array-type="associative">
                        @php
                            $existingCharges = old('charges', $customer_contract->charges?->toArray());
                            if (count($existingCharges) < 1) {
                                $existingCharges = [
                                        [
                                            'id' => null,
                                            "rate" => null,
                                            "quantity" => null,
                                        ]
                                ];
                            }
                        @endphp

                        @foreach ($existingCharges as $index => $item)
                            <tr class="dynamic-row-item">
                                <input type="hidden" name="charges[{{ $index }}][customer_contract_charge_id]" value="{{ $item['id'] }}">
                                <td>
                                    <input type="number" name="charges[{{ $index }}][quantity]" data-type="quantity" id="quantity" class="@error('charges.{{ $index }}.quantity') is-invalid @enderror form-control" value="{{ $item['quantity'] }}" min="0" placeholder="0" required>
                                    @error('charges.{{ $index }}.quantity')
                                        <div class="invalid-feedback">{{ $messages }}</div>
                                    @enderror
                                </td>
                                <td>
                                    <input type="number" name="charges[{{ $index }}][rate]" data-type="rate" id="rate" class="@error('charges.{{ $index }}.rate') is-invalid @enderror form-control" value="{{ $item['rate'] }}" min="0" placeholder="0" required>
                                    @error('charges.{{ $index }}.rate')
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

@push('js')
    <script>
        function calculateAmount(rowItem) {
            const quantity = ~~parseFloat($(rowItem).find('input[data-type="quantity"]').val());
            const rate = ~~parseFloat($(rowItem).find('input[data-type="rate"]').val());
            const amount = quantity * rate;

            $(rowItem).find("input#amount").val(amount);
        }

        $(document).on('change', "select[data-type='charge']", function (event) {
            const rowItem = $(this).parents('.dynamic-row-item');
            const unitId = $(this).children('option:selected').data('unit-id') || '';

            $(rowItem).find('select#unit_id').val(unitId);
        });

        // $(document).on('keyup', 'input[data-type="quantity"], input[data-type="rate"]', function (event) {
        //     const rowItem = $(this).parents(".dynamic-row-item");
        //     calculateAmount(rowItem);
        // })

        $(document).ready(function () {
            // Protect Contract Start and Contract End Date
            $("#contract_start").change(function (event) {
                $("#contract_end").val("");

                const contract_start = $("#contract_start").val();
                if (contract_start) {
                    $("#contract_end").attr('min', contract_start);
                } else {
                    $("#contract_end").removeAttr('min');
                }
            })
        });
    </script>
@endpush
