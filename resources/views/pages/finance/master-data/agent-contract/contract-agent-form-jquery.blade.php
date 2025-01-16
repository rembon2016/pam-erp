@push('js')
    <script>
        $(document).off('click', '.trigger-show-detail').on('click', '.trigger-show-detail', function (event) {
            event.preventDefault();

            const bodyRowElement = $(this).parents('.tableChargeForm-body-row');
            const detailElement = bodyRowElement.find('.tableChargeDetailContent');

            $(".tableChargeDetailContent").not(detailElement).slideUp();
            $(detailElement).slideToggle();
        })

        // Work as Expected
        $('#addServices').click(function() {
            let serviceTableRow = $('.serviceTableRow')
            let chargeTableRow = $('.chargeTableRow')
            let chargeItemTableRow = $(`.chargeItemTableRow_1`)

            $(`${serviceItemRow((serviceTableRow.length + 1), (chargeItemTableRow.length + 1), 1)}`)
                .insertAfter(chargeTableRow.last())

            activateSelect2()

            if (serviceTableRow.length >= 1) $('#removeServices').removeAttr('disabled')
        })

        // Work as Expected
        $('#removeServices').click(function() {
            let serviceTableRow = $('.serviceTableRow')
            let chargeTableRow = $('.chargeTableRow')

            let lastServiceTableRow = serviceTableRow.last()
            let lastChargeTableRow = chargeTableRow.last()

            lastServiceTableRow.remove()
            lastChargeTableRow.remove()

            if ((serviceTableRow.length -1)  <= 1) $('#removeServices').attr('disabled', 'disabled')
        })

        // Work as Expected
        $(document).on('click', '.addCharges', function () {
            let serviceIdFromChargeBtn = $(this).attr('id').split('_')
            serviceIdFromChargeBtn = serviceIdFromChargeBtn[serviceIdFromChargeBtn.length - 1]

            const chargeBody = $(this).parents('.chargeTableRow').find('.tableChargeForm-body');
            const chargeItem = $(chargeBody).find('.tableChargeForm-body-row').length;
            const chargeHtml = chargeItemHtml(serviceIdFromChargeBtn, (chargeItem + 1), 1);

            $(chargeBody).append(chargeHtml);
            activateSelect2()

            if (chargeItem >= 1) $(this).parent().find('.removeCharges').removeAttr('disabled')
        })

        // Work as Expected
        $(document).on('click', '.removeCharges', function () {
            const chargeBody = $(this).parents('.chargeTableRow').find('.tableChargeForm-body');
            const chargeItem = $(chargeBody).find('.tableChargeForm-body-row').length;
            $(chargeBody).find('.tableChargeForm-body-row').eq(chargeItem - 1).remove();

            if (chargeItem <= 2) $(this).attr('disabled', 'disabled')
        })

        $(document).off('click', '.addDetailCharges').on('click', '.addDetailCharges', function (event) {
            event.preventDefault();

            const splittedId = $(this).attr('id').split('|')[1];
            const spslittedServiceAndChargeId = splittedId.split("_");
            const serviceIdFromBtn = spslittedServiceAndChargeId[0];
            const chargeIdFromBtn = spslittedServiceAndChargeId[1];

            const tableContent = $(this).parents('.tableChargeDetailContent');
            const bodyWrapper = $(tableContent).find('.tableChargeDetailForm-body');
            const chargeDetailItem = $(bodyWrapper).find(".tableChargeDetailForm-body-row").length;
            const chargeDetailHtml = chargeDetailItemHtml(serviceIdFromBtn, chargeIdFromBtn, (chargeDetailItem + 1));

            $(bodyWrapper).append(chargeDetailHtml);

            if (chargeDetailItem >= 1) $(tableContent).find(".removeDetailCharges").removeAttr('disabled')
        });

        $(document).off('click', '.removeDetailCharges').on('click', '.removeDetailCharges', function (event) {
            event.preventDefault();

            const tableContent = $(this).parents('.tableChargeDetailContent');
            const chargeDetailItem = $(tableContent).find(".tableChargeDetailForm-body-row").length;
            $(tableContent).find(".tableChargeDetailForm-body-row").eq(chargeDetailItem - 1).remove();

            if (chargeDetailItem <= 2) $(this).attr('disabled', 'disabled');
        });

        // Work as Expected
        $('select[name="vendor_id"]').change(function() {
            let getLabel = $(this).find(':selected').data('vendor-type')
            $('#vendorType').val(getLabel)
        })

        // Work as Expected
        $(document).on('change', '.countryList', function() {
            let rawId = $(this).attr('id').split('_')
            let condition = rawId[0]
            let id = rawId[rawId.length - 1]
            let countryId = $(this).find(':selected').val()
            let portListApiUrl = `{{ route('api.finance.master-data.port.list') }}?country=${countryId}`

            $.ajax({
                url: portListApiUrl,
                beforeSend: function() {
                    $(`#${condition}_port_id_${id}`).attr('disabled', 'disabled')
                },
                success: function(res) {
                    $(`#${condition}_port_id_${id}`).empty()
                    $(`#${condition}_port_id_${id}`).append(`
                        <option value="" selected hidden>Port</option>
                    `)
                    res.data.map(function(item) {
                        $(`#${condition}_port_id_${id}`).append(`
                            <option value="${item.port_id}">${item.port_code}-${item.port_name}</option>
                        `)
                    })
                },
                complete: function() {
                    $(`#${condition}_port_id_${id}`).removeAttr('disabled')
                }
            })
        })

        // Work as Expected
        $(document).on('change', '.chargeIdClass', function() {
            let rawId = $(this).attr('id').split('_')
            let serviceId = rawId[2]
            let chargeId = rawId[rawId.length -1]

            let vendorName = $(this).find(':selected').data('charge-name')
            let findChargeApiUrl = "{{ route('api.finance.master-data.charge.show', ['id' => ':id']) }}"
            findChargeApiUrl = findChargeApiUrl.replace(':id', $(this).find(':selected').val())

            $.ajax({
                url: findChargeApiUrl,
                beforeSend: function() {
                    $(`#currency_id_${serviceId}_${chargeId}`).attr('disabled', 'disabled')
                    $(`#unit_id_${serviceId}_${chargeId}`).attr('disabled', 'disabled')
                },
                success: function(res) {
                    $(`#charge_name_${serviceId}_${chargeId}`).val(`${vendorName}`)

                    // $(`#currency_id_${serviceId}_${chargeId}`).empty()
                    // $(`#currency_id_${serviceId}_${chargeId}`).append(`
                    //     <option value="${res.data.currency_code}" selected>${res.data.currency_code}</option>
                    // `)

                    // Edit Kode Disini
                    if ($(`#service_id_${serviceId}`).find(':selected').val() == 'lcl_and_fcl' && res.data.charge_code == 'THC') {
                        // Amount Minimum Via Row
                        $(`#amount_per_unit_${serviceId}_${chargeId}`).removeAttr('disabled')
                        $(`#minimum_amount_${serviceId}_${chargeId}`).removeAttr('disabled')
                        $(`#via_port_${serviceId}_${chargeId}`).removeAttr('disabled')
                        // End Amount Minimum Via Row

                        // Container Row
                        $(`.unitContainerField_${serviceId}_${chargeId}`).each(function () {
                            $(this).removeAttr('disabled')
                        })
                        // End Container Row

                        // Kilogram Row
                        $(`.unitKilogramField_${serviceId}_${chargeId}`).each(function () {
                            $(this).attr('disabled', 'disabled')
                        })
                        // End Kilogram Row

                    } else {
                        $(`#unit_id_${serviceId}_${chargeId}`).val(res.data.unit_id);

                        chargeOnChange(serviceId, chargeId)
                    }


                },
                complete: function() {
                    $(`#currency_id_${serviceId}_${chargeId}`).removeAttr('disabled')
                    $(`#unit_id_${serviceId}_${chargeId}`).removeAttr('disabled')
                    $(`#unit_id_${serviceId}_${chargeId}`).attr('readonly', 'readonly')
                }
            })

        })

        // Work as Expected
        $(document).on('change', '.carrierList', function() {
            let rawId = $(this).attr('id').split('_')
            let id = rawId[rawId.length - 1]
            let carrierName = $(this).find(':selected').data('carrier-name')

            $(`#carrier_name_${id}`).val(carrierName)
        })

        // Work as Expected
        $(document).on('change', '.selectTransit', function() {
            let rawId = $(this).attr('id').split('_')
            let id = rawId[rawId.length - 1]
            let val = $(this).find(':selected').val()

            if (val == 'NONE') {
                $(`#select_transit_${id}`).removeAttr('name')
                $(`#input_transit_${id}`).removeAttr('disabled')
            } else {
                $(`#input_transit_${id}`).val('');
                $(`#input_transit_${id}`).attr('disabled', 'disabled')
                $(`#select_transit_${id}`).attr('name', `service_data[${id - 1}][transit]`)
            }
        })

        // Work as Expected
        $(document).on('change', '.selectRouted', function() {
            let rawId = $(this).attr('id').split('_')
            let serviceId = rawId[2]
            let chargeId = rawId[rawId.length -1]
            let val = $(this).find(':selected').val()

            if (val == 'NONE') {
                $(`#select_routed_${serviceId}_${chargeId}`).removeAttr('name')
                $(`#input_routed_${serviceId}_${chargeId}`).removeAttr('disabled')
            } else {
                $(`#input_routed_${serviceId}_${chargeId}`).attr('disabled', 'disabled')
                $(`#select_routed_${serviceId}_${chargeId}`).attr('name', `service_data[${id - 1}][routed]`)
            }
        })

        activateSelect2()

        function serviceItemRow(index, chargeIndex, detailIndex) {
            return `
                <div class="serviceTableRow">
                    <div class="tableServiceForm-body-row">
                        <div class="accordion-toggle tableServiceForm-box" data-bs-toggle="collapse" data-bs-target="#r${index}" aria-expanded="false" style="min-width: 80px;">
                            <input type="text" value="${index} ↓" class="form-control" style="width: 100%;" readonly>
                        </div>
                        <div class="tableServiceForm-box" style="min-width: 130px;">
                            <select
                                name="service_data[${index - 1}][service]"
                                class="form-select serviceList"
                                id="service_id_${index}"
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
                                name="service_data[${index - 1}][por_country]"
                                class="form-select selectLists countryList"
                                id="por_country_id_${index}"
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
                                name="service_data[${index - 1}][por_port]"
                                class="form-select selectLists"
                                id="por_port_id_${index}"
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
                                name="service_data[${index - 1}][fdc_country]"
                                class="form-select selectLists countryList"
                                id="fdc_country_id_${index}"
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
                                name="service_data[${index - 1}][fdc_port]"
                                class="form-select selectLists"
                                id="fdc_port_id_${index}"
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
                                name="service_data[${index - 1}][tos]"
                                class="form-control"
                                value=""
                                style="min-width: 100%;">
                        </div>
                        <div class="tableServiceForm-box">
                            <input
                                type="text"
                                name="service_data[${index - 1}][tos_name]"
                                class="form-control"
                                value=""
                                style="min-width: 100%;">
                        </div>
                        <div class="tableServiceForm-box" style="min-width: 150px">
                            <select
                                name="service_data[${index - 1}][transit]"
                                class="form-select selectTransit"
                                id="select_transit_${index}"
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
                                name="service_data[${index - 1}][manual_input_transit]"
                                class="form-control"
                                id="input_transit_${index}"
                                value=""
                                style="min-width: 100%;"
                                disabled>
                        </div>
                        <div class="tableServiceForm-box">
                            <select
                                name="service_data[${index - 1}][carrier_id]"
                                class="form-select selectLists carrierList"
                                id="carrier_id_${index}"
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
                                name="service_data[${index - 1}][carrier_name]"
                                class="form-control"
                                value=""
                                id="carrier_name_${index}"
                                style="min-width: 100%;"
                                readonly>
                        </div>
                        <div class="tableServiceForm-box">
                            <input
                                type="text"
                                name="service_data[${index - 1}][party]"
                                class="form-control"
                                value=""
                                style="min-width: 100%;">
                        </div>
                        <div class="tableServiceForm-box">
                            <input
                                type="text"
                                name="service_data[${index - 1}][service_note]"
                                class="form-control"
                                value=""
                                style="min-width: 100%;">
                        </div>
                    </div>
                    <div class="collapse accordion-collapse chargeTableRow" id="r${index}" data-bs-parent=".tableServiceForm">
                        <div class="row">
                            <div class="col-12">
                                <div class="mb-10">
                                    <div
                                        class="d-flex align-items-center mb-1 ps-3">
                                        <h4 class="my-5 mx-3">Charge Details</h4>
                                        <div class="ms-5">
                                            <button type="button"
                                                id="add_charge_${index}"
                                                class="addCharges btn btn-icon btn-success rounded" style="height: 30px; width: 30px;">
                                                <i class="fa fa-plus pe-0"></i>
                                            </button>
                                            <button type="button"
                                                id="remove_charge_${index}"
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
                                                    ${chargeItemHtml((index), (chargeIndex), (detailIndex))}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            `
        }

        function chargeItemHtml(serviceIndex, index, detailIndex) {
            return `
                <div class="chargeTableItemRow_${serviceIndex} tableChargeForm-body-row flex-column">
                    <div class="d-flex flex-row p-0">
                        <div class="tableChargeForm-box trigger-show-detail" style="min-width: 80px;">
                            <input
                                type="text"
                                class="form-control"
                                value="${index} ↓"
                                style=""
                                readonly>
                        </div>
                        <div class="tableChargeForm-box" style="min-width: 170px;">
                            <select
                                name="service_data[${serviceIndex - 1}][charge_data][${index - 1}][charge_id]"
                                class="form-select chargeIdClass"
                                id="charge_id_${serviceIndex}_${index}"
                                style="width: 100%;">
                                <option value="" selected hidden>
                                    Charge
                                </option>
                                @foreach ($charges as $charge)
                                    <option
                                        value="{{ $charge->id }}"
                                        data-charge-name="{{ $charge->charge_name }}">
                                        {{ $charge->charge_code }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="tableChargeForm-box">
                            <input
                                type="text"
                                name="service_data[${serviceIndex - 1}][charge_data][${index - 1}][charge_name]"
                                class="form-control"
                                value=""
                                id="charge_name_${serviceIndex}_${index}"
                                style="width: 100%;"
                                readonly>
                        </div>
                        <div class="tableChargeForm-box" style="min-width: 115px;">
                            <select
                                name="service_data[${serviceIndex - 1}][charge_data][${index - 1}][c_r_n]"
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
                                name="service_data[${serviceIndex - 1}][charge_data][${index - 1}][currency]"
                                id="currency_id_${serviceIndex}_${index}"
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
                                name="service_data[${serviceIndex - 1}][charge_data][${index - 1}][unit_id]"
                                id="unit_id_${serviceIndex}_${index}"
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
                                id="amount_per_unit_${serviceIndex}_${index}"
                                name="service_data[${serviceIndex - 1}][charge_data][${index - 1}][amount_per_unit]"
                                style="width: 100%;">
                        </div>
                        <div class="tableChargeForm-box" style="min-width: 130px;">
                            <input
                                type="text"
                                class="form-control"
                                id="minimum_amount_${serviceIndex}_${index}"
                                name="service_data[${serviceIndex - 1}][charge_data][${index - 1}][minimum_amount]"
                                style="width: 100%;">
                        </div>
                        <div class="tableChargeForm-box">
                            <input
                                type="text"
                                class="form-control"
                                id="via_port_${serviceIndex}_${index}"
                                name="service_data[${serviceIndex - 1}][charge_data][${index - 1}][via_port]"
                                style="width: 100%;">
                        </div>
                        <div class="tableChargeForm-box" style="min-width: 130px;">
                            <input
                                type="text"
                                class="form-control unitContainerField_${serviceIndex}_${index}"
                                name="service_data[${serviceIndex - 1}][charge_data][${index - 1}][20_feet]"
                                value=""
                                style="width: 100%;">
                        </div>
                        <div class="tableChargeForm-box" style="min-width: 130px;">
                            <input
                                type="text"
                                class="form-control unitContainerField_${serviceIndex}_${index}"
                                name="service_data[${serviceIndex - 1}][charge_data][${index - 1}][20_feet_goh]"
                                value=""
                                style="width: 100%;">
                        </div>
                        <div class="tableChargeForm-box" style="min-width: 130px;">
                            <input
                                type="text"
                                class="form-control unitContainerField_${serviceIndex}_${index}"
                                name="service_data[${serviceIndex - 1}][charge_data][${index - 1}][40_feet]"
                                value=""
                                style="width: 100%;">
                        </div>
                        <div class="tableChargeForm-box" style="min-width: 130px;">
                            <input
                                type="text"
                                class="form-control unitContainerField_${serviceIndex}_${index}"
                                name="service_data[${serviceIndex - 1}][charge_data][${index - 1}][40_feet_goh]"
                                value=""
                                style="width: 100%;">
                        </div>
                        <div class="tableChargeForm-box" style="min-width: 130px;">
                            <input
                                type="text"
                                class="form-control unitContainerField_${serviceIndex}_${index}"
                                name="service_data[${serviceIndex - 1}][charge_data][${index - 1}][40_feet_hc]"
                                value=""
                                style="width: 100%;">
                        </div>
                        <div class="tableChargeForm-box" style="min-width: 130px;">
                            <input
                                type="text"
                                class="form-control unitContainerField_${serviceIndex}_${index}"
                                name="service_data[${serviceIndex - 1}][charge_data][${index - 1}][40_feet_hc_goh]"
                                value=""
                                style="width: 100%;">
                        </div>
                        <div class="tableChargeForm-box" style="min-width: 130px;">
                            <input
                                type="text"
                                class="form-control unitContainerField_${serviceIndex}_${index}"
                                name="service_data[${serviceIndex - 1}][charge_data][${index - 1}][45_feet]"
                                value=""
                                style="width: 100%;">
                        </div>
                        <div class="tableChargeForm-box" style="min-width: 130px;">
                            <input
                                type="text"
                                class="form-control unitContainerField_${serviceIndex}_${index}"
                                name="service_data[${serviceIndex - 1}][charge_data][${index - 1}][45_feet_goh]"
                                value=""
                                style="width: 100%;">
                        </div>
                        <div class="tableChargeForm-box" style="min-width: 130px;">
                            <input
                                type="text"
                                class="form-control"
                                name="service_data[${serviceIndex - 1}][charge_data][${index - 1}][por]"
                                value=""
                                style="width: 100%;">
                        </div>
                        <div class="tableChargeForm-box" style="min-width: 130px;">
                            <input
                                type="text"
                                class="form-control"
                                name="service_data[${serviceIndex - 1}][charge_data][${index - 1}][fdc]"
                                value=""
                                style="width: 100%;">
                        </div>
                        <div class="tableChargeForm-box" style="min-width: 110px;">
                            <select
                                name="service_data[${serviceIndex - 1}][charge_data][${index - 1}][pp_cc]"
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
                                name="service_data[${serviceIndex - 1}][charge_data][${index - 1}][routed]"
                                class="form-select selectRouted"
                                id="select_routed_${serviceIndex}_${index}"
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
                                name="service_data[${serviceIndex - 1}][charge_data][${index - 1}][manual_input_routed]"
                                class="form-control"
                                id="input_routed_${serviceIndex}_${index}"
                                value=""
                                style="width: 100%;"
                                disabled>
                        </div>
                        <div class="tableChargeForm-box" style="min-width: 120px;">
                            <select
                                name="service_data[${serviceIndex - 1}][charge_data][${index - 1}][imco]"
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
                                name="service_data[${serviceIndex - 1}][charge_data][${index - 1}][loading_bay]"
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
                                name="service_data[${serviceIndex - 1}][charge_data][${index - 1}][commodity]"
                                value=""
                                style="width: 100%;">
                        </div>
                        <div class="tableChargeForm-box" style="min-width: 150px;">
                            <input
                                type="date"
                                class="form-control"
                                name="service_data[${serviceIndex - 1}][charge_data][${index - 1}][valid_from_date]"
                                value=""
                                style="width: 100%;">
                        </div>
                        <div class="tableChargeForm-box" style="min-width: 150px;">
                            <input
                                type="date"
                                class="form-control"
                                name="service_data[${serviceIndex - 1}][charge_data][${index - 1}][valid_to_date]"
                                value=""
                                style="width: 100%;">
                        </div>
                    </div>

                    <div class="tableChargeDetailContent" style="display: none;">
                        <div class="row" style="margin-left: auto; flex-basis: 100% !important; width: 100%; !important;">
                            <div class="col-12">
                                <div class="mb-2">
                                    <div
                                        class="d-flex align-items-center justify-content-start mb-1 ps-3">
                                        <div class="ms-5">
                                            <button type="button"
                                                id="add_charge_detail|${serviceIndex}_${index}"
                                                class="addDetailCharges btn btn-icon btn-success rounded" style="height: 30px; width: 30px;">
                                                <i class="fa fa-plus pe-0"></i>
                                            </button>
                                            <button type="button"
                                                id="remove_charge_detail|${serviceIndex}_${index}"
                                                class="removeDetailCharges btn btn-icon btn-warning rounded" style="height: 30px; width: 30px;"
                                                disabled>
                                                <i class="fa fa-minus pe-0"></i>
                                            </button>
                                        </div>
                                    </div>

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
                                            ${chargeDetailItemHtml((serviceIndex), (index), (detailIndex))}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            `
        }

        function chargeDetailItemHtml(serviceIndex, chargeIndex, index) {
            return `
                <div class="chargeDetailTableItemRow_${index} tableChargeDetailForm-body-row">
                    <div class="tableChargeDetailForm-box" style="min-width: 70px;">
                        <input
                            type="text"
                            class="form-control"
                            value="${index}"
                            style=""
                            readonly>
                    </div>
                    <div class="tableChargeDetailForm-box" style="min-width: 100px;">
                        <input
                            type="text"
                            name="service_data[${serviceIndex - 1}][charge_data][${chargeIndex - 1}][charge_detail_data][${index - 1}][from]"
                            class="form-control"
                            value=""
                            id="from_${serviceIndex}_${chargeIndex}_${index}"
                            style="width: 100%;">
                    </div>
                    <div class="tableChargeDetailForm-box" style="min-width: 100px;">
                        <input
                            type="text"
                            name="service_data[${serviceIndex - 1}][charge_data][${chargeIndex - 1}][charge_detail_data][${index - 1}][to]"
                            class="form-control"
                            value=""
                            id="to_${serviceIndex}_${chargeIndex}_${index}"
                            style="width: 100%;">
                    </div>
                    <div class="tableChargeDetailForm-box" style="min-width: 100px;">
                        <input
                            type="text"
                            name="service_data[${serviceIndex - 1}][charge_data][${chargeIndex - 1}][charge_detail_data][${index - 1}][value]"
                            class="form-control"
                            value=""
                            id="value_${serviceIndex}_${chargeIndex}_${index}"
                            style="width: 100%;">
                    </div>
                </div>
            `
        }

        function activateSelect2() {
            $(document).ready(function () {
                $(".selectLists").each(function () {
                    let placeholder = $(this).data('placeholder')
                    $(this).select2({
                        placeholder: placeholder,
                    })
                })
            })
        }

        function chargeOnChange(serviceId, chargeId) {
            let unitName = $(`#unit_id_${serviceId}_${chargeId}`).children('option:selected').data('unit-code')
            if (unitName == 'KG') {

                // Amount Minimum Via Row
                $(`#amount_per_unit_${serviceId}_${chargeId}`).attr('disabled', 'disabled')
                $(`#minimum_amount_${serviceId}_${chargeId}`).attr('disabled', 'disabled')
                $(`#via_port_${serviceId}_${chargeId}`).attr('disabled', 'disabled')
                // End Amount Minimum Via Row

                // Container Row
                $(`.unitContainerField_${serviceId}_${chargeId}`).each(function () {
                    $(this).val('')
                    $(this).attr('disabled', 'disabled')
                })
                // End Container Row

                // Kilogram Row
                $(`.unitKilogramField_${serviceId}_${chargeId}`).each(function () {
                    $(this).removeAttr('disabled')
                })
                // End Kilogram Row

            } else if (unitName == 'SHIPMENT') {

                // Amount Minimum Via Row
                $(`#amount_per_unit_${serviceId}_${chargeId}`).removeAttr('disabled')
                $(`#minimum_amount_${serviceId}_${chargeId}`).removeAttr('disabled')
                $(`#via_port_${serviceId}_${chargeId}`).attr('disabled', 'disabled')
                // End Amount Minimum Via Row

                // Container Row
                $(`.unitContainerField_${serviceId}_${chargeId}`).each(function () {
                    $(this).val('')
                    $(this).attr('disabled', 'disabled')
                })
                // End Container Row

                // Kilogram Row
                $(`.unitKilogramField_${serviceId}_${chargeId}`).each(function () {
                    $(this).val('')
                    $(this).attr('disabled', 'disabled')
                })
                // End Kilogram Row

            } else if (unitName == 'CONTAINER' || unitName == 'CN') {

                // Amount Minimum Via Row
                $(`#amount_per_unit_${serviceId}_${chargeId}`).removeAttr('disabled')
                $(`#minimum_amount_${serviceId}_${chargeId}`).attr('disabled', 'disabled')
                $(`#via_port_${serviceId}_${chargeId}`).removeAttr('disabled')
                // End Amount Minimum Via Row

                // Container Row
                $(`.unitContainerField_${serviceId}_${chargeId}`).each(function () {
                    $(this).removeAttr('disabled')
                })
                // End Container Row

                // Kilogram Row
                $(`.unitKilogramField_${serviceId}_${chargeId}`).each(function () {
                    $(this).val('')
                    $(this).attr('disabled', 'disabled')
                })
                // End Kilogram Row
            } else {

                // Amount Minimum Via Row
                $(`#amount_per_unit_${serviceId}_${chargeId}`).removeAttr('disabled')
                $(`#minimum_amount_${serviceId}_${chargeId}`).removeAttr('disabled')
                $(`#via_port_${serviceId}_${chargeId}`).removeAttr('disabled')
                // End Amount Minimum Via Row

                // Container Row
                $(`.unitContainerField_${serviceId}_${chargeId}`).each(function () {
                    $(this).attr('disabled', 'disabled')
                })
                // End Container Row

                // Kilogram Row
                $(`.unitKilogramField_${serviceId}_${chargeId}`).each(function () {
                    $(this).attr('disabled', 'disabled')
                })
                // End Kilogram Row
            }
        }

    </script>
@endpush
