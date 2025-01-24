@extends('layout.app')

@push('css')
<style>
    .table-detail, .table-charge {
        border: 1px solid #ddd;
        width: 100%;
    }

    .table-detail tr td {
        border: 1px solid #ddd;
        width: 50%;
        padding: 7.5px;
    }

    .table-charge :is(tr, td, th) {
        border: 1px solid #ddd;
    }

    .table-charge :is(td, th) {
        padding: 10px;
    }
</style>
@endpush

@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="History Detail of Customer Contract">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
        <x:layout.breadcrumb.item pageName="Customer Contract" href="{{ route('finance.master-data.customer-contract.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <div class="card-body">
            <h3 class="text-center mb-4">Customer Contract History Detail Information</h3>

            <div class="d-flex flex-column">
                <p class="mb-0">Created at: {{ \Carbon\Carbon::parse($history->payload['created_at']) }}</p>
                <p class="mb-0">Modified at: {{ \Carbon\Carbon::parse($history->payload['updated_at']) }}</p>
            </div>

            <hr>

            <div class="table-responsive mb-10">
                <table class="table-detail">
                    <tr>
                        <td class="fw-bold fs-6 text-gray-800">Contract No</td>
                        <td>{{ $history->payload['contract_no'] }}</td>
                    </tr>
                    <tr>
                        <td class="fw-bold fs-6 text-gray-800">Customer Name</td>
                        <td>{{ $customer->customer_name }}</td>
                    </tr>
                    <tr>
                        <td class="fw-bold fs-6 text-gray-800">Customer Type</td>
                        <td>
                            @if ($customer?->customerTypes->count() > 1)
                                <ul>
                                    @foreach ($customer?->customerTypes as $customerType)
                                        <li>{{ $customerType?->name ?? 'N/A' }}</li>
                                    @endforeach
                                </ul>
                            @elseif ($customer?->customerTypes->count() == 1)
                                {{ $customer?->customerTypes->first()?->name ?? 'N/A' }}
                            @else
                                N/A
                            @endif
                        </td>
                    </tr>
                    <tr>
                        <td class="fw-bold fs-6 text-gray-800">Valid From</td>
                        <td>{{ \Carbon\Carbon::parse($history->payload['contract_start'])->format('d/m/Y') }}</td>
                    </tr>
                    <tr>
                        <td class="fw-bold fs-6 text-gray-800">Valid To</td>
                        <td>{{ \Carbon\Carbon::parse($history->payload['contract_end'])->format('d/m/Y') }}</td>
                    </tr>
                    <tr>
                        <td class="fw-bold fs-6 text-gray-800">Service</td>
                        <td>-</td>
                    </tr>
                    <tr>
                        <td class="fw-bold fs-6 text-gray-800">Country Origin</td>
                        <td>-</td>
                    </tr>
                    <tr>
                        <td class="fw-bold fs-6 text-gray-800">Port Origin</td>
                        <td>-</td>
                    </tr>
                    <tr>
                        <td class="fw-bold fs-6 text-gray-800">Country Destination</td>
                        <td>-</td>
                    </tr>
                    <tr>
                        <td class="fw-bold fs-6 text-gray-800">Port Destination</td>
                        <td>-</td>
                    </tr>
                    <tr>
                        <td class="fw-bold fs-6 text-gray-800">Currency</td>
                        <td>{{ $currency }}</td>
                    </tr>
                    <tr>
                        <td class="fw-bold fs-6 text-gray-800">Attachment (Document)</td>
                        <td>
                            <div id="fileList">
                                @forelse($documents as $document)
                                    <div class="file-item">
                                        <span>{{ $document['contract_file'] }}</span>
                                        <div class="d-flex align-items-center justify-content-end gap-2">
                                            {{-- <a href="{{ asset('storage/'.\App\Models\Finance\CustomerContract::FOLDER_NAME.'/'.$document['contract_file']) }}" class="btn btn-sm px-1 py-3" download>
                                                <i class="bx bx-download text-info fs-2"></i>
                                            </a> --}}
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

            <!--begin::Accordion-->
            <div class="accordion mb-5" id="kt_accordion_1">
                @foreach ($charges as $charge)
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="kt_accordion_{{ $loop->iteration }}_header">
                            <button class="accordion-button fs-4 fw-semibold @if($loop->iteration != 1) collapsed @endif" type="button" data-bs-toggle="collapse" data-bs-target="#kt_accordion_{{ $loop->iteration }}_body" aria-expanded="true" aria-controls="kt_accordion_{{ $loop->iteration }}_body">
                                {{ $charge['charges']['charge_code'] }} - {{ $charge['charges']['charge_name'] }}
                            </button>
                        </h2>
                        <div id="kt_accordion_{{ $loop->iteration }}_body" class="accordion-collapse collapse @if($loop->iteration == 1) show @endif" aria-labelledby="kt_accordion_{{ $loop->iteration }}_header" data-bs-parent="#kt_accordion_1">
                            <div class="accordion-body">
                                @if ($charge['details']->count() > 0)
                                    @if ($charge['details'][0]['unit_code'] == "KG")
                                    <strong class="d-block mb-3">Charge Rates by Kilogram:</strong>
                                        <table class="table-charge">
                                            <thead>
                                                <tr>
                                                    <th>From</th>
                                                    <th>To</th>
                                                    <th>Value</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($charge['details'] as $rate)
                                                    <tr>
                                                        <td>{{ $rate['from'] }}</td>
                                                        <td>{{ $rate['to'] }}</td>
                                                        <td>{{ $rate['rate'] }}</td>
                                                    </tr>
                                                @endforeach
                                            </tbody>
                                        </table>
                                    @elseif ($charge['details'][0]['unit_code'] == "SHIPMENT")
                                    <strong class="d-block mb-3">Charge Rates by Shipment:</strong>
                                        <table class="table-charge">
                                            <thead>
                                                <tr>
                                                    <th>Rate</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($charge['details'] as $rate)
                                                    <tr>
                                                        <td>{{ $rate['rate'] }}</td>
                                                    </tr>
                                                @endforeach
                                            </tbody>
                                        </table>
                                    @elseif ($charge['details'][0]['unit_code'] == "CONTAINER")
                                        <strong class="d-block mb-3">Charge Rates by Container:</strong>
                                        <table class="table-charge">
                                            <thead>
                                                <tr>
                                                    <th>Container Type</th>
                                                    <th class="text-center">Rate</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($charge['details'] as $rate)
                                                    <tr>
                                                        <td>{{ $rate['container_type'] }}</td>
                                                        <td class="text-center">{{ $rate['rate'] }}</td>
                                                    </tr>
                                                @endforeach
                                            </tbody>
                                        </table>
                                    @endif
                                @endif
                            </div>
                        </div>
                    </div>
                @endforeach

            </div>
            <!--end::Accordion-->

            <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
                <x:form.cancel-button href="{{ route('finance.master-data.customer-contract.index') }}" label="Close" />
            </div>
        </div>
    </x:layout.card.wrapper>
@endsection
