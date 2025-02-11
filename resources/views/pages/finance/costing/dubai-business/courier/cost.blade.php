@extends('layout.main-layout')
@section('title', 'Form Courier Costing')

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
<x:layout.breadcrumb.wrapper module="Costing" pageName="Courier">
    <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
    <x:layout.breadcrumb.item pageName="Cost" />
</x:layout.breadcrumb.wrapper>

<x:layout.card.wrapper>
    <x:layout.card.header>

        <h1 class="page-heading d-flex text-dark fw-bold fs-3 flex-column justify-content-center my-0">
            Courier Form
        </h1>
    </x:layout.card.header>
    <x:layout.card.body>
     <x:form.wrapper id="costing-form" action="{{ $data['action'] }}" method="{{ $data['method'] }}">
        <input type="hidden" value="{{ $joborder->job_order_id }}" name="loading_plan_id">
        <input type="hidden" value="{{ $joborder->job_order_id }}" name="job_order_id">
        <input type="hidden" name="type_costing" value="COURIER">
         <input type="hidden" name="status_costing" id="status_costing" value="">
        <div class="col-md-12">
            <div class="row">
                <div class='col-md-4'>
                    <x:form.input label="Job Order No" placeholder="Job Order No" name="job_order_code" :model="$joborder" disabled="disabled" />
                </div>
                <div class='col-md-4'>
                    <x:form.input label="Courier Resi Number" placeholder="Courier Resi Number" name="loading_plan_number" :model="$joborder" disabled="disabled" />
                </div>
                <div class='col-md-4'>
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
                    <button class="nav-link active" id="import-tab" data-bs-toggle="tab" data-bs-target="#import" type="button" role="tab">COURIER COSTING</button>
                </li>

            </ul>
            <div class="tab-content p-5 bg-white border border-top-0">
                <div class="tab-pane fade show active" id="import" role="tabpanel">
                    <x-costing.special-other :costing="$costing" type="courier" :vendorLine="$vendor_all" :charge="$charge" :currency="$currency" :joborder='$joborder'/>
                    <div class="d-flex align-items-center justify-content-start mb-5">
                        <x:form.input label="Transaction Date" placeholder="Transaction Date" name="transaction_date_import" type="date" :model="$joborder" />
                    </div>

                    @if($costing == null)
                    <x-costing.other-form :costing="$costing" :joborder="$joborder" :costing="$costing" :vendorAll="$vendor_all" :charge="$charge" :currency="$currency" />
                    @else
                      <x-costing.other-form-edit :costing="$costing" :joborder="$joborder" :costing="$costing" :vendorAll="$vendor_all" :charge="$charge" :currency="$currency" />
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
function setChargeOther(vendorId,vendorName,vendorCode, number, vendorType, type, typeIndex = '') {
      var key = $("#other_"+number).val();
      if(vendorType != 'manual-other' && typeIndex != ''){

      $(`.${typeIndex}`).each(function () {
            const $row = $(this);
            const hiddenInput = $row.find(`input[name="costing_detail_other_${key}_id[]"]`);

            if (hiddenInput.length) {

                const deletedId = hiddenInput.val(); // Ambil value ID dari input hidden
                if (deletedId) {
                    // Tambahkan input hidden untuk menandai ID yang dihapus
                    $row.append(`
                        <input type="hidden" name="costing_detail_other_${key}_delete_id[]" value="${deletedId}">
                    `);
                }
                $row.addClass('d-none');
            } else {

                $row.remove();
            }
        });
      }


            var index = window[`rowIndexOther${key}`];
            console.log(index);
            //ajax disini
           $.ajax({
            url: `/finance/costing/dubai-business/courier/contract/${vendorId}/${number}/${type}`, // Replace with your actual route
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
                            window[`setCharge${key}`](data, key, number, indx, 'other', vendorType, typex, vendorLine, typeIndex);
                        });
                    } else {
                        console.log("No charges available for this Other.");
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching charges:", error);
                }
            });

 }
</script>
@endpush
