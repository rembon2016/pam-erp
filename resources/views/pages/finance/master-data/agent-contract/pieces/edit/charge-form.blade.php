<div class="row">
    <div class="col-12">
        <div class="mb-10">

            <div
                class="d-flex align-items-center mb-1 ps-3">
                <h4 class="my-5 mx-3">Charge Details</h4>
                <div class="ms-5">
                    <button type="button"
                        id="add_charge_{{ $index + 1 }}"
                        class="addCharges btn btn-icon btn-success rounded" style="height: 30px; width: 30px;">
                        <i class="fa fa-plus pe-0"></i>
                    </button>
                    <button type="button"
                        id="remove_charge_{{ $index + 1 }}"
                        class="removeCharges btn btn-icon btn-warning rounded" style="height: 30px; width: 30px;"
                        disabled>
                        <i class="fa fa-minus pe-0"></i>
                    </button>
                </div>
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
                            <div class="tableChargeForm-box text-center" style="display: none;">
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
                            {{-- <div class="tableChargeForm-box text-center" style="min-width: 130px;">
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
                            </div> --}}
                            <div class="tableChargeForm-box text-center" style="min-width: 130px;">
                                <span class="tableChargeForm-heading-text">
                                    20 FT
                                </span>
                            </div>
                            <div class="tableChargeForm-box text-center" style="min-width: 130px;">
                                <span class="tableChargeForm-heading-text">
                                    20 FT GOH
                                </span>
                            </div>
                            <div class="tableChargeForm-box text-center" style="min-width: 130px;">
                                <span class="tableChargeForm-heading-text">
                                    40 FT
                                </span>
                            </div>
                            <div class="tableChargeForm-box text-center" style="min-width: 130px;">
                                <span class="tableChargeForm-heading-text">
                                    40 FT GOH
                                </span>
                            </div>
                            <div class="tableChargeForm-box text-center" style="min-width: 130px;">
                                <span class="tableChargeForm-heading-text">
                                    40 FT HC
                                </span>
                            </div>
                            <div class="tableChargeForm-box text-center" style="min-width: 130px;">
                                <span class="tableChargeForm-heading-text">
                                    40 FT HC GOH
                                </span>
                            </div>
                            <div class="tableChargeForm-box text-center" style="min-width: 130px;">
                                <span class="tableChargeForm-heading-text">
                                    45 FT
                                </span>
                            </div>
                            <div class="tableChargeForm-box text-center" style="min-width: 130px;">
                                <span class="tableChargeForm-heading-text">
                                    45 FT GOH
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
                        </div>
                        <div class="tableChargeForm-body">
                            @foreach($service->contractAgentCharge as $chargeIndex => $chargeValue)
                                <div class="chargeTableItemRow_{{ $chargeIndex + 1 }} tableChargeForm-body-row flex-column">
                                    <div class="d-flex flex-row p-0">
                                        <div class="tableChargeForm-box trigger-show-detail" style="min-width: 80px;">
                                            <input
                                                type="text"
                                                class="form-control"
                                                value="{{ $chargeIndex + 1 }}  ↓"
                                                style=""
                                                readonly>
                                            <input type="hidden" name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][contract_agent_charge_id]" value="{{ $chargeValue->id }}">
                                        </div>
                                        <div class="tableChargeForm-box" style="min-width: 170px;">
                                            <select
                                                name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][charge_id]"
                                                class="form-select chargeIdClass"
                                                id="charge_id_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                style="width: 100%;">
                                                <option value="" selected hidden>
                                                    Charge
                                                </option>
                                                @foreach ($charges as $charge)
                                                    <option
                                                        value="{{ $charge->id }}"
                                                        data-charge-name="{{ $charge->charge_name }}"
                                                        data-unit-code="{{ $charge->unit?->unit_name }}"
                                                        @selected($chargeValue->charge_id == $charge->id)>
                                                        {{ $charge->charge_code }}
                                                    </option>
                                                @endforeach
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
                                                readonly>
                                        </div>
                                        <div class="tableChargeForm-box" style="min-width: 115px;">
                                            <select
                                                name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][c_r_n]"
                                                class="form-select"
                                                style="width: 100%;">
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
                                                style="width: 100%;">
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
                                        <div class="tableChargeForm-box" style="display: none;">
                                            <select
                                                name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][unit_id]"
                                                id="unit_id_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                class="form-select"
                                                style="width: 100%;">
                                                <option value="" @selected(!in_array($chargeValue->unit_id, $units->pluck('unit_id')->toArray())) hidden>
                                                    Unit
                                                </option>
                                                @foreach($units as $unit)
                                                    <option
                                                        value="{{ $unit->unit_id }}"
                                                        data-unit-code="{{ $unit->unit_name }}"
                                                        @selected($chargeValue->unit_id == $unit->unit_id)>
                                                        {{ $unit->description." ({$unit->unit_name})" }}
                                                    </option>
                                                @endforeach
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
                                                @disabled($chargeValue?->unit?->unit_name == 'KG')>
                                        </div>
                                        <div class="tableChargeForm-box" style="min-width: 130px;">
                                            <input
                                                type="text"
                                                class="form-control"
                                                id="minimum_amount_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][minimum_amount]"
                                                value="{{ $chargeValue->minimum_amount }}"
                                                style="width: 100%;"
                                                @if($chargeValue?->unit?->unit_name == 'CONTAINER')
                                                    disabled
                                                @elseif($chargeValue?->unit?->unit_name == 'KG')
                                                    disabled
                                                @endif>
                                        </div>
                                        <div class="tableChargeForm-box">
                                            <input
                                                type="text"
                                                class="form-control"
                                                id="via_port_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][via_port]"
                                                style="width: 100%;"
                                                value="{{ $chargeValue->via_port }}"
                                                @if($chargeValue?->unit?->unit_name == 'KG')
                                                    disabled
                                                @elseif($chargeValue?->unit?->unit_name == 'SHIPMENT')
                                                    disabled
                                                @endif>
                                        </div>
                                        {{-- <div class="tableChargeForm-box" style="min-width: 130px;">
                                            <input
                                                type="text"
                                                class="form-control unitKilogramField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][from_0_to_44]"
                                                value="{{ $chargeValue->from_0_to_44 == 0 ? '' : $chargeValue->from_0_to_44 }}"
                                                style="width: 100%;"
                                                @if($chargeValue?->unit?->unit_name != 'KG')
                                                    disabled
                                                @endif>
                                        </div>
                                        <div class="tableChargeForm-box" style="min-width: 135px;">
                                            <input
                                                type="text"
                                                class="form-control unitKilogramField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][from_45_to_99]"
                                                value="{{ $chargeValue->from_45_to_99 == 0 ? '' : $chargeValue->from_45_to_99 }}"
                                                style="width: 100%;"
                                                @if($chargeValue?->unit?->unit_name != 'KG')
                                                    disabled
                                                @endif>
                                        </div>
                                        <div class="tableChargeForm-box" style="min-width: 145px;">
                                            <input
                                                type="text"
                                                class="form-control unitKilogramField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][from_100_to_299]"
                                                value="{{ $chargeValue->from_100_to_299 == 0 ? '' : $chargeValue->from_100_to_299 }}"
                                                style="width: 100%;"
                                                @if($chargeValue?->unit?->unit_name != 'KG')
                                                    disabled
                                                @endif>
                                        </div>
                                        <div class="tableChargeForm-box" style="min-width: 150px;">
                                            <input
                                                type="text"
                                                class="form-control unitKilogramField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][from_300_to_499]"
                                                value="{{ $chargeValue->from_300_to_499 == 0 ? '' : $chargeValue->from_300_to_499 }}"
                                                style="width: 100%;"
                                                @if($chargeValue?->unit?->unit_name != 'KG')
                                                    disabled
                                                @endif>
                                        </div>
                                        <div class="tableChargeForm-box" style="min-width: 150px;">
                                            <input
                                                type="text"
                                                class="form-control unitKilogramField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][from_500_to_999]"
                                                value="{{ $chargeValue->from_500_to_999 == 0 ? '' : $chargeValue->from_500_to_999 }}"
                                                style="width: 100%;"
                                                @if($chargeValue?->unit?->unit_name != 'KG')
                                                    disabled
                                                @endif>
                                        </div>
                                        <div class="tableChargeForm-box" style="min-width: 145px;">
                                            <input
                                                type="text"
                                                class="form-control unitKilogramField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][from_1000_to_infinity]"
                                                value="{{ $chargeValue->from_1000_to_infinity == 0 ? '' : $chargeValue->from_1000_to_infinity }}"
                                                style="width: 100%;"
                                                @if($chargeValue?->unit?->unit_name != 'KG')
                                                    disabled
                                                @endif>
                                        </div> --}}
                                        <div class="tableChargeForm-box" style="min-width: 130px;">
                                            <input
                                                type="text"
                                                class="form-control unitContainerField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][20_feet]"
                                                value="{{ $chargeValue->twenty_feet == 0 ? '' : $chargeValue->twenty_feet  }}"
                                                style="width: 100%;"
                                                @if($chargeValue?->unit?->unit_name != 'CONTAINER')
                                                    disabled
                                                @endif>
                                        </div>
                                        <div class="tableChargeForm-box" style="min-width: 130px;">
                                            <input
                                                type="text"
                                                class="form-control unitContainerField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][20_feet_goh]"
                                                value="{{ $chargeValue->twenty_feet_goh == 0 ? '' : $chargeValue->twenty_feet_goh  }}"
                                                style="width: 100%;"
                                                @if($chargeValue?->unit?->unit_name != 'CONTAINER')
                                                    disabled
                                                @endif>
                                        </div>
                                        <div class="tableChargeForm-box" style="min-width: 130px;">
                                            <input
                                                type="text"
                                                class="form-control unitContainerField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][40_feet]"
                                                value="{{ $chargeValue->forty_feet == 0 ? '' : $chargeValue->forty_feet }}"
                                                style="width: 100%;"
                                                @if($chargeValue?->unit?->unit_name != 'CONTAINER')
                                                    disabled
                                                @endif>
                                        </div>
                                        <div class="tableChargeForm-box" style="min-width: 130px;">
                                            <input
                                                type="text"
                                                class="form-control unitContainerField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][40_feet_goh]"
                                                value="{{ $chargeValue->forty_feet_goh == 0 ? '' : $chargeValue->forty_feet_goh }}"
                                                style="width: 100%;"
                                                @if($chargeValue?->unit?->unit_name != 'CONTAINER')
                                                    disabled
                                                @endif>
                                        </div>
                                        <div class="tableChargeForm-box" style="min-width: 130px;">
                                            <input
                                                type="text"
                                                class="form-control unitContainerField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][40_feet_hc]"
                                                value="{{ $chargeValue->forty_feet_hc == 0 ? '' : $chargeValue->forty_feet_hc }}"
                                                style="width: 100%;"
                                                @if($chargeValue?->unit?->unit_name != 'CONTAINER')
                                                    disabled
                                                @endif>
                                        </div>
                                        <div class="tableChargeForm-box" style="min-width: 130px;">
                                            <input
                                                type="text"
                                                class="form-control unitContainerField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][40_feet_hc_goh]"
                                                value="{{ $chargeValue->forty_feet_hc_goh == 0 ? '' : $chargeValue->forty_feet_hc_goh }}"
                                                style="width: 100%;"
                                                @if($chargeValue?->unit?->unit_name != 'CONTAINER')
                                                    disabled
                                                @endif>
                                        </div>
                                        <div class="tableChargeForm-box" style="min-width: 130px;">
                                            <input
                                                type="text"
                                                class="form-control unitContainerField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][45_feet]"
                                                value="{{ $chargeValue->forty_five_feet == 0 ? '' : $chargeValue->forty_five_feet }}"
                                                style="width: 100%;"
                                                @if($chargeValue?->unit?->unit_name != 'CONTAINER')
                                                    disabled
                                                @endif>
                                        </div>
                                        <div class="tableChargeForm-box" style="min-width: 130px;">
                                            <input
                                                type="text"
                                                class="form-control unitContainerField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                                name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][45_feet_goh]"
                                                value="{{ $chargeValue->forty_five_feet_goh == 0 ? '' : $chargeValue->forty_five_feet_goh }}"
                                                style="width: 100%;"
                                                @if($chargeValue?->unit?->unit_name != 'CONTAINER')
                                                    disabled
                                                @endif>
                                        </div>
                                        <div class="tableChargeForm-box" style="min-width: 110px;">
                                            <select
                                                name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][pp_cc]"
                                                class="form-select"
                                                style="width: 100%;">
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
                                                style="width: 100%;">
                                                <option value="" selected hidden>
                                                    Routed
                                                </option>
                                                @foreach ($routedTransits as $data)
                                                    <option
                                                        value="{{ $data['value'] }}"
                                                        @selected($chargeValue->routed == $data['value'])>
                                                        {{ $data['label'] }}
                                                    </option>
                                                @endforeach
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
                                                @disabled(is_null($chargeValue->manual_input_routed))>
                                        </div>
                                        <div class="tableChargeForm-box" style="min-width: 120px;">
                                            <select
                                                name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][imco]"
                                                class="form-select"
                                                style="width: 100%;">
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
                                                style="width: 100%;">
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
                                                style="width: 100%;">
                                        </div>
                                    </div>

                                    @include('pages.finance.master-data.agent-contract.pieces.edit.charge-detail-form')
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
