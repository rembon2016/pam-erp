@extends('layout.main-layout')
@section('title', 'Detail History of Agent Contract')
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

    .tableServiceForm :is(.tableServiceForm-heading, .tableServiceForm-body .tableServiceForm-body-row), .tableChargeForm :is(.tableChargeForm-heading, .tableChargeForm-body .tableChargeForm-body-row), .tableChargeDetailForm :is(.tableChargeDetailForm-heading, .tableChargeDetailForm-body .tableChargeDetailForm-body-row) {
        display: flex;
        flex-direction: row;
        flex-wrap: nowrap;
        white-space: nowrap;
    }

    .tableServiceForm .tableServiceForm-box, .tableChargeForm .tableChargeForm-box, .tableChargeDetailForm .tableChargeDetailForm-box  {
        flex: 1;
        /* border: 1px solid #ededed; */
        min-width: 200px;
        padding: 5px;
    }

    .tableChargeForm .tableChargeForm-box .tableChargeForm-heading-text, .tableChargeDetailForm .tableChargeDetailForm-box .tableChargeDetailForm-heading-text  {
        font-size: 12px;
    }
</style>
@endpush
@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="Detail Of Agent Contract">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
        <x:layout.breadcrumb.item pageName="Agent Contract" href="{{ route('finance.master-data.agent-contract.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <div class="card">
        <div class="card-body">
            <h3 class="text-center mb-4 mt-2">Agent Contract Detail Information</h3>

            <div class="d-flex flex-column">
                <p class="mb-0">Created at: {{ \Carbon\Carbon::parse($history->payload['created_at'])->format('Y-m-d H:i:s') }}</p>
                <p class="mb-0">Modified at: {{ \Carbon\Carbon::parse($history->payload['updated_at'])->format('Y-m-d H:i:s') }}</p>
            </div>

            <hr>

            <div class="table-responsive mb-10">
                <table class="table-detail">
                    <tr>
                        <td class="fw-semibold text-dark">Contract No</td>
                        <td>{{ $history->payload['contract_no'] }}</td>
                    </tr>
                    <tr>
                        <td class="fw-semibold text-dark">Customer Name</td>
                        <td>{{ $customer->customer_name }}</td>
                    </tr>
                    <tr>
                        <td class="fw-semibold text-dark">Customer Type</td>
                        <td>
                            @if ($customer->customerTypes->count() > 1)
                                <ul>
                                    @foreach ($customer->customerTypes as $customerType)
                                        <li>{{ $customerType?->name ?? 'N/A' }}</li>
                                    @endforeach
                                </ul>
                            @elseif ($customer->customerTypes->count() == 1)
                                {{ $customer->customerTypes->first()?->name ?? 'N/A' }}
                            @else
                                N/A
                            @endif
                        </td>
                    </tr>
                    <tr>
                        <td class="fw-semibold text-dark">Contract Date</td>
                        <td>{{ \Carbon\Carbon::parse($history->payload['contract_date'])->format('d/m/Y') }}</td>
                    </tr>
                    <tr>
                        <td class="fw-semibold text-dark">Valid From</td>
                        <td>{{ \Carbon\Carbon::parse($history->payload['contract_start'])->format('d/m/Y') }}</td>
                    </tr>
                    <tr>
                        <td class="fw-semibold text-dark">Valid To</td>
                        <td>{{ \Carbon\Carbon::parse($history->payload['contract_end'])->format('d/m/Y') }}</td>
                    </tr>
                    <tr>
                        <td class="fw-semibold text-dark">Attachment (Document)</td>
                        <td>
                            <div id="fileList">
                                @forelse($documents as $document)
                                    <div class="file-item">
                                        <span>{{ $document->contract_file }}</span>
                                        <div class="d-flex align-items-center justify-content-end gap-2">
                                            <a href="{{ asset('storage/' . \App\Models\Finance\AgentContract::FOLDER_NAME . '/' . $document['contract_file']) }}" class="btn px-1" download>
                                                <i class="bx bx-download text-primary fs-5"></i>
                                            </a>
                                        </div>
                                    </div>
                                @empty
                                -
                                @endforelse
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>



    <div class="card">
        <div class="card-body">
            <h5 class="mb-4 text-center">Agent Contract Ports</h5>
            <div class="mb-10">
                <div class="row">
                    <div class="col-12">
                        <div class='mb-10'>
                            <!--begin::Accordion-->
                            @include('pages.finance.master-data.agent-contract.detail-history-service-contract', ['services' => $services])
                            <!--end::Accordion-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
        <x:form.cancel-button href="{{ route('finance.master-data.agent-contract.index') }}" label="Close" />
    </div>
@endsection
