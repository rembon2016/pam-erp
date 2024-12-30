<div class="row costing-table">
    <div class='col-md-4'>

        @if($costing?->port != null)
        <input type="hidden" name="costing_vendor_port_id" value="{{ $row->port->id ?? "" }}">
        @endif
        @php
            $disabled = "";
        @endphp
        <label for="#vendor_id" class='form-label'>Port Code</label>
        <select class="form-select" name="port_id" id="port_id"  data-placeholder="Port Code" @if($costing?->status != 1 && $costing != null) disabled @endif>

        </select>
        <input type="hidden" name="port_code" id="port_code" value="AEJEA">`
    </div>
    <div class='col-md-4'>
        <div class='mb-10'>
            <label for="#vendor_id" class='form-label'>Vendor Code</label>
            @if($costing?->status != 1 && $costing != null)
                <input type="hidden" name="vendor_port_id" type="text" class=" form-control" value="{{ $costing?->port?->vendor_id }}">
            @endif
            <select class="form-select" onChange="setVendorPortName('0')" name="vendor_port_id" id="vendor_port_id" data-control="select2" data-placeholder="Vendor Code" @if($costing?->status != 1 && $costing != null) disabled @endif>
                <option></option>
                @foreach($vendorPort as $rows)
                <option value="{{ $rows->vendor_id }}" @if($costing?->port != null && $costing?->port?->vendor_id == $rows->vendor_id) selected @endif data-vendor-name="{{ $rows->vendor_name }}" data-vendor-code="{{ $rows->vendor_code }}">{{ $rows->vendor_code }}</option>
                @endforeach

            </select>
        </div>
    </div>
    <div class='col-md-4'>
        <div class='mb-10'>
            <label for="#vendor_name" class='form-label '>Vendor Name</label>
            <input id="vendor_port_name" name="vendor_port_name" value="{{ $costing?->port != null ? $costing?->port?->vendor_name : '' }}" type="text" class=" form-control" value="" readonly="readonly">
        </div>
    </div>
</div>

@push('js')
<script>
     function setVendorPortName() {

        var $dropdown = $(`#vendor_port_id`);
        var vendorId = $dropdown.val();
        var vendorName = $dropdown.find(':selected').data('vendor-name');
        var vendorCode = $dropdown.find(':selected').data('vendor-code');
        $('#vendor_port_name').val(vendorName);

        @foreach($bl as $k => $row)
             setChargeBl(vendorId,vendorName,vendorCode, '{{ $row->bl_number }}', 'port','LAND');
        @endforeach

    }

    $('#port_id').select2({
        ajax: {
            url: '{{ route("finance.costing.sea-air.port") }}',
            dataType: 'json',
            delay: 250, // Delay for debouncing user input
            data: function (params) {
                return {
                    search: params.term, // Search term
                    page: params.page || 1 // Current page
                };
            },
            processResults: function (data) {
                console.log(data);
                return {
                    results: data.results.map(item => ({
                        id: item.port_id, // Adjust as per your model
                        text: item.port_code // Adjust as per your model
                    })),
                    pagination: {
                        more: data.pagination.more
                    }
                };
            },
            cache: true
        },
        placeholder: 'Select Port',

    });

    const defaultPortId = "b384b57a-142f-4b64-8c83-3e5b0601cd3c"; // Replace with your default value
    const defaultPortCode = "AEJEA"; // Replace with the corresponding text for the default value

    // Add the default option and select it
    @if($costing?->port != null)
        const defaultOption = new Option("{{ $costing?->port?->port_code }}", "{{ $costing?->port?->id }}", true, true);
        $('#port_id').append(defaultOption).trigger('change');
    @else
        const defaultOption = new Option(defaultPortCode, defaultPortId, true, true);
        $('#port_id').append(defaultOption).trigger('change');
    @endif

    $("#port_id").change(function () {
        var $dropdown = $(this);
        var portCode = $dropdown.find(':selected').data('port-code');
        $("#port_code").val(portCode);
    });


</script>
@endpush
