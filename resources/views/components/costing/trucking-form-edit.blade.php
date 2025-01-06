<div class="costing-table">
    @foreach($costing->truck as $key => $row)
    <div class="row">
        <input type="hidden" name="costing_vendor_truck_id[]" value="{{ $row->id }}">
        <div class='col-md-4'>
            <div class='mb-10'>
                <label for="#container_number" class='form-label '>Container No.</label>
                <input id="container_number" name="container_number[]" type="text" class=" form-control" value="{{ $row->container_no }}" readonly="readonly">
                <input type="hidden" name="bl_number[]" value="{{ $row->value }}">
            </div>
        </div>
        <div class='col-md-4'>
            <div class='mb-10'>
                <label for="#vendor_id" class='form-label'>Vendor Code</label>
                @if($costing->status != 1)
               <input type="hidden" name="vendor_truck_id[]" type="text" class=" form-control" value="{{ $row->vendor_id }}">
               @endif
                <select class="form-select" onChange="setVendorName('{{ $key }}','{{ $row->value }}')" name="vendor_truck_id[]" id="vendor_id_{{ $key }}" data-control="select2" data-placeholder="Vendor Code" @if($costing->status != 1) disabled @endif>
                    <option></option>
                    @foreach($vendorTruck as $rows)
                    <option value="{{ $rows->vendor_id }}" @if($row->vendor_id == $rows->vendor_id) selected @endif data-vendor-name="{{ $rows->vendor_name }}" data-vendor-code="{{ $rows->vendor_code }}">{{ $rows->vendor_code }} - {{ $rows->vendor_name  }}</option>
                    @endforeach

                </select>

            </div>
        </div>
        <div class='col-md-4'>
            <div class='mb-10'>
                <label for="#vendor_name" class='form-label '>Vendor Name</label>
                <input id="vendor_name_{{ $key }}" value="{{ $row->vendor_name }}" name="vendor_truck_name[]" type="text" class=" form-control" value="" readonly="readonly">
            </div>
        </div>
    </div>
    @endforeach
</div>

@push('js')
<script>
 function setVendorName(key,bl) {

        var $dropdown = $(`#vendor_id_${key}`);
        var vendorId = $dropdown.val();
        var vendorName = $dropdown.find(':selected').data('vendor-name');
        var vendorCode = $dropdown.find(':selected').data('vendor-code');
        $('#vendor_name_' + key).val(vendorName);
       var vendorType = 'truck-'+bl+'-'+vendorCode;
       if(bl != ''){
        setChargeBl(vendorId,vendorName,vendorCode, bl, vendorType,'LAND','truck-'+key);
       }
    }
</script>
@endpush
