@extends('layout.main-layout')
@section('title', 'Form Sea Import Costing')

@push('css')
<style>
td {
    padding-inline: 2px !important;
}

input,
select,
.select2-container .select2-selection--single,
.select2-container .select2-results__option {
    font-size: 13px !important; /* Ubah ukuran sesuai kebutuhan */
}

</style>

@endpush
@section('body')
<x:layout.breadcrumb.wrapper module="Costing" pageName="SEA IMPORT">
    <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
    <x:layout.breadcrumb.item pageName="Cost" />
</x:layout.breadcrumb.wrapper>

<x:layout.card.wrapper>
    <x:layout.card.header>

        <h1 class="page-heading d-flex text-dark fw-bold fs-3 flex-column justify-content-center my-0 mb-3">
            Sea Import Form
        </h1>
    </x:layout.card.header>
    <x:layout.card.body>
     <x:form.wrapper id="costing-form" action="{{ $data['action'] }}" method="{{ $data['method'] }}">
        <input type="hidden" value="{{ $joborder->loading_plan_id }}" name="loading_plan_id">
        <input type="hidden" value="{{ $joborder->job_order_id }}" name="job_order_id">
        <input type="hidden" name="type_costing" value="SEAIMPORT">
         <input type="hidden" name="status_costing" id="status_costing" value="">
        <div class="col-md-12">
            <div class="row">
                <div class='col-md-3'>
                    <x:form.input label="Job Order No" placeholder="Job Order No" name="job_order_code" :model="$joborder" disabled="disabled" />
                </div>
                <div class='col-md-3'>
                    <x:form.input label="Vessel - Voyage" placeholder="Vessel - Voyage" name="vessel_name_voyage" :model="$joborder" disabled="disabled" />
                </div>
                <div class='col-md-3'>
                    <x:form.input label="Eta" placeholder="Eta" name="eta_dubai" :model="$joborder" disabled="disabled" />
                </div>
                <div class='col-md-3'>
                    <div class='mb-10'>
                        <label for="#origin" class='form-label '>Origin</label>
                        <input id="origin" type="text" class=" form-control" value="{{ $joborder->origin->city ?? "" }}" disabled="disabled">
                    </div>

                </div>
                <div class='col-md-12'>
                    <x:form.textarea label="Notes" placeholder="Notes" :model="$costing" name="notes" />
                </div>
            </div>
            <ul class="nav nav-tabs costing-tabs default-costing-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="vendor-tab" data-bs-toggle="tab" data-bs-target="#vendor" type="button" role="tab">Vendor</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="import-tab" data-bs-toggle="tab" data-bs-target="#import" type="button" role="tab">IMPORT COSTING</button>
                </li>

            </ul>
            <div class="tab-content p-3 bg-white border border-top-0">
                <div class="tab-pane fade show active" id="vendor" role="tabpanel">
                    <ul class="nav nav-tabs costing-tabs default-costing-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link pam-tab active" id="trucking-tab" data-bs-toggle="tab" data-bs-target="#trucking" type="button" role="tab">Trucking</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link pam-tab" id="port-tab" data-bs-toggle="tab" data-bs-target="#port" type="button" role="tab">Port</button>
                        </li>


                    </ul>
                    <div class="tab-content p-3 bg-white border border-top-0">
                        <div class="tab-pane fade show active" id="trucking" role="tabpanel">
                            @if($costing == null)
                            <x-costing.trucking-form :loading="$loading" :vendorTruck="$vendor_truck" />
                            @else
                             <x-costing.trucking-form-edit :costing="$costing" :vendorTruck="$vendor_truck" />
                            @endif
                        </div>

                        <div class="tab-pane fade" id="port" role="tabpanel">
                            <x-costing.port-form :bl="$bl" :costing="$costing" :vendorPort="$vendor_port" />
                        </div>


                    </div>
                </div>

                <div class="tab-pane fade row" id="import" role="tabpanel">
                    <x-costing.special-import :costing="$costing" type="dubai-business/sea-import" :vendorLine="$vendor_all" :charge="$charge" :currency="$currency" :joborder='$joborder' :bl='$bl'/>
                    <div class="d-flex align-items-center justify-content-start mb-3">
                        <x:form.input label="Transaction Date" placeholder="Transaction Date" name="transaction_date_import" type="date" :model="$joborder" />
                    </div>

                    @if($costing == null)
                    <x-costing.bl-form :costing="$costing" :bl="$bl" :costing="$costing" :vendorLine="$vendor_line" :charge="$charge" :currency="$currency" />
                    @else
                        <x-costing.bl-form-edit :bl="$bl" :costing="$costing" :vendorLine="$vendor_line" :charge="$charge" :currency="$currency" />
                    @endif
                </div>


            </div>
        </div>

         <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px; margin-top: 20px">
            <x:form.cancel-button href="{{ route('finance.costing.dubai-business.sea-import.index') }}" label="Cancel" />
            @if($costing?->status != 2)
            <button type="button" class="btn btn-sm custom-btn custom-btn-primary" id="save-button">Save</button>
            <button type="button" class="btn btn-sm custom-btn custom-btn-primary" id="post-button">Post</button>
            @endif
        </div>
        </x:form.wrapper>
    </x:layout.card.body>
</x:layout.card.wrapper>
@endsection

@push('js')
<script>

        // Event untuk tombol Save
        $('#save-button').click(function () {
            @if($costing?->status == 3)
            $('#status_costing').val(3); // Set status menjadi 1 (Save)
            @else
             $('#status_costing').val(1); // Set status menjadi 1 (Save)
            @endif
            $('#costing-form').submit(); // Submit form
        });

        // Event untuk tombol Post
        $('#post-button').click(function () {

            $('#status_costing').val(2); // Set status menjadi 2 (Post)
            $('#costing-form').submit(); // Submit form
        });

</script>
<script>
function setChargeBl(vendorId,vendorName,vendorCode, bl, vendorType, type, typeIndex = '') {
      var key = $("#bl_"+bl).val();
      if(vendorType != 'manual-bl' && vendorType != 'manual-mawb' && typeIndex != ''){
        console.log("XCA");
      $(`.${typeIndex}`).each(function () {
            const $row = $(this);
            const hiddenInput = $row.find(`input[name="costing_detail_bl_${key}_id[]"]`);

            if (hiddenInput.length) {

                const deletedId = hiddenInput.val(); // Ambil value ID dari input hidden
                if (deletedId) {
                    // Tambahkan input hidden untuk menandai ID yang dihapus
                    $row.append(`
                        <input type="hidden" name="costing_detail_bl_${key}_delete_id[]" value="${deletedId}">
                    `);
                }
                $row.addClass('d-none');
            } else {

                $row.remove();
            }
        });
      }


            var index = window[`rowIndexBl${key}`];
            console.log(index);
            //ajax disini
           $.ajax({
            url: `/finance/costing/dubai-business/sea-import/contractbl/${vendorId}/${bl}/${type}`, // Replace with your actual route
            method: 'GET', // Or 'POST' if your route uses POST
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    const charges = response.data;

                // Process the charges
                        charges.forEach((charge, idx) => {
                            var typex = idx === 0 ? 'parent' : 'child';
                            var data = {
                                vendor_id: vendorId,
                                vendor_name: vendorName,
                                vendor_code: vendorCode,
                                charge_id: charge.charge_id,
                                charge_name: charge.charge_name,
                                charge_code: charge.charge_code,
                                currency_id: charge.currency_id,
                                rate: charge.rate,
                                amount_in_usd: charge.amount_in_usd,
                                amount_in_aed: charge.amount_in_aed,
                                status: charge.status,
                            };
                            var indx = index + idx;
                           var vendorLine = @json($vendor_all);
                            // Call setCharge function
                            window[`setCharge${key}`](data, key, bl, indx, 'bl', vendorType, typex, vendorLine, typeIndex);
                        });
                    } else {
                        console.log("No charges available for this BL.");
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching charges:", error);
                }
            });

 }
</script>
@endpush
