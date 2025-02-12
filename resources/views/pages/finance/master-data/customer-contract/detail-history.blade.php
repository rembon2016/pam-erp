@extends('layout.main-layout')
@section('title', 'Detail History of Customer Contract')

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

    <div class="card">
        <div class="card-body">
            <h3 class="text-center mb-4 mt-2">Customer Contract History Detail Information</h3>

            <div class="d-flex flex-column">
                <p class="mb-0">Created at: {{ \Carbon\Carbon::parse($history->payload['created_at']) }}</p>
                <p class="mb-0">Modified at: {{ \Carbon\Carbon::parse($history->payload['updated_at']) }}</p>
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
                        <td class="fw-semibold text-dark">Valid From</td>
                        <td>{{ \Carbon\Carbon::parse($history->payload['contract_start'])->format('d/m/Y') }}</td>
                    </tr>
                    <tr>
                        <td class="fw-semibold text-dark">Valid To</td>
                        <td>{{ \Carbon\Carbon::parse($history->payload['contract_end'])->format('d/m/Y') }}</td>
                    </tr>
                    <tr>
                        <td class="fw-semibold text-dark">Currency</td>
                        <td>{{ $currency }}</td>
                    </tr>
                    <tr>
                        <td class="fw-semibold text-dark">Attachment (Document)</td>
                        <td>
                            <div id="fileList">
                                @forelse($documents as $document)
                                    <div class="file-item">
                                        <span>{{ $document['contract_file'] }}</span>
                                        <div class="d-flex align-items-center justify-content-end gap-2">
                                            {{-- <a href="{{ asset('storage/'.\App\Models\Finance\CustomerContract::FOLDER_NAME.'/'.$document['contract_file']) }}" class="btn btn-sm px-1 py-3" download>
                                                <i class="bx bx-download text-info fs-5"></i>
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
        </div>
    </div>

    <!--begin::Accordion-->
    <div class="accordion mb-4" id="kt_accordion_service">
        @foreach ($services as $service_index => $service)
            <div class="accordion-item">
                <h2 class="accordion-header" id="kt_accordion_{{ $service_index + 1 }}_header">
                    <button class="accordion-button fs-7 fw-semibold @if($service_index != 0) collapsed @endif" type="button" data-bs-toggle="collapse" data-bs-target="#kt_accordion_{{ $service_index + 1 }}_body" aria-expanded="true" aria-controls="kt_accordion_{{ $service_index + 1 }}_body">
                        {{ \App\Functions\Eloquent\CustomerContractHelper::getServiceType($service['service_type']) }} #{{ $service_index + 1 }}
                    </button>
                </h2>
                <div id="kt_accordion_{{ $service_index + 1 }}_body" class="accordion-collapse collapse @if($service_index == 0) show @endif" aria-labelledby="kt_accordion_{{ $service_index + 1 }}_header" data-bs-parent="#kt_accordion_service">
                    <div class="accordion-body">
                        <div class="row mb-4">
                            <div class="col-12 mb-3">
                                <label for="" class="form-label">Service</label>
                                <input type="text" class="form-control" value="{{ \App\Functions\Eloquent\CustomerContractHelper::getServiceType($service['service_type']) }}" disabled>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="" class="form-label">Country Origin</label>
                                <input type="text" class="form-control" value="{{ \App\Functions\Eloquent\CustomerContractHelper::getCountry((int)$service['origin_country_id'], 'country_name') }}" disabled>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="" class="form-label">Port Origin</label>
                                <input type="text" class="form-control" value="{{ \App\Functions\Eloquent\CustomerContractHelper::getPort($service, 'origin') }}" disabled>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="" class="form-label">Country Destination</label>
                                <input type="text" class="form-control" value="{{ \App\Functions\Eloquent\CustomerContractHelper::getCountry((int)$service['destination_country_id'], 'country_name') }}" disabled>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="" class="form-label">Port Destination</label>
                                <input type="text" class="form-control" value="{{ \App\Functions\Eloquent\CustomerContractHelper::getPort($service, 'destination') }}" disabled>
                            </div>
                        </div>

                        <h6 class="mb-3">List of Charges</h6>

                        <div class="accordion" id="kt_accordion_{{ $service_index + 1 }}">
                            @foreach ($service['charges'] as $charge_index => $charge)
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="kt_accordion_{{ $service_index + 1 }}_{{ $charge_index + 1 }}_header">
                                        <button class="accordion-button fs-7 fw-semibold @if($charge_index != 0) collapsed @endif" type="button" data-bs-toggle="collapse" data-bs-target="#kt_accordion_{{ $service_index + 1 }}_{{ $charge_index + 1 }}_body" aria-expanded="true" aria-controls="kt_accordion_{{ $service_index + 1 }}_{{ $charge_index + 1 }}_body">
                                            {{ $charge['charges']['charge_code'] }} - {{ $charge['charges']['charge_name'] }}
                                        </button>
                                    </h2>
                                    <div id="kt_accordion_{{ $service_index + 1 }}_{{ $charge_index + 1 }}_body" class="accordion-collapse collapse @if($charge_index == 0) show @endif" aria-labelledby="kt_accordion_{{ $service_index + 1 }}_{{ $charge_index + 1 }}_header" data-bs-parent="#kt_accordion_{{ $service_index + 1 }}">
                                        <div class="accordion-body">
                                            @if (count($charge['details']) > 0)
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
                                                            @foreach ($charge->rates as $rate)
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
                    </div>
                </div>
            </div>
        @endforeach
    </div>
    <!--end::Accordion-->

    <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
        <x:form.cancel-button href="{{ route('finance.master-data.customer-contract.index') }}" label="Close" />
    </div>
@endsection
