{{-- <div class="row">
    <div class="col-12">
        <div class="mb-10">

            <div
                class="d-flex align-items-center mb-5">
                <h4 class="my-5 mx-3">Charge Details</h4>
                <div class="ms-5">
                    <button type="button"
                        id="add_charge_{{$index + 1}}"
                        class="addCharges btn btn-icon btn-success rounded" style="height: 30px; width: 30px;">
                        <i class="fa fa-plus pe-0"></i>
                    </button>
                    <button type="button"
                        id="remove_charge_{{$index + 1}}"
                        class="removeCharges btn btn-icon btn-warning rounded" style="height: 30px; width: 30px;"
                        disabled>
                        <i class="fa fa-minus pe-0"></i>
                    </button>
                </div>
            </div>

            <div class="row">
                <div class="col-12">

                    <table class="table tableChargeForm">
                        <thead>
                            <tr>
                                <th style="width: 20px;" class="align-middle text-center" scope="col">#</th>
                                <th class="align-middle text-center" scope="col">Charge</th>
                                <th class="align-middle text-center" scope="col">Charge Name</th>
                                <th class="align-middle text-center" scope="col">C/R/N</th>
                                <th class="align-middle text-center" scope="col">Currency</th>
                                <th class="align-middle text-center" scope="col">Unit</th>
                                <th class="align-middle text-center" scope="col">Amount per Unit</th>
                                <th class="align-middle text-center" scope="col">Minimum Amount</th>
                                <th class="align-middle text-center" scope="col">Via Port</th>
                                <th class="align-middle text-center" scope="col">From (0) - To (44)</th>
                                <th class="align-middle text-center" scope="col">From (45) - To (99)</th>
                                <th class="align-middle text-center" scope="col">From (100) - To (299)</th>
                                <th class="align-middle text-center" scope="col">From (300) - To (499)</th>
                                <th class="align-middle text-center" scope="col">From (500) - To (999)</th>
                                <th class="align-middle text-center" scope="col">From (1000) - To (∞)</th>
                                <th class="align-middle text-center" scope="col">20°</th>
                                <th class="align-middle text-center" scope="col">40°</th>
                                <th class="align-middle text-center" scope="col">45° HC</th>
                                <th class="align-middle text-center" scope="col">45°</th>
                                <th class="align-middle text-center" scope="col">POR</th>
                                <th class="align-middle text-center" scope="col">FDC</th>
                                <th class="align-middle text-center" scope="col">PP/CC</th>
                                <th class="align-middle text-center" scope="col">Routed</th>
                                <th class="align-middle text-center" scope="col">Manual Input Routed</th>
                                <th class="align-middle text-center" scope="col">IMCO</th>
                                <th class="align-middle text-center" scope="col">Loading Bay</th>
                                <th class="align-middle text-center" scope="col">Commodity</th>
                                <th class="align-middle text-center" scope="col">Valid from Date</th>
                                <th class="align-middle text-center" scope="col">Valid to Date</th>
                            </tr>
                        </thead>
                        <tbody>

                            @foreach($service->contractAgentCharge as $chargeIndex => $chargeValue)
                                <tr class="chargeTableItemRow_{{$chargeIndex + 1}}">
                                    <td>
                                        <input
                                            type="text"
                                            class="form-control"
                                            value="{{ $chargeIndex + 1 }}"
                                            style="width: 80px;"
                                            readonly>
                                    </td>
                                    <td>
                                        <select
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][charge_id]"
                                            class="form-select chargeIdClass"
                                            id="charge_id_{{$index + 1}}_{{$chargeIndex + 1}}"
                                            style="width: 200px;">
                                            <option value="" selected hidden>
                                                Charge
                                            </option>
                                            @foreach ($charges as $charge)
                                                <option
                                                    value="{{ $charge->charge_id }}"
                                                    data-charge-name="{{ $charge->charge_name }}"
                                                    @selected($chargeValue->charge_id == $charge->charge_id)>
                                                    {{ $charge->charge_code }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </td>
                                    <td>
                                        <input
                                            type="text"
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][charge_name]"
                                            class="form-control"
                                            value="{{ $chargeValue->charge_name }}"
                                            id="charge_name_{{$index + 1}}_{{$chargeIndex + 1}}"
                                            style="width: 200px;"
                                            readonly>
                                    </td>
                                    <td>
                                        <select
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][c_r_n]"
                                            class="form-select"
                                            style="width: 200px;">
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
                                    </td>
                                    <td>
                                        <select
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][currency]"
                                            id="currency_id_{{$index + 1}}_{{$chargeIndex + 1}}"
                                            class="form-select"
                                            style="width: 200px;">
                                            <option value="" selected hidden>
                                                Currency
                                            </option>
                                            <option value="USD" @selected($chargeValue->currency == 'USD')>
                                                USD
                                            </option>
                                            <option value="IDR" @selected($chargeValue->currency == 'IDR')>
                                                IDR
                                            </option>
                                            <option value="AED" @selected($chargeValue->currency == 'AED')>
                                                AED
                                            </option>
                                        </select>
                                    </td>
                                    <td>
                                        <select
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][unit_id]"
                                            id="unit_id_{{$index + 1}}_{{$chargeIndex + 1}}"
                                            class="form-select"
                                            style="width: 200px;">
                                            <option value="" selected hidden>
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
                                    </td>
                                    <td>
                                        <input
                                            type="text"
                                            class="form-control"
                                            id="amount_per_unit_{{$index + 1}}_{{$chargeIndex + 1}}"
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][amount_per_unit]"
                                            style="width: 200px;"
                                            value="{{ $chargeValue->amount_per_unit }}"
                                            @if($chargeValue->unit->unit_name == 'KG')
                                                disabled
                                            @endif>
                                    </td>
                                    <td>
                                        <input
                                            type="text"
                                            class="form-control"
                                            id="minimum_amount_{{$index + 1}}_{{$chargeIndex + 1}}"
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][minimum_amount]"
                                            style="width: 200px;"
                                            value="{{ $chargeValue->minimum_amount }}"
                                            @if($chargeValue->unit->unit_name == 'CNTR')
                                                disabled
                                            @elseif($chargeValue->unit->unit_name == 'KG')
                                                disabled
                                            @endif>
                                    </td>
                                    <td>
                                        <input
                                            type="text"
                                            class="form-control"
                                            id="via_port_{{$index + 1}}_{{$chargeIndex + 1}}"
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][via_port]"
                                            style="width: 200px;"
                                            value="{{ $chargeValue->via_port }}"
                                            @if($chargeValue->unit->unit_name == 'KG')
                                                disabled
                                            @elseif($chargeValue->unit->unit_name == 'SHPT')
                                                disabled
                                            @endif>
                                    </td>
                                    <td>
                                        <input
                                            type="text"
                                            class="form-control unitKilogramField_{{$index + 1}}_{{$chargeIndex + 1}}"
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][from_0_to_44]"
                                            value="{{ $chargeValue->from_0_to_44 == 0 ? '' : $chargeValue->from_0_to_44 }}"
                                            style="width: 200px;"
                                            @if($chargeValue->unit->unit_name != 'KG')
                                                disabled
                                            @endif>
                                    </td>
                                    <td>
                                        <input
                                            type="text"
                                            class="form-control unitKilogramField_{{$index + 1}}_{{$chargeIndex + 1}}"
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][from_45_to_99]"
                                            value="{{ $chargeValue->from_45_to_99 == 0 ? '' : $chargeValue->from_45_to_99 }}"
                                            style="width: 200px;"
                                            @if($chargeValue->unit->unit_name != 'KG')
                                                disabled
                                            @endif>
                                    </td>
                                    <td>
                                        <input
                                            type="text"
                                            class="form-control unitKilogramField_{{$index + 1}}_{{$chargeIndex + 1}}"
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][from_100_to_299]"
                                            value="{{ $chargeValue->from_100_to_299 == 0 ? '' : $chargeValue->from_100_to_299 }}"
                                            style="width: 200px;"
                                            @if($chargeValue->unit->unit_name != 'KG')
                                                disabled
                                            @endif>
                                    </td>
                                    <td>
                                        <input
                                            type="text"
                                            class="form-control unitKilogramField_{{$index + 1}}_{{$chargeIndex + 1}}"
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][from_300_to_499]"
                                            value="{{ $chargeValue->from_300_to_499 == 0 ? '' : $chargeValue->from_300_to_499 }}"
                                            style="width: 200px;"
                                            @if($chargeValue->unit->unit_name != 'KG')
                                                disabled
                                            @endif>
                                    </td>
                                    <td>
                                        <input
                                            type="text"
                                            class="form-control unitKilogramField_{{$index + 1}}_{{$chargeIndex + 1}}"
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][from_500_to_999]"
                                            value="{{ $chargeValue->from_500_to_999 == 0 ? '' : $chargeValue->from_500_to_999 }}"
                                            style="width: 200px;"
                                            @if($chargeValue->unit->unit_name != 'KG')
                                                disabled
                                            @endif>
                                    </td>
                                    <td>
                                        <input
                                            type="text"
                                            class="form-control unitKilogramField_{{$index + 1}}_{{$chargeIndex + 1}}"
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][from_1000_to_infinity]"
                                            value="{{ $chargeValue->from_1000_to_infinity == 0 ? '' : $chargeValue->from_1000_to_infinity }}"
                                            style="width: 200px;"
                                            @if($chargeValue->unit->unit_name != 'KG')
                                                disabled
                                            @endif>
                                    </td>
                                    <td>
                                        <input
                                            type="text"
                                            class="form-control unitContainerField_{{$index + 1}}_{{$chargeIndex + 1}}"
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][20_feet]"
                                            value="{{ $chargeValue->{'20_feet'} == 0 ? '' : $chargeValue->{'20_feet'}  }}"
                                            style="width: 200px;"
                                            @if($chargeValue->unit->unit_name != 'CNTR')
                                                disabled
                                            @endif>
                                    </td>
                                    <td>
                                        <input
                                            type="text"
                                            class="form-control unitContainerField_{{$index + 1}}_{{$chargeIndex + 1}}"
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][40_feet]"
                                            value="{{ $chargeValue->{'40_feet'} == 0 ? '' : $chargeValue->{'40_feet'} }}"
                                            style="width: 200px;"
                                            @if($chargeValue->unit->unit_name != 'CNTR')
                                                disabled
                                            @endif>
                                    </td>
                                    <td>
                                        <input
                                            type="text"
                                            class="form-control unitContainerField_{{$index + 1}}_{{$chargeIndex + 1}}"
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][45_feet_hc]"
                                            value="{{ $chargeValue->{'45_feet_hc'} == 0 ? '' : $chargeValue->{'45_feet_hc'} }}"
                                            style="width: 200px;"
                                            @if($chargeValue->unit->unit_name != 'CNTR')
                                                disabled
                                            @endif>
                                    </td>
                                    <td>
                                        <input
                                            type="text"
                                            class="form-control unitContainerField_{{$index + 1}}_{{$chargeIndex + 1}}"
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][45_feet]"
                                            value="{{ $chargeValue->{'45_feet'} == 0 ? '' : $chargeValue->{'45_feet'} }}"
                                            style="width: 200px;"
                                            @if($chargeValue->unit->unit_name != 'CNTR')
                                                disabled
                                            @endif>
                                    </td>
                                    <td>
                                        <input
                                            type="text"
                                            class="form-control"
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][por]"
                                            value="{{ $chargeValue->por }}"
                                            style="width: 200px;">
                                    </td>
                                    <td>
                                        <input
                                            type="text"
                                            class="form-control"
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][fdc]"
                                            value="{{ $chargeValue->fdc }}"
                                            style="width: 200px;">
                                    </td>
                                    <td>
                                        <select
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][pp_cc]"
                                            class="form-select"
                                            style="width: 200px;">
                                            <option value="" selected hidden>
                                                PP/CC
                                            </option>
                                            <option value="KG" @selected($chargeValue->pp_cc == 'KG')>
                                                KG
                                            </option>
                                            <option value="SHPT" @selected($chargeValue->pp_cc == 'SHPT')>
                                                SHPT
                                            </option>
                                            <option value="CNTR" @selected($chargeValue->pp_cc == 'CNTR')>
                                                CNTR
                                            </option>
                                        </select>
                                    </td>
                                    <td>
                                        <select
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][routed]"
                                            class="form-select selectRouted"
                                            id="select_routed_{{$index + 1}}_{{$chargeIndex + 1}}"
                                            style="width: 200px;">
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
                                    </td>
                                    <td>
                                        <input
                                            type="text"
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][manual_input_routed]"
                                            class="form-control"
                                            id="input_routed_{{$index + 1}}_{{$chargeIndex + 1}}"
                                            value="{{ $chargeValue->manual_input_routed }}"
                                            style="width: 200px;"
                                            @if(is_null($chargeValue->manual_input_routed)) disabled @endif>
                                    </td>
                                    <td>
                                        <select
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][imco]"
                                            class="form-select"
                                            style="width: 200px;">
                                            <option value="" selected hidden>
                                                IMCO
                                            </option>
                                            <option value="KG" @selected($chargeValue->imco == 'KG')>
                                                KG
                                            </option>
                                            <option value="SHPT" @selected($chargeValue->imco == 'SHPT')>
                                                SHPT
                                            </option>
                                            <option value="CNTR" @selected($chargeValue->imco == 'CNTR')>
                                                CNTR
                                            </option>
                                        </select>
                                    </td>
                                    <td>
                                        <select
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][loading_bay]"
                                            class="form-select"
                                            style="width: 200px;">
                                            <option value="" selected hidden>
                                                Loading Bay
                                            </option>
                                            <option value="KG" @selected($chargeValue->loading_bay == 'KG')>
                                                KG
                                            </option>
                                            <option value="SHPT" @selected($chargeValue->loading_bay == 'SHPT')>
                                                SHPT
                                            </option>
                                            <option value="CNTR" @selected($chargeValue->loading_bay == 'CNTR')>
                                                CNTR
                                            </option>
                                        </select>
                                    </td>
                                    <td>
                                        <input
                                            type="text"
                                            class="form-control"
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][commodity]"
                                            value="{{ $chargeValue->commodity }}"
                                            style="width: 200px;">
                                    </td>
                                    <td>
                                        <input
                                            type="date"
                                            class="form-control"
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][valid_from_date]"
                                            value="{{ $chargeValue->valid_from_date }}"
                                            style="width: 200px;">
                                    </td>
                                    <td>
                                        <input
                                            type="date"
                                            class="form-control"
                                            name="service_data[{{$index}}][charge_data][{{$chargeIndex}}][valid_to_date]"
                                            value="{{ $chargeValue->valid_to_date }}"
                                            style="width: 200px;">
                                    </td>
                                </tr>
                            @endforeach

                        </tbody>
                    </table>
                </div>
            </div>

            <hr>
        </div>
    </div>
</div> --}}

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
                                <div class="chargeTableItemRow_{{ $chargeIndex + 1 }} tableChargeForm-body-row">
                                    <div class="tableChargeForm-box" style="min-width: 80px;">
                                        <input
                                            type="text"
                                            class="form-control"
                                            value="{{ $chargeIndex + 1 }}"
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
                                                    value="{{ $charge->charge_id }}"
                                                    data-charge-name="{{ $charge->charge_name }}"
                                                    @selected($chargeValue->charge_id == $charge->charge_id)>
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
                                    <div class="tableChargeForm-box">
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
                                            @disabled($chargeValue->unit->unit_name == 'KG')>
                                    </div>
                                    <div class="tableChargeForm-box" style="min-width: 130px;">
                                        <input
                                            type="text"
                                            class="form-control"
                                            id="minimum_amount_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                            name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][minimum_amount]"
                                            value="{{ $chargeValue->minimum_amount }}"
                                            style="width: 100%;"
                                            @if($chargeValue->unit->unit_name == 'CNTR')
                                                disabled
                                            @elseif($chargeValue->unit->unit_name == 'KG')
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
                                            @if($chargeValue->unit->unit_name == 'KG')
                                                disabled
                                            @elseif($chargeValue->unit->unit_name == 'SHPT')
                                                disabled
                                            @endif>
                                    </div>
                                    <div class="tableChargeForm-box" style="min-width: 130px;">
                                        <input
                                            type="text"
                                            class="form-control unitKilogramField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                            name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][from_0_to_44]"
                                            value="{{ $chargeValue->from_0_to_44 == 0 ? '' : $chargeValue->from_0_to_44 }}"
                                            style="width: 100%;"
                                            @if($chargeValue->unit->unit_name != 'KG')
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
                                            @if($chargeValue->unit->unit_name != 'KG')
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
                                            @if($chargeValue->unit->unit_name != 'KG')
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
                                            @if($chargeValue->unit->unit_name != 'KG')
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
                                            @if($chargeValue->unit->unit_name != 'KG')
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
                                            @if($chargeValue->unit->unit_name != 'KG')
                                                disabled
                                            @endif>
                                    </div>
                                    <div class="tableChargeForm-box" style="min-width: 130px;">
                                        <input
                                            type="text"
                                            class="form-control unitContainerField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                            name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][20_feet]"
                                            value="{{ $chargeValue->twenty_feet == 0 ? '' : $chargeValue->twenty_feet  }}"
                                            style="width: 100%;"
                                            @if($chargeValue->unit->unit_name != 'CNTR')
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
                                            @if($chargeValue->unit->unit_name != 'CNTR')
                                                disabled
                                            @endif>
                                    </div>
                                    <div class="tableChargeForm-box" style="min-width: 130px;">
                                        <input
                                            type="text"
                                            class="form-control unitContainerField_{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                            name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][45_feet_hc]"
                                            value="{{ $chargeValue->forty_five_feet_hc == 0 ? '' : $chargeValue->forty_five_feet_hc }}"
                                            style="width: 100%;"
                                            @if($chargeValue->unit->unit_name != 'CNTR')
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
                                            @if($chargeValue->unit->unit_name != 'CNTR')
                                                disabled
                                            @endif>
                                    </div>
                                    <div class="tableChargeForm-box" style="min-width: 130px;">
                                        <input
                                            type="text"
                                            class="form-control"
                                            name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][por]"
                                            value="{{ $chargeValue->por }}"
                                            style="width: 100%;">
                                    </div>
                                    <div class="tableChargeForm-box" style="min-width: 130px;">
                                        <input
                                            type="text"
                                            class="form-control"
                                            name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][fdc]"
                                            value="{{ $chargeValue->fdc }}"
                                            style="width: 100%;">
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
                                            <option value="SHPT" @selected($chargeValue->pp_cc == 'SHPT')>
                                                SHPT
                                            </option>
                                            <option value="CNTR" @selected($chargeValue->pp_cc == 'CNTR')>
                                                CNTR
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
                                            <option value="SHPT" @selected($chargeValue->imco == 'SHPT')>
                                                SHPT
                                            </option>
                                            <option value="CNTR" @selected($chargeValue->imco == 'CNTR')>
                                                CNTR
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
                                            <option value="SHPT" @selected($chargeValue->loading_bay == 'SHPT')>
                                                SHPT
                                            </option>
                                            <option value="CNTR" @selected($chargeValue->loading_bay == 'CNTR')>
                                                CNTR
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
                                    <div class="tableChargeForm-box" style="min-width: 150px;">
                                        <input
                                            type="date"
                                            class="form-control"
                                            name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][valid_from_date]"
                                            value="{{ $chargeValue->valid_from_date }}"
                                            style="width: 100%;">
                                    </div>
                                    <div class="tableChargeForm-box" style="min-width: 150px;">
                                        <input
                                            type="date"
                                            class="form-control"
                                            name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][valid_to_date]"
                                            value="{{ $chargeValue->valid_to_date }}"
                                            style="width: 100%;">
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
