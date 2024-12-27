{{-- New Form without Table --}}
<div class="tableServiceForm accordion">
    <div class="tableServiceForm-content">
        <div class="tableServiceForm-heading">
            <div class="text-center tableServiceForm-box" style="min-width: 80px;">
                <span class="tableServiceForm-heading-text">
                    #
                </span>
            </div>
            <div class="text-center tableServiceForm-box" style="min-width: 130px;">
                <span class="tableServiceForm-heading-text">
                    Service
                </span>
            </div>
            <div class="text-center tableServiceForm-box">
                <span class="tableServiceForm-heading-text">
                    POR Country
                </span>
            </div>
            <div class="text-center tableServiceForm-box">
                <span class="tableServiceForm-heading-text">
                    POR Port
                </span>
            </div>
            <div class="text-center tableServiceForm-box">
                <span class="tableServiceForm-heading-text">
                    FDC Country
                </span>
            </div>
            <div class="text-center tableServiceForm-box">
                <span class="tableServiceForm-heading-text">
                    FDC Port
                </span>
            </div>
            <div class="text-center tableServiceForm-box">
                <span class="tableServiceForm-heading-text">
                    TOS
                </span>
            </div>
            <div class="text-center tableServiceForm-box">
                <span class="tableServiceForm-heading-text">
                    TOS Name
                </span>
            </div>
            <div class="text-center tableServiceForm-box" style="min-width: 150px">
                <span class="tableServiceForm-heading-text">
                    Transit
                </span>
            </div>
            <div class="text-center tableServiceForm-box">
                <span class="tableServiceForm-heading-text">
                    Manual Input Transit
                </span>
            </div>
            <div class="text-center tableServiceForm-box">
                <span class="tableServiceForm-heading-text">
                    Carrier
                </span>
            </div>
            <div class="text-center tableServiceForm-box">
                <span class="tableServiceForm-heading-text">
                    Carrier Name
                </span>
            </div>
            <div class="text-center tableServiceForm-box">
                <span class="tableServiceForm-heading-text">
                    Party
                </span>
            </div>
            <div class="text-center tableServiceForm-box">
                <span class="tableServiceForm-heading-text">
                    Service Notes
                </span>
            </div>
        </div>
        <div class="tableServiceForm-body">
            @foreach (@$agent_contract->serviceContract as $index => $service)
                <div class="serviceTableRow">
                    <div class="tableServiceForm-body-row">
                        <div class="accordion-toggle tableServiceForm-box" data-bs-toggle="collapse" data-bs-target="#r{{ $index + 1 }}" aria-expanded="true" style="min-width: 80px;">
                            <input type="text" value="{{ $index + 1 }} ↓" class="form-control" style="width: 100%;" disabled>
                        </div>
                        <div class="tableServiceForm-box" style="min-width: 130px;">
                            <select
                                name="service_data[{{ $index }}][service]"
                                class="form-select serviceList"
                                id="service_id_{{ $index + 1 }}"
                                style="min-width: 100%;"
                                disabled>
                                <option value="" selected hidden>
                                    {{ Str::replace('_', ' ', Str::upper($service->serviceType?->service_name)) }}
                                </option>
                            </select>
                        </div>
                        <div class="tableServiceForm-box">
                            <select
                                name="service_data[{{ $index }}][por_country]"
                                class="form-select selectLists countryList"
                                id="por_country_id_{{ $index + 1 }}"
                                data-placeholder="Select an option"
                                style="min-width: 100%;"
                                disabled>
                                <option value="" selected hidden>
                                    {{ $service->porCountry?->country_name }}
                                </option>
                            </select>
                        </div>
                        <div class="tableServiceForm-box">
                            <select
                                name="service_data[{{ $index }}][por_port]"
                                class="form-select selectLists"
                                id="por_port_id_{{ $index + 1 }}"
                                data-placeholder="Select an option"
                                style="min-width: 100%;"
                                disabled>
                                    <option value="">
                                        {{ $service->porPort?->port_code.'-'.$service->porPort->port_name }}
                                    </option>
                            </select>
                        </div>
                        <div class="tableServiceForm-box">
                            <select
                                name="service_data[{{ $index }}][fdc_country]"
                                class="form-select selectLists countryList"
                                id="fdc_country_id_{{ $index + 1 }}"
                                data-placeholder="Select an option"
                                style="min-width: 100%;"
                                disabled>
                                <option value="" selected hidden>
                                    {{ $service->fdcCountry?->country_name }}
                                </option>
                            </select>
                        </div>
                        <div class="tableServiceForm-box">
                            <select
                                name="service_data[{{ $index }}][fdc_port]"
                                class="form-select selectLists"
                                id="fdc_port_id_{{ $index + 1 }}"
                                data-placeholder="Select an option"
                                style="min-width: 100%;"
                                disabled>
                                <option value="" selected hidden>
                                    {{ $service->fdcPort?->port_code.'-'.$service->fdcPort->port_name }}
                                </option>
                            </select>
                        </div>
                        <div class="tableServiceForm-box">
                            <input
                                type="text"
                                name="service_data[{{ $index }}][tos]"
                                class="form-control"
                                value="{{ $service->tos }}"
                                style="min-width: 100%;"
                                disabled>
                        </div>
                        <div class="tableServiceForm-box">
                            <input
                                type="text"
                                name="service_data[{{ $index }}][tos_name]"
                                class="form-control"
                                value="{{ $service->tos_name }}"
                                style="min-width: 100%;"
                                disabled>
                        </div>
                        <div class="tableServiceForm-box" style="min-width: 150px">
                            <select
                                name="service_data[{{ $index }}][transit]"
                                class="form-select selectTransit"
                                id="select_transit_{{ $index + 1 }}"
                                style="min-width: 100%;"
                                disabled>
                                <option value="" selected hidden>
                                    {{ $service->transit_via }}
                                </option>
                            </select>
                        </div>
                        <div class="tableServiceForm-box">
                            <input
                                type="text"
                                name="service_data[{{ $index }}][manual_input_transit]"
                                class="form-control"
                                id="input_transit_{{ $index + 1 }}"
                                value="{{ $service->manual_input_transit }}"
                                style="min-width: 100%;"
                                disabled>
                        </div>
                        <div class="tableServiceForm-box">
                            <select
                                name="service_data[{{ $index }}][carrier_id]"
                                class="form-select selectLists carrierList"
                                id="carrier_id_{{ $index + 1 }}"
                                data-placeholder="Select an option"
                                style="min-width: 100%;"
                                disabled>
                                <option value="" selected hidden>
                                    {{ $service->carrier?->carrier_code.'-'.$service->carrier?->carrier_name }}
                                </option>
                            </select>
                        </div>
                        <div class="tableServiceForm-box">
                            <input
                                type="text"
                                name="service_data[{{ $index }}][carrier_name]"
                                class="form-control"
                                value="{{ $service->carrier?->carrier_name }}"
                                id="carrier_name_{{ $index + 1 }}"
                                style="min-width: 100%;"
                                disabled>
                        </div>
                        <div class="tableServiceForm-box">
                            <input
                                type="text"
                                name="service_data[{{ $index }}][party]"
                                class="form-control"
                                value="{{ $service->party }}"
                                style="min-width: 100%;"
                                disabled>
                        </div>
                        <div class="tableServiceForm-box">
                            <input
                                type="text"
                                name="service_data[{{ $index }}][service_note]"
                                class="form-control"
                                value="{{ $service->notes }}"
                                style="min-width: 100%;"
                                disabled>
                        </div>
                    </div>
                    <div class="collapse accordion-collapse chargeTableRow show" id="r{{ $index + 1 }}" data-bs-parent=".tableServiceForm">
                        <div class="row">
                            <div class="col-12">
                                <div class="mb-10">

                                    <div
                                        class="d-flex align-items-center mb-1 ps-3">
                                        <h4 class="my-5 mx-3">Charge Details</h4>
                                    </div>

                                    <div class="row">
                                        <div class="col-12">

                                            <div class="table tableChargeForm">
                                                <div class="tableChargeForm-heading">
                                                    <div class="tableChargeForm-box text-center" style="min-width: 80px !important;">
                                                        <span class="tableChargeForm-heading-text">
                                                            #
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center" style="min-width: 170px;">
                                                        <span class="tableChargeForm-heading-text">
                                                            Charge
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center">
                                                        <span class="tableChargeForm-heading-text">
                                                            Charge Name
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center" style="min-width: 115px;">
                                                        <span class="tableChargeForm-heading-text">
                                                            C/R/N
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center" style="min-width: 100px;">
                                                        <span class="tableChargeForm-heading-text">
                                                            Currency
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center">
                                                        <span class="tableChargeForm-heading-text">
                                                            Unit
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center" style="min-width: 130px;">
                                                        <span class="tableChargeForm-heading-text">
                                                            Amount per Unit
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center" style="min-width: 130px;">
                                                        <span class="tableChargeForm-heading-text">
                                                            Minimum Amount
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center">
                                                        <span class="tableChargeForm-heading-text">
                                                            Via Port
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center" style="min-width: 130px;">
                                                        <span class="tableChargeForm-heading-text">
                                                            From (0) - To (44)
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center" style="min-width: 135px;">
                                                        <span class="tableChargeForm-heading-text">
                                                            From (45) - To (99)
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center" style="min-width: 145px;">
                                                        <span class="tableChargeForm-heading-text">
                                                            From (100) - To (299)
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center" style="min-width: 150px;">
                                                        <span class="tableChargeForm-heading-text">
                                                            From (300) - To (499)
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center" style="min-width: 150px;">
                                                        <span class="tableChargeForm-heading-text">
                                                            From (500) - To (999)
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center" style="min-width: 145px;">
                                                        <span class="tableChargeForm-heading-text">
                                                            From (1000) - To (∞)
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center" style="min-width: 130px;">
                                                        <span class="tableChargeForm-heading-text">
                                                            20°
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center" style="min-width: 130px;">
                                                        <span class="tableChargeForm-heading-text">
                                                            40°
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center" style="min-width: 130px;">
                                                        <span class="tableChargeForm-heading-text">
                                                            45° HC
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center" style="min-width: 130px;">
                                                        <span class="tableChargeForm-heading-text">
                                                            45°
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center" style="min-width: 130px;">
                                                        <span class="tableChargeForm-heading-text">
                                                            POR
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center" style="min-width: 130px;">
                                                        <span class="tableChargeForm-heading-text">
                                                            FDC
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center" style="min-width: 110px;">
                                                        <span class="tableChargeForm-heading-text">
                                                            PP/CC
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center" style="min-width: 150px;">
                                                        <span class="tableChargeForm-heading-text">
                                                            Routed
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center">
                                                        <span class="tableChargeForm-heading-text">
                                                            Manual Input Routed
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center" style="min-width: 120px;">
                                                        <span class="tableChargeForm-heading-text">
                                                            IMCO
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center" style="min-width: 120px;">
                                                        <span class="tableChargeForm-heading-text">
                                                            Loading Bay
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center">
                                                        <span class="tableChargeForm-heading-text">
                                                            Commodity
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center" style="min-width: 150px;">
                                                        <span class="tableChargeForm-heading-text">
                                                            Valid from Date
                                                        </span>
                                                    </div>
                                                    <div class="tableChargeForm-box text-center" style="min-width: 150px;">
                                                        <span class="tableChargeForm-heading-text">
                                                            Valid to Date
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="tableChargeForm-body">
                                                    @foreach($service->contractAgentCharge as $chargeIndex => $chargeValue)
                                                        <div class="chargeTableItemRow_{{ $chargeIndex + 1 }} tableChargeForm-body-row flex-column">
                                                            <div class="d-flex flex-row p-0">
                                                                <div class="tableChargeForm-box" style="min-width: 80px;">
                                                                    <input
                                                                        type="text"
                                                                        class="form-control"
                                                                        value="{{ $chargeIndex + 1 }} ↓"
                                                                        style=""
                                                                        disabled>
                                                                </div>
                                                                <div class="tableChargeForm-box" style="min-width: 170px;">
                                                                    <select
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][charge_id]"
                                                                        class="form-select chargeIdClass"
                                                                        id="charge_id_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                                        style="width: 100%;" disabled>
                                                                        <option value="" selected hidden>
                                                                            {{ $chargeValue->charge_name }}
                                                                        </option>
                                                                    </select>
                                                                </div>
                                                                <div class="tableChargeForm-box">
                                                                    <input
                                                                        type="text"
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][charge_name]"
                                                                        class="form-control"
                                                                        value="{{ $chargeValue->charge_name }}"
                                                                        id="charge_name_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                                        style="width: 100%;"
                                                                        disabled>
                                                                </div>
                                                                <div class="tableChargeForm-box" style="min-width: 115px;">
                                                                    <select
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][c_r_n]"
                                                                        class="form-select"
                                                                        style="width: 100%;" disabled>
                                                                        <option value="" selected hidden>
                                                                            C/R/N
                                                                        </option>
                                                                        <option value="cost" @selected($chargeValue->crn == 'cost')>
                                                                            Cost
                                                                        </option>
                                                                        <option value="R" @selected($chargeValue->crn == 'R')>
                                                                            R
                                                                        </option>
                                                                        <option value="N" @selected($chargeValue->crn == 'N')>
                                                                            N
                                                                        </option>
                                                                    </select>
                                                                </div>
                                                                <div class="tableChargeForm-box" style="min-width: 100px;">
                                                                    <select
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][currency]"
                                                                        id="currency_id_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                                        class="form-select"
                                                                        style="width: 100%;" disabled>
                                                                        <option value="" @selected(!in_array($chargeValue->currency_id, $currencies->pluck('id')->toArray())) hidden>
                                                                            Currency
                                                                        </option>
                                                                        @foreach ($currencies as $currency)
                                                                            <option value="{{ $currency->id }}" @selected($chargeValue->currency_id == $currency->id)>
                                                                                {{ $currency->currency_name }}
                                                                            </option>
                                                                        @endforeach
                                                                    </select>
                                                                </div>
                                                                <div class="tableChargeForm-box">
                                                                    <select
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][unit_id]"
                                                                        id="unit_id_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                                        class="form-select"
                                                                        style="width: 100%;" disabled>
                                                                        <option value="{{ $chargeValue?->unit?->unit_name }}" selected hidden>
                                                                            {{ $chargeValue?->unit?->description." ({$chargeValue?->unit?->unit_name})" }}
                                                                        </option>
                                                                    </select>
                                                                </div>
                                                                <div class="tableChargeForm-box" style="min-width: 130px;">
                                                                    <input
                                                                        type="text"
                                                                        class="form-control"
                                                                        id="amount_per_unit_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][amount_per_unit]"
                                                                        value="{{ $chargeValue->amount_per_unit }}"
                                                                        style="width: 100%;"
                                                                        disabled>
                                                                </div>
                                                                <div class="tableChargeForm-box" style="min-width: 130px;">
                                                                    <input
                                                                        type="text"
                                                                        class="form-control"
                                                                        id="minimum_amount_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][minimum_amount]"
                                                                        value="{{ $chargeValue->minimum_amount }}"
                                                                        style="width: 100%;"
                                                                        disabled>
                                                                </div>
                                                                <div class="tableChargeForm-box">
                                                                    <input
                                                                        type="text"
                                                                        class="form-control"
                                                                        id="via_port_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][via_port]"
                                                                        style="width: 100%;"
                                                                        value="{{ $chargeValue->via_port }}"
                                                                        disabled>
                                                                </div>
                                                                <div class="tableChargeForm-box" style="min-width: 130px;">
                                                                    <input
                                                                        type="text"
                                                                        class="form-control unitKilogramField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][from_0_to_44]"
                                                                        value="{{ $chargeValue->from_0_to_44 == 0 ? '' : $chargeValue->from_0_to_44 }}"
                                                                        style="width: 100%;"
                                                                        disabled>
                                                                </div>
                                                                <div class="tableChargeForm-box" style="min-width: 135px;">
                                                                    <input
                                                                        type="text"
                                                                        class="form-control unitKilogramField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][from_45_to_99]"
                                                                        value="{{ $chargeValue->from_45_to_99 == 0 ? '' : $chargeValue->from_45_to_99 }}"
                                                                        style="width: 100%;"
                                                                        disabled>
                                                                </div>
                                                                <div class="tableChargeForm-box" style="min-width: 145px;">
                                                                    <input
                                                                        type="text"
                                                                        class="form-control unitKilogramField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][from_100_to_299]"
                                                                        value="{{ $chargeValue->from_100_to_299 == 0 ? '' : $chargeValue->from_100_to_299 }}"
                                                                        style="width: 100%;"
                                                                        disabled>
                                                                </div>
                                                                <div class="tableChargeForm-box" style="min-width: 150px;">
                                                                    <input
                                                                        type="text"
                                                                        class="form-control unitKilogramField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][from_300_to_499]"
                                                                        value="{{ $chargeValue->from_300_to_499 == 0 ? '' : $chargeValue->from_300_to_499 }}"
                                                                        style="width: 100%;"
                                                                        disabled>
                                                                </div>
                                                                <div class="tableChargeForm-box" style="min-width: 150px;">
                                                                    <input
                                                                        type="text"
                                                                        class="form-control unitKilogramField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][from_500_to_999]"
                                                                        value="{{ $chargeValue->from_500_to_999 == 0 ? '' : $chargeValue->from_500_to_999 }}"
                                                                        style="width: 100%;"
                                                                        disabled>
                                                                </div>
                                                                <div class="tableChargeForm-box" style="min-width: 145px;">
                                                                    <input
                                                                        type="text"
                                                                        class="form-control unitKilogramField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][from_1000_to_infinity]"
                                                                        value="{{ $chargeValue->from_1000_to_infinity == 0 ? '' : $chargeValue->from_1000_to_infinity }}"
                                                                        style="width: 100%;"
                                                                        disabled>
                                                                </div>
                                                                <div class="tableChargeForm-box" style="min-width: 130px;">
                                                                    <input
                                                                        type="text"
                                                                        class="form-control unitContainerField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][20_feet]"
                                                                        value="{{ $chargeValue->twenty_feet == 0 ? '' : $chargeValue->twenty_feet  }}"
                                                                        style="width: 100%;"
                                                                        disabled>
                                                                </div>
                                                                <div class="tableChargeForm-box" style="min-width: 130px;">
                                                                    <input
                                                                        type="text"
                                                                        class="form-control unitContainerField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][40_feet]"
                                                                        value="{{ $chargeValue->forty_feet == 0 ? '' : $chargeValue->forty_feet }}"
                                                                        style="width: 100%;"
                                                                        disabled>
                                                                </div>
                                                                <div class="tableChargeForm-box" style="min-width: 130px;">
                                                                    <input
                                                                        type="text"
                                                                        class="form-control unitContainerField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][45_feet_hc]"
                                                                        value="{{ $chargeValue->forty_five_feet_hc == 0 ? '' : $chargeValue->forty_five_feet_hc }}"
                                                                        style="width: 100%;"
                                                                        disabled>
                                                                </div>
                                                                <div class="tableChargeForm-box" style="min-width: 130px;">
                                                                    <input
                                                                        type="text"
                                                                        class="form-control unitContainerField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][45_feet]"
                                                                        value="{{ $chargeValue->forty_five_feet == 0 ? '' : $chargeValue->forty_five_feet }}"
                                                                        style="width: 100%;"
                                                                        disabled>
                                                                </div>
                                                                <div class="tableChargeForm-box" style="min-width: 130px;">
                                                                    <input
                                                                        type="text"
                                                                        class="form-control"
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][por]"
                                                                        value="{{ $chargeValue->por }}"
                                                                        style="width: 100%;" disabled>
                                                                </div>
                                                                <div class="tableChargeForm-box" style="min-width: 130px;">
                                                                    <input
                                                                        type="text"
                                                                        class="form-control"
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][fdc]"
                                                                        value="{{ $chargeValue->fdc }}"
                                                                        style="width: 100%;" disabled>
                                                                </div>
                                                                <div class="tableChargeForm-box" style="min-width: 110px;">
                                                                    <select
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][pp_cc]"
                                                                        class="form-select"
                                                                        style="width: 100%;" disabled>
                                                                        <option value="" selected hidden>
                                                                            PP/CC
                                                                        </option>
                                                                        <option value="KG" @selected($chargeValue->pp_cc == 'KG')>
                                                                            KG
                                                                        </option>
                                                                        <option value="SHIPMENT" @selected($chargeValue->pp_cc == 'SHIPMENT')>
                                                                            SHIPMENT
                                                                        </option>
                                                                        <option value="CONTAINER" @selected($chargeValue->pp_cc == 'CONTAINER')>
                                                                            CONTAINER
                                                                        </option>
                                                                    </select>
                                                                </div>
                                                                <div class="tableChargeForm-box" style="min-width: 150px;">
                                                                    <select
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][routed]"
                                                                        class="form-select selectRouted"
                                                                        id="select_routed_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                                        style="width: 100%;" disabled>
                                                                        <option value="" selected hidden>
                                                                            {{ $chargeValue->routed }}
                                                                        </option>
                                                                    </select>
                                                                </div>
                                                                <div class="tableChargeForm-box">
                                                                    <input
                                                                        type="text"
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][manual_input_routed]"
                                                                        class="form-control"
                                                                        id="input_routed_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                                        value="{{ $chargeValue->manual_input_routed }}"
                                                                        style="width: 100%;"
                                                                        disabled>
                                                                </div>
                                                                <div class="tableChargeForm-box" style="min-width: 120px;">
                                                                    <select
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][imco]"
                                                                        class="form-select"
                                                                        style="width: 100%;" disabled>
                                                                        <option value="" selected hidden>
                                                                            IMCO
                                                                        </option>
                                                                        <option value="KG" @selected($chargeValue->imco == 'KG')>
                                                                            KG
                                                                        </option>
                                                                        <option value="SHIPMENT" @selected($chargeValue->imco == 'SHIPMENT')>
                                                                            SHIPMENT
                                                                        </option>
                                                                        <option value="CONTAINER" @selected($chargeValue->imco == 'CONTAINER')>
                                                                            CONTAINER
                                                                        </option>
                                                                    </select>
                                                                </div>
                                                                <div class="tableChargeForm-box" style="min-width: 120px;">
                                                                    <select
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][loading_bay]"
                                                                        class="form-select"
                                                                        style="width: 100%;" disabled>
                                                                        <option value="" selected hidden>
                                                                            Loading Bay
                                                                        </option>
                                                                        <option value="KG" @selected($chargeValue->loading_bay == 'KG')>
                                                                            KG
                                                                        </option>
                                                                        <option value="SHIPMENT" @selected($chargeValue->loading_bay == 'SHIPMENT')>
                                                                            SHIPMENT
                                                                        </option>
                                                                        <option value="CONTAINER" @selected($chargeValue->loading_bay == 'CONTAINER')>
                                                                            CONTAINER
                                                                        </option>
                                                                    </select>
                                                                </div>
                                                                <div class="tableChargeForm-box">
                                                                    <input
                                                                        type="text"
                                                                        class="form-control"
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][commodity]"
                                                                        value="{{ $chargeValue->commodity }}"
                                                                        style="width: 100%;" disabled>
                                                                </div>
                                                                <div class="tableChargeForm-box" style="min-width: 150px;">
                                                                    <input
                                                                        type="date"
                                                                        class="form-control"
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][valid_from_date]"
                                                                        value="{{ $chargeValue->valid_from_date }}"
                                                                        style="width: 100%;" disabled>
                                                                </div>
                                                                <div class="tableChargeForm-box" style="min-width: 150px;">
                                                                    <input
                                                                        type="date"
                                                                        class="form-control"
                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][valid_to_date]"
                                                                        value="{{ $chargeValue->valid_to_date }}"
                                                                        style="width: 100%;" disabled>
                                                                </div>
                                                            </div>

                                                            @if ($chargeValue->chargeDetails->count() > 0)
                                                                <div class="tableChargeDetailContent">
                                                                    <div class="row" style="margin-left: auto; flex-basis: 100% !important; width: 100%; !important;">
                                                                        <div class="col-12">
                                                                            <div class="mb-2">
                                                                                <div class="table tableChargeDetailForm">
                                                                                    <div class="tableChargeDetailForm-heading">
                                                                                        <div class="tableChargeDetailForm-box text-center" style="min-width: 70px;">
                                                                                            <span class="tableChargeForm-heading-text">
                                                                                                #
                                                                                            </span>
                                                                                        </div>
                                                                                        <div class="tableChargeDetailForm-box text-center" style="min-width: 100px;">
                                                                                            <span class="tableChargeForm-heading-text">
                                                                                                From
                                                                                            </span>
                                                                                        </div>
                                                                                        <div class="tableChargeDetailForm-box text-center" style="min-width: 100px;">
                                                                                            <span class="tableChargeForm-heading-text">
                                                                                                To
                                                                                            </span>
                                                                                        </div>
                                                                                        <div class="tableChargeDetailForm-box text-center" style="min-width: 100px;">
                                                                                            <span class="tableChargeForm-heading-text">
                                                                                                Value
                                                                                            </span>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="tableChargeDetailForm-body">
                                                                                        @foreach ($chargeValue->chargeDetails as $detailIndex => $detailValue)
                                                                                            <div class="chargeDetailTableItemRow_{{ $detailIndex + 1 }} tableChargeDetailForm-body-row">
                                                                                                <input type="hidden" name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][charge_detail_data][{{ $detailIndex }}][contract_agent_charge_detail_id]" value="{{ $detailValue->id }}">
                                                                                                <div class="tableChargeDetailForm-box" style="min-width: 70px;">
                                                                                                    <input
                                                                                                        type="text"
                                                                                                        class="form-control"
                                                                                                        value="{{ $detailIndex + 1 }}"
                                                                                                        style=""
                                                                                                        readonly>
                                                                                                </div>
                                                                                                <div class="tableChargeDetailForm-box" style="min-width: 100px;">
                                                                                                    <input
                                                                                                        type="text"
                                                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][charge_detail_data][{{ $detailIndex }}][from]"
                                                                                                        class="form-control"
                                                                                                        value="{{ $detailValue->from }}"
                                                                                                        id="from_{{ $index + 1 }}_{{ $chargeIndex + 1 }}_{{ $detailIndex + 1 }}"
                                                                                                        style="width: 100%;" disabled>
                                                                                                </div>
                                                                                                <div class="tableChargeDetailForm-box" style="min-width: 100px;">
                                                                                                    <input
                                                                                                        type="text"
                                                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][charge_detail_data][{{ $detailIndex }}][to]"
                                                                                                        class="form-control"
                                                                                                        value="{{ $detailValue->to }}"
                                                                                                        id="to_{{ $index + 1 }}_{{ $chargeIndex + 1 }}_{{ $detailIndex + 1 }}"
                                                                                                        style="width: 100%;" disabled>
                                                                                                </div>
                                                                                                <div class="tableChargeDetailForm-box" style="min-width: 100px;">
                                                                                                    <input
                                                                                                        type="text"
                                                                                                        name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][charge_detail_data][{{ $detailIndex }}][value]"
                                                                                                        class="form-control"
                                                                                                        value="{{ $detailValue->value }}"
                                                                                                        id="value_{{ $index + 1 }}_{{ $chargeIndex + 1 }}_{{ $detailIndex + 1 }}"
                                                                                                        style="width: 100%;" disabled>
                                                                                                </div>
                                                                                            </div>
                                                                                        @endforeach
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            @endif
                                                        </div>
                                                    @endforeach
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>
