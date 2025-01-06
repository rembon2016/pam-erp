<div class="costing-table">
    @foreach($loading as $key => $row)
    <div class="row">
        <div class='col-md-4'>
            <div class='mb-10'>
                <label for="#container_number" class='form-label '>Container No.</label>
                <input id="container_number" name="container_number[]" type="text" class=" form-control" value="{{ $row->container_number }}" readonly="readonly">
                <input type="hidden" id="index_trucking_{{ $key }}" value="">
                <input type="hidden" name="bl_number[]" value="{{ $row->bl->bl_number }}">
            </div>
        </div>
        <div class='col-md-4'>
            <div class='mb-10'>
                <label for="#vendor_id" class='form-label'>Vendor Code</label>
                <select class="form-select" onChange="setVendorName('{{ $key }}', '{{ $row->bl->bl_number }}')" name="vendor_truck_id[]" id="vendor_id_{{ $key }}" data-control="select2" data-placeholder="Vendor Code">
                    <option></option>
                    @foreach($vendorTruck as $rows)
                    <option value="{{ $rows->vendor_id }}" data-vendor-name="{{ $rows->vendor_name }}" data-vendor-code="{{ $rows->vendor_code }}">{{ $rows->vendor_code }} - {{ $rows->vendor_name  }}</option>
                    @endforeach

                </select>
            </div>
        </div>
        <div class='col-md-4'>
            <div class='mb-10'>
                <label for="#vendor_name" class='form-label '>Vendor Name</label>
                <input id="vendor_name_{{ $key }}" name="vendor_truck_name[]" type="text" class=" form-control" value="" readonly="readonly">
            </div>
        </div>
    </div>
    @endforeach
</div>

@push('js')
<script>
 function setVendorName(ke,bl) {

        var $dropdown = $(`#vendor_id_${ke}`);
        var vendorId = $dropdown.val();
        var vendorName = $dropdown.find(':selected').data('vendor-name');
         var vendorCode = $dropdown.find(':selected').data('vendor-code');
         console.log(vendorName);
        $('#vendor_name_' + ke).val(vendorName);
        var vendorType = 'truck-'+bl+'-'+vendorCode;
        setChargeBl(vendorId,vendorName,vendorCode, bl, vendorType,'LAND','truck-'+ke);
 }
</script>
@endpush
