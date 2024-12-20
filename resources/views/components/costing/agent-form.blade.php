<div class="container mt-4 costing-table">
    <div style="display: flex; align-items: center; justify-content: end;">
        @if($costing?->status != 2)
        <button type="button" id="add-row" class="btn btn-icon btn-success rounded" style="height: 30px; width: 30px; margin-right:5px;">
            <i class="fa fa-plus pe-0"></i>
        </button>
        @endif
    </div>
    <div id="input-rows">
        @if(!empty($costing))
        @foreach($costing->agent as $key => $row)
        <div class="row mb-3 align-items-center" id="row-{{ $key }}">
            <input type="hidden" name="costing_vendor_agent_id[]" value="{{ $row->id }}">
            <div class="col-md-4">
                <label for="mawb_{{ $key }}" class="form-label">MAWB</label>
                <input type="text" class="form-control" id="mawb_{{ $key }}" value="{{ $row->mawb }}" name="mawb[]" placeholder="Type here.." @if($costing->status != 1) readonly @endif>
            </div>
            <div class="col-md-4">
                <label for="vendor_air_id_{{ $key }}" class="form-label">Vendor Code</label>
                 @if($costing->status != 1)
                    <input type="hidden" name="vendor_air_id[]" type="text" class=" form-control" value="{{ $row->vendor_id }}">
                @endif
                <select class="form-select vendor-select" onchange="setVendorAirName({{ $key }})" data-control="select2" id="vendor_air_id_{{ $key }}" name="vendor_air_id[]" data-key="{{ $key }}" @if($costing?->status != 1 && $costing != null) disabled @endif>
                    <option>Select Vendor</option>
                    @foreach($vendorAir as $rows)
                    <option value="{{ $rows->vendor_id }}" @if($rows->vendor_id == $row->vendor_id) selected @endif data-vendor-name="{{ $rows->vendor_name }}" data-vendor-code="{{ $rows->vendor_code }}">{{ $rows->vendor_code }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-3">
                <label for="vendor_air_name_{{ $key }}" class="form-label">Vendor Name</label>
                <input type="text" class="form-control" id="vendor_air_name_{{ $key }}" value="{{ $row->vendor_name }}" name="vendor_air_name[]" readonly>
            </div>
            <div class="col-md-1 d-flex align-items-end">
                @if($costing->status == 1)
                <button type="button" class="btn btn-icon btn-danger remove-row" data-row-id="{{ $key }}" style="height: 30px; width: 30px;margin-top:20px;">
                    <i class="fa fa-trash"></i>
                </button>
                @endif
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
        let rowId = {{ count($costing->agent) }}; // Start ID after the last row
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
                    <select class="form-select vendor-select" onchange="setVendorAirName(${rowId})" id="vendor_air_id_${rowId}" name="vendor_air_id[]" data-control="select2" data-key="${rowId}">
                        <option>Select Vendor</option>
                        @foreach($vendorAir as $rows)
                            <option value="{{ $rows->vendor_id }}" data-vendor-name="{{ $rows->vendor_name }}">{{ $rows->vendor_code }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-3">
                    <label for="vendor_air_name_${rowId}" class="form-label">Vendor Name</label>
                    <input type="text" class="form-control" id="vendor_air_name_${rowId}" name="vendor_air_name[]" readonly>
                </div>
                <div class="col-md-1 d-flex align-items-end">
                    <button type="button" class="btn btn-icon btn-danger remove-row" data-row-id="${rowId}" style="height: 30px; width: 30px;margin-top:20px;">
                        <i class="fa fa-minus"></i>
                    </button>
                </div>
            </div>`;
        $('#input-rows').append(newRow);

        // Re-initialize Select2 for the new select element
        $(`#vendor_air_id_${rowId}`).select2();

        rowId++;
    });

    // Remove specific row
    $('#input-rows').on('click', '.remove-row', function () {
    const rowToHide = $(this).closest('.row');
    const hiddenInput = rowToHide.find('input[name="costing_vendor_agent_id[]"]');

    if (hiddenInput.length) {
        const deletedId = hiddenInput.val();
        if (deletedId) {
            // Append the hidden delete input INSIDE the row itself
            rowToHide.append(`
                <input type="hidden" name="costing_vendor_agent_delete_id[]" value="${deletedId}">
            `);
        }
    }

    // Hide the row instead of removing it
    rowToHide.addClass('d-none');
});

});

// Function to set vendor name based on selected vendor code
function setVendorAirName(key) {
    var $dropdown = $(`#vendor_air_id_${key}`);
    var mawb = $(`#mawb_${key}`).val();
    var vendorId = $dropdown.val();
    var vendorName = $dropdown.find(':selected').data('vendor-name');
    var vendorCode = $dropdown.find(':selected').data('vendor-code');
    $(`#vendor_air_name_${key}`).val(vendorName);

    setChargeMawb(vendorId,vendorName,vendorCode, mawb, 'agent');
}
</script>
@endpush
