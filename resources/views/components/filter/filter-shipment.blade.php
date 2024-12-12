<div>
    <div class="filter-container">
        <div class="filter-group">
            <label class="filter-label">Shipment By</label>
            <select class="filter-select" name="shipment_by">
                <option value="" hidden>Choose</option>
                <option value="SEA AIR">SEA AIR</option>
                <option value="AIR">AIR</option>
            </select>
        </div>

        <div class="filter-group">
            <label class="filter-label">Origin</label>
            <select class="filter-select" name="origin_id" id="origin">
                <option value="" hidden>Choose</option>
            </select>
        </div>

        <div class="filter-group">
            <label class="filter-label">Destination</label>
            <select class="filter-select" name="port_destination_name" id="destination">
                <option value="" hidden>Choose</option>
            </select>
        </div>

        <div class="filter-group">
            <label class="filter-label">Vessel/Carrier</label>
            <select class="filter-select" name="mother_vessel_name" id="vessel">
                <option value="" hidden>Choose</option>
            </select>
        </div>

        <div class="filter-group">
            <label class="filter-label">ETA Transit Hub</label>
            <select class="filter-select" name="eta" id="eta">
                <option value="" hidden>Choose</option>
            </select>
        </div>

        <div class="filter-group">
            <label class="filter-label">From Date ETD</label>
            <input type="date" class="filter-date" placeholder="mm/dd/yyyy">
        </div>

        <div class="filter-group">
            <label class="filter-label">To Date ETD</label>
            <input type="date" class="filter-date" placeholder="mm/dd/yyyy">
        </div>

        <div class="d-flex flex-column align-items-center">
            <button class="btn-clear">Clear Filter</button>
            <button class="btn-filter">Filter</button>
        </div>
    </div>
</div>

@push('js')
    <script>
        function origin() {
            $.ajax({
                url: '{{ route('finance.general-wise.shipment.origin', ['type' => $type]) }}',
                type: 'GET',
                dataType: 'json',
                success: function(response) {
                    $('#origin').empty();
                    $('#origin').append('<option value="" hidden>Choose</option>');
                    $.each(response.data, function(key, value) {
                        $('#origin').append('<option value="' + value.origin_name + '">' + value
                            .origin_name + '</option>');
                    });
                }
            });
        }

        function destination() {
            $.ajax({
                url: '{{ route('finance.general-wise.shipment.destination', ['type' => $type]) }}',
                type: 'GET',
                dataType: 'json',
                success: function(response) {
                    $('#destination').empty();
                    $('#destination').append('<option value="" hidden>Choose</option>');
                    $.each(response.data, function(key, value) {
                        $('#destination').append('<option value="' + value.port_destination_name +
                            '">' + value.port_destination_name + '</option>');
                    });
                }
            });
        }

        function vessel() {
            $.ajax({
                url: '{{ route('finance.general-wise.shipment.vessel', ['type' => $type]) }}',
                type: 'GET',
                dataType: 'json',
                success: function(response) {
                    $('#vessel').empty();
                    $('#vessel').append('<option value="" hidden>Choose</option>');
                    $.each(response.data, function(key, value) {
                        $('#vessel').append('<option value="' + value.mother_vessel_name + '">' + value
                            .mother_vessel_name + '</option>');
                    });
                }
            });
        }

        function eta() {
            $.ajax({
                url: '{{ route('finance.general-wise.shipment.eta', ['type' => $type]) }}',
                type: 'GET',
                dataType: 'json',
                success: function(response) {
                    $('#eta').empty();
                    $('#eta').append('<option value="" hidden>Choose</option>');
                    $.each(response.data, function(key, value) {
                        $('#eta').append('<option value="' + value.eta + '">' + value.eta +
                            '</option>');
                    });
                }
            });
        }
        origin();
        destination();
        vessel();
        eta();
    </script>
@endpush
