@push('css')
<style>
table {
    table-layout: fixed;
    width: 100%;
}

</style>
@endpush
<div >
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
        <div class="table-responsive">
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
                        <th style="width: 100px;">Status</th>
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
        <button type="button" class="btn btn-success" id="add-row"><i class="bi bi-plus-circle"></i> Add</button>
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

 function setVendorSpecialImportName(key) {

        var $dropdown = $(`#vendor_special_import_id_${key}`);
        var vendorName = $dropdown.find(':selected').data('vendor-name');

        $('#vendor_special_import_name_' + key).val(vendorName);
    }

</script>

@endpush
