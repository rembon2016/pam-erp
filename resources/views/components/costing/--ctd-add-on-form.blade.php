@push('css')
<style>
    table {
        table-layout: fixed;
        width: 100%;
    }

</style>
@endpush
<div>


    <!-- Form Container -->
    <div id="ctd-charges-form-{{ $k }}" >

        <div style="display: flex; align-items: center; justify-content: end;">
            <button type="button" id="add-row-ctd-{{ $k }}" class="btn btn-icon btn-success rounded" style="height: 30px; width: 30px;margin-right:5px;">
                <i class="fa fa-plus pe-0"></i>
            </button>
            <button type="button" id="updown-ctd-{{ $k }}" class="btn btn-icon btn-primary rounded" style="height: 30px; width: 30px;">
                <i class="fa fa-angle-down"></i>
            </button>
        </div>

        <div class="table-responsive" id="table-ctd-{{ $k }}">
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
                <tbody id="ctd-charges-rows-{{ $k }}">
                    <!-- Rows will be dynamically added here -->
                    <tr id="row-0">
                        <td><select class="form-select vendor-select" onchange="setVendorNameBl({{ $k }},0)
                                                " data-control="select2" id="vendor_ctd_{{ $k }}_id_0" name="vendor_ctd_{{ $k }}_id[]" data-key="0">
                                <option>Select</option>
                                @foreach($vendorLine as $rows)
                                <option value="{{ $rows->vendor_id }}" data-vendor-name="{{ $rows->vendor_name }}">{{ $rows->vendor_code }}</option>
                                @endforeach
                            </select></td>
                        <td><input type="text" class="form-control" id="vendor_ctd_{{ $k }}_name_0" placeholder="Name" name="vendor_ctd_{{ $k }}_name[]" readonly></td>
                        <td>
                            <select class="form-select" data-control="select2" id="charge_ctd_{{ $k }}_id_0" name="charge_ctd_{{ $k }}_id[]" data-key="0">
                                <option>Select</option>
                                @foreach($charge as $rows)
                                <option value="{{ $rows->id }}">{{ $rows->charge_code }}</option>
                                @endforeach
                            </select>
                        </td>
                        <td> <select class="form-select" data-control="select2" id="currency_ctd_{{ $k }}_id_0" name="currency_ctd_{{ $k }}_id[]" data-key="0">
                                <option>Select</option>
                                @foreach($currency as $rows)
                                <option value="{{ $rows->id }}">{{ $rows->currency_code }}</option>
                                @endforeach
                            </select></td>
                        <td><input type="text" class="form-control" name="rate_ctd_{{ $k }}[]" placeholder="Type here.."></td>
                        <td><input type="text" class="form-control" name="amount_ctd_{{ $k }}[]" placeholder="Type here.."></td>
                        <td><input type="text" class="form-control" name="local_amount_ctd_{{ $k }}[]" placeholder="Type here.."></td>
                        <td>
                            <select class="form-select" name="status_ctd_{{ $k }}[]">
                                <option>Select</option>
                                <option value="Debit">Debit</option>
                                <option value="Credit">Credit</option>
                            </select>
                        </td>
                        <td><button type="button" class="btn btn-danger rounded btn-remove-row-ctd-{{ $k }}" style="height: 30px; width: 30px;"><i class="bi bi-trash "></i></button></td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>
</div>


@push('js')
<script>
let isVisibleCTD{{ $k }} = true; // Track the visibility state

        $('#updown-ctd-{{ $k }}').click(function () {
            console.log('clicked');
            if (isVisibleCTD{{ $k }}) {
                // Hide the table and change the icon to "angle-up"
                $('#table-ctd-{{ $k }}').slideUp();
                $(this).find('i').removeClass('fa-angle-down').addClass('fa-angle-up');
            } else {
                // Show the table and change the icon to "angle-down"
                $('#table-ctd-{{ $k }}').slideDown();
                $(this).find('i').removeClass('fa-angle-up').addClass('fa-angle-down');
            }
            isVisibleCTD{{ $k }} = !isVisibleCTD{{ $k }}; // Toggle visibility state
        });

 function setVendorNameBl(k,key) {

        var $dropdown = $(`#vendor_ctd_${k}_id_${key}`);
        var vendorName = $dropdown.find(':selected').data('vendor-name');

        $(`#vendor_ctd_${k}_name_` + key).val(vendorName);
    }

   let k{{ $k }} = {{ $k }}; // This will result in something like "let k1 = 1;" in the final rendered JavaScript

let rowIndexCtd{{ $k }} = 1; // Initialize index for new rows

// Add Row
$('#add-row-ctd-{{ $k }}').on('click', function () {
    const newRow = `
        <tr id="row-${rowIndexCtd{{ $k }}}">
            <td>
                <select class="form-select vendor-select" onchange="setVendorNameBl(k{{ $k }}, rowIndexCtd{{ $k }})"
                    data-control="select2" id="vendor_ctd_${k{{ $k }}}_id_${rowIndexCtd{{ $k }}}" name="vendor_ctd_${k{{ $k }}}_id[]" data-key="${rowIndexCtd{{ $k }}}">
                    <option>Select</option>
                    @foreach($vendorLine as $rows)
                    <option value="{{ $rows->vendor_id }}" data-vendor-name="{{ $rows->vendor_name }}">{{ $rows->vendor_code }}</option>
                    @endforeach
                </select>
            </td>
            <td><input type="text" class="form-control" id="vendor_ctd_${k{{ $k }}}_name_${rowIndexCtd{{ $k }}}" placeholder="Name" name="vendor_ctd_${k{{ $k }}}_name[]" readonly></td>
            <td>
                <select class="form-select" data-control="select2" id="charge_ctd_${k{{ $k }}}_id_${rowIndexCtd{{ $k }}}" name="charge_ctd_${k{{ $k }}}_id[]" data-key="${rowIndexCtd{{ $k }}}">
                    <option>Select</option>
                    @foreach($charge as $rows)
                    <option value="{{ $rows->id }}">{{ $rows->charge_code }}</option>
                    @endforeach
                </select>
            </td>
            <td>
                <select class="form-select" data-control="select2" id="currency_ctd_${k{{ $k }}}_id_${rowIndexCtd{{ $k }}}" name="currency_ctd_${k{{ $k }}}_id[]" data-key="${rowIndexCtd{{ $k }}}">
                    <option>Select</option>
                    @foreach($currency as $rows)
                    <option value="{{ $rows->id }}">{{ $rows->currency_code }}</option>
                    @endforeach
                </select>
            </td>
            <td><input type="text" class="form-control" name="rate_ctd_${k{{ $k }}}[]" placeholder="Type here.."></td>
            <td><input type="text" class="form-control" name="amount_ctd_${k{{ $k }}}[]" placeholder="Type here.."></td>
            <td><input type="text" class="form-control" name="local_amount_ctd_${k{{ $k }}}[]" placeholder="Type here.."></td>
            <td>
                <select class="form-select" name="status_ctd_${k{{ $k }}}[]">
                    <option>Select</option>
                    <option value="Debit">Debit</option>
                    <option value="Credit">Credit</option>
                </select>
            </td>
            <td><button type="button" class="btn btn-danger btn-remove-row-ctd-${k{{ $k }}}"><i class="bi bi-trash"></i></button></td>
        </tr>
    `;
    $('#ctd-charges-rows-{{ $k }}').append(newRow); // Append the new row
    $('.vendor-select').select2(); // Reinitialize Select2
    rowIndexCtd{{ $k }}++; // Increment row index
});


    // Remove Row
    $(document).on('click', '.btn-remove-row-ctd-'+k, function () {
        $(this).closest('tr').remove(); // Remove the closest row
    });


</script>

@endpush
