{{-- New Charge Form without Table --}}
<div class="row">
    <div class="col-12">
        <div class="mb-10">

            <div
                class="d-flex align-items-center mb-1 ps-3">
                <h6 class="m-3">Charge Details</h6>
                <div class="ms-5">
                    <button type="button"
                        id="add_charge_1"
                        class="addCharges btn btn-success d-inline-flex align-items-center justify-content-center" style="height: 30px; width: 30px;">
                        <i class="fa fa-plus pe-0"></i>
                    </button>
                    <button type="button"
                        id="remove_charge_1"
                        class="removeCharges btn btn-danger d-inline-flex align-items-center justify-content-center" style="height: 30px; width: 30px;"
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
                            <div class="tableChargeForm-box text-center"  style="display: none;">
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
                            <div class="chargeTableItemRow_1 tableChargeForm-body-row flex-column">
                                <div class="d-flex flex-row p-0">
                                    <div class="tableChargeForm-box trigger-show-detail" style="min-width: 80px;">
                                        <input
                                            type="text"
                                            class="form-control"
                                            value="1 ↓"
                                            style=""
                                            readonly>
                                    </div>
                                    <div class="tableChargeForm-box" style="min-width: 170px;">
                                        <select
                                            name="service_data[0][charge_data][0][charge_id]"
                                            class="form-select chargeIdClass selectLists"
                                            data-placeholder="Charge"
                                            id="charge_id_1_1"
                                            style="width: 100%;">
                                            <option value="" selected hidden>
                                                Charge
                                            </option>
                                            {{-- @foreach ($charges as $charge)
                                                <option
                                                    value="{{ $charge->id }}"
                                                    data-charge-name="{{ $charge->charge_name }}"
                                                    data-unit-code="{{ $charge->unit?->unit_name }}">
                                                    {{ $charge->charge_code }}
                                                </option>
                                            @endforeach --}}
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
                                    <div class="tableChargeForm-box" style="display: none;">
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
                                    {{-- <div class="tableChargeForm-box" style="min-width: 130px;">
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
                                    </div> --}}
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
                                            name="service_data[0][charge_data][0][20_feet_goh]"
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
                                            name="service_data[0][charge_data][0][40_feet_goh]"
                                            value=""
                                            style="width: 100%;">
                                    </div>
                                    <div class="tableChargeForm-box" style="min-width: 130px;">
                                        <input
                                            type="text"
                                            class="form-control unitContainerField_1_1"
                                            name="service_data[0][charge_data][0][40_feet_hc]"
                                            value=""
                                            style="width: 100%;">
                                    </div>
                                    <div class="tableChargeForm-box" style="min-width: 130px;">
                                        <input
                                            type="text"
                                            class="form-control unitContainerField_1_1"
                                            name="service_data[0][charge_data][0][40_feet_hc_goh]"
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
                                            class="form-control unitContainerField_1_1"
                                            name="service_data[0][charge_data][0][45_feet_goh]"
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
                                            <option value="SHIPMENT">
                                                SHIPMENT
                                            </option>
                                            <option value="CONTAINER">
                                                CONTAINER
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
                                            <option value="SHIPMENT">
                                                SHIPMENT
                                            </option>
                                            <option value="CONTAINER">
                                                CONTAINER
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
                                            <option value="SHIPMENT">
                                                SHIPMENT
                                            </option>
                                            <option value="CONTAINER">
                                                CONTAINER
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
                                </div>

                                @include('pages.finance.master-data.agent-contract.pieces.create.charge-detail-form')
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
