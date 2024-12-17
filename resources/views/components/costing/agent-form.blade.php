<div class="container mt-4">
 <div style="display: flex; align-items: center; justify-content: end;">
            <button type="button" id="add-row" class="btn btn-icon btn-success rounded" style="height: 30px; width: 30px;margin-right:5px;">
                <i class="fa fa-plus pe-0"></i>
            </button>
            <button type="button" id="remove-row" class="btn btn-icon btn-warning rounded" style="height: 30px; width: 30px;">
                <i class="fa fa-minus pe-0"></i>
            </button>
        </div>
    <div id="input-rows">
        @if(!empty($costing))
        @foreach($costing->agent as $key => $row)
        <div class="row mb-3 align-items-center" id="row-{{ $key }}">
            <input type="hidden" name="costing_vendor_agent_id[]" value="{{ $row->id }}">
            <div class="col-md-4">
                <label for="mawb_{{ $key }}" class="form-label">MAWB</label>
                <input type="text" class="form-control" id="mawb_{{ $key }}" value="{{ $row->mawb }}" name="mawb[]" placeholder="Type here..">
            </div>
            <div class="col-md-4">
                <label for="vendor_air_id_{{ $key }}" class="form-label">Vendor Code</label>
                <select class="form-select vendor-select" onchange="setVendorAirName(0)
                                                " data-control="select2" id="vendor_air_id_{{ $key }}" name="vendor_air_id[]" data-key="{{ $key }}">
                    <option>Select Vendor</option>
                    @foreach($vendorAir as $rows)
                    <option value="{{ $rows->vendor_id }}" @if($rows->vendor_id == $row->vendor_id) selected @endif data-vendor-name="{{ $rows->vendor_name }}">{{ $rows->vendor_code }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-4">
                <label for="vendor_air_name_{{ $key }}" class="form-label">Vendor Name</label>
                <input type="text" class="form-control" id="vendor_air_name_{{ $key }}" value="{{ $row->vendor_name }}" name="vendor_air_name[]" readonly>
            </div>
        </div>
        @endforeach
        @endif
    </div>

</div>

@push('js')
<script>
 $(document).ready(function () {
    @if($costing == null)
        let rowId = 0; // Start ID after the initial row
    @else
        let rowId = {{ count($costing->agent) - 1 }}; // Start ID after the initial row
    @endif

        // Add new row
       $('#add-row').on('click', function () {
    const newRow = `
        <div class="row mb-3 align-items-center" id="row-${rowId}">
            <div class="col-md-4">
                <label for="mawb_${rowId}" class="form-label">MAWB</label>
                <input type="text" class="form-control" id="mawb_${rowId}" name="mawb[]" placeholder="Type here..">
            </div>
            <div class="col-md-4">
                <label for="vendor_air_id_${rowId}" class="form-label">Vendor Code</label>
                <select class="form-select vendor-select" onchange="setVendorAirName(${rowId})" id="vendor_air_id_${rowId}" data-control="select2" name="vendor_air_id[]" data-key="${rowId}">
                    <option>Select Vendor</option>
                    @foreach($vendorAir as $rows)
                        <option value="{{ $rows->vendor_id }}" data-vendor-name="{{ $rows->vendor_name }}">{{ $rows->vendor_code }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-4">
                <label for="vendor_air_name_${rowId}" class="form-label">Vendor Name</label>
                <input type="text" class="form-control" id="vendor_air_name_${rowId}" name="vendor_air_name[]" readonly>
            </div>
        </div>`;
    $('#input-rows').append(newRow);

    // Re-initialize Select2 for the new select element
    $(`#vendor_air_id_${rowId}`).select2();

    rowId++;
});


        // Remove last row
        $('#remove-row').on('click', function () {
            if ($('#input-rows .row').length > 1) {
                $('#input-rows .row:last').remove();
                rowId--; // Adjust the ID for new rows
            } else {
                alert('At least one row must remain.');
            }
        });

     });
    function setVendorAirName(key) {

        var $dropdown = $(`#vendor_air_id_${key}`);
        var vendorName = $dropdown.find(':selected').data('vendor-name');

        $('#vendor_air_name_' + key).val(vendorName);
    }

</script>
@endpush
