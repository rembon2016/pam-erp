@push('css')
<style>
    table {
        table-layout: fixed;
        width: 100%;
    }

</style>
@endpush
<div>
    <div class="mb-5">
        <label class="form-label">Add Special Charges?</label>

        <div class="d-flex align-items-center gap-4">
            <div class="d-flex align-items-center gap-1">
                <input type="radio" id="special_charges_no_export" name="special_charges_export" value="no" checked>
                <label for="special_charges_no_export">No</label>
            </div>
            <div class="d-flex align-items-center gap-1">
                <input type="radio" id="special_charges_yes_export" name="special_charges_export" value="yes">
                <label for="special_charges_yes_export">Yes</label>
            </div>
        </div>
    </div>

    <!-- Form Container -->
    <div id="special-export-charges-form" class="d-none">

        <div style="display: flex; align-items: center; justify-content: end;">
             @if($costing?->status != 2)
            <button type="button" id="add-row-special-export" class="btn btn-icon btn-success rounded" style="height: 30px; width: 30px;margin-right:5px;">
                <i class="fa fa-plus pe-0"></i>
            </button>
            @endif
            <button type="button" id="updown-special-export" class="btn btn-icon btn-primary rounded" style="height: 30px; width: 30px;">
                <i class="fa fa-angle-down"></i>
            </button>
        </div>

        <div class="table-responsive" id="table-special-export">
            <table class="table table-bordered costing-table">
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
                <tbody id="charges-export-rows">
                    <!-- Rows will be dynamically added here -->
                     @if($costing != null)
                    @foreach($costing->special as $key => $row)
                     @if($row->costing_type === 'export')
                              <tr id="row-{{ $key }}">
                        <td>
                        <input type="hidden" name="costing_special_export_id[]" value="{{ $row->id }}">
                         @if($costing->status != 1)
                            <input type="hidden" name="vendor_special_export_id[]" type="text" class=" form-control" value="{{ $row->vendor_id }}">
                            <input type="hidden" name="charge_special_export_id[]" type="text" class=" form-control" value="{{ $row->charge_id }}">
                            <input type="hidden" name="currency_special_export_id[]" type="text" class=" form-control" value="{{ $row->currency_id }}">
                             <input type="hidden" name="status_special_export[]" type="text" class=" form-control" value="{{ $row->status }}">
                        @endif
                        <select class="form-select vendor-select" onchange="setVendorSpecialExportName({{ $key }})
                                                " data-control="select2" id="vendor_special_export_id_{{ $key }}" name="vendor_special_export_id[]" data-key="{{ $key }}" @if($costing->status != 1) disabled @endif>
                                <option>Select</option>
                                @foreach($vendorLine as $rows)
                                <option value="{{ $rows->vendor_id }}" @if($row->vendor_id == $rows->vendor_id) selected @endif data-vendor-name="{{ $rows->vendor_name }}">{{ $rows->vendor_code }}</option>
                                @endforeach
                            </select></td>
                        <td><input type="text" class="form-control" value="{{ $row->vendor_name }}" id="vendor_special_export_name_{{ $key }}" placeholder="Name" name="vendor_special_export_name[]" readonly></td>
                        <td>
                            <select class="form-select" data-control="select2" id="charge_special_export_id_0" name="charge_special_export_id[]" data-key="{{ $key }}" @if($costing->status != 1) disabled @endif>
                                <option>Select</option>
                                @foreach($charge as $rows)
                                <option value="{{ $rows->id }}" @if($row->charge_id == $rows->id) selected @endif>{{ $rows->charge_code }}</option>
                                @endforeach
                            </select>
                        </td>
                        <td> <select class="form-select" data-control="select2" id="currency_special_export_id_{{ $key }}" name="currency_special_export_id[]" data-key="{{ $key }}" @if($costing->status != 1) disabled @endif>
                                <option>Select</option>
                                @foreach($currency as $rows)
                                <option value="{{ $rows->id }}" @if($row->currency_id == $rows->id) selected @endif>{{ $rows->currency_code }}</option>
                                @endforeach
                            </select></td>
                        <td><input type="text" class="form-control" name="rate_special_export[]" value="{{ $row->rate }}" placeholder="Type here.." @if($costing->status != 1) readonly @endif></td>
                        <td><input type="text" class="form-control" name="amount_special_export[]" value="{{ $row->amount }}" placeholder="Type here.." @if($costing->status != 1) readonly @endif></td>
                        <td><input type="text" class="form-control" value="{{ $row->local_amount }}" name="local_amount_special_export[]" placeholder="Type here.." @if($costing->status != 1) readonly @endif></td>
                        <td>
                            <select class="form-select" name="status_special_export[]" @if($costing->status != 1) disabled @endif>
                                <option>Select</option>
                                <option value="Debit" @if($row->status == 'Debit') selected @endif>Debit</option>
                                <option value="Credit" @if($row->status == 'Credit') selected @endif>Credit</option>
                            </select>
                        </td>
                        <td>
                        @if($costing->status == 1)
                          <button type="button" class="btn btn-icon btn-danger btn-remove-row-special-export" style="height: 30px; width: 30px;margin-top:5px;">
                                <i class="fa fa-trash"></i>
                            </button>
                        @endif

                        </td>
                    </tr>
                      @endif
                    @endforeach
                    @else
                    <tr id="row-0">
                        <td><select class="form-select vendor-select" onchange="setVendorSpecialExportName(0)
                                                " data-control="select2" id="vendor_special_export_id_0" name="vendor_special_export_id[]" data-key="0">
                                <option>Select</option>
                                @foreach($vendorLine as $rows)
                                <option value="{{ $rows->vendor_id }}" data-vendor-name="{{ $rows->vendor_name }}">{{ $rows->vendor_code }}</option>
                                @endforeach
                            </select></td>
                        <td><input type="text" class="form-control" id="vendor_special_export_name_0" placeholder="Name" name="vendor_special_export_name[]" readonly></td>
                        <td>
                            <select class="form-select" data-control="select2" id="charge_special_export_id_0" name="charge_special_export_id[]" data-key="0">
                                <option>Select</option>
                                @foreach($charge as $rows)
                                <option value="{{ $rows->id }}">{{ $rows->charge_code }}</option>
                                @endforeach
                            </select>
                        </td>
                        <td> <select class="form-select" data-control="select2" id="currency_special_export_id_0" name="currency_special_export_id[]" data-key="0">
                                <option>Select</option>
                                @foreach($currency as $rows)
                                <option value="{{ $rows->id }}">{{ $rows->currency_code }}</option>
                                @endforeach
                            </select></td>
                        <td><input type="text" class="form-control" name="rate_special_export[]" placeholder="Type here.."></td>
                        <td><input type="text" class="form-control" name="amount_special_export[]" placeholder="Type here.."></td>
                        <td><input type="text" class="form-control" name="local_amount_special_export[]" placeholder="Type here.."></td>
                        <td>
                            <select class="form-select" name="status_special_export[]">
                                <option>Select</option>
                                <option value="Debit">Debit</option>
                                <option value="Credit">Credit</option>
                            </select>
                        </td>
                        <td><button type="button" class="btn btn-icon btn-danger btn-remove-row-special-export" style="height: 30px; width: 30px;margin-top:5px;">
                    <i class="fa fa-trash"></i>
                </button></td>
                    </tr>
                    @endif
                </tbody>
            </table>
        </div>

    </div>
</div>


@push('js')
<script>
@if($costing != null)
@if($costing->special->contains(fn($item) => $item->costing_type === 'export'))
    $('#special-export-charges-form').removeClass('d-none');
     $('#special_charges_yes_export').prop('checked', true); // Check the 'Yes' radio button
    $('#special_charges_no_export').prop('checked', false);
@endif
@endif
$('input[name="special_charges_export"]').on('change', function () {
    if ($(this).val() === 'yes') {
        $('#special-export-charges-form').removeClass('d-none');
    } else {
        $('#special-export-charges-form').addClass('d-none');
    }
});

let isVisibleSpecialExport = true; // Track the visibility state

        $('#updown-special-export').click(function () {
            console.log('clicked');
            if (isVisibleSpecialExport) {
                // Hide the table and change the icon to "angle-up"
                $('#table-special-export').slideUp();
                $(this).find('i').removeClass('fa-angle-down').addClass('fa-angle-up');
            } else {
                // Show the table and change the icon to "angle-down"
                $('#table-special-export').slideDown();
                $(this).find('i').removeClass('fa-angle-up').addClass('fa-angle-down');
            }
            isVisibleSpecialExport = !isVisibleSpecialExport; // Toggle visibility state
        });

 function setVendorSpecialExportName(key) {

        var $dropdown = $(`#vendor_special_export_id_${key}`);
        var vendorName = $dropdown.find(':selected').data('vendor-name');

        $('#vendor_special_export_name_' + key).val(vendorName);
    }

    @if($costing != null)
        @if($costing->special->contains(fn($item) => $item->costing_type === 'export'))
            @php
                // Count special rows where costing_type is 'import'
                $importCount = $costing->special->where('costing_type', 'export')->count();
            @endphp
            let rowIndexSpecialExport = {{ $importCount + 1 }};
        @else
        let rowIndexSpecialExport = 1; // Initialize index for new rows
        @endif
    @else
    let rowIndexSpecialExport = 1; // Initialize index for new rows
    @endif

    // Add Row
    $('#add-row-special-export').on('click', function () {
        const newRow = `
            <tr id="row-${rowIndexSpecialExport}">
                <td>
                    <select class="form-select vendor-select" onchange="setVendorSpecialExportName(${rowIndexSpecialExport})"
                        data-control="select2" id="vendor_special_export_id_${rowIndexSpecialExport}" name="vendor_special_export_id[]" data-key="${rowIndexSpecialExport}">
                        <option>Select</option>
                        @foreach($vendorLine as $rows)
                        <option value="{{ $rows->vendor_id }}" data-vendor-name="{{ $rows->vendor_name }}">{{ $rows->vendor_code }}</option>
                        @endforeach
                    </select>
                </td>
                <td><input type="text" class="form-control" id="vendor_special_export_name_${rowIndexSpecialExport}" placeholder="Name" name="vendor_special_export_name[]" readonly></td>
                <td>
                    <select class="form-select" data-control="select2" id="charge_special_export_id_${rowIndexSpecialExport}" name="charge_special_export_id[]" data-key="${rowIndexSpecialExport}">
                        <option>Select</option>
                        @foreach($charge as $rows)
                        <option value="{{ $rows->id }}">{{ $rows->charge_code }}</option>
                        @endforeach
                    </select>
                </td>
                <td>
                    <select class="form-select" data-control="select2" id="currency_special_export_id_${rowIndexSpecialExport}" name="currency_special_export_id[]" data-key="${rowIndexSpecialExport}">
                        <option>Select</option>
                        @foreach($currency as $rows)
                        <option value="{{ $rows->id }}">{{ $rows->currency_code }}</option>
                        @endforeach
                    </select>
                </td>
                <td><input type="text" class="form-control" name="rate_special_export[]" placeholder="Type here.."></td>
                <td><input type="text" class="form-control" name="amount_special_export[]" placeholder="Type here.."></td>
                <td><input type="text" class="form-control" name="local_amount_special_export[]" placeholder="Type here.."></td>
                <td>
                    <select class="form-select" name="status_special_export[]">
                        <option>Select</option>
                        <option value="Debit">Debit</option>
                        <option value="Credit">Credit</option>
                    </select>
                </td>
                <td><button type="button" class="btn btn-icon btn-danger btn-remove-row-special-export" style="height: 30px; width: 30px;margin-top:5px;">
                    <i class="fa fa-trash"></i>
                </button></td>
            </tr>
        `;
        $('#charges-export-rows').append(newRow); // Add the new row to the table
        $('.vendor-select').select2();
        rowIndexSpecialExport++; // Increment row index
    });

    // Remove Row


    $('#charges-export-rows').on('click', '.btn-remove-row-special-export', function () {
    const rowToHide = $(this).closest('tr'); // Ambil baris yang diklik
    const hiddenInput = rowToHide.find('input[name="costing_special_export_id[]"]'); // Cari input id

    if (hiddenInput.length) {
        const deletedId = hiddenInput.val(); // Ambil value ID dari input hidden
        if (deletedId) {
            // Tambahkan input hidden untuk menandai ID yang dihapus
            rowToHide.append(`
                <input type="hidden" name="costing_special_export_delete_id[]" value="${deletedId}">
            `);
        }
    }

    // Tambahkan class untuk menyembunyikan baris
    rowToHide.addClass('d-none');
});


</script>

@endpush
