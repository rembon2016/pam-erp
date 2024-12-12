{{-- <div class="row">
    <div class="col-12">
        <div class="mb-10">

            <div
                class="d-flex align-items-center mb-5">
                <h4 class="my-5 mx-3">Charge Details</h4>
                <div class="ms-5">
                    <button type="button"
                        id="add_charge_1"
                        class="addCharges btn btn-icon btn-success rounded" style="height: 30px; width: 30px;">
                        <i class="fa fa-plus pe-0"></i>
                    </button>
                    <button type="button"
                        id="remove_charge_1"
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
                            <tr class="chargeTableItemRow_1">
                                <td>
                                    <input
                                        type="text"
                                        class="form-control"
                                        value="1"
                                        style="width: 80px;"
                                        readonly>
                                </td>
                                <td>
                                    <select
                                        name="service_data[0][charge_data][0][charge_id]"
                                        class="form-select chargeIdClass"
                                        id="charge_id_1_1"
                                        style="width: 200px;">
                                        <option value="" selected hidden>
                                            Charge
                                        </option>
                                        @foreach ($charges as $charge)
                                            <option
                                                value="{{ $charge->charge_id }}"
                                                data-charge-name="{{ $charge->charge_name }}">
                                                {{ $charge->charge_code }}
                                            </option>
                                        @endforeach
                                    </select>
                                </td>
                                <td>
                                    <input
                                        type="text"
                                        name="service_data[0][charge_data][0][charge_name]"
                                        class="form-control"
                                        value=""
                                        id="charge_name_1_1"
                                        style="width: 200px;"
                                        readonly>
                                </td>
                                <td>
                                    <select
                                        name="service_data[0][charge_data][0][c_r_n]"
                                        class="form-select"
                                        style="width: 200px;">
                                        <option value="" selected hidden>
                                            C/R/N
                                        </option>
                                        <option value="cost">
                                            Cost
                                        </option>
                                        <option value="R">
                                            R
                                        </option>
                                        <option value="N">
                                            N
                                        </option>
                                    </select>
                                </td>
                                <td>
                                    <select
                                        name="service_data[0][charge_data][0][currency]"
                                        id="currency_id_1_1"
                                        class="form-select"
                                        style="width: 200px;"
                                        disabled>
                                        <option value="" selected hidden>
                                            Currency
                                        </option>
                                        <option value="USD">
                                            USD
                                        </option>
                                        <option value="IDR">
                                            IDR
                                        </option>
                                        <option value="AED">
                                            AED
                                        </option>
                                    </select>
                                </td>
                                <td>
                                    <select
                                        name="service_data[0][charge_data][0][unit_id]"
                                        id="unit_id_1_1"
                                        class="form-select"
                                        style="width: 200px;"
                                        disabled>
                                        <option value="" selected hidden>
                                            Unit
                                        </option>
                                        @foreach($units as $unit)
                                            <option
                                                value="{{ $unit->unit_id }}"
                                                data-unit-code="{{ $unit->unit_name }}">
                                                {{ $unit->description." ({$unit->unit_name})" }}
                                            </option>
                                        @endforeach
                                    </select>
                                </td>
                                <td>
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="amount_per_unit_1_1"
                                        name="service_data[0][charge_data][0][amount_per_unit]"
                                        style="width: 200px;">
                                </td>
                                <td>
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="minimum_amount_1_1"
                                        name="service_data[0][charge_data][0][minimum_amount]"
                                        style="width: 200px;">
                                </td>
                                <td>
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="via_port_1_1"
                                        name="service_data[0][charge_data][0][via_port]"
                                        style="width: 200px;">
                                </td>
                                <td>
                                    <input
                                        type="text"
                                        class="form-control unitKilogramField_1_1"
                                        name="service_data[0][charge_data][0][from_0_to_44]"
                                        value=""
                                        style="width: 200px;">
                                </td>
                                <td>
                                    <input
                                        type="text"
                                        class="form-control unitKilogramField_1_1"
                                        name="service_data[0][charge_data][0][from_45_to_99]"
                                        value=""
                                        style="width: 200px;">
                                </td>
                                <td>
                                    <input
                                        type="text"
                                        class="form-control unitKilogramField_1_1"
                                        name="service_data[0][charge_data][0][from_100_to_299]"
                                        value=""
                                        style="width: 200px;">
                                </td>
                                <td>
                                    <input
                                        type="text"
                                        class="form-control unitKilogramField_1_1"
                                        name="service_data[0][charge_data][0][from_300_to_499]"
                                        value=""
                                        style="width: 200px;">
                                </td>
                                <td>
                                    <input
                                        type="text"
                                        class="form-control unitKilogramField_1_1"
                                        name="service_data[0][charge_data][0][from_500_to_999]"
                                        value=""
                                        style="width: 200px;">
                                </td>
                                <td>
                                    <input
                                        type="text"
                                        class="form-control unitKilogramField_1_1"
                                        name="service_data[0][charge_data][0][from_1000_to_infinity]"
                                        value=""
                                        style="width: 200px;">
                                </td>
                                <td>
                                    <input
                                        type="text"
                                        class="form-control unitContainerField_1_1"
                                        name="service_data[0][charge_data][0][20_feet]"
                                        value=""
                                        style="width: 200px;">
                                </td>
                                <td>
                                    <input
                                        type="text"
                                        class="form-control unitContainerField_1_1"
                                        name="service_data[0][charge_data][0][40_feet]"
                                        value=""
                                        style="width: 200px;">
                                </td>
                                <td>
                                    <input
                                        type="text"
                                        class="form-control unitContainerField_1_1"
                                        name="service_data[0][charge_data][0][45_feet_hc]"
                                        value=""
                                        style="width: 200px;">
                                </td>
                                <td>
                                    <input
                                        type="text"
                                        class="form-control unitContainerField_1_1"
                                        name="service_data[0][charge_data][0][45_feet]"
                                        value=""
                                        style="width: 200px;">
                                </td>
                                <td>
                                    <input
                                        type="text"
                                        class="form-control"
                                        name="service_data[0][charge_data][0][por]"
                                        value=""
                                        style="width: 200px;">
                                </td>
                                <td>
                                    <input
                                        type="text"
                                        class="form-control"
                                        name="service_data[0][charge_data][0][fdc]"
                                        value=""
                                        style="width: 200px;">
                                </td>
                                <td>
                                    <select
                                        name="service_data[0][charge_data][0][pp_cc]"
                                        class="form-select"
                                        style="width: 200px;">
                                        <option value="" selected hidden>
                                            PP/CC
                                        </option>
                                        <option value="KG">
                                            KG
                                        </option>
                                        <option value="SHPT">
                                            SHPT
                                        </option>
                                        <option value="CNTR">
                                            CNTR
                                        </option>
                                    </select>
                                </td>
                                <td>
                                    <select
                                        name="service_data[0][charge_data][0][routed]"
                                        class="form-select selectRouted"
                                        id="select_routed_1_1"
                                        style="width: 200px;">
                                        <option value="" selected hidden>
                                            Routed
                                        </option>
                                        @foreach ($routedTransits as $data)
                                            <option
                                                value="{{ $data['value'] }}">
                                                {{ $data['label'] }}
                                            </option>
                                        @endforeach
                                    </select>
                                </td>
                                <td>
                                    <input
                                        type="text"
                                        name="service_data[0][charge_data][0][manual_input_routed]"
                                        class="form-control"
                                        id="input_routed_1_1"
                                        value=""
                                        style="width: 200px;"
                                        disabled>
                                </td>
                                <td>
                                    <select
                                        name="service_data[0][charge_data][0][imco]"
                                        class="form-select"
                                        style="width: 200px;">
                                        <option value="" selected hidden>
                                            IMCO
                                        </option>
                                        <option value="KG">
                                            KG
                                        </option>
                                        <option value="SHPT">
                                            SHPT
                                        </option>
                                        <option value="CNTR">
                                            CNTR
                                        </option>
                                    </select>
                                </td>
                                <td>
                                    <select
                                        name="service_data[0][charge_data][0][loading_bay]"
                                        class="form-select"
                                        style="width: 200px;">
                                        <option value="" selected hidden>
                                            Loading Bay
                                        </option>
                                        <option value="KG">
                                            KG
                                        </option>
                                        <option value="SHPT">
                                            SHPT
                                        </option>
                                        <option value="CNTR">
                                            CNTR
                                        </option>
                                    </select>
                                </td>
                                <td>
                                    <input
                                        type="text"
                                        class="form-control"
                                        name="service_data[0][charge_data][0][commodity]"
                                        value=""
                                        style="width: 200px;">
                                </td>
                                <td>
                                    <input
                                        type="date"
                                        class="form-control"
                                        name="service_data[0][charge_data][0][valid_from_date]"
                                        value=""
                                        style="width: 200px;">
                                </td>
                                <td>
                                    <input
                                        type="date"
                                        class="form-control"
                                        name="service_data[0][charge_data][0][valid_to_date]"
                                        value=""
                                        style="width: 200px;">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <hr>
        </div>
    </div>
</div> --}}

{{-- New Charge Form without Table --}}
<div class="row">
    <div class="col-12">
        <div class="mb-10">

            <div
                class="d-flex align-items-center mb-1 ps-3">
                <h4 class="my-5 mx-3">Charge Details</h4>
                <div class="ms-5">
                    <button type="button"
                        id="add_charge_1"
                        class="addCharges btn btn-icon btn-success rounded" style="height: 30px; width: 30px;">
                        <i class="fa fa-plus pe-0"></i>
                    </button>
                    <button type="button"
                        id="remove_charge_1"
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
                            <div class="chargeTableItemRow_1 tableChargeForm-body-row">
                                <div class="tableChargeForm-box" style="min-width: 80px;">
                                    <input
                                        type="text"
                                        class="form-control"
                                        value="1"
                                        style=""
                                        readonly>
                                </div>
                                <div class="tableChargeForm-box" style="min-width: 170px;">
                                    <select
                                        name="service_data[0][charge_data][0][charge_id]"
                                        class="form-select chargeIdClass"
                                        id="charge_id_1_1"
                                        style="width: 100%;">
                                        <option value="" selected hidden>
                                            Charge
                                        </option>
                                        @foreach ($charges as $charge)
                                            <option
                                                value="{{ $charge->charge_id }}"
                                                data-charge-name="{{ $charge->charge_name }}">
                                                {{ $charge->charge_code }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="tableChargeForm-box">
                                    <input
                                        type="text"
                                        name="service_data[0][charge_data][0][charge_name]"
                                        class="form-control"
                                        value=""
                                        id="charge_name_1_1"
                                        style="width: 100%;"
                                        readonly>
                                </div>
                                <div class="tableChargeForm-box" style="min-width: 115px;">
                                    <select
                                        name="service_data[0][charge_data][0][c_r_n]"
                                        class="form-select"
                                        style="width: 100%;">
                                        <option value="" selected hidden>
                                            C/R/N
                                        </option>
                                        <option value="cost">
                                            Cost
                                        </option>
                                        <option value="R">
                                            R
                                        </option>
                                        <option value="N">
                                            N
                                        </option>
                                    </select>
                                </div>
                                <div class="tableChargeForm-box" style="min-width: 100px;">
                                    <select
                                        name="service_data[0][charge_data][0][currency]"
                                        id="currency_id_1_1"
                                        class="form-select"
                                        style="width: 100%;"
                                        disabled>
                                        <option value="" selected hidden>
                                            Currency
                                        </option>
                                        @foreach ($currencies as $currency)
                                            <option value="{{ $currency->id }}">
                                                {{ $currency->currency_name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="tableChargeForm-box">
                                    <select
                                        name="service_data[0][charge_data][0][unit_id]"
                                        id="unit_id_1_1"
                                        class="form-select"
                                        style="width: 100%;"
                                        disabled>
                                        <option value="" selected hidden>
                                            Unit
                                        </option>
                                        @foreach($units as $unit)
                                            <option
                                                value="{{ $unit->unit_id }}"
                                                data-unit-code="{{ $unit->unit_name }}">
                                                {{ $unit->description." ({$unit->unit_name})" }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="tableChargeForm-box" style="min-width: 130px;">
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="amount_per_unit_1_1"
                                        name="service_data[0][charge_data][0][amount_per_unit]"
                                        style="width: 100%;">
                                </div>
                                <div class="tableChargeForm-box" style="min-width: 130px;">
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="minimum_amount_1_1"
                                        name="service_data[0][charge_data][0][minimum_amount]"
                                        style="width: 100%;">
                                </div>
                                <div class="tableChargeForm-box">
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="via_port_1_1"
                                        name="service_data[0][charge_data][0][via_port]"
                                        style="width: 100%;">
                                </div>
                                <div class="tableChargeForm-box" style="min-width: 130px;">
                                    <input
                                        type="text"
                                        class="form-control unitKilogramField_1_1"
                                        name="service_data[0][charge_data][0][from_0_to_44]"
                                        value=""
                                        style="width: 100%;">
                                </div>
                                <div class="tableChargeForm-box" style="min-width: 135px;">
                                    <input
                                        type="text"
                                        class="form-control unitKilogramField_1_1"
                                        name="service_data[0][charge_data][0][from_45_to_99]"
                                        value=""
                                        style="width: 100%;">
                                </div>
                                <div class="tableChargeForm-box" style="min-width: 145px;">
                                    <input
                                        type="text"
                                        class="form-control unitKilogramField_1_1"
                                        name="service_data[0][charge_data][0][from_100_to_299]"
                                        value=""
                                        style="width: 100%;">
                                </div>
                                <div class="tableChargeForm-box" style="min-width: 150px;">
                                    <input
                                        type="text"
                                        class="form-control unitKilogramField_1_1"
                                        name="service_data[0][charge_data][0][from_300_to_499]"
                                        value=""
                                        style="width: 100%;">
                                </div>
                                <div class="tableChargeForm-box" style="min-width: 150px;">
                                    <input
                                        type="text"
                                        class="form-control unitKilogramField_1_1"
                                        name="service_data[0][charge_data][0][from_500_to_999]"
                                        value=""
                                        style="width: 100%;">
                                </div>
                                <div class="tableChargeForm-box" style="min-width: 145px;">
                                    <input
                                        type="text"
                                        class="form-control unitKilogramField_1_1"
                                        name="service_data[0][charge_data][0][from_1000_to_infinity]"
                                        value=""
                                        style="width: 100%;">
                                </div>
                                <div class="tableChargeForm-box" style="min-width: 130px;">
                                    <input
                                        type="text"
                                        class="form-control unitContainerField_1_1"
                                        name="service_data[0][charge_data][0][20_feet]"
                                        value=""
                                        style="width: 100%;">
                                </div>
                                <div class="tableChargeForm-box" style="min-width: 130px;">
                                    <input
                                        type="text"
                                        class="form-control unitContainerField_1_1"
                                        name="service_data[0][charge_data][0][40_feet]"
                                        value=""
                                        style="width: 100%;">
                                </div>
                                <div class="tableChargeForm-box" style="min-width: 130px;">
                                    <input
                                        type="text"
                                        class="form-control unitContainerField_1_1"
                                        name="service_data[0][charge_data][0][45_feet_hc]"
                                        value=""
                                        style="width: 100%;">
                                </div>
                                <div class="tableChargeForm-box" style="min-width: 130px;">
                                    <input
                                        type="text"
                                        class="form-control unitContainerField_1_1"
                                        name="service_data[0][charge_data][0][45_feet]"
                                        value=""
                                        style="width: 100%;">
                                </div>
                                <div class="tableChargeForm-box" style="min-width: 130px;">
                                    <input
                                        type="text"
                                        class="form-control"
                                        name="service_data[0][charge_data][0][por]"
                                        value=""
                                        style="width: 100%;">
                                </div>
                                <div class="tableChargeForm-box" style="min-width: 130px;">
                                    <input
                                        type="text"
                                        class="form-control"
                                        name="service_data[0][charge_data][0][fdc]"
                                        value=""
                                        style="width: 100%;">
                                </div>
                                <div class="tableChargeForm-box" style="min-width: 110px;">
                                    <select
                                        name="service_data[0][charge_data][0][pp_cc]"
                                        class="form-select"
                                        style="width: 100%;">
                                        <option value="" selected hidden>
                                            PP/CC
                                        </option>
                                        <option value="KG">
                                            KG
                                        </option>
                                        <option value="SHPT">
                                            SHPT
                                        </option>
                                        <option value="CNTR">
                                            CNTR
                                        </option>
                                    </select>
                                </div>
                                <div class="tableChargeForm-box" style="min-width: 150px;">
                                    <select
                                        name="service_data[0][charge_data][0][routed]"
                                        class="form-select selectRouted"
                                        id="select_routed_1_1"
                                        style="width: 100%;">
                                        <option value="" selected hidden>
                                            Routed
                                        </option>
                                        @foreach ($routedTransits as $data)
                                            <option
                                                value="{{ $data['value'] }}">
                                                {{ $data['label'] }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="tableChargeForm-box">
                                    <input
                                        type="text"
                                        name="service_data[0][charge_data][0][manual_input_routed]"
                                        class="form-control"
                                        id="input_routed_1_1"
                                        value=""
                                        style="width: 100%;"
                                        disabled>
                                </div>
                                <div class="tableChargeForm-box" style="min-width: 120px;">
                                    <select
                                        name="service_data[0][charge_data][0][imco]"
                                        class="form-select"
                                        style="width: 100%;">
                                        <option value="" selected hidden>
                                            IMCO
                                        </option>
                                        <option value="KG">
                                            KG
                                        </option>
                                        <option value="SHPT">
                                            SHPT
                                        </option>
                                        <option value="CNTR">
                                            CNTR
                                        </option>
                                    </select>
                                </div>
                                <div class="tableChargeForm-box" style="min-width: 120px;">
                                    <select
                                        name="service_data[0][charge_data][0][loading_bay]"
                                        class="form-select"
                                        style="width: 100%;">
                                        <option value="" selected hidden>
                                            Loading Bay
                                        </option>
                                        <option value="KG">
                                            KG
                                        </option>
                                        <option value="SHPT">
                                            SHPT
                                        </option>
                                        <option value="CNTR">
                                            CNTR
                                        </option>
                                    </select>
                                </div>
                                <div class="tableChargeForm-box">
                                    <input
                                        type="text"
                                        class="form-control"
                                        name="service_data[0][charge_data][0][commodity]"
                                        value=""
                                        style="width: 100%;">
                                </div>
                                <div class="tableChargeForm-box" style="min-width: 150px;">
                                    <input
                                        type="date"
                                        class="form-control"
                                        name="service_data[0][charge_data][0][valid_from_date]"
                                        value=""
                                        style="width: 100%;">
                                </div>
                                <div class="tableChargeForm-box" style="min-width: 150px;">
                                    <input
                                        type="date"
                                        class="form-control"
                                        name="service_data[0][charge_data][0][valid_to_date]"
                                        value=""
                                        style="width: 100%;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
