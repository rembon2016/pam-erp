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
                <x:form.input label="Attachment" name="contract_file" placeholder="Choose File" type="file" :model="$customer_contract" file="true" multiple="true" />
            </div>
            <div class="col-md-12">
                <x:form.select label="Service" name="service_type" defaultOption="Select Service" :model="$customer_contract" required="true">
                    @foreach ($services as $key => $name)
                        <option value="{{ $key }}" @selected(old('service_type', $customer_contract?->service_type) == $key)>{{ $name }}</option>
                    @endforeach
                </x:form.select>
            </div>
            <div class="col-md-3">
                <x:form.select2 label="Country Origin" class="country-list" name="origin_country_id" placeholder="Select Country" :model="$customer_contract" required="true" disabled="true">
                    @foreach($countries as $country)
                        <option value="{{ $country->country_id }}" @selected(old('origin_country_id', $customer_contract?->origin_country_id) == $country->country_id)>{{ $country->country_name }}</option>
                    @endforeach
                </x:form.select2>
            </div>
            <div class="col-md-3">
                <div class="select-port">
                    <x:form.select label="Port Origin" name="origin_port_id" placeholder="Select Port" :model="$customer_contract" required="true" disabled="true" />
                </div>
                <div class="free-text-port" style="display: none;">
                    <x:form.input label="Port Origin" name="origin_port" placeholder="Port Origin" :model="$customer_contract" required="true" />
                </div>
            </div>
            <div class="col-md-3">
                <x:form.select2 label="Country Destination" class="country-list" name="destination_country_id" placeholder="Select Country" :model="$customer_contract" required="true" disabled="true">
                    @foreach($countries as $country)
                        <option value="{{ $country->country_id }}" @selected(old('destination_country_id', $customer_contract?->destination_country_id) == $country->country_id)>{{ $country->country_name }}</option>
                    @endforeach
                </x:form.select2>
            </div>
            <div class="col-md-3">
                <div class="select-port">
                    <x:form.select label="Port Destination" name="destination_port_id" placeholder="Select Port" :model="$customer_contract" required="true" disabled="true" />
                </div>
                <div class="free-text-port" style="display: none;">
                    <x:form.input label="Port Destination" name="destination_port" placeholder="Port Destination" :model="$customer_contract" required="true" />
                </div>
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
                                <label for="" class="form-label required mb-0">From</label>
                            </th>
                            <th>
                                <label for="" class="form-label required mb-0">To</label>
                            </th>
                            <th>
                                <label for="" class="form-label required mb-0">Value</label>
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
                                            "from" => null,
                                            "to" => null,
                                        ]
                                ];
                            }
                        @endphp

                        @foreach ($existingCharges as $index => $item)
                            <tr class="dynamic-row-item">
                                <input type="hidden" name="charges[{{ $index }}][customer_contract_charge_id]" value="{{ $item['id'] }}">
                                <td>
                                    <input type="number" name="charges[{{ $index }}][from]" data-type="from" id="from" class="@error('charges.{{ $index }}.from') is-invalid @enderror form-control" value="{{ $item['from'] }}" min="0" placeholder="0" required>
                                    @error('charges.{{ $index }}.from')
                                        <div class="invalid-feedback">{{ $messages }}</div>
                                    @enderror
                                </td>
                                <td>
                                    <input type="number" name="charges[{{ $index }}][to]" data-type="to" id="to" class="@error('charges.{{ $index }}.to') is-invalid @enderror form-control" value="{{ $item['to'] }}" min="0" placeholder="0" required>
                                    @error('charges.{{ $index }}.to')
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
                <x:form.textarea label="Description" name="contract_description" placeholder="Type Description of Contract" :model="$customer_contract" />
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

        function generatePortSelect2(id, country_type, transport_mode, country = '') {
            let defaultValue = [];
            @if ($data['method'] == "PUT")
                if (country_type == 'origin') {
                    defaultValue = [
                        "{{ $customer_contract?->origin_port_id }}",
                        "{{ $customer_contract?->originPort?->port_code }} - {{ $customer_contract?->originPort?->port_name }}",
                    ];
                } else {
                    defaultValue = [
                        "{{ $customer_contract?->destination_port_id }}",
                        "{{ $customer_contract?->destinationPort?->port_code }} - {{ $customer_contract?->destinationPort?->port_name }}",
                    ];
                }
            @endif

            console.log(defaultValue);

            generateAjaxSelect2(
                id,
                "{{ route('api.finance.master-data.port.list') }}" + `?transport_mode=${transport_mode}&country=${country}`,
                "Select Port",
                function (result) {
                    return {
                        results: result.data.map(item => ({
                            id: item.port_id,
                            text: `${item.port_code} - ${item.port_name}`
                        })),
                    };
                },
                defaultValue
            );
        }

        function togglePortCountry(service_type) {
            const is_disabled = service_type === '' || service_type === null || service_type === undefined;

            if (is_disabled) {
                $("#origin_country_id").val('')
                $("#origin_port_id").val('')
                $("#destination_country_id").val('')
                $("#destination_port_id").val('')
            } else {
                $("#origin_country_id").prop('disabled', is_disabled)
                $("#origin_port_id").prop('disabled', is_disabled)
                $("#destination_country_id").prop('disabled', is_disabled)
                $("#destination_port_id").prop('disabled', is_disabled)

                $("#origin_port").prop('disabled', true);
                $("#destination_port").prop('disabled', true);

                let transport_mode = service_type.split('_')[0].toUpperCase();
                if (transport_mode === 'AIR' || transport_mode === 'SEA') {
                    $(".free-text-port").hide();
                    $(".select-port").show();

                    generatePortSelect2('origin_port_id', 'origin', transport_mode, $("#origin_country_id").val() ?? '');
                    generatePortSelect2('destination_port_id', 'destination', transport_mode, $("#destination_country_id").val() ?? '');
                } else {
                    $("#origin_port_id").prop('disabled', true)
                    $("#destination_port_id").prop('disabled', true)

                    $("#origin_port").prop('disabled', is_disabled);
                    $("#destination_port").prop('disabled', is_disabled);

                    $(".select-port").hide();
                    $(".free-text-port").show();
                }
            }
        }

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
            });

            const service_type = $("#service_type").val();
            togglePortCountry(service_type);

            $("#service_type").change(function (event) {
                const current_service_type = $(this).val();
                togglePortCountry(current_service_type);
            });

            $(".country-list").change(function (event) {
                const elementId = $(this).attr('id');
                const country_type = elementId.split('_')[0];
                const current_service_type = $("#service_type").val();

                const current_transport_mode = current_service_type.split('_')[0].toUpperCase();
                const country_id = $(this).val();
                const selectId = `${country_type}_port_id`;

                generatePortSelect2(selectId, country_type, current_transport_mode, country_id);
            });
        });
    </script>
@endpush
