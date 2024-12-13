<div>
    <div class="filter-container">
        <x-form.select2
            label="Shipment By"
            name="shipment_by"
            id="shipment_by"
            placeholder="Choose"
            :allowClear="false"
            :isFilterShipment="true">
        </x-form.select2>

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
                // Get DataTable instance from window object
                var dataTable = window.shipmentDataTable;
                
                if (dataTable) {
                    dataTable.ajax.reload(null, false);
                } else {
                    console.error('DataTable instance not found');
                }
            });

            // Add click handler for clear button
            $('#btn-clear').on('click', function() {
                // Clear all select2 fields
                $('#shipment_by, #origin, #destination, #vessel, #eta').val(null).trigger('change');
                
                // Clear date inputs
                $('#from_date_etd, #to_date_etd').val('');
                
                // Get the DataTable instance and reload
                var dataTable = $('#datatable').DataTable();
                if (dataTable) {
                    dataTable.ajax.reload();
                }
            });
        });
    </script>
@endpush
