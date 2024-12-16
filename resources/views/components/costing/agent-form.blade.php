<div class="container mt-4">
    <div id="input-rows">
        <div class="row mb-3 align-items-center" id="row-0">
            <div class="col-md-4">
                <label for="mawb_0" class="form-label">MAWB</label>
                <input type="text" class="form-control" id="mawb_0" name="mawb[]" placeholder="Type here..">
            </div>
            <div class="col-md-4">
                <label for="vendor_air_id_0" class="form-label">Vendor Code</label>
                <select class="form-select vendor-select" onchange="setVendorAirName(0)
                                                " data-control="select2" id="vendor_air_id_0" name="vendor_air_id[]" data-key="0">
                    <option>Select Vendor</option>
                    @foreach($vendorAir as $rows)
                    <option value="{{ $rows->vendor_id }}" data-vendor-name="{{ $rows->vendor_name }}">{{ $rows->vendor_code }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-4">
                <label for="vendor_air_name_0" class="form-label">Vendor Name</label>
                <input type="text" class="form-control" id="vendor_air_name_0" name="vendor_air_name[]" readonly>
            </div>
        </div>
    </div>
    <div class="d-flex justify-content-end">
        <button type="button" class="btn btn-success me-2" id="add-row"><i class="bi bi-plus-circle"></i> Add</button>
        <button type="button" class="btn btn-danger" id="remove-row"><i class="bi bi-trash"></i> Remove</button>
    </div>
</div>

@push('js')
<script>
 $(document).ready(function () {
        let rowId = 1; // Start ID after the initial row

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
