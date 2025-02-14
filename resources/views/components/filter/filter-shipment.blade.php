@props(['type', 'tableId'])

<x:layout.modal.filter-modal>
    <div class="col-12">
        {{-- <x-form.select2
            label="Shipment By"
            name="shipment_by"
            id="shipment_by"
            placeholder="Choose"
            :allowClear="false"
            :isFilterShipment="true">
        </x-form.select2> --}}

        @if(in_array($type, ['seaimport', 'seaexport', 'airimport', 'airexport', 'warehouse', 'trucking', 'courier']))
            <x-form.select2
                label="Status Shipment"
                name="status_id"
                id="status"
                placeholder="Choose"
                :allowClear="false"
                :isFilterShipment="true">
            </x-form.select2>
        @endif

        @if(in_array($type, ['seaair', 'crossair', 'seaimport', 'airimport']))
            <x-form.select2
                label="Origin"
                name="origin_id"
                id="origin"
                placeholder="Choose"
                :allowClear="false"
                :isFilterShipment="true">
            </x-form.select2>
        @endif

        @if(in_array($type, ['seaair', 'crossair', 'seaexport', 'airexport']))
            <x-form.select2
                label="Destination"
                name="port_destination_name"
                id="destination"
                placeholder="Choose"
                :allowClear="false"
                :isFilterShipment="true">
            </x-form.select2>
        @endif

        @if(in_array($type, ['seaair', 'crossair', 'seaimport', 'seaexport']))
            <x-form.select2
                label="Vessel/Carrier"
                name="mother_vessel_name"
                id="vessel"
                placeholder="Choose"
                :allowClear="false"
                :isFilterShipment="true">
            </x-form.select2>
        @endif

        @if(in_array($type, ['airimport', 'airexport']))
            <x-form.select2
                label="Carrier"
                name="carrier"
                id="carrier"
                placeholder="Choose"
                :allowClear="false"
                :isFilterShipment="true">
            </x-form.select2>
        @endif

        @if(!in_array($type, ['warehouse', 'trucking', 'courier']))
            <x-form.select2
                label="ETA"
                name="eta"
                id="eta"
                placeholder="Choose"
                :allowClear="false"
                :isFilterShipment="true">
            </x-form.select2>
        @endif

        @if(in_array($type, ['seaair', 'crossair']))
            <div class="mb-2 mt-2">
                <label class="form-label">From Date ETD</label>
                <input type="date" class="form-control" id="from_date_etd" placeholder="mm/dd/yyyy">
            </div>

            <div class="mb-2 mt-2">
                <label class="form-label">To Date ETD</label>
                <input type="date" class="form-control" id="to_date_etd" placeholder="mm/dd/yyyy">
            </div>
        @endif

        @if(in_array($type, ['warehouse', 'trucking']))
            <x-form.select2
                label="Shipper"
                name="shipper"
                id="shipper"
                placeholder="Choose"
                :allowClear="false"
                :isFilterShipment="true">
            </x-form.select2>

            <x-form.select2
                label="Consignee"
                name="consignee"
                id="consignee"
                placeholder="Choose"
                :allowClear="false"
                :isFilterShipment="true">
            </x-form.select2>
        @endif
    </div>
</x:layout.modal.filter-modal>

@push('js')
    <script>
        const API_BASE = `${window.location.protocol}//${'{!! in_array($type, ['seaair', 'crossair']) ? env('API_ORIGIN') : env('API_DXB') !!}'}`;
        
        function getSelect2Value(elementId) {
            try {
                const element = $(`#${elementId}`);
                if (element.length === 0) return null;
                
                const select2Data = element.select2('data');
                if (!select2Data || !select2Data[0]) return null;
                
                return select2Data[0].text;
            } catch (error) {
                console.warn(`Error getting select2 value for ${elementId}:`, error);
                return null;
            }
        }
        
        function updateFilterValues(shouldShow = false) {
            const filterValues = [];
            
            const status = getSelect2Value('status');
            const origin = getSelect2Value('origin');
            const destination = getSelect2Value('destination');
            const vessel = getSelect2Value('vessel');
            const carrier = getSelect2Value('carrier');
            const eta = getSelect2Value('eta');
            
            const fromDateEtd = $('#from_date_etd').val();
            const toDateEtd = $('#to_date_etd').val();
            
            const shipper = getSelect2Value('shipper');
            const consignee = getSelect2Value('consignee');

            function formatDate(dateStr) {
                if (!dateStr) return '';
                const date = new Date(dateStr);
                return date.toLocaleDateString('en-GB', {
                    day: '2-digit',
                    month: 'short',
                    year: 'numeric'
                });
            }

            if (status) filterValues.push(`<span class="badge bg-light text-dark me-2">Status: ${status}</span>`);
            if (origin) filterValues.push(`<span class="badge bg-light text-dark me-2">Origin: ${origin}</span>`);
            if (destination) filterValues.push(`<span class="badge bg-light text-dark me-2">Destination: ${destination}</span>`);
            if (vessel) filterValues.push(`<span class="badge bg-light text-dark me-2">Vessel/Carrier: ${vessel}</span>`);
            if (carrier) filterValues.push(`<span class="badge bg-light text-dark me-2">Carrier: ${carrier}</span>`);
            if (eta) filterValues.push(`<span class="badge bg-light text-dark me-2">ETA: ${eta}</span>`);

            if (fromDateEtd || toDateEtd) {
                const formattedFromDate = formatDate(fromDateEtd);
                const formattedToDate = formatDate(toDateEtd);
                
                if (fromDateEtd && toDateEtd) {
                    filterValues.push(`<span class="badge bg-light text-dark me-2">ETD: ${formattedFromDate} to ${formattedToDate}</span>`);
                } else if (fromDateEtd) {
                    filterValues.push(`<span class="badge bg-light text-dark me-2">From ETD: ${formattedFromDate}</span>`);
                } else if (toDateEtd) {
                    filterValues.push(`<span class="badge bg-light text-dark me-2">To ETD: ${formattedToDate}</span>`);
                }
            }

            if (shipper) filterValues.push(`<span class="badge bg-light text-dark me-2">Shipper: ${shipper}</span>`);
            if (consignee) filterValues.push(`<span class="badge bg-light text-dark me-2">Consignee: ${consignee}</span>`);

            // Create filter result div if it doesn't exist
            const filterResultDiv = $('.shipment-filter-result');
            if (filterResultDiv.length === 0) {
                const newFilterResultDiv = `
                    <div class="filter-result shipment-filter-result mb-3" style="display: none;">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <span class="fw-bold">Filter by </span>
                                <span class="filter-values"></span>
                            </div>
                            <button type="button" class="btn btn-sm btn-light-danger" id="clear-filter-btn">
                                <i class="fas fa-times me-1"></i>Clear Filter
                            </button>
                        </div>
                    </div>
                `;
                $('.card-body').prepend(newFilterResultDiv);

                $(document).on('click', '#clear-filter-btn', function() {
                    $('#reset-filter-btn').click();
                });
            }

            const filterValuesElement = $('.shipment-filter-result .filter-values');
            const filterResultElement = $('.shipment-filter-result');

            if (shouldShow && filterValues.length > 0) {
                filterValuesElement.html(filterValues.join(''));
                filterResultElement.show();
            } else {
                filterValuesElement.html('');
                filterResultElement.hide();
            }
        }

        function initializeSelect2WithData(elementId, url, valueField) {
            $.ajax({
                url: url,
                type: 'GET',
                dataType: 'json',
                success: function(response) {
                    const data = response.data.map(function(item) {
                        if (elementId === 'status') {
                            return {
                                id: item.status_name,
                                text: item.status_name,
                                status_id: item.status_id
                            };
                        }
                        if (elementId === 'destination') {
                            return {
                                id: item[valueField],
                                text: item.port_destination_code ? `${item.port_destination_code} - ${item.port_destination_name}` : item.port_destination_name
                            };
                        }
                        if (elementId === 'vessel') {
                            return {
                                id: item[valueField],
                                text: `${item.mother_vessel_name} - ${item.voyage_number_mother}`,
                                mother_vessel_id: item.mother_vessel_id,
                                voyage_number_mother: item.voyage_number_mother
                            };
                        }
                        if (elementId === 'eta') {
                            const date = new Date(item[valueField]);
                            const formattedDate = date.toLocaleDateString('en-GB', {
                                day: '2-digit',
                                month: 'short',
                                year: 'numeric'
                            });
                            return {
                                id: item[valueField],
                                text: formattedDate
                            };
                        }
                        if (elementId === 'carrier') {
                            return {
                                id: item.carrier_id,
                                text: item.carrier_name,
                                carrier_id: item.carrier_id
                            };
                        }
                        if (elementId === 'shipper') {
                            return {
                                id: item.from_shipper,
                                text: item.shipper_name,
                                shipper_id: item.from_shipper
                            };
                        }
                        if (elementId === 'consignee') {
                            return {
                                id: item.to_consignee,
                                text: item.consigne_name,
                                consignee_id: item.to_consignee
                            };
                        }

                        return {
                            id: item[valueField],
                            text: item[valueField]
                        };
                    });

                    $(`#${elementId}`).select2({
                        placeholder: 'Choose',
                        allowClear: false,
                        data: data,
                        dropdownParent: $('.sidebar-layout-filter'),
                        closeOnSelect: true,
                        matcher: function(params, data) {
                            if ($.trim(params.term) === '') {
                                return data;
                            }

                            if (typeof data.text === 'undefined') {
                                return null;
                            }

                            if (data.text.toLowerCase().indexOf(params.term.toLowerCase()) > -1) {
                                return data;
                            }

                            return null;
                        }
                    }).val(null).trigger('change');

                    $(`#${elementId}`).on('change', function(e) {
                        $(this).select2('close');
                    });
                },
                error: function(xhr, status, error) {
                    console.error(`Error loading ${elementId}:`, error);
                }
            });
        }

        $(document).ready(function() {
            const currentType = '{{ $type }}';

            $('#shipment_by').select2({
                placeholder: 'Choose',
                allowClear: false,
                data: [
                    { id: 'SEA AIR', text: 'SEA AIR' },
                    { id: 'AIR', text: 'AIR' }
                ],
                dropdownParent: $('.sidebar-layout-filter'),
                closeOnSelect: true
            }).val(null).trigger('change');

            if (['seaair', 'crossair', 'seaimport', 'airimport'].includes(currentType)) {
                initializeSelect2WithData(
                    'origin',
                    '{{ route('finance.general-wise.shipment.origin', ['type' => $type]) }}',
                    'origin_name'
                );
            }

            if (['seaair', 'crossair', 'seaexport', 'airexport'].includes(currentType)) {
                initializeSelect2WithData(
                    'destination',
                    '{{ route('finance.general-wise.shipment.destination', ['type' => $type]) }}',
                    'port_destination_name'
                );
            }

            if (['seaair', 'crossair', 'seaimport', 'seaexport'].includes(currentType)) {
                initializeSelect2WithData(
                    'vessel',
                    '{{ route('finance.general-wise.shipment.vessel', ['type' => $type]) }}',
                    'mother_vessel_name'
                );
            }

            if (['airimport', 'airexport'].includes(currentType)) {
                initializeSelect2WithData(
                    'carrier',
                    '{{ route('finance.general-wise.shipment.carrier', ['type' => $type]) }}',
                    'carrier_name'
                );
            }

            if (!['warehouse', 'trucking', 'courier'].includes(currentType)) {
                initializeSelect2WithData(
                    'eta',
                    '{{ route('finance.general-wise.shipment.eta', ['type' => $type]) }}',
                    'eta'
                );
            }

            if (['seaimport', 'seaexport', 'airimport', 'airexport', 'warehouse', 'trucking', 'courier'].includes(currentType)) {
                initializeSelect2WithData(
                    'status',
                    '{{ route('finance.general-wise.shipment.statusShipment', ['type' => $type]) }}',
                    'status'
                );
            }

            if (['trucking', 'warehouse'].includes(currentType)) {
                initializeSelect2WithData(
                    'shipper',
                    '{{ route('finance.general-wise.shipment.shipper', ['type' => $type]) }}',
                    'shipper_name'
                );

                initializeSelect2WithData(
                    'consignee',
                    '{{ route('finance.general-wise.shipment.consignee', ['type' => $type]) }}',
                    'consignee_name'
                );
            }

            $('#from_date_etd, #to_date_etd').off('change');

            $('.filter-buttons button[type="submit"]').not('#reset-filter-btn').on('click', function(e) {
                e.preventDefault();
                
                const fromDateEtd = $('#from_date_etd').val();
                const toDateEtd = $('#to_date_etd').val();

                if ((fromDateEtd && !toDateEtd) || (!fromDateEtd && toDateEtd)) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Validation Error',
                        text: 'Both From Date ETD and To Date ETD must be filled if one is provided'
                    });
                    return;
                }

                if (fromDateEtd && toDateEtd) {
                    const fromDate = new Date(fromDateEtd);
                    const toDate = new Date(toDateEtd);

                    if (toDate < fromDate) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Validation Error',
                            text: 'To Date ETD cannot be earlier than From Date ETD'
                        });
                        return;
                    }
                }

                const filterValues = {
                    origin_name: $('#origin').val() || '',
                    port_destination_name: $('#destination').val() || '',
                    mother_vessel_name: $('#vessel').val() || '',
                    status_shipment: $('#status').length ? $('#status').select2('data')[0]?.text || '' : '',
                    mother_vessel_id: $('#vessel').length ? $('#vessel').select2('data')[0]?.mother_vessel_id || '' : '',
                    voyage_number_mother: $('#vessel').length ? $('#vessel').select2('data')[0]?.voyage_number_mother || '' : '',
                    carrier_id: $('#carrier').length ? $('#carrier').select2('data')[0]?.carrier_id || '' : '',
                    from_shipper: $('#shipper').length ? $('#shipper').select2('data')[0]?.shipper_id || '' : '',
                    to_consignee: $('#consignee').length ? $('#consignee').select2('data')[0]?.consignee_id || '' : '',
                    etd: fromDateEtd && toDateEtd ? `${fromDateEtd},${toDateEtd}` : '',
                    status: 6,
                    shipment_by: (() => {
                        const type = '{{ $type }}';
                        switch(type) {
                            case 'seaair': return 'SEAAIR';
                            case 'crossair': return 'AIR';
                            case 'seaimport': return 'SEAIMPORT';
                            case 'seaexport': return 'SEAEXPORT';
                            case 'airimport': return 'AIRIMPORT';
                            case 'airexport': return 'AIREXPORT';
                            case 'warehouse': return 'WAREHOUSE';
                            case 'trucking': return 'TRUCKING';
                            case 'courier': return 'COURIER';
                            default: return '';
                        }
                    })()
                };

                var dataTable = window.shipmentDataTable;

                if (dataTable) {
                    dataTable.ajax.reload(null, false);

                    updateFilterValues(true);

                    const totalOrderUrl = `${API_BASE}/api/shippinginstruction/totalorder`;

                    $.ajax({
                        url: totalOrderUrl,
                        type: 'GET',
                        data: filterValues,
                        success: function(response) {
                            $('#totalOrderSection').show();

                            const formatNumber = (value) => {
                                if (value === null || value === undefined || value === '') return '-';
                                const numValue = parseFloat(value);
                                if (isNaN(numValue)) return '-';
                                return numValue.toLocaleString('en-US', {
                                    minimumFractionDigits: 0,
                                    maximumFractionDigits: 2
                                });
                            };

                            $('#totalQty').text(formatNumber(response?.data?.qty || "-"));
                            $('#totalChargable').text(formatNumber(response?.data?.chargable || "-"));
                            $('#totalGrossWeight').text(formatNumber(response?.data?.gross_weight || "-"));
                            $('#totalMeasurement').text(formatNumber(response?.data?.measurement || "-"));
                            $('#totalTeus').text(formatNumber(response?.data?.container || "-"));

                            $('.sidebar-closes').click();
                        },
                        error: function(xhr, status, error) {
                            console.error('Error fetching total order data:', error);
                            $('#totalOrderSection').hide();
                            $('#totalQty, #totalChargable, #totalGrossWeight, #totalMeasurement, #totalTeus').text('-');
                            $('.sidebar-closes').click();
                        }
                    });
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'DataTable instance not found'
                    });
                }
            });

            $('#reset-filter-btn').on('click', function(e) {
                e.preventDefault();
                e.stopPropagation();
                
                $('#shipment_by, #origin, #destination, #vessel, #eta, #status, #carrier, #shipper, #consignee').each(function() {
                    if ($(this).data('select2')) {
                        $(this).val(null).trigger('change');
                    }
                });

                $('#from_date_etd, #to_date_etd').val('');
                $('.button-export-text').text('Export All Data to CSV');
                $('.row-checkbox, #select_all').prop('checked', false);
                $('#totalOrderSection').hide();

                var dataTable = window.shipmentDataTable;
                if (dataTable) {
                    dataTable.ajax.reload(function() {
                        updateFilterValues(false);
                        $('.sidebar-closes').click();
                    }, false);
                } else {
                    console.error('DataTable instance not found');
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'DataTable instance not found'
                    });
                }
                
                return false;
            });
        });

        $(document).ready(function() {
            $(document).on('click', function(e) {
                const $sidebar = $('.toggle-sidebar.open-filter.show-layout');
                const $target = $(e.target);
                
                if ($sidebar.length > 0) {
                    if (!$target.closest('.toggle-sidebar').length && 
                        !$target.closest('.filter-button').length && 
                        !$target.closest('.filter-btn').length && 
                        !$target.closest('.btn-filter').length &&
                        !$target.closest('.btn-filters').length) {
                        
                        $('.sidebar-closes').trigger('click');
                    }
                }
            });
        });
    </script>
@endpush
