@push('css')
<style>
    table {
        table-layout: fixed;
        width: 100%;
    }

</style>
@endpush
<div>
    <div class="mb-3">
        <label class="form-label">Add Special Charges?</label>
        <div>
            <input type="radio" id="special_charges_no" name="special_charges" value="no" checked>
            <label for="special_charges_no">No</label>
            <input type="radio" id="special_charges_yes" name="special_charges" value="yes">
            <label for="special_charges_yes">Yes</label>
        </div>
    </div>

    <!-- Form Container -->
    <div id="special-charges-form" class="d-none">

        <div style="display: flex; align-items: center; justify-content: end;">
            <button type="button" id="add-row-special" class="btn btn-icon btn-success rounded" style="height: 30px; width: 30px;margin-right:5px;">
                <i class="fa fa-plus pe-0"></i>
            </button>
            <button type="button" id="updown" class="btn btn-icon btn-primary rounded" style="height: 30px; width: 30px;">
                <i class="fa fa-angle-down"></i>
            </button>
        </div>

        <div class="table-responsive" id="table-special-import">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th style="width: 150px;">Vendor Code</th>
                        <th style="width: 200px;">Vendor Name</th>
                        <th style="width: 200px;">Charge</th>
                        <th style="width: 150px;">Currency</th>
                        <th style="width: 200px;">Rate</th>
                        <th style="width: 200px;">Amount</th>
                        <th style="width: 200px;">Local Amount</th>
                        <th style="width: 150px;">Status</th>
                        <th style="width: 100px;">Actions</th>
                    </tr>
                </thead>
                <tbody id="charges-rows">
                    <!-- Rows will be dynamically added here -->
                    <tr id="row-0">
                        <td><select class="form-select vendor-select" onchange="setVendorSpecialImportName(0)
                                                " data-control="select2" id="vendor_special_import_id_0" name="vendor_special_import_id[]" data-key="0">
                                <option>Select</option>
                                @foreach($vendorLine as $rows)
                                <option value="{{ $rows->vendor_id }}" data-vendor-name="{{ $rows->vendor_name }}">{{ $rows->vendor_code }}</option>
                                @endforeach
                            </select></td>
                        <td><input type="text" class="form-control" id="vendor_special_import_name_0" placeholder="Name" name="vendor_special_import_name[]" readonly></td>
                        <td>
                            <select class="form-select" data-control="select2" id="charge_special_import_id_0" name="charge_special_import_id[]" data-key="0">
                                <option>Select</option>
                                @foreach($charge as $rows)
                                <option value="{{ $rows->id }}">{{ $rows->charge_code }}</option>
                                @endforeach
                            </select>
                        </td>
                        <td> <select class="form-select" data-control="select2" id="currency_special_import_id_0" name="currency_special_import_id[]" data-key="0">
                                <option>Select</option>
                                @foreach($currency as $rows)
                                <option value="{{ $rows->id }}">{{ $rows->currency_code }}</option>
                                @endforeach
                            </select></td>
                        <td><input type="text" class="form-control" name="rate_special_import[]" placeholder="Type here.."></td>
                        <td><input type="text" class="form-control" name="amount_special_import[]" placeholder="Type here.."></td>
                        <td><input type="text" class="form-control" name="local_amount_special_import[]" placeholder="Type here.."></td>
                        <td>
                            <select class="form-select" name="status_special_import[]">
                                <option>Select</option>
                                <option value="Debit">Debit</option>
                                <option value="Credit">Credit</option>
                            </select>
                        </td>
                        <td><button type="button" class="btn btn-danger btn-remove-row"><i class="bi bi-trash"></i></button></td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>
</div>


@push('js')
<script>
$('input[name="special_charges"]').on('change', function () {
    if ($(this).val() === 'yes') {
        $('#special-charges-form').removeClass('d-none');
    } else {
        $('#special-charges-form').addClass('d-none');
    }
});

let isVisible = true; // Track the visibility state

        $('#updown').click(function () {
            console.log('clicked');
            if (isVisible) {
                // Hide the table and change the icon to "angle-up"
                $('#table-special-import').slideUp();
                $(this).find('i').removeClass('fa-angle-down').addClass('fa-angle-up');
            } else {
                // Show the table and change the icon to "angle-down"
                $('#table-special-import').slideDown();
                $(this).find('i').removeClass('fa-angle-up').addClass('fa-angle-down');
            }
            isVisible = !isVisible; // Toggle visibility state
        });

 function setVendorSpecialImportName(key) {

        var $dropdown = $(`#vendor_special_import_id_${key}`);
        var vendorName = $dropdown.find(':selected').data('vendor-name');

        $('#vendor_special_import_name_' + key).val(vendorName);
    }

    let rowIndex = 1; // Initialize index for new rows

    // Add Row
    $('#add-row-special').on('click', function () {
        const newRow = `
            <tr id="row-${rowIndex}">
                <td>
                    <select class="form-select vendor-select" onchange="setVendorSpecialImportName(${rowIndex})"
                        data-control="select2" id="vendor_special_import_id_${rowIndex}" name="vendor_special_import_id[]" data-key="${rowIndex}">
                        <option>Select</option>
                        @foreach($vendorLine as $rows)
                        <option value="{{ $rows->vendor_id }}" data-vendor-name="{{ $rows->vendor_name }}">{{ $rows->vendor_code }}</option>
                        @endforeach
                    </select>
                </td>
                <td><input type="text" class="form-control" id="vendor_special_import_name_${rowIndex}" placeholder="Name" name="vendor_special_import_name[]" readonly></td>
                <td>
                    <select class="form-select" data-control="select2" id="charge_special_import_id_${rowIndex}" name="charge_special_import_id[]" data-key="${rowIndex}">
                        <option>Select</option>
                        @foreach($charge as $rows)
                        <option value="{{ $rows->id }}">{{ $rows->charge_code }}</option>
                        @endforeach
                    </select>
                </td>
                <td>
                    <select class="form-select" data-control="select2" id="currency_special_import_id_${rowIndex}" name="currency_special_import_id[]" data-key="${rowIndex}">
                        <option>Select</option>
                        @foreach($currency as $rows)
                        <option value="{{ $rows->id }}">{{ $rows->currency_code }}</option>
                        @endforeach
                    </select>
                </td>
                <td><input type="text" class="form-control" name="rate_special_import[]" placeholder="Type here.."></td>
                <td><input type="text" class="form-control" name="amount_special_import[]" placeholder="Type here.."></td>
                <td><input type="text" class="form-control" name="local_amount_special_import[]" placeholder="Type here.."></td>
                <td>
                    <select class="form-select" name="status_special_import[]">
                        <option>Select</option>
                        <option value="Debit">Debit</option>
                        <option value="Credit">Credit</option>
                    </select>
                </td>
                <td><button type="button" class="btn btn-danger btn-remove-row"><i class="bi bi-trash"></i></button></td>
            </tr>
        `;
        $('#charges-rows').append(newRow); // Add the new row to the table
        $('.vendor-select').select2();
        rowIndex++; // Increment row index
    });

    // Remove Row
    $(document).on('click', '.btn-remove-row', function () {
        $(this).closest('tr').remove(); // Remove the closest row
    });


</script>

@endpush
