<div class="row">
    <div class='col-md-4'>
        <x:form.select2 label="Port Code" id="port_id" name="port_id[]" defaultOption="Select Port Code">
            @foreach($port as $row)
            <option value="{{ $row->port_id }}" data-port-code="{{ $row->port_code }}" @if($row->port_code == "AEJEA") selected @endif>{{ $row->port_code }}</option>
            @endforeach
        </x:form.select2>
        <input type="hidden" name="port_code[]" id="port_code" value="AEJEA">`
    </div>
    <div class='col-md-4'>
        <div class='mb-10'>
            <label for="#vendor_id" class='form-label'>Vendor Code</label>
            <select class="form-select" onChange="setVendorPortName('0')" name="vendor_port_id" id="vendor_port_id" data-control="select2" data-placeholder="Vendor Code">
                <option></option>
                @foreach($vendorPort as $rows)
                <option value="{{ $rows->vendor_id }}" data-vendor-name="{{ $rows->vendor_name }}">{{ $rows->vendor_code }}</option>
                @endforeach

            </select>
        </div>
    </div>
    <div class='col-md-4'>
        <div class='mb-10'>
            <label for="#vendor_name" class='form-label '>Vendor Name</label>
            <input id="vendor_port_name" name="vendor_port_name" type="text" class=" form-control" value="" readonly="readonly">
        </div>
    </div>
</div>

@push('js')
<script>
     function setVendorPortName() {

        var $dropdown = $(`#vendor_port_id`);
        var vendorName = $dropdown.find(':selected').data('vendor-name');

        $('#vendor_port_name').val(vendorName);
    }

    $("#port_id").change(function () {
        var $dropdown = $(this);
        var portCode = $dropdown.find(':selected').data('port-code');
        $("#port_code").val(portCode);
    });
</script>
@endpush
