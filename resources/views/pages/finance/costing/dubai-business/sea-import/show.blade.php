@extends('layout.main-layout')
@section('title', 'Detail of Sea Import Costing')

@section('body')
    <x:layout.breadcrumb.wrapper module="Costing" pageName="SEA IMPORT">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="DETAIL" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>

           <h1 class="page-heading text-dark fw-bold fs-3 text-center my-0 w-100">
               Sea Import Information
            </h1>
        </x:layout.card.header>
        <x:layout.card.body>
             <div class="row mb-5">
                <div class="col-md-6 col-12 mb-3">
                    <div class="card card-flush card-transition shadow-sm border p-4">
                        <h5 class="mb-3">Job Order Code</h5>
                        <span>{{ $joborder->job_order_code ?? '-' }}</span>
                    </div>
                </div>
                <div class="col-md-6 col-12 mb-3">
                    <div class="card card-flush card-transition shadow-sm border p-4">
                        <h5 class="mb-3">Origin</h5>
                        <span>{{ $joborder?->origin->city ?? '-' }}</span>
                    </div>
                </div>
            </div>

            <div class="row mb-5">
                <div class="col-md-6 col-12 mb-3">
                    <div class="card card-flush card-transition shadow-sm border p-4">
                        <h5 class="mb-3">Mother Vessel</h5>
                        <span>{{ $joborder?->vessel_name_voyage ?? '-' }}</span>
                    </div>
                </div>
                <div class="col-md-6 col-12 mb-3">
                    <div class="card card-flush card-transition shadow-sm border p-4">
                        <h5 class="mb-3">Feeder Vessel</h5>
                        <span>{{ $joborder?->loading->feeder_vessel_name ?? '-' }}</span>
                    </div>
                </div>
            </div>

            <div class="row mb-5">
                <div class="col-md-4 col-6 mb-3">
                    <div class="card card-flush card-transition shadow-sm border p-4">
                        <h5 class="mb-3">Date Order</h5>
                        <span>{{ \Carbon\Carbon::parse($joborder->date_order)->format('d M Y') }}</span>
                    </div>
                </div>
                <div class="col-md-4 col-6 mb-3">
                    <div class="card card-flush card-transition shadow-sm border p-4">
                        <h5 class="mb-3">Eta Transit Port</h5>
                        <span>{{ \Carbon\Carbon::parse($joborder->eta_dubai)->format('d M Y') }}</span>
                    </div>
                </div>
                <div class="col-md-4 col-6 mb-3">
                    <div class="card card-flush card-transition shadow-sm border p-4">
                        <h5 class="mb-3">Destination Charges</h5>
                        <span>{{ $joborder->destination_charges ?? '-' }}</span>
                    </div>
                </div>
            </div>

            <div class="row mb-5">
                <div class="col-12">
                    <div class="card card-flush card-transition shadow-sm border p-4">
                        <h5 class="mb-3">Description</h5>
                        <span>{{ $joborder->description ?? '-' }}</span>
                    </div>
                </div>
            </div>

            <div class="row mb-5">
                <div class="col-12 mb-3">
                    <div class="card card-flush card-transition shadow-sm border p-4">
                        <div class="d-flex flex-column gap-4">
                            <div class="mb-5">
                                <h5 class="mb-3">CTD Number</h5>
                                <div class="d-flex flex-row gap-3 flex-wrap">
                                    @forelse($joborder->detail as $detail)
                                    <span class="badge badge-success rounded-pill mb-3">
                                        {{ $detail->ctd_number }}
                                    </span>
                                    @empty
                                    <span>-</span>
                                    @endforelse
                                </div>
                            </div>
                            <div>
                                <h5 class="mb-3">Vendor</h5>
                                <div class="d-flex flex-row gap-3 flex-wrap">
                                    @forelse($joborder->vendor as $vendor)
                                    <span class="badge badge-primary rounded-pill mb-3">
                                        {{ $vendor->vendor_name }}
                                    </span>
                                    @empty
                                    <span>-</span>
                                    @endforelse
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mb-5">
                <div class="col-12 mb-3">
                    <div class="card card-flush shadow-sm border p-4">
                        <h5 class="mb-5">Documents</h5>
                        <div class="row mb-5 align-item-stretch">
                            <div class="col-md-6">
                                <div class="card card-flush card-transition shadow-sm border p-4 h-100">
                                    <h5 class="mb-3">Operation Chart</h5>
                                    <div class="d-flex flex-column gap-2">
                                        @if(!empty($op))
                                        @if($op->operation_chart != null || $op->operation_chart != 'null')
                                        <a href="{{ env('API_DXB').'/api/operationdocument/download?name_file='.$op->operation_chart }}" class="link-success" download>
                                            <i class="fa fa-download link-success"></i>
                                            {{ mb_strimwidth($op->operation_chart, 0, 10, '...') }}
                                        </a>
                                        @endif
                                        @endif


                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card card-flush card-transition shadow-sm border p-4 h-100">
                                    <h5 class="mb-3">Seaway Bill</h5>
                                    <div class="d-flex flex-column gap-2">
                                     @if(!empty($op))
                                        @if($op->seaway_bill != null || $op->seaway_bill != 'null')
                                        <a href="{{ env('API_DXB').'/api/operationdocument/download?name_file='.$op->seaway_bill }}" class="link-success" download>
                                            <i class="fa fa-download link-success"></i>
                                            {{ mb_strimwidth($op->seaway_bill, 0, 10, '...') }}
                                        </a>
                                        @endif
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-5 align-item-stretch">
                            <div class="col-md-4">
                                <div class="card card-flush card-transition shadow-sm border p-4 h-100">
                                    <h5 class="mb-3">Shipping Line Invoices</h5>
                                    <div class="d-flex flex-column gap-2">
                                        @foreach($joborder->doc as $row)
                                            @if($row->type_document == "shipping_line_invoices")
                                            <a href="{{ env('API_DXB').'/api/joborderdocument/download?name_file='.$row->name_file }}" class="link-success" download>
                                                <i class="fa fa-download link-success"></i>
                                                {{ mb_strimwidth($row->name_file, 0, 10, '...') }}
                                            </a>
                                            @endif
                                        @endforeach

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card card-flush card-transition shadow-sm border p-4 h-100">
                                    <h5 class="mb-3">Agreed Rate</h5>
                                    <div class="d-flex flex-column gap-2">
                                       @foreach($joborder->doc as $row)
                                            @if($row->type_document == "agreed_rate")
                                            <a href="{{ env('API_DXB').'/api/joborderdocument/download?name_file='.$row->name_file }}" class="link-success" download>
                                                <i class="fa fa-download link-success"></i>
                                                {{ mb_strimwidth($row->name_file, 0, 10, '...') }}
                                            </a>
                                            @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card card-flush card-transition shadow-sm border p-4 h-100">
                                    <h5 class="mb-3">Origin Debit Note</h5>
                                    <div class="d-flex flex-column gap-2">
                                        @foreach($joborder->doc as $row)
                                            @if($row->type_document == "origin_debit_note")
                                            <a href="{{ env('API_DXB').'/api/joborderdocument/download?name_file='.$row->name_file }}" class="link-success" download>
                                                <i class="fa fa-download link-success"></i>
                                                {{ mb_strimwidth($row->name_file, 0, 10, '...') }}
                                            </a>
                                            @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-5 align-item-stretch">
                            <div class="col-md-4">
                                <div class="card card-flush card-transition shadow-sm border p-4 h-100">
                                    <h5 class="mb-3">DCA Approval</h5>
                                    <div class="d-flex flex-column gap-2">
                                        @foreach($joborder->doc as $row)
                                            @if($row->type_document == "dca_approval")
                                            <a href="{{ env('API_DXB').'/api/joborderdocument/download?name_file='.$row->name_file }}" class="link-success" download>
                                                <i class="fa fa-download link-success"></i>
                                                {{ mb_strimwidth($row->name_file, 0, 10, '...') }}
                                            </a>
                                            @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card card-flush card-transition shadow-sm border p-4 h-100">
                                    <h5 class="mb-3">Custom Bill Entry</h5>
                                    <div class="d-flex flex-column gap-2">
                                        @foreach($joborder->doc as $row)
                                            @if($row->type_document == "custom_bill_entry")
                                            <a href="{{ env('API_DXB').'/api/joborderdocument/download?name_file='.$row->name_file }}" class="link-success" download>
                                                <i class="fa fa-download link-success"></i>
                                                {{ mb_strimwidth($row->name_file, 0, 10, '...') }}
                                            </a>
                                            @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card card-flush card-transition shadow-sm border p-4 h-100">
                                    <h5 class="mb-3">Packing List</h5>
                                    <div class="d-flex flex-column gap-2">
                                       @foreach($joborder->doc as $row)
                                            @if($row->type_document == "packing_list")
                                            <a href="{{ env('API_DXB').'/api/joborderdocument/download?name_file='.$row->name_file }}" class="link-success" download>
                                                <i class="fa fa-download link-success"></i>
                                                {{ mb_strimwidth($row->name_file, 0, 10, '...') }}
                                            </a>
                                            @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-5 align-item-stretch">
                            <div class="col-md-4">
                                <div class="card card-flush card-transition shadow-sm border p-4 h-100">
                                    <h5 class="mb-3">Calogi Invoices</h5>
                                    <div class="d-flex flex-column gap-2">
                                       @foreach($joborder->doc as $row)
                                            @if($row->type_document == "calogi_invoices")
                                            <a href="{{ env('API_DXB').'/api/joborderdocument/download?name_file='.$row->name_file }}" class="link-success" download>
                                                <i class="fa fa-download link-success"></i>
                                                {{ mb_strimwidth($row->name_file, 0, 10, '...') }}
                                            </a>
                                            @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card card-flush card-transition shadow-sm border p-4 h-100">
                                    <h5 class="mb-3">Final MAWB Copy</h5>
                                    <div class="d-flex flex-column gap-2">
                                       @foreach($joborder->doc as $row)
                                            @if($row->type_document == "final_mawb_copy")
                                            <a href="{{ env('API_DXB').'/api/joborderdocument/download?name_file='.$row->name_file }}" class="link-success" download>
                                                <i class="fa fa-download link-success"></i>
                                                {{ mb_strimwidth($row->name_file, 0, 10, '...') }}
                                            </a>
                                            @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card card-flush card-transition shadow-sm border p-4 h-100">
                                    <h5 class="mb-3">Commercial Invoices</h5>
                                    <div class="d-flex flex-column gap-2">
                                       @foreach($joborder->doc as $row)
                                            @if($row->type_document == "commerical_invoices")
                                            <a href="{{ env('API_DXB').'/api/joborderdocument/download?name_file='.$row->name_file }}" class="link-success" download>
                                                <i class="fa fa-download link-success"></i>
                                                {{ mb_strimwidth($row->name_file, 0, 10, '...') }}
                                            </a>
                                            @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-5 align-item-stretch">
                            <div class="col-md-4">
                                <div class="card card-flush card-transition shadow-sm border p-4 h-100">
                                    <h5 class="mb-3">Cash Voucher</h5>
                                    <div class="d-flex flex-column gap-2">
                                        @foreach($joborder->doc as $row)
                                            @if($row->type_document == "cash_voucher")
                                            <a href="{{ env('API_DXB').'/api/joborderdocument/download?name_file='.$row->name_file }}" class="link-success" download>
                                                <i class="fa fa-download link-success"></i>
                                                {{ mb_strimwidth($row->name_file, 0, 10, '...') }}
                                            </a>
                                            @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card card-flush card-transition shadow-sm border p-4 h-100">
                                    <h5 class="mb-3">Custom Inspection</h5>
                                    <div class="d-flex flex-column gap-2">
                                        @foreach($joborder->doc as $row)
                                            @if($row->type_document == "custom_inpection")
                                            <a href="{{ env('API_DXB').'/api/joborderdocument/download?name_file='.$row->name_file }}" class="link-success" download>
                                                <i class="fa fa-download link-success"></i>
                                                {{ mb_strimwidth($row->name_file, 0, 10, '...') }}
                                            </a>
                                            @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card card-flush card-transition shadow-sm border p-4 h-100">
                                    <h5 class="mb-3">Bill of Loading</h5>
                                    <div class="d-flex flex-column gap-2">
                                       @foreach($lpdoc as $row)
                                            @if($row->type_document == "lp_bl_doc")
                                            <a href="{{ env('API_DXB').'/api/loadingplandocument/download?name_file='.$row->name_file }}" class="link-success" download>
                                                <i class="fa fa-download link-success"></i>
                                                {{ mb_strimwidth($row->name_file, 0, 10, '...') }}
                                            </a>
                                            @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-5 align-item-stretch">
                            <div class="col-md-6">
                                <div class="card card-flush card-transition shadow-sm border p-4 h-100">
                                    <h5 class="mb-3">Shipping Line Do</h5>
                                    <div class="d-flex flex-column gap-2">
                                       @foreach($joborder->doc as $row)
                                            @if($row->type_document == "shipping_line_do")
                                            <a href="{{ env('API_DXB').'/api/joborderdocument/download?name_file='.$row->name_file }}" class="link-success" download>
                                                <i class="fa fa-download link-success"></i>
                                                {{ mb_strimwidth($row->name_file, 0, 10, '...') }}
                                            </a>
                                            @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card card-flush card-transition shadow-sm border p-4 h-100">
                                    <h5 class="mb-3">DG Handler Invoices</h5>
                                    <div class="d-flex flex-column gap-2">
                                       @foreach($joborder->doc as $row)
                                            @if($row->type_document == "dg_handler_invoices")
                                            <a href="{{ env('API_DXB').'/api/joborderdocument/download?name_file='.$row->name_file }}" class="link-success" download>
                                                <i class="fa fa-download link-success"></i>
                                                {{ mb_strimwidth($row->name_file, 0, 10, '...') }}
                                            </a>
                                            @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-5 align-item-stretch">
                            <div class="col-md-6">
                                <div class="card card-flush card-transition shadow-sm border p-4 h-100">
                                    <h5 class="mb-3">Airline Agreed Rate</h5>
                                    <div class="d-flex flex-column gap-2">
                                       @foreach($joborder->doc as $row)
                                            @if($row->type_document == "airline_agreed_rate")
                                            <a href="{{ env('API_DXB').'/api/joborderdocument/download?name_file='.$row->name_file }}" class="link-success" download>
                                                <i class="fa fa-download link-success"></i>
                                                {{ mb_strimwidth($row->name_file, 0, 10, '...') }}
                                            </a>
                                            @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card card-flush card-transition shadow-sm border p-4 h-100">
                                    <h5 class="mb-3">Transport Invoices</h5>
                                    <div class="d-flex flex-column gap-2">
                                       @foreach($joborder->doc as $row)
                                            @if($row->type_document == "transport_invoice")
                                            <a href="{{ env('API_DXB').'/api/joborderdocument/download?name_file='.$row->name_file }}" class="link-success" download>
                                                <i class="fa fa-download link-success"></i>
                                                {{ mb_strimwidth($row->name_file, 0, 10, '...') }}
                                            </a>
                                            @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-5 align-item-stretch">
                            <div class="col-md-12">
                                <div class="card card-flush card-transition shadow-sm border p-4 h-100">
                                    <h5 class="mb-3">CTD</h5>
                                    <div class="d-flex flex-column gap-2">
                                        @forelse($joborder->detail as $ctd)
                                        <a href="{{ env('API_DXB').'/api/shippinginstruction/download?ctd_number='.$ctd->ctd_number }}" class="link-success" download>
                                            <i class="fa fa-download link-success"></i>
                                            {{ mb_strimwidth($ctd->ctd_number, 0, 20, '...') }}
                                        </a>
                                        @empty
                                        <span>-</span>
                                        @endforelse
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-5 align-item-stretch">
                            <div class="col-md-12">
                                <div class="card card-flush card-transition shadow-sm border p-4 h-100">
                                    <h5 class="mb-3">Other</h5>
                                    <div class="d-flex flex-column gap-2">
                                        @foreach($joborder->doc as $row)
                                            @if($row->type_document == "others")
                                            <a href="{{ env('API_DXB').'/api/joborderdocument/download?name_file='.$row->name_file }}" class="link-success" download>
                                                <i class="fa fa-download link-success"></i>
                                                {{ mb_strimwidth($row->name_file, 0, 10, '...') }}
                                            </a>
                                            @endif
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="d-flex w-100 justify-start" style="gap: 7.5px; margin-top: 20px">
                <button type="button" class="btn btn-sm custom-btn btn-secondary" >Open</button>
                @if($costing?->status != 1 && $costing != null)
                <button type="button" class="btn btn-sm custom-btn btn-danger" id="closed-button">Closed</button>
                <button type="button" class="btn btn-sm custom-btn custom-btn-primary" id="reopen-button">Re-Open</button>
                @endif
            </div>
             <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px; margin-top: 20px">
            <x:form.cancel-button href="{{ route('finance.costing.dubai-business.sea-import.index') }}" label="Cancel" />



        </div>
        </x:layout.card.body>
    </x:layout.card.wrapper>
@endsection

@push('js')
<script>
  @if($costing?->status != 1 && $costing != null)
$(document).on('click', '#closed-button', function (e) {
    e.preventDefault(); // Prevent the default link behavior

    const url = "{{ route('finance.costing.dubai-business.sea-import.status',[$costing?->id, 2]) }}"; // Get the URL from the link

    Swal.fire({
        title: 'Are you sure?',
        text: "do you want to close?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes!'
    }).then((result) => {
        if (result.isConfirmed) {
            // Redirect to the URL if confirmed
            window.location.href = url;
        }
    });
});


$(document).on('click', '#reopen-button', function (e) {
    e.preventDefault(); // Prevent the default link behavior

    const url = "{{ route('finance.costing.dubai-business.sea-import.status',[$costing?->id, 3]) }}"; // Get the URL from the link

    Swal.fire({
        title: 'Are you sure?',
        text: "do you want to re-open?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes!'
    }).then((result) => {
        if (result.isConfirmed) {
            // Redirect to the URL if confirmed
            window.location.href = url;
        }
    });
});
@endif
</script>
@endpush
