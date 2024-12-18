@extends('layout.app')
@section('body')
<x:layout.breadcrumb.wrapper module="Costing" pageName="SEA AIR">
    <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
    <x:layout.breadcrumb.item pageName="DETAIL" />
</x:layout.breadcrumb.wrapper>

<x:layout.card.wrapper>
    <x:layout.card.header>

        <h1 class="page-heading d-flex text-dark fw-bold fs-3 flex-column justify-content-center my-0">
            Sea Air Form
        </h1>
    </x:layout.card.header>
    <x:layout.card.body>
     <x:form.wrapper id="costing-form" action="{{ $data['action'] }}" method="{{ $data['method'] }}">
        <input type="hidden" value="{{ $joborder->loading_plan_id }}" name="loading_plan_id">
        <input type="hidden" value="{{ $joborder->job_order_id }}" name="job_order_id">
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
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="vendor-tab" data-bs-toggle="tab" data-bs-target="#vendor" type="button" role="tab">Vendor</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="import-tab" data-bs-toggle="tab" data-bs-target="#import" type="button" role="tab">IMPORT COSTING</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="export-tab" data-bs-toggle="tab" data-bs-target="#export" type="button" role="tab">EXPORT COSTING</button>
                </li>

            </ul>
            <div class="tab-content p-5 bg-white border border-top-0">
                <div class="tab-pane fade show active" id="vendor" role="tabpanel">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="trucking-tab" data-bs-toggle="tab" data-bs-target="#trucking" type="button" role="tab">Trucking</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="port-tab" data-bs-toggle="tab" data-bs-target="#port" type="button" role="tab">Port</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="agent-tab" data-bs-toggle="tab" data-bs-target="#agent" type="button" role="tab">Agent Airlines</button>
                        </li>

                    </ul>
                    <div class="tab-content p-5 bg-white border border-top-0">
                        <div class="tab-pane fade show active" id="trucking" role="tabpanel">
                            @if($costing == null)
                            <x-costing.trucking-form :loading="$loading" :vendorTruck="$vendor_truck" />
                            @else
                             <x-costing.trucking-form-edit :costing="$costing" :vendorTruck="$vendor_truck" />
                            @endif
                        </div>

                        <div class="tab-pane fade" id="port" role="tabpanel">
                            <x-costing.port-form :port="$port" :costing="$costing" :vendorPort="$vendor_port" />
                        </div>
                        <div class="tab-pane fade" id="agent" role="tabpanel">
                            <x-costing.agent-form  :costing="$costing" :vendorAir="$vendor_air" />

                        </div>

                    </div>
                </div>

                <div class="tab-pane fade row" id="import" role="tabpanel">
                    <x-costing.special-import :costing="$costing" :vendorLine="$vendor_line" :charge="$charge" :currency="$currency" />
                    <div class="d-flex align-items-center justify-content-start mb-5">
                        <x:form.input label="Transaction Date" placeholder="Transaction Date" name="transaction_date_import" type="date" :model="$joborder" />
                    </div>

                    @if($costing == null)
                    <x-costing.bl-form :costing="$costing" :bl="$bl" :costing="$costing" :vendorLine="$vendor_line" :charge="$charge" :currency="$currency" />
                    @else
                        <x-costing.bl-form-edit :bl="$bl" :costing="$costing" :vendorLine="$vendor_line" :charge="$charge" :currency="$currency" />
                    @endif
                </div>
                <div class="tab-pane fade" id="export" role="tabpanel">
                    <x-costing.special-export :costing="$costing" :vendorLine="$vendor_air" :charge="$charge" :currency="$currency" />
                    <div class="col-md-4">
                     <x:form.input label="Transaction Date" placeholder="Transaction Date" name="transaction_date_export" type="date" :model="$joborder" />
                     </div>
                       @if($costing == null)
                     <x-costing.mawb-form :costing="$costing" :loadingplan="$loadingplan" :vendorLine="$vendor_air" :charge="$charge" :currency="$currency" />
                     @else
                     <x-costing.mawb-form-edit :costing="$costing" :loadingplan="$loadingplan" :vendorLine="$vendor_air" :charge="$charge" :currency="$currency" />
                     @endif
                </div>

            </div>
        </div>
         <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px; margin-top: 20px">
            <x:form.cancel-button href="{{ route('finance.costing.sea-air.index') }}" label="Cancel" />
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
@endpush
