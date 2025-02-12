@extends('layout.main-layout')
@section('title', 'Detail of Invoice')
@push('css')
<style>
    .table-detail {
        border: 1px solid #ddd;
        width: 100%;
    }

    .table-detail tr td {
        border: 1px solid #ddd;
        width: 50%;
        padding: 7.5px;
    }

    .tableServiceForm, .tableChargeForm {
        display: flex;
        flex-direction: column;
        flex-wrap: nowrap;
    }

    .tableServiceForm {
        overflow-x: hidden;
    }

    .tableChargeForm {
        margin: 0 15px;
    }

    .tableServiceForm :is(.form-control) {
        padding: 0.5rem 0.75rem;
        font-size: 1rem;
    }

    .tableServiceForm :is(.form-select) {
        padding: 0.5rem 3rem 0.5rem 0.75rem;
        font-size: 1rem;
    }

    .tableServiceForm .tableServiceForm-content::-webkit-scrollbar, .tableChargeForm::-webkit-scrollbar {
        height: 3px;
        width: 3px;
    }

    .tableServiceForm .tableServiceForm-content::-webkit-scrollbar-track, .tableChargeForm::-webkit-scrollbar-track{
        background-color: #fff;
    }

    .tableServiceForm .tableServiceForm-content {
        overflow-x: scroll;
        border: 1px solid #ddd;
        border-radius: 5px;
    }

    .tableServiceForm :is(.tableServiceForm-heading, .tableServiceForm-body .tableServiceForm-body-row), .tableChargeForm :is(.tableChargeForm-heading, .tableChargeForm-body .tableChargeForm-body-row) {
        display: flex;
        flex-direction: row;
        flex-wrap: nowrap;
        white-space: nowrap;
    }

    .tableServiceForm .tableServiceForm-box, .tableChargeForm .tableChargeForm-box {
        flex: 1;
        /* border: 1px solid #ededed; */
        min-width: 200px;
        padding: 5px;
    }

    .tableChargeForm .tableChargeForm-box .tableChargeForm-heading-text {
        font-size: 12px;
    }
</style>
@endpush
@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="Agent Contract">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
    </x:layout.breadcrumb.wrapper>

    <div class="card">
        <div class="card-body">
            <h3 class="text-center mb-4 mt-2">Invoice Detail Information</h3>

            <div class="d-flex flex-column">
                <p class="mb-0">Created at: {{ $data->created_at?->format('Y-m-d H:i:s') }}</p>
                <p class="mb-0">Modified at: {{ $data->updated_at?->format('Y-m-d H:i:s') }}</p>
            </div>

            <hr>

            <div class="table-responsive mb-10">
                <table class="table-detail">
                    <tr>
                        <td class="fw-semibold text-dark">Invoice No</td>
                        <td>{{ $data->invoice_nno }}</td>
                    </tr>
                    <tr>
                        <td class="fw-semibold text-dark">Invoice Date</td>
                        <td>{{ $data->invoice_date?->format('d/m/y') }}</td>
                    </tr>
                    <tr>
                        <td class="fw-semibold text-dark">Invoice Due Date</td>
                        <td>{{ $data->invoice_due_date?->format('d/m/y') }}</td>
                    </tr>
                    <tr>
                        <td class="fw-semibold text-dark">CTD No.</td>
                        <td>
                            @if ($data->invoiceShipment->count() > 1)
                                <ul class="mb-0">
                                    @foreach ($data->invoiceShipment as $shipment)
                                        <li>{{ $shipment?->ctd_number ?? 'N/A' }}</li>
                                    @endforeach
                                </ul>
                            @elseif ($data->invoiceShipment->count() == 1)
                                {{ $data->invoiceShipment->first()?->ctd_number ?? 'N/A' }}
                            @else
                                N/A
                            @endif
                        </td>
                    </tr>
                    <tr>
                        <td class="fw-semibold text-dark">Billing Customer</td>
                        <td>{{ $data->customer?->customer_name }}</td>
                    </tr>
                    <tr>
                        <td class="fw-semibold text-dark">Additional Charges</td>
                        <td> - </td>
                    </tr>
                    <tr>
                        <td class="fw-semibold text-dark">Billing Amount</td>
                        <td>{{ $data->total }}</td>
                    </tr>
                    <tr>
                        <td class="fw-semibold text-dark">Description</td>
                        <td>{{ $data->description }}</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>


            <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
                <x:form.cancel-button href="{{ route('finance.billing.invoice.index') }}" label="Close" />

                @if ($data->is_approved == 0)
                    <a href="{{ route('finance.billing.invoice.approve', $data->id) }}" class="btn btn-sm custom-btn custom-btn-primary">Approve</a>
                @else
                    <button type="button" class="btn btn-primary" disabled>Approved</button>
                @endif
            </div>
@endsection
