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

        <x-form.select2
            label="Origin"
            name="origin_id"
            id="origin"
            placeholder="Choose"
            :allowClear="false"
            :isFilterShipment="true">
        </x-form.select2>

        <x-form.select2
            label="Destination"
            name="port_destination_name"
            id="destination"
            placeholder="Choose"
            :allowClear="false"
            :isFilterShipment="true">
        </x-form.select2>

        <x-form.select2
            label="Vessel/Carrier"
            name="mother_vessel_name"
            id="vessel"
            placeholder="Choose"
            :allowClear="false"
            :isFilterShipment="true">
        </x-form.select2>

        <x-form.select2
            label="ETA"
            name="eta"
            id="eta"
            placeholder="Choose"
            :allowClear="false"
            :isFilterShipment="true">
        </x-form.select2>

        <div class="filter-group">
            <label class="filter-label">From Date ETD</label>
            <input type="date" class="filter-date" id="from_date_etd" placeholder="mm/dd/yyyy">
        </div>

        <div class="filter-group">
            <label class="filter-label">To Date ETD</label>
            <input type="date" class="filter-date" id="to_date_etd" placeholder="mm/dd/yyyy">
        </div>

        <div class="d-flex flex-column align-items-center">
            <button class="btn-clear" id="btn-clear">Clear Filter</button>
            <button class="btn-filter" id="btn-filter-shipment">Filter</button>
        </div>
    </div>
</div>

@push('js')
    <script>
        const API_BASE = `${window.location.protocol}//${'{!! env('API_ORIGIN') !!}'}`;
        function initializeSelect2WithData(elementId, url, valueField) {
            $.ajax({
                url: url,
                type: 'GET',
                dataType: 'json',
                success: function(response) {
                    // Transform the data
                    const data = response.data.map(function(item) {
                        // Special handling for destination
                        if (elementId === 'destination') {
                            return {
                                id: item[valueField],
                                text: `${item.port_destination_code} - ${item.port_destination_name}`
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
                        // Default handling for other fields
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
                    Swal.fire({
                        icon: 'error',
                        title: 'API Error',
                        text: 'Failed to fetch data. Please try again.'
                    });
                }
            });
        }

        $(document).ready(function() {
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

            // Initialize other dynamic select2s
            initializeSelect2WithData(
                'origin', 
                '{{ route('finance.general-wise.shipment.origin', ['type' => $type]) }}',
                'origin_name'
            );
            
            initializeSelect2WithData(
                'destination',
                '{{ route('finance.general-wise.shipment.destination', ['type' => $type]) }}',
                'port_destination_name'
            );
            
            initializeSelect2WithData(
                'vessel',
                '{{ route('finance.general-wise.shipment.vessel', ['type' => $type]) }}',
                'mother_vessel_name'
            );
            
            initializeSelect2WithData(
                'eta',
                '{{ route('finance.general-wise.shipment.eta', ['type' => $type]) }}',
                'eta'
            );

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

                // Get DataTable instance from window object
                var dataTable = window.shipmentDataTable;
                
                if (dataTable) {
                    dataTable.ajax.reload(null, false);
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'DataTable instance not found'
                    });
                }
            });

            // Add click handler for clear button
            $('#btn-clear').on('click', function() {
                // Clear all select2 fields
                $('#shipment_by, #origin, #destination, #vessel, #eta').val(null).trigger('change');
                
                // Clear date inputs
                $('#from_date_etd, #to_date_etd').val('');
                
                // Reset export button text to initial state
                $('.button-export').text('Export All Data to CSV');
                
                // Add back the SVG icon
                $('.button-export').append(`
                    <svg width="10" height="13" viewBox="0 0 10 13" fill="none" xmlns="http://www.w3.org/2000/svg" class="ms-2">
                        <path d="M1.66667 0C0.747396 0 0 0.728711 0 1.625V11.375C0 12.2713 0.747396 13 1.66667 13H8.33333C9.2526 13 10 12.2713 10 11.375V4.0625H6.66667C6.20573 4.0625 5.83333 3.69941 5.83333 3.25V0H1.66667ZM6.66667 0V3.25H10L6.66667 0ZM4.05469 6.35273L5 7.67051L5.94531 6.35273C6.14323 6.07598 6.53385 6.00996 6.8151 6.20293C7.09635 6.3959 7.16667 6.77676 6.96875 7.05098L5.76302 8.73438L6.97135 10.4152C7.16927 10.692 7.10156 11.0703 6.81771 11.2633C6.53385 11.4563 6.14583 11.3902 5.94792 11.1135L5 9.7957L4.05469 11.1135C3.85677 11.3902 3.46615 11.4563 3.1849 11.2633C2.90365 11.0703 2.83333 10.6895 3.03125 10.4152L4.23698 8.73438L3.02865 7.05352C2.83073 6.77676 2.89844 6.39844 3.18229 6.20547C3.46615 6.0125 3.85417 6.07852 4.05208 6.35527L4.05469 6.35273Z" fill="#F8F8F8"></path>
                    </svg>
                `);
                
                // Uncheck all checkboxes
                $('.row-checkbox').prop('checked', false);
                $('#select_all').prop('checked', false);
                
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
