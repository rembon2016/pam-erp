<div>
    <div class="filter-container">
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
            <div class="filter-group">
                <label class="filter-label">From Date ETD</label>
                <input type="date" class="filter-date" id="from_date_etd" placeholder="mm/dd/yyyy">
            </div>

            <div class="filter-group">
                <label class="filter-label">To Date ETD</label>
                <input type="date" class="filter-date" id="to_date_etd" placeholder="mm/dd/yyyy">
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

        

        <div class="d-flex flex-column align-items-center">
            <button class="btn-clear" id="btn-clear">Clear Filter</button>
            <button class="btn-filter" id="btn-filter-shipment">Filter</button>
        </div>
    </div>
</div>

@push('js')
    <script>
        const API_BASE = `${window.location.protocol}//${'{!! in_array($type, ['seaair', 'crossair']) ? env('API_ORIGIN') : env('API_DXB') !!}'}`;
        function initializeSelect2WithData(elementId, url, valueField) {
            $.ajax({
                url: url,
                type: 'GET',
                dataType: 'json',
                success: function(response) {
                    // Transform the data
                    const data = response.data.map(function(item) {
                        // Special handling for status
                        if (elementId === 'status') {
                            return {
                                id: item.status_name,
                                text: item.status_name,
                                status_id: item.status_id
                            };
                        }
                        // Special handling for destination
                        if (elementId === 'destination') {
                            return {
                                id: item[valueField],
                                text: item.port_destination_code ? `${item.port_destination_code} - ${item.port_destination_name}` : item.port_destination_name
                            };
                        }
                        // Special handling for vessel
                        if (elementId === 'vessel') {
                            return {
                                id: item[valueField],
                                text: `${item.mother_vessel_name} - ${item.voyage_number_mother}`,
                                mother_vessel_id: item.mother_vessel_id,
                                voyage_number_mother: item.voyage_number_mother
                            };
                        }
                        // Special handling for ETA
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
                        // Special handling for carrier
                        if (elementId === 'carrier') {
                            return {
                                id: item.carrier_id,  // Use carrier_id as the id
                                text: item.carrier_name, // Display carrier_name as the text
                                carrier_id: item.carrier_id
                            };
                        }
                        // Special handling for shipper
                        if (elementId === 'shipper') {
                            return {
                                id: item.from_shipper,
                                text: item.shipper_name,
                                shipper_id: item.from_shipper
                            };
                        }
                        // Special handling for consignee
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

                    // Initialize select2 with the data
                    $(`#${elementId}`).select2({
                        placeholder: 'Choose',
                        allowClear: false,
                        data: data,
                        initSelection: function(element, callback) {
                            callback(null);
                        },
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
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching data for ' + elementId + ':', error);
                    console.error('Response:', xhr.responseText);
                    Swal.fire({
                        icon: 'error',
                        title: 'API Error',
                        text: 'Failed to fetch data. Please try again.'
                    });
                }
            });
        }

        $(document).ready(function() {
            // Get current page type
            const currentType = '{{ $type }}';

            // Initialize shipment_by select2 with static data
            $('#shipment_by').select2({
                placeholder: 'Choose',
                allowClear: false,
                data: [
                    { id: 'SEA AIR', text: 'SEA AIR' },
                    { id: 'AIR', text: 'AIR' }
                ],
                initSelection: function(element, callback) {
                    callback(null);
                }
            }).val(null).trigger('change');

            // Initialize other dynamic select2s based on conditions
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

            // Only initialize carrier select2 for airimport and airexport
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

            // Update the filter button click handler
            $('#btn-filter-shipment').on('click', function() {
                const fromDateEtd = $('#from_date_etd').val();
                const toDateEtd = $('#to_date_etd').val();

                // Check if one date is filled but the other isn't
                if ((fromDateEtd && !toDateEtd) || (!fromDateEtd && toDateEtd)) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Validation Error',
                        text: 'Both From Date ETD and To Date ETD must be filled if one is provided'
                    });
                    return; // Stop execution if validation fails
                }

                // Check if dates are filled and compare them
                if (fromDateEtd && toDateEtd) {
                    const fromDate = new Date(fromDateEtd);
                    const toDate = new Date(toDateEtd);

                    if (toDate < fromDate) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Validation Error',
                            text: 'To Date ETD cannot be earlier than From Date ETD'
                        });
                        return; // Stop execution if validation fails
                    }
                }

                // Get all filter values
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
                    status: 6, // Add fixed status parameter
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

                // Get DataTable instance from window object
                var dataTable = window.shipmentDataTable;
                
                if (dataTable) {
                    dataTable.ajax.reload(null, false);

                    // Make the total order API call
                    const totalOrderUrl = `${API_BASE}/api/shippinginstruction/totalorder`;
                    
                    $.ajax({
                        url: totalOrderUrl,
                        type: 'GET',
                        data: filterValues,
                        success: function(response) {
                            // Show the total order section
                            $('#totalOrderSection').show();

                            // Helper function to format numbers
                            const formatNumber = (value) => {
                                if (value === null || value === undefined || value === '') return '-';
                                const numValue = parseFloat(value);
                                if (isNaN(numValue)) return '-';
                                return numValue.toLocaleString('en-US', {
                                    minimumFractionDigits: 0,
                                    maximumFractionDigits: 2
                                });
                            };

                            // Update the values with proper formatting
                            $('#totalQty').text(formatNumber(response?.data?.qty || "-"));
                            $('#totalChargable').text(formatNumber(response?.data?.chargable || "-"));
                            $('#totalGrossWeight').text(formatNumber(response?.data?.gross_weight || "-"));
                            $('#totalMeasurement').text(formatNumber(response?.data?.measurement || "-"));
                            $('#totalTeus').text(formatNumber(response?.data?.container || "-"));
                        },
                        error: function(xhr, status, error) {
                            console.error('Error fetching total order data:', error);
                            $('#totalOrderSection').hide();
                            
                            // Reset all values to '-' on error
                            $('#totalQty, #totalChargable, #totalGrossWeight, #totalMeasurement, #totalTeus').text('-');
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

            // Update clear button handler to hide total order section
            $('#btn-clear').on('click', function() {
                // Clear all select2 fields
                $('#shipment_by, #origin, #destination, #vessel, #eta, #status, #carrier, #shipper, #consignee').val(null).trigger('change');
                
                // Clear date inputs
                $('#from_date_etd, #to_date_etd').val('');
                
                // Reset export button text to initial state
                $('.button-export-text').text('Export All Data to CSV');
                
                // Uncheck all checkboxes
                $('.row-checkbox').prop('checked', false);
                $('#select_all').prop('checked', false);
                
                // Hide total order section
                $('#totalOrderSection').hide();
                
                // Get the DataTable instance and reload
                var dataTable = $('#datatable').DataTable();
                if (dataTable) {
                    dataTable.ajax.reload();
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'DataTable instance not found'
                    });
                }
            });
        });
    </script>
@endpush
