<div>
    <x:form.select2 label="Shipment By" name="shipment_by" placeholder="Select Shipment By" required="false" >
        <option value="SEA AIR">SEA AIR</option>
        <option value="AIR">AIR</option>
    </x-form.select2>


    <div class='mb-2'>
        <label for="#origin_id" class='form-label '>Origin</label>
        <select class=" form-select"
            name="origin_id"
            id="origin"
            data-control="select2"
            data-placeholder="Origin"
           >

        </select>
    </div>
    <div class='mb-2'>
        <label for="#port_destination_name" class='form-label '>Destination</label>
        <select class=" form-select"
            name="port_destination_name"
            id="destination"
            data-control="select2"
            data-placeholder="Destination"
           >

        </select>
    </div>

    <div class='mb-2'>
        <label for="#mother_vessel_name" class='form-label '>Vessel/Carrier</label>
        <select class="form-select"
            name="mother_vessel_name"
            id="vessel"
            data-control="select2"
            data-placeholder="Vessel/Carrier"
           >

        </select>
    </div>

    <div class='mb-2'>
        <label for="#eta" class='form-label '>Eta Transit Hub</label>
        <select class="form-select"
            name="eta"
            id="eta"
            data-control="select2"
            data-placeholder="Eta Transit Hub"
           >

        </select>
    </div>
</div>
@push('js')
<script>
    function origin(){
        $.ajax({
            url: '{{ route('finance.general-wise.shipment.origin',['type'=>$type]) }}',
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                $('#origin').empty();
                $('#origin').append('<option value="" hidden>Select Origin</option>');
                $.each(response.data, function (key, value) {
                    $('#origin').append('<option value="' + value.origin_name + '">' + value.origin_name + '</option>');
                });
            }
        });
    }
    function destination(){
        $.ajax({
            url: '{{ route('finance.general-wise.shipment.destination',['type'=>$type]) }}',
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                $('#destination').empty();
                $('#destination').append('<option value="" hidden>Select Destination</option>');
                $.each(response.data, function (key, value) {
                    $('#destination').append('<option value="' + value.port_destination_name + '">' + value.port_destination_name + '</option>');
                });
            }
        });
    }
    function vessel(){
        $.ajax({
            url: '{{ route('finance.general-wise.shipment.vessel',['type'=>$type]) }}',
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                $('#vessel').empty();
                $('#vessel').append('<option value="" hidden>Select Vessel/Carrier</option>');
                $.each(response.data, function (key, value) {
                    $('#vessel').append('<option value="' + value.mother_vessel_name + '">' + value.mother_vessel_name + '</option>');
                });
            }
        });
    }
    function eta(){
        $.ajax({
            url: '{{ route('finance.general-wise.shipment.eta',['type'=>$type]) }}',
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                $('#eta').empty();
                $('#eta').append('<option value="" hidden>Select Eta Transit Hub</option>');
                $.each(response.data, function (key, value) {
                    $('#eta').append('<option value="' + value.eta + '">' + value.eta + '</option>');
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
