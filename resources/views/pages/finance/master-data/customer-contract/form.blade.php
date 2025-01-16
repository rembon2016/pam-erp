@extends('layout.app')

@push('css')
<style>
    .charge-heading.active .dropdown-marker {
        transform: rotate(-180deg);
    }

    .charge-heading .dropdown-marker {
        transition: all .3s linear
    }
</style>
@endpush

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
            <div class="col-md-6">
                <x:form.input label="Contract Validity From" name="contract_start" placeholder="Select Date" type="date" :model="$customer_contract" required="true" />
            </div>
            <div class="col-md-6">
                <x:form.input label="Contract Validity To" name="contract_end" placeholder="Select Date" type="date" :model="$customer_contract" required="true" />
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
            {{-- <div class="col-md-6">
                <x:form.select2 label="Charge Name" name="charge_id" placeholder="Select Charge" :model="$customer_contract" required="true">
                    @foreach ($charges as $charge)
                        <option value="{{ $charge->id }}" @selected(old('charge_id', $customer_contract?->charge_id) == $charge->id)>{{ $charge->charge_name }}</option>
                    @endforeach
                </x:form.select2>
            </div> --}}
            <div class="col-md-6">
                <x:form.input label="Attachment (Multiple File Upload)" class="inputFiles" name="contract_file[]" placeholder="Choose File" type="file" :model="$customer_contract" file="true" multiple="true" />
                <div id="fileList">
                    @foreach($customer_contract?->documents as $document)
                        <div class="file-item">
                            <span>{{ $document->contract_file }}</span>
                            <div class="d-flex align-items-center justify-content-end gap-2">
                                <a href="{{ $document->getFileUrl() }}" class="btn btn-sm px-1 py-3" download>
                                    <i class="bx bx-download text-info fs-2"></i>
                                </a>
                                <button type="button" data-action="{{ route('finance.master-data.customer-contract.document.delete', $document->id) }}" data-type="delete-existing-file" class="btn btn-sm px-1 py-3">
                                    <i class="bx bx-trash text-danger fs-2"></i>
                                </button>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
            <div class="col-md-6">
                <x:form.select2 label="Currency" name="currency_id" placeholder="Select Currency" :model="$customer_contract" required="true">
                    @foreach ($currencies as $currency)
                        <option value="{{ $currency->id }}" @selected(old('currency_id', $customer_contract?->currency_id) == $currency->id)>{{ $currency->currency_name }}</option>
                    @endforeach
                </x:form.select2>
            </div>

            <div class="d-flex align-items-center justify-content-between gap-2 mb-3 p-3">
                <h5 class="mb-0">Charges</h5>
                <div class="d-flex align-item-center gap-3">
                    <button type="button" class="btn btn-success btn-icon btn-sm" data-type="add-charge">
                        <i class="bx bx-plus"></i>
                    </button>
                </div>
            </div>

            <div class="row px-0 ps-6 charge-item-wrapper">
                @php
                    $contractCharges = old('charges', $customer_contract?->charges->toArray());
                    if (count($contractCharges) == 0) $contractCharges = [
                        [
                            "id" => null,
                            'charge_id' => null,
                            'rates' => []
                        ],
                    ]
                @endphp

                @foreach ($contractCharges as $chargeIndex => $chargeItem)
                    <div class="col-12 border p-0 mb-3 charge-item">
                        <div class="d-flex flex-column">
                            <div class="d-flex align-items-center justify-content-between gap-2 p-3 border charge-heading" style="cursor: pointer;">
                                <h5 class="mb-0 charge-title">Charge #{{ $loop->iteration }}</h5>
                                <div class="d-flex align-item-center gap-3">
                                    <button type="button" class="btn btn-icon btn-danger" data-type="delete-charge">
                                        <i class="bx bx-trash-alt"></i>
                                    </button>
                                    <span class="d-flex align-items-center justify-content-center dropdown-marker">
                                        <i class="bx bx-chevron-down" style="font-size: 2rem"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="flex-column charge-body mt-3" style="display: none;">
                            <div class="d-flex px-3 charge-input">
                                <div class="col-12 d-flex align-items-end mb-3">
                                    <input type="hidden" name="charges[{{ $chargeIndex }}][customer_contract_charge_id]" value="{{ !empty($chargeItem['id']) ? $chargeItem['id'] : '' }}">
                                    <div class="col-12">
                                        <label for="" class="form-label required">Charge Name</label>
                                        <select name="charges[{{ $chargeIndex }}][charge_id]" id="charge_id" class="form-select chargeSelect2" data-placeholder="Select Charge" required>
                                            <option value="" selected disabled>Select Charge</option>
                                            @foreach ($charges as $charge)
                                                <option value="{{ $charge->id }}" @selected(old('charge_id', $chargeItem['charge_id']) == $charge->id)>{{ $charge->charge_name }} - {{ $charge->unit->unit_name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>

                            @if (count($chargeItem['rates']) > 0)
                                @if ($chargeItem['rates'][0]['unit_code'] == "KG")
                                    {{-- Kilogram --}}
                                    <div class="flex-column mx-3 border mb-3 charge-rates" data-unit-type="{{ $chargeItem['rates'][0]['unit_code'] }}">
                                        <div class="d-flex align-items-center justify-content-between gap-2 mb-3 px-3 py-2">
                                            <h5 class="mb-0">Charge Rates by Kilogram</h5>
                                            <button type="button" class="btn btn-info btn-icon btn-sm" data-type="add-charge-detail">
                                                <i class="bx bx-plus"></i>
                                            </button>
                                        </div>

                                        <div class="table-responsive px-3">
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
                                                <tbody class="charge-detail-wrapper">
                                                    @foreach ($chargeItem['rates'] as $rateIndex => $rate)
                                                        <tr class="charge-detail-item">
                                                            <input type="hidden" name="charges[{{ $chargeIndex }}][rates][{{ $rateIndex }}][customer_contract_charge_detail_id]" value="{{ !empty($rate['id']) ? $rate['id'] : '' }}">
                                                            <input type="hidden" name="charges[{{ $chargeIndex }}][rates][{{ $rateIndex }}][unit_code]" value="{{ $rate['unit_code'] }}" data-type="unit-code">
                                                            <td>
                                                                <input type="number" name="charges[{{ $chargeIndex }}][rates][{{ $rateIndex }}][from]" data-type="from" id="from" class="form-control" value="{{ $rate['from'] }}" min="0" placeholder="0" required>
                                                            </td>
                                                            <td>
                                                                <input type="number" name="charges[{{ $chargeIndex }}][rates][{{ $rateIndex }}][to]" data-type="to" id="to" class="form-control" value="{{ $rate['from'] }}" min="0" placeholder="0" required>
                                                            </td>
                                                            <td>
                                                                <input type="number" name="charges[{{ $chargeIndex }}][rates][{{ $rateIndex }}][rate]" data-type="rate" id="rate" class="form-control" value="{{ $rate['to'] }}" min="0" placeholder="0" required>
                                                            </td>
                                                            <td>
                                                                <div class="d-flex justify-content-end">
                                                                    <button type="button" class="btn btn-icon btn-danger" data-type="delete-charge-detail">
                                                                        <i class="bx bx-trash-alt"></i>
                                                                    </button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    @endforeach
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                @elseif ($chargeItem['rates'][0]['unit_code'] == "SHIPMENT")
                                    {{-- Shipment --}}
                                    <div class="flex-column mx-3 border mb-3 charge-rates" data-unit-type="{{ $chargeItem['rates'][0]['unit_code'] }}">
                                        <div class="d-flex align-items-center justify-content-between gap-2 mb-3 px-3 py-2">
                                            <h5 class="mb-0">Charge Rates by Shipment</h5>
                                        </div>

                                        <div class="table-responsive px-3">
                                            <table class="table table-bordered table-striped table-sm">
                                                <thead>
                                                    <tr>
                                                        <th>
                                                            <label for="" class="form-label required mb-0">Rate</label>
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody class="charge-detail-wrapper">
                                                    @foreach ($chargeItem['rates'] as $rateIndex => $rate)

                                                    @endforeach
                                                    <tr class="charge-detail-item">
                                                        <input type="hidden" name="charges[{{ $chargeIndex }}][rates][{{ $rateIndex }}][customer_contract_charge_detail_id]" value="{{ !empty($rate['id']) ? $rate['id'] : '' }}">
                                                        <input type="hidden" name="charges[{{ $chargeIndex }}][rates][{{ $rateIndex }}][unit_code]" value="{{ $rate['unit_code'] }}" data-type="unit-code">
                                                        <td>
                                                            <input type="number" name="charges[{{ $chargeIndex }}][rates][{{ $rateIndex }}][rate]" data-type="rate" id="rate" class="form-control" value="{{ $rate['rate'] }}" min="0" placeholder="0" required>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                @elseif ($chargeItem['rates'][0]['unit_code'] == "CONTAINER")
                                    {{-- Container --}}
                                    <div class="flex-column mx-3 border mb-3 charge-rates" data-unit-type="{{ $chargeItem['rates'][0]['unit_code'] }}">
                                        <div class="d-flex align-items-center justify-content-between gap-2 mb-3 px-3 py-2">
                                            <h5 class="mb-0">Charge Rates by Container</h5>
                                        </div>

                                        <div class="table-responsive px-3">
                                            <table class="table table-bordered table-striped table-sm">
                                                <thead>
                                                    <tr>
                                                        <th>
                                                            <label for="" class="form-label required mb-0">Container Type</label>
                                                        </th>
                                                        <th>
                                                            <label for="" class="form-label required mb-0">Rate</label>
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody class="charge-detail-wrapper">
                                                    @foreach ($container_types as $container_type)
                                                        @foreach ($chargeItem['rates'] as $rateIndex => $rate)
                                                            @if ($rate['container_type'] == $container_type)
                                                                <tr class="charge-detail-item">
                                                                    <input type="hidden" name="charges[{{ $chargeIndex }}][rates][{{ $rateIndex }}][customer_contract_charge_detail_id]" value="{{ !empty($rate['id']) ? $rate['id'] : '' }}">
                                                                    <input type="hidden" name="charges[{{ $chargeIndex }}][rates][{{ $rateIndex }}][unit_code]" value="{{ $rate['unit_code'] }}" data-type="unit-code">
                                                                    <td>
                                                                        <input type="text" name="charges[{{ $chargeIndex }}][rates][{{ $rateIndex }}][container_type]" data-type="container-type" id="container-type" class="form-control" value="{{ $container_type }}" placeholder="Container Type" readonly required>
                                                                    </td>
                                                                    <td>
                                                                        <input type="number" name="charges[{{ $chargeIndex }}][rates][{{ $rateIndex }}][rate]" data-type="rate" id="rate" class="form-control" value="{{ $rate['rate'] }}" min="0" placeholder="0" required>
                                                                    </td>
                                                                </tr>
                                                            @endif
                                                        @endforeach
                                                    @endforeach
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                @endif
                            @endif

                        </div>
                    </div>
                @endforeach
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

        function slideChargeItem(chargeItem) {
            $(chargeItem).find('.charge-body').slideToggle();
            $(chargeItem).find('.charge-heading').toggleClass('active');
        }

        function generateChargeItemHtml(chargeIndex) {
            return `
                <div class="col-12 border p-0 mb-3 charge-item">
                    <div class="d-flex flex-column">
                        <div class="d-flex align-items-center justify-content-between gap-2 p-3 border charge-heading" style="cursor: pointer;">
                            <h5 class="mb-0 charge-title">Charge #${chargeIndex + 1}</h5>
                            <div class="d-flex align-item-center gap-3">
                                <button type="button" class="btn btn-icon btn-danger" data-type="delete-charge">
                                    <i class="bx bx-trash-alt"></i>
                                </button>
                                <span class="d-flex align-items-center justify-content-center dropdown-marker">
                                    <i class="bx bx-chevron-down" style="font-size: 2rem"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="flex-column charge-body mt-3" style="display: none">
                        <div class="d-flex px-3 charge-input">
                            <div class="col-12 d-flex align-items-end mb-3">
                                <input type="hidden" name="charges[${chargeIndex}][customer_contract_charge_id]" value="">
                                <div class="col-12">
                                    <label for="" class="form-label required">Charge Name</label>
                                    <select name="charges[${chargeIndex}][charge_id]" id="charge_id" class="form-select chargeSelect2" data-placeholder="Select Charge" required>
                                        <option value="" selected disabled>Select Charge</option>
                                        @foreach ($charges as $charge)
                                            <option value="{{ $charge->id }}">{{ $charge->charge_name }} - {{ $charge->unit->unit_name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            `;
        }

        function generateChargeRatesHtml(unit_type, chargeIndex) {
            if (unit_type === 'KG') {
                return `
                    <div class="flex-column mx-3 border mb-3 charge-rates" data-unit-type="KG">
                        <div class="d-flex align-items-center justify-content-between gap-2 mb-3 px-3 py-2">
                            <h5 class="mb-0">Charge Rates by Kilogram</h5>
                            <button type="button" class="btn btn-info btn-icon btn-sm" data-type="add-charge-detail">
                                <i class="bx bx-plus"></i>
                            </button>
                        </div>

                        <div class="table-responsive px-3">
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
                                <tbody class="charge-detail-wrapper">
                                    ${generateChargeDetailHtml(unit_type, chargeIndex)}
                                </tbody>
                            </table>
                        </div>
                    </div>
                `;
            } else if (unit_type === 'SHIPMENT') {
                return `
                    <div class="flex-column mx-3 border mb-3 charge-rates" data-unit-type="SHIPMENT">
                        <div class="d-flex align-items-center justify-content-between gap-2 mb-3 px-3 py-2">
                            <h5 class="mb-0">Charge Rates by Shipment</h5>
                        </div>

                        <div class="table-responsive px-3">
                            <table class="table table-bordered table-striped table-sm">
                                <thead>
                                    <tr>
                                        <th>
                                            <label for="" class="form-label required mb-0">Rate</label>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody class="charge-detail-wrapper">
                                    ${generateChargeDetailHtml(unit_type, chargeIndex)}
                                </tbody>
                            </table>
                        </div>
                    </div>
                `;
            } else if (unit_type === "CONTAINER") {
                return `
                    <div class="flex-column mx-3 border mb-3 charge-rates" data-unit-type="CONTAINER">
                        <div class="d-flex align-items-center justify-content-between gap-2 mb-3 px-3 py-2">
                            <h5 class="mb-0">Charge Rates by Container</h5>
                        </div>

                        <div class="table-responsive px-3">
                            <table class="table table-bordered table-striped table-sm">
                                <thead>
                                    <tr>
                                        <th>
                                            <label for="" class="form-label required mb-0">Container Type</label>
                                        </th>
                                        <th>
                                            <label for="" class="form-label required mb-0">Rate</label>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody class="charge-detail-wrapper">
                                    ${generateChargeDetailHtml(unit_type, chargeIndex)}
                                </tbody>
                            </table>
                        </div>
                    </div>
                `;
            } else {
                console.warn(`Undefined Container Type: ${unit_type}`);
                return;
            }
        }

        function generateChargeDetailHtml(unit_type, chargeIndex, chargeDetailIndex = 0) {
            if (unit_type === 'KG') {
                return `
                    <tr class="charge-detail-item">
                        <input type="hidden" name="charges[${chargeIndex}][rates][${chargeDetailIndex}][customer_contract_charge_detail_id]" value="">
                        <input type="hidden" name="charges[${chargeIndex}][rates][${chargeDetailIndex}][unit_code]" data-type="unit-code" value="${unit_type}">
                        <td>
                            <input type="number" name="charges[${chargeIndex}][rates][${chargeDetailIndex}][from]" data-type="from" id="from" class="form-control" value="" min="0" placeholder="0" required>
                        </td>
                        <td>
                            <input type="number" name="charges[${chargeIndex}][rates][${chargeDetailIndex}][to]" data-type="to" id="to" class="form-control" value="" min="0" placeholder="0" required>
                        </td>
                        <td>
                            <input type="number" name="charges[${chargeIndex}][rates][${chargeDetailIndex}][rate]" data-type="rate" id="rate" class="form-control" value="" min="0" placeholder="0" required>
                        </td>
                        <td>
                            <div class="d-flex justify-content-end">
                                <button type="button" class="btn btn-icon btn-danger" data-type="delete-charge-detail">
                                    <i class="bx bx-trash-alt"></i>
                                </button>
                            </div>
                        </td>
                    </tr>
                `;
            } else if (unit_type === 'SHIPMENT') {
                return `
                    <tr class="charge-detail-item">
                        <input type="hidden" name="charges[${chargeIndex}][rates][0][customer_contract_charge_detail_id]" value="">
                        <input type="hidden" name="charges[${chargeIndex}][rates][${chargeDetailIndex}][unit_code]" data-type="unit-code" value="${unit_type}">
                        <td>
                            <input type="number" name="charges[${chargeIndex}][rates][0][rate]" data-type="rate" id="rate" class="form-control" value="" min="0" placeholder="0" required>
                        </td>
                    </tr>
                `;
            } else if (unit_type === 'CONTAINER') {
                return `
                    @foreach($container_types as $container_index => $container_type)
                        <tr class="charge-detail-item">
                            <input type="hidden" name="charges[${chargeIndex}][rates][{{ $container_index }}][customer_contract_charge_detail_id]" value="">
                            <input type="hidden" name="charges[${chargeIndex}][rates][{{ $container_index }}][unit_code]" data-type="unit-code" value="${unit_type}">
                            <td>
                                <input type="text" name="charges[${chargeIndex}][rates][{{ $container_index }}][container_type]" data-type="container-type" id="container-type" class="form-control" value="{{ $container_type }}" placeholder="Container Type" readonly required>
                            </td>
                            <td>
                                <input type="number" name="charges[${chargeIndex}][rates][{{ $container_index }}][rate]" data-type="rate" id="rate" class="form-control" value="" min="0" placeholder="0" required>
                            </td>
                        </tr>
                    @endforeach
                `;
            } else {
                console.warn(`Undefined Unit Type: ${unit_type}`);
                return;
            }
        }

        function setNewElementNameAttribute(element, chargesIndex, ratesIndex = null) {
            const nameAttr = $(element).attr('name');
            if (!nameAttr) return;

            let updatedName = nameAttr.replace(/charges\[\d+\]/, `charges[${chargesIndex}]`);
            if (ratesIndex !== null) {
                if (/\[rates\]\[\d+\]/.test(updatedName)) {
                    updatedName = updatedName.replace(/\[rates\]\[\d+\]/, `[rates][${ratesIndex}]`);
                } else {
                    console.warn(`No '[rates]' index found in name: ${nameAttr} with index ${ratesIndex}`);
                }
            }

            $(element).attr('name', updatedName);
        }

        function renameElementAttribute() {
            $(".charge-item-wrapper").children('.charge-item').each(function (chargeItemIndex) {
                const chargeInput = $(this).find('.charge-input');
                $(this).find('.charge-title').text(`Charge #${chargeItemIndex + 1}`);

                $(chargeInput).find('select, input').each(function (i) {
                    setNewElementNameAttribute($(this), chargeItemIndex);
                })

                $(this).find('.charge-detail-item').each(function (chargeDetailIndex) {
                    $(this).find('select, input').each(function (i) {
                        setNewElementNameAttribute($(this), chargeItemIndex, chargeDetailIndex);
                    })
                })
            })
        }

        $(document).off('click', '.charge-heading').on('click', '.charge-heading', function (event) {
            event.preventDefault();
            const chargeItem = $(this).parents('.charge-item');
            slideChargeItem(chargeItem);
        })

        $(document).on('change', '.chargeSelect2', function (event) {
            const selectedOption = $(this).children('option:selected');
            if (!selectedOption) return;

            const unit_name = $(selectedOption).text();
            const unit_name_array = unit_name.split('-');
            const unit_type = unit_name_array[unit_name_array.length - 1].trim().toUpperCase()
            const chargeItem = $(this).parents('.charge-item');
            const chargeIndex = $(chargeItem).index();
            const chargeRates = $(chargeItem).find('.charge-rates');

            const chargeRatesHtml = generateChargeRatesHtml(unit_type, chargeIndex);
            if (chargeRates.length > 0) {
                $(chargeRates).each(function () {
                    const chargeRatesType = $(this).data('unit-type');
                    if (unit_type !== chargeRatesType) {
                        $(this).remove();
                    }
                });

                if ($(chargeItem).find(".charge-rates").length == 0) $(chargeItem).find('.charge-body').append(chargeRatesHtml);
            } else {
                $(chargeItem).find('.charge-body').append(chargeRatesHtml);
            }
        })

        // Add & Delete Charge Item
        $(document).off('click', 'button[data-type="add-charge"]').on('click', 'button[data-type="add-charge"]', function (event) {
            event.preventDefault();
            const chargeItemWrapper = $(".charge-item-wrapper")
            const countOfCharge = $(chargeItemWrapper).children('.charge-item').length;
            const chargeItemHtml = generateChargeItemHtml(countOfCharge);

            $(chargeItemWrapper).append(chargeItemHtml);
        })

        $(document).off('click', 'button[data-type="delete-charge"]').on('click', 'button[data-type="delete-charge"]', function (event) {
            event.stopPropagation();

            const chargeWrapper = $(this).parents('.charge-item-wrapper');
            const countOfCharge = $(chargeWrapper).children('.charge-item').length;

            if (countOfCharge > 1) {
                $(this).parents('.charge-item').remove();
                renameElementAttribute();
            } else {
                $(this).parents('.charge-item').find('input, select').val('');
                $(this).parents('.charge-item').find('.charge-rates').remove();
            }
        });

        // Add & Delete Charge Detail Item
        $(document).off('click', 'button[data-type="add-charge-detail"]').on('click', 'button[data-type="add-charge-detail"]', function (event) {
            event.preventDefault();
            const chargeItem = $(this).parents('.charge-item');
            const countChargeDetail = $(chargeItem).find('.charge-detail-item').length;
            const chargeItemIndex = $(chargeItem).index();
            const unit_type = $(this).parents('.charge-rates').data('unit-type');
            const chargeDetailHtml = generateChargeDetailHtml(unit_type, chargeItemIndex, countChargeDetail);

            $(chargeItem).find('.charge-detail-wrapper').append(chargeDetailHtml);

            if (unit_type === 'KG') {
                const countOfChargeDetail = $(chargeItem).find('.charge-detail-item').length;
                const above_to_value = ~~parseFloat($(chargeItem).find('.charge-detail-item').eq(countOfChargeDetail - 2).find('input[data-type="to"]').val());

                $(chargeItem).find('.charge-detail-item').eq(countOfChargeDetail - 1).find('input[data-type="from"]').val(above_to_value);
            }
        });

        $(document).off('click', 'button[data-type="delete-charge-detail"]').on('click', 'button[data-type="delete-charge-detail"]', function (event) {
            event.preventDefault();

            const chargeDetailWrapper = $(this).parents('.charge-detail-wrapper');
            const countOfChargeDetail = $(chargeDetailWrapper).find('.charge-detail-item').length;

            if (countOfChargeDetail > 1) {
                $(this).parents('.charge-detail-item').remove();
                renameElementAttribute();
            } else {
                $(this).parents('.charge-detail-item').find('input, select').val('');
            }
        });

        $(document).ready(function () {
            slideChargeItem($(".charge-item").eq(0));

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

            $("button[data-type='delete-existing-file']").off('click').on('click', function (event) {
                event.preventDefault();
                const actionUrl = $(this).data('action');
                const fileItem = $(this).parents('.file-item');

                $.ajax({
                    url: actionUrl,
                    method: 'DELETE',
                    headers: {
                        'X-CSRF-TOKEN': "{{ csrf_token() }}",
                    },
                    beforeSend: function () {
                        $(fileItem).hide();
                    },
                    success: function (response) {
                        if (response.ok) {
                            iziToast.success({
                                title: 'Success',
                                message : response.message,
                                position: 'topRight',
                                timeout: 1500,
                            });

                            $(fileItem).remove();
                        } else {
                            iziToast.error({
                                title: 'Failed',
                                message : response.message,
                                position: 'topRight',
                                timeout: 1500,
                                displayMode: 2,
                            });

                            $(fileItem).show();
                        }
                    },
                    error: function (xhr, status, error) {
                        iziToast.error({
                            title: 'Failed',
                            message : error,
                            position: 'topRight',
                            timeout: 1500,
                            displayMode: 2,
                        });

                        $(fileItem).show();
                    },
                })
            })
        });

        let filesArray = [];

        // Saat file dipilih
        $('.inputFiles').on('change', function (e) {
            filesArray = Array.from(e.target.files); // Simpan file dalam array
            renderFileList();
        });

        // Fungsi untuk render daftar file
        function renderFileList() {
            $('.uploaded-file').remove(); // Kosongkan daftar
            filesArray.forEach((file, index) => {
                $('#fileList').append(
                    `<div class="file-item uploaded-file">
                        <span>${file.name}</span>
                        <button type="button" data-type="delete-file" data-index="${index}" class="btn btn-sm">
                            <i class="bx bx-trash text-danger fs-2"></i>
                        </button>
                    </div>`
                );
            });

            updateInputFiles(); // Perbarui file input
        }

        // Hapus file tertentu dari daftar
        $(document).on('click', 'button[data-type="delete-file"]', function () {
            const fileIndex = $(this).data('index');
            filesArray.splice(fileIndex, 1); // Hapus file dari array
            renderFileList();
        });

        // Perbarui input file dengan file yang tersisa di array
        function updateInputFiles() {
            const dataTransfer = new DataTransfer(); // Membuat DataTransfer baru
            filesArray.forEach((file) => {
                dataTransfer.items.add(file); // Tambahkan file ke DataTransfer
            });
            $('.inputFiles')[0].files = dataTransfer.files; // Perbarui input file
        }
    </script>
@endpush
