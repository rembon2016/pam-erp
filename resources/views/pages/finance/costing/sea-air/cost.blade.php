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
     <x:form.wrapper action="{{ $data['action'] }}" method="{{ $data['method'] }}">
        <input type="hidden" value="{{ $joborder->loading_plan_id }}" name="loading_plan_id">
        <input type="hidden" value="{{ $joborder->job_order_id }}" name="job_order_id">
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
                    <x:form.textarea label="Notes" placeholder="Notes" name="notes" />
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
                            <x-costing.trucking-form :loading="$loading" :vendorTruck="$vendor_truck" />
                        </div>

                        <div class="tab-pane fade" id="port" role="tabpanel">
                            <x-costing.port-form :port="$port" :vendorPort="$vendor_port" />
                        </div>
                        <div class="tab-pane fade" id="agent" role="tabpanel">
                            <x-costing.agent-form  :vendorAir="$vendor_air" />

                        </div>

                    </div>
                </div>

                <div class="tab-pane fade" id="import" role="tabpanel">
                    <x-costing.special-import :vendorLine="$vendor_line" :charge="$charge" :currency="$currency" />
                    <x:form.input label="Transaction Date" placeholder="Transaction Date" name="transaction_date_import" type="date" :model="$joborder" />
                    <x-costing.bl-form :bl="$bl" :vendorLine="$vendor_line" :charge="$charge" :currency="$currency" />
                </div>
                <div class="tab-pane fade" id="export" role="tabpanel">
                    <x-costing.special-export :vendorLine="$vendor_line" :charge="$charge" :currency="$currency" />
                     <x:form.input label="Transaction Date" placeholder="Transaction Date" name="transaction_date_export" type="date" :model="$joborder" />
                     <x-costing.mawb-form :loadingplan="$loadingplan" :vendorLine="$vendor_line" :charge="$charge" :currency="$currency" />
                </div>

            </div>
        </div>
        </x:form.wrapper>
    </x:layout.card.body>
</x:layout.card.wrapper>
@endsection
