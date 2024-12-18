{{-- <div class="table-responsive">
    <table class="table tableServiceForm accordion">
        <thead>
            <tr>
                <th style="width: 20px;" class="align-middle text-center" scope="col">#</th>
                <th class="align-middle text-center" scope="col">Service</th>
                <th class="align-middle text-center" scope="col">POR Country</th>
                <th class="align-middle text-center" scope="col">POR Port</th>
                <th class="align-middle text-center" scope="col">FDC Country</th>
                <th class="align-middle text-center" scope="col">FDC Port</th>
                <th class="align-middle text-center" scope="col">TOS</th>
                <th class="align-middle text-center" scope="col">TOS Name</th>
                <th class="align-middle text-center" scope="col">Transit</th>
                <th class="align-middle text-center" scope="col">Manual Input Transit</th>
                <th class="align-middle text-center" scope="col">Carrier</th>
                <th class="align-middle text-center" scope="col">Carrier Name</th>
                <th class="align-middle text-center" scope="col">Party</th>
                <th class="align-middle text-center" scope="col">Service Notes</th>
            </tr>
        </thead>
        <tbody>
            <tr class="serviceTableRow">
                <td scope="row" class="accordion-toggle" data-bs-toggle="collapse" data-bs-target="#r1" aria-expanded="false">
                    <input type="text" value="1 ↓" class="form-control" style="min-width:200px;" readonly>
                </td>
                <td>
                    <select
                        name="service_data[0][service]"
                        class="form-select serviceList"
                        id="service_id_1"
                        style="min-width:200px;"
                        required>
                        <option value="" selected hidden>
                            Service
                        </option>
                        @foreach ($serviceVendors as $serviceVendor)
                            <option
                                value="{{ $serviceVendor->id }}">
                                {{ $serviceVendor->service_code }}
                            </option>
                        @endforeach
                    </select>
                </td>
                <td>
                    <select
                        name="service_data[0][por_country]"
                        class="form-select selectLists countryList"
                        id="por_country_id_1"
                        data-placeholder="Select an option"
                        style="min-width:200px;"
                        required>
                        <option value="" selected hidden>
                            Country
                        </option>
                        @foreach ($countries as $country)
                            <option
                                value="{{ $country->country_id }}">
                                {{ $country->country_name }}
                            </option>
                        @endforeach
                    </select>
                </td>
                <td>
                    <select
                        name="service_data[0][por_port]"
                        class="form-select selectLists"
                        id="por_port_id_1"
                        data-placeholder="Select an option"
                        style="min-width:200px;"
                        required
                        disabled>
                        <option value="" selected hidden>
                            Port
                        </option>
                    </select>
                </td>
                <td>
                    <select
                        name="service_data[0][fdc_country]"
                        class="form-select selectLists countryList"
                        id="fdc_country_id_1"
                        data-placeholder="Select an option"
                        style="min-width:200px;"
                        required>
                        <option value="" selected hidden>
                            Country
                        </option>
                        @foreach ($countries as $country)
                            <option
                                value="{{ $country->country_id }}">
                                {{ $country->country_name }}
                            </option>
                        @endforeach
                    </select>
                </td>
                <td>
                    <select
                        name="service_data[0][fdc_port]"
                        class="form-select selectLists"
                        id="fdc_port_id_1"
                        data-placeholder="Select an option"
                        style="min-width:200px;"
                        required
                        disabled>
                        <option value="" selected hidden>
                            Port
                        </option>
                    </select>
                </td>
                <td>
                    <input
                        type="text"
                        name="service_data[0][tos]"
                        class="form-control"
                        value=""
                        style="min-width:200px;"
                        required>
                </td>
                <td>
                    <input
                        type="text"
                        name="service_data[0][tos_name]"
                        class="form-control"
                        value=""
                        style="min-width:200px;"
                        required>
                </td>
                <td>
                    <select
                        name="service_data[0][transit]"
                        class="form-select selectTransit"
                        id="select_transit_1"
                        style="min-width:200px;"
                        required>
                        <option value="" selected hidden>
                            Transit
                        </option>
                        @foreach ($routedTransits as $data)
                            <option value="{{ $data['value'] }}">
                                {{ $data['label'] }}
                            </option>
                        @endforeach
                    </select>
                </td>
                <td>
                    <input
                        type="text"
                        name="service_data[0][manual_input_transit]"
                        class="form-control"
                        id="input_transit_1"
                        value=""
                        style="min-width:200px;"
                        disabled>
                </td>
                <td>
                    <select
                        name="service_data[0][carrier_id]"
                        class="form-select selectLists carrierList"
                        id="carrier_id_1"
                        data-placeholder="Select an option"
                        style="min-width:200px;"
                        required>
                        <option value="" selected hidden>
                            Carrier
                        </option>
                        @foreach ($carriers as $carrier)
                            <option
                                value="{{ $carrier->carrier_id }}"
                                data-carrier-name="{{ $carrier->carrier_name }}">
                                {{ $carrier->carrier_code.'-'.$carrier->carrier_name }}
                            </option>
                        @endforeach
                    </select>
                </td>
                <td>
                    <input
                        type="text"
                        name="service_data[0][carrier_name]"
                        class="form-control"
                        value=""
                        id="carrier_name_1"
                        style="min-width:200px;"
                        readonly>
                </td>
                <td>
                    <input
                        type="text"
                        name="service_data[0][party]"
                        class="form-control"
                        value=""
                        style="min-width:200px;"
                        required>
                </td>
                <td>
                    <input
                        type="text"
                        name="service_data[0][service_note]"
                        class="form-control"
                        value=""
                        style="min-width:200px;"
                        required>
                </td>
            </tr>
            <tr class="collapse accordion-collapse chargeTableRow" id="r1" data-bs-parent=".tableServiceForm">
                <td colspan="14">
                    @include('pages.finance.master-data.agent-contract.pieces.create.charge-form')
                </td>
            </tr>
        </tbody>
    </table>
</div> --}}


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
            <div class="serviceTableRow">
                <div class="tableServiceForm-body-row">
                    <div class="accordion-toggle tableServiceForm-box" data-bs-toggle="collapse" data-bs-target="#r1" aria-expanded="false" style="min-width: 80px;">
                        <input type="text" value="1 ↓" class="form-control" style="width: 100%;" readonly>
                    </div>
                    <div class="tableServiceForm-box" style="min-width: 130px;">
                        <select
                            name="service_data[0][service]"
                            class="form-select serviceList"
                            id="service_id_1"
                            style="min-width: 100%;"
                            required>
                            <option value="" selected hidden>
                                Service
                            </option>
                            @foreach ($serviceVendors as $serviceVendor)
                                <option
                                    value="{{ $serviceVendor->id }}">
                                    {{ $serviceVendor->service_code }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                    <div class="tableServiceForm-box">
                        <select
                            name="service_data[0][por_country]"
                            class="form-select selectLists countryList"
                            id="por_country_id_1"
                            data-placeholder="Select an option"
                            style="min-width: 100%;">
                            <option value="" selected hidden>
                                Country
                            </option>
                            @foreach ($countries as $country)
                                <option
                                    value="{{ $country->country_id }}">
                                    {{ $country->country_name }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                    <div class="tableServiceForm-box">
                        <select
                            name="service_data[0][por_port]"
                            class="form-select selectLists"
                            id="por_port_id_1"
                            data-placeholder="Select an option"
                            style="min-width: 100%;"
                            disabled>
                            <option value="" selected hidden>
                                Port
                            </option>
                        </select>
                    </div>
                    <div class="tableServiceForm-box">
                        <select
                            name="service_data[0][fdc_country]"
                            class="form-select selectLists countryList"
                            id="fdc_country_id_1"
                            data-placeholder="Select an option"
                            style="min-width: 100%;">
                            <option value="" selected hidden>
                                Country
                            </option>
                            @foreach ($countries as $country)
                                <option
                                    value="{{ $country->country_id }}">
                                    {{ $country->country_name }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                    <div class="tableServiceForm-box">
                        <select
                            name="service_data[0][fdc_port]"
                            class="form-select selectLists"
                            id="fdc_port_id_1"
                            data-placeholder="Select an option"
                            style="min-width: 100%;"
                            disabled>
                            <option value="" selected hidden>
                                Port
                            </option>
                        </select>
                    </div>
                    <div class="tableServiceForm-box">
                        <input
                            type="text"
                            name="service_data[0][tos]"
                            class="form-control"
                            value=""
                            style="min-width: 100%;">
                    </div>
                    <div class="tableServiceForm-box">
                        <input
                            type="text"
                            name="service_data[0][tos_name]"
                            class="form-control"
                            value=""
                            style="min-width: 100%;">
                    </div>
                    <div class="tableServiceForm-box" style="min-width: 150px">
                        <select
                            name="service_data[0][transit]"
                            class="form-select selectTransit"
                            id="select_transit_1"
                            style="min-width: 100%;">
                            <option value="" selected hidden>
                                Transit
                            </option>
                            @foreach ($routedTransits as $data)
                                <option value="{{ $data['value'] }}">
                                    {{ $data['label'] }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                    <div class="tableServiceForm-box">
                        <input
                            type="text"
                            name="service_data[0][manual_input_transit]"
                            class="form-control"
                            id="input_transit_1"
                            value=""
                            style="min-width: 100%;"
                            disabled>
                    </div>
                    <div class="tableServiceForm-box">
                        <select
                            name="service_data[0][carrier_id]"
                            class="form-select selectLists carrierList"
                            id="carrier_id_1"
                            data-placeholder="Select an option"
                            style="min-width: 100%;">
                            <option value="" selected hidden>
                                Carrier
                            </option>
                            @foreach ($carriers as $carrier)
                                <option
                                    value="{{ $carrier->carrier_id }}"
                                    data-carrier-name="{{ $carrier->carrier_name }}">
                                    {{ $carrier->carrier_code.'-'.$carrier->carrier_name }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                    <div class="tableServiceForm-box">
                        <input
                            type="text"
                            name="service_data[0][carrier_name]"
                            class="form-control"
                            value=""
                            id="carrier_name_1"
                            style="min-width: 100%;"
                            readonly>
                    </div>
                    <div class="tableServiceForm-box">
                        <input
                            type="text"
                            name="service_data[0][party]"
                            class="form-control"
                            value=""
                            style="min-width: 100%;">
                    </div>
                    <div class="tableServiceForm-box">
                        <input
                            type="text"
                            name="service_data[0][service_note]"
                            class="form-control"
                            value=""
                            style="min-width: 100%;">
                    </div>
                </div>
                <div class="collapse accordion-collapse chargeTableRow" id="r1" data-bs-parent=".tableServiceForm">
                    @include('pages.finance.master-data.agent-contract.pieces.create.charge-form')
                </div>
            </div>
        </div>
    </div>
</div>
