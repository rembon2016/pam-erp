@extends('layout.app')
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

    .tableServiceForm .tableServiceForm-content::-webkit-scrollbar-track, .tableChargeForm::-webkit-scrollbar-tra{
        background-color: #000;
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

    <x:layout.card.wrapper>
        <div class="card-body">
            <h3 class="text-center mb-4">Agent Contract Detail Information</h3>

            <div class="d-flex flex-column">
                <p class="mb-0">Created at: {{ $agent_contract->created_at?->format('Y-m-d H:i:s') }}</p>
                <p class="mb-0">Modified at: {{ $agent_contract->updated_at?->format('Y-m-d H:i:s') }}</p>
            </div>

            <hr>

            <div class="table-responsive mb-10">
                <table class="table-detail">
                    <tr>
                        <td class="fw-bold fs-6 text-gray-800">Customer Name</td>
                        <td>{{ $agent_contract->customer?->customer_name }}</td>
                    </tr>
                    <tr>
                        <td class="fw-bold fs-6 text-gray-800">Customer Type</td>
                        <td>
                            @if ($agent_contract->customer?->customerTypes->count() > 1)
                                <ul>
                                    @foreach ($agent_contract->customer?->customerTypes as $customerType)
                                        <li>{{ $customerType?->name ?? 'N/A' }}</li>
                                    @endforeach
                                </ul>
                            @elseif ($agent_contract->customer?->customerTypes->count() == 1)
                                {{ $agent_contract->customer?->customerTypes->first()?->name ?? 'N/A' }}
                            @else
                                N/A
                            @endif
                        </td>
                    </tr>
                    <tr>
                        <td class="fw-bold fs-6 text-gray-800">Contract Date</td>
                        <td>{{ $agent_contract->contract_date?->format('d/m/Y') }}</td>
                    </tr>
                    <tr>
                        <td class="fw-bold fs-6 text-gray-800">Start Contract Date</td>
                        <td>{{ $agent_contract->contract_start?->format('d/m/Y') }}</td>
                    </tr>
                    <tr>
                        <td class="fw-bold fs-6 text-gray-800">End Contract Date</td>
                        <td>{{ $agent_contract->contract_end?->format('d/m/Y') }}</td>
                    </tr>
                    <tr>
                        <td class="fw-bold fs-6 text-gray-800">Attachment (Document)</td>
                        <td>
                            @if (!is_null($agent_contract?->contract_file))
                                <a href="{{ $agent_contract?->getFileURL() }}" class="btn btn-sm btn-info d-inline-block mt-2" download>
                                    <i class="bx bx-download me-2"></i> Download File
                                </a>
                            @else
                                -
                            @endif
                        </td>
                    </tr>
                </table>
            </div>


            <div class="mb-10">
                <div class="d-flex align-items-center justify-content-between mb-5">
                    <h4 class="mb-5 mt-5">Service Details</h4>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class='mb-10'>
                            <!--begin::Accordion-->
                            @include('pages.finance.master-data.agent-contract.detail-service-contract-form')
                            <!--end::Accordion-->
                        </div>
                    </div>
                </div>
            </div>

            <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
                <x:form.cancel-button href="{{ route('finance.master-data.agent-contract.index') }}" label="Close" />
            </div>
        </div>
    </x:layout.card.wrapper>
@endsection