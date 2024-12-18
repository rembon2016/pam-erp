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
    <div id="{{ $type }}-charges-form-{{ $k }}">
        {{-- <div class="d-flex align-items-center justify-content-between gap-2"> --}}
            {{-- @if (isset($ctd) && !empty($ctd))
                <button class="btn custom-btn custom-btn-primary btn-sm">CTD NO: {{ $ctd->ctd_number }}</button>
            @endif --}}

        <div style="display: flex; align-items: center; justify-content: end;">
         @if($costing?->status != 2)
            <button type="button" id="add-row-{{ $type }}-{{ $k }}" class="btn btn-icon btn-success rounded" style="height: 30px; width: 30px;margin-right:5px;">
                <i class="fa fa-plus pe-0"></i>
            </button>
            @endif
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

                    @if(!empty($detail->detail))

                    @foreach($detail->detail as $m => $row)
                    @if($row->costing_value == $value)
                    <tr id="row-{{ $m }}">
                        <td>
                            <input type="hidden" name="costing_detail_{{ $type }}_{{ $k }}_id[]" value="{{ $row->id }}">
                            @if($costing->status != 1)
                            <input type="hidden" name="vendor_{{ $type }}_{{ $k }}_id[]" type="text" class=" form-control" value="{{ $row->vendor_id }}">
                            <input type="hidden" name="charge_{{ $type }}_{{ $k }}_id[]" type="text" class=" form-control" value="{{ $row->charge_id }}">
                            <input type="hidden" name="currency_{{ $type }}_{{ $k }}_id[]" type="text" class=" form-control" value="{{ $row->currency_id }}">
                             <input type="hidden" name="status_{{ $type }}_{{ $k }}[]" type="text" class=" form-control" value="{{ $row->status }}">
                        @endif
                            <select class="form-select vendor-select" onchange="setVendorName{{ ucfirst($type) }}({{ $k }}, {{ $m }})" " data-control=" select2" id="vendor_{{ $type }}_{{ $k }}_id_0" name="vendor_{{ $type }}_{{ $k }}_id[]" data-key="{{ $m }}" @if($costing->status != 1) disabled @endif>
                                @foreach($vendor as $rows)
                                <option value="{{ $rows->vendor_id }}" @if($row->vendor_id == $rows->vendor_id) selected @endif data-vendor-name="{{ $rows->vendor_name }}">{{ $rows->vendor_code }}</option>
                                @endforeach
                            </select></td>
                        <td><input type="text" class="form-control" id="vendor_{{ $type }}_{{ $k }}_name_{{ $m }}" placeholder="Name" value="{{  $row->vendor_name  }}" name="vendor_{{ $type }}_{{ $k }}_name[]" readonly></td>
                        <td>
                            <select class="form-select" data-control="select2" id="charge_{{ $type }}_{{ $k }}_id_{{ $m }}" name="charge_{{ $type }}_{{ $k }}_id[]" data-key="{{ $m }}" @if($costing->status != 1) disabled @endif>

                                @foreach($charge as $rows)
                                <option value="{{ $rows->id }}" @if($row->charge_id == $rows->id) selected @endif>{{ $rows->charge_code }}</option>
                                @endforeach
                            </select>
                        </td>
                        <td> <select class="form-select" data-control="select2" id="currency_{{ $type }}_{{ $k }}_id_0" name="currency_{{ $type }}_{{ $k }}_id[]" data-key="0" @if($costing->status != 1) disabled @endif>

                                @foreach($currency as $rows)
                                <option value="{{ $rows->id }}" @if($row->currency_id == $rows->id) selected @endif>{{ $rows->currency_code }}</option>
                                @endforeach
                            </select></td>
                        <td><input type="text" class="form-control" value="{{ $row->rate }}" name="rate_{{ $type }}_{{ $k }}[]" placeholder="Type here.." @if($costing->status != 1) readonly @endif></td>
                        <td><input type="text" class="form-control" value="{{ $row->amount }}" name="amount_{{ $type }}_{{ $k }}[]" placeholder="Type here.." @if($costing->status != 1) readonly @endif></td>
                        <td><input type="text" class="form-control" value="{{ $row->local_amount }}" name="local_amount_{{ $type }}_{{ $k }}[]" placeholder="Type here.." @if($costing->status != 1) readonly @endif></td>
                        <td>
                            <select class="form-select" name="status_{{ $type }}_{{ $k }}[]" @if($costing->status != 1) disabled @endif>

                                <option value="Debit" @if($row->status == 'Debit') selected @endif>Debit</option>
                                <option value="Credit" @if($row->status == 'Credit') selected @endif>Credit</option>
                            </select>
                        </td>
                        <td>
                        @if($costing->status == 1)
                            <button type="button" class="btn btn-icon btn-danger btn-remove-row-{{ $type }}-{{ $k }}" style="height: 30px; width: 30px;margin-top:5px;">
                            <i class="fa fa-trash"></i>
                        </button>
                        @endif
                        </td>
                    </tr>

                    @endif
                    @endforeach
                    @endif
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
     @php
                        $jum = 0;
                    @endphp
 @if(!empty($detail->detail))

                    @foreach($detail->detail as $m => $row)
                    @if($detail->costing_value == $value)
                        @php
                            $jum++;
                        @endphp
                    @endif
                    @endforeach
                    @endif

let rowIndex{{ ucfirst($type) }}{{ $k }} = {{ $jum }}; // Initialize index for new rows

// Add Row
$('#add-row-{{ $type }}-{{ $k }}').on('click', function () {
    const newRow = `
        <tr id="row-${rowIndex{{ ucfirst($type) }}{{ $k }}}">
            <td>
                <select class="form-select vendor-select" onchange="setVendorName{{ ucfirst($type) }}({{ $k }}, ${rowIndex{{ ucfirst($type) }}{{ $k }}})"
                    data-control="select2" id="vendor_{{ $type }}_{{ $k }}_id_${rowIndex{{ ucfirst($type) }}{{ $k }}}" name="vendor_{{ $type }}_{{ $k }}_id[]" data-key="${rowIndex{{ ucfirst($type) }}{{ $k }}}">
                    @foreach($vendor as $rows)
                    <option value="{{ $rows->vendor_id }}" data-vendor-name="{{ $rows->vendor_name }}">{{ $rows->vendor_code }}</option>
                    @endforeach
                </select>
            </td>
            <td><input type="text" class="form-control" id="vendor_{{ $type }}_{{ $k }}_name_${rowIndex{{ ucfirst($type) }}{{ $k }}}" placeholder="Name" name="vendor_{{ $type }}_{{ $k }}_name[]" readonly></td>
            <td>
                <select class="form-select" data-control="select2" id="charge_{{ $type }}_{{ $k }}_id_${rowIndex{{ ucfirst($type) }}{{ $k }}}" name="charge_{{ $type }}_{{ $k }}_id[]" data-key="${rowIndex{{ ucfirst($type) }}{{ $k }}}">

                    @foreach($charge as $rows)
                    <option value="{{ $rows->id }}">{{ $rows->charge_code }}</option>
                    @endforeach
                </select>
            </td>
            <td>
                <select class="form-select" data-control="select2" id="currency_{{ $type }}_{{ $k }}_id_${rowIndex{{ ucfirst($type) }}{{ $k }}}" name="currency_{{ $type }}_{{ $k }}_id[]" data-key="${rowIndex{{ ucfirst($type) }}{{ $k }}}">

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
                    <option value="Debit">Debit</option>
                    <option value="Credit">Credit</option>
                </select>
            </td>
            <td><button type="button" class="btn btn-icon btn-danger btn-remove-row-{{ $type }}-{{ $k }}" style="height: 30px; width: 30px;margin-top:5px;">
                            <i class="fa fa-trash"></i>
                        </button></td>
        </tr>
    `;
    $('#{{ $type }}-charges-rows-{{ $k }}').append(newRow); // Append the new row
    $('.vendor-select').select2(); // Reinitialize Select2
    rowIndex{{ ucfirst($type) }}{{ $k }}++; // Increment row index
});


    // Remove Row


      $('#{{ $type }}-charges-rows-{{ $k }}').on('click', '.btn-remove-row-{{ $type }}-{{ $k }}', function () {
    const rowToHide = $(this).closest('tr'); // Ambil baris yang diklik
    const hiddenInput = rowToHide.find('input[name="costing_detail_{{ $type }}_{{ $k }}_id[]"]'); // Cari input id

    if (hiddenInput.length) {
        const deletedId = hiddenInput.val(); // Ambil value ID dari input hidden
        if (deletedId) {
            // Tambahkan input hidden untuk menandai ID yang dihapus
            rowToHide.append(`
                <input type="hidden" name="costing_detail_{{ $type }}_{{ $k }}_delete_id[]" value="${deletedId}">
            `);
        }
    }

    // Tambahkan class untuk menyembunyikan baris
    rowToHide.addClass('d-none');
});


</script>

@endpush
