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
    <div id="{{ $type }}-charges-form-{{ $k }}" >

        <div style="display: flex; align-items: center; justify-content: end;">
            <button type="button" id="add-row-{{ $type }}-{{ $k }}" class="btn btn-icon btn-success rounded" style="height: 30px; width: 30px;margin-right:5px;">
                <i class="fa fa-plus pe-0"></i>
            </button>
            <button type="button" id="updown-{{ $type }}-{{ $k }}" class="btn btn-icon btn-primary rounded" style="height: 30px; width: 30px;">
                <i class="fa fa-angle-down"></i>
            </button>
        </div>

        <div class="table-responsive" id="table-{{ $type }}-{{ $k }}">
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
                <tbody id="{{ $type }}-charges-rows-{{ $k }}">
                    <!-- Rows will be dynamically added here -->
                    <tr id="row-0">
                        <td><select class="form-select vendor-select" onchange="setVendorName{{ ucfirst($type) }}({{ $k }},0)
                                                " data-control="select2" id="vendor_{{ $type }}_{{ $k }}_id_0" name="vendor_{{ $type }}_{{ $k }}_id[]" data-key="0">
                                <option>Select</option>
                                @foreach($vendor as $rows)
                                <option value="{{ $rows->vendor_id }}" data-vendor-name="{{ $rows->vendor_name }}">{{ $rows->vendor_code }}</option>
                                @endforeach
                            </select></td>
                        <td><input type="text" class="form-control" id="vendor_{{ $type }}_{{ $k }}_name_0" placeholder="Name" name="vendor_{{ $type }}_{{ $k }}_name[]" readonly></td>
                        <td>
                            <select class="form-select" data-control="select2" id="charge_{{ $type }}_{{ $k }}_id_0" name="charge_{{ $type }}_{{ $k }}_id[]" data-key="0">
                                <option>Select</option>
                                @foreach($charge as $rows)
                                <option value="{{ $rows->id }}">{{ $rows->charge_code }}</option>
                                @endforeach
                            </select>
                        </td>
                        <td> <select class="form-select" data-control="select2" id="currency_{{ $type }}_{{ $k }}_id_0" name="currency_{{ $type }}_{{ $k }}_id[]" data-key="0">
                                <option>Select</option>
                                @foreach($currency as $rows)
                                <option value="{{ $rows->id }}">{{ $rows->currency_code }}</option>
                                @endforeach
                            </select></td>
                        <td><input type="text" class="form-control" name="rate_{{ $type }}_{{ $k }}[]" placeholder="Type here.."></td>
                        <td><input type="text" class="form-control" name="amount_{{ $type }}_{{ $k }}[]" placeholder="Type here.."></td>
                        <td><input type="text" class="form-control" name="local_amount_{{ $type }}_{{ $k }}[]" placeholder="Type here.."></td>
                        <td>
                            <select class="form-select" name="status_{{ $type }}_{{ $k }}[]">
                                <option>Select</option>
                                <option value="Debit">Debit</option>
                                <option value="Credit">Credit</option>
                            </select>
                        </td>
                        <td><button type="button" class="btn btn-danger rounded btn-remove-row-{{ $type }}-{{ $k }}" style="height: 30px; width: 30px;"><i class="bi bi-trash "></i></button></td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>
</div>


@push('js')
<script>
let isVisible{{ ucfirst($type) }}{{ $k }} = true; // Track the visibility state

        $('#updown-{{ $type }}-{{ $k }}').click(function () {
            console.log('clicked');
            if (isVisible{{ ucfirst($type) }}{{ $k }}) {
                // Hide the table and change the icon to "angle-up"
                $('#table-{{ $type }}-{{ $k }}').slideUp();
                $(this).find('i').removeClass('fa-angle-down').addClass('fa-angle-up');
            } else {
                // Show the table and change the icon to "angle-down"
                $('#table-{{ $type }}-{{ $k }}').slideDown();
                $(this).find('i').removeClass('fa-angle-up').addClass('fa-angle-down');
            }
            isVisible{{ ucfirst($type) }}{{ $k }} = !isVisible{{ ucfirst($type) }}{{ $k }}; // Toggle visibility state
        });

 function setVendorName{{ ucfirst($type) }}(k,key) {

        var $dropdown = $(`#vendor_{{ $type }}_${k}_id_${key}`);
        var vendorName = $dropdown.find(':selected').data('vendor-name');

        $(`#vendor_{{ $type }}_${k}_name_` + key).val(vendorName);
    }

let rowIndex{{ ucfirst($type) }}{{ $k }} = 1; // Initialize index for new rows

// Add Row
$('#add-row-{{ $type }}-{{ $k }}').on('click', function () {
    const newRow = `
        <tr id="row-${rowIndex{{ ucfirst($type) }}{{ $k }}}">
            <td>
                <select class="form-select vendor-select" onchange="setVendorName{{ ucfirst($type) }}({{ $k }}, ${rowIndex{{ ucfirst($type) }}{{ $k }}})"
                    data-control="select2" id="vendor_{{ $type }}_{{ $k }}_id_${rowIndex{{ ucfirst($type) }}{{ $k }}}" name="vendor_{{ $type }}_{{ $k }}_id[]" data-key="${rowIndex{{ ucfirst($type) }}{{ $k }}}">
                    <option>Select</option>
                    @foreach($vendor as $rows)
                    <option value="{{ $rows->vendor_id }}" data-vendor-name="{{ $rows->vendor_name }}">{{ $rows->vendor_code }}</option>
                    @endforeach
                </select>
            </td>
            <td><input type="text" class="form-control" id="vendor_{{ $type }}_{{ $k }}_name_${rowIndex{{ ucfirst($type) }}{{ $k }}}" placeholder="Name" name="vendor_{{ $type }}_{{ $k }}_name[]" readonly></td>
            <td>
                <select class="form-select" data-control="select2" id="charge_{{ $type }}_{{ $k }}_id_${rowIndex{{ ucfirst($type) }}{{ $k }}}" name="charge_{{ $type }}_{{ $k }}_id[]" data-key="${rowIndex{{ ucfirst($type) }}{{ $k }}}">
                    <option>Select</option>
                    @foreach($charge as $rows)
                    <option value="{{ $rows->id }}">{{ $rows->charge_code }}</option>
                    @endforeach
                </select>
            </td>
            <td>
                <select class="form-select" data-control="select2" id="currency_{{ $type }}_{{ $k }}_id_${rowIndex{{ ucfirst($type) }}{{ $k }}}" name="currency_{{ $type }}_{{ $k }}_id[]" data-key="${rowIndex{{ ucfirst($type) }}{{ $k }}}">
                    <option>Select</option>
                    @foreach($currency as $rows)
                    <option value="{{ $rows->id }}">{{ $rows->currency_code }}</option>
                    @endforeach
                </select>
            </td>
            <td><input type="text" class="form-control" name="rate_{{ $type }}_{{ $k }}[]" placeholder="Type here.."></td>
            <td><input type="text" class="form-control" name="amount_{{ $type }}_{{ $k }}[]" placeholder="Type here.."></td>
            <td><input type="text" class="form-control" name="local_amount_{{ $type }}_{{ $k }}[]" placeholder="Type here.."></td>
            <td>
                <select class="form-select" name="status_{{ $type }}_{{ $k }}[]">
                    <option>Select</option>
                    <option value="Debit">Debit</option>
                    <option value="Credit">Credit</option>
                </select>
            </td>
            <td><button type="button" class="btn btn-danger btn-remove-row-ctd-{{ $k }}"><i class="bi bi-trash"></i></button></td>
        </tr>
    `;
    $('#{{ $type }}-charges-rows-{{ $k }}').append(newRow); // Append the new row
    $('.vendor-select').select2(); // Reinitialize Select2
    rowIndex{{ ucfirst($type) }}{{ $k }}++; // Increment row index
});


    // Remove Row
    $(document).on('click', '.btn-remove-row-{{ $type }}-{{ $k }}', function () {
        $(this).closest('tr').remove(); // Remove the closest row
    });


</script>

@endpush
