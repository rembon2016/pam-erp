@props(['shipment', 'type'])
<script>
    console.log('Shipment data:', @json($shipment));
</script>

<div class="card mb-5 mb-xl-10">
    <div class="card-header justify-content-end header-shipment-detail">
        <div class="card-toolbar">
            <a href="{{ url()->previous() }}" class="btn-close-shipment-detail">
                Close <i class="fas fa-times text-white ms-2"></i>
            </a>
        </div>
    </div>

    <div class="my-card-padding">
        <div class="bg-light-success p-5 mb-5">
            <div class="d-flex justify-content-between align-items-center w-100">
                <div class="d-flex gap-3 flex-column p-4">
                    <div class="d-flex align-items-center gap-2">
                        <h3 class="ctd-big-info">{{ $shipment['ctd_number'] ?? '-' }}</h3>
                        <i class="fas fa-copy cursor-pointer"
                            onclick="copyToClipboard('{{ $shipment['ctd_number'] }}')"></i>
                    </div>
                    <span class="ctd-mini-info">
                        @php
                            $shipmentType = match($shipment['shipment_by']) {
                                'SEAAIR' => 'SEA - AIR TRANSPORT',
                                'AIR' => 'CROSS - AIR TRANSPORT', 
                                'SEAIMPORT' => 'SEA IMPORT TRANSPORT',
                                'SEAEXPORT' => 'SEA EXPORT TRANSPORT',
                                'AIRIMPORT' => 'AIR IMPORT TRANSPORT',
                                'AIREXPORT' => 'AIR EXPORT TRANSPORT',
                                'WAREHOUSE' => 'WAREHOUSE',
                                'TRUCKING' => 'TRUCKING',
                                'COURIER' => 'COURIER',
                                default => $shipment['shipment_by'] ?? '-'
                            };
                        @endphp
                        {{ $shipmentType }}
                    </span>
                </div>
                <div class="d-flex gap-3 flex-column align-items-end">
                    <div>
                        <span class="text-dark fw-bold">Shipment Status : </span>
                        <span class="status-ship">{{ $shipment['status_shipment'] ?? '-' }}</span>
                    </div>
                    @if(in_array($shipment['shipment_by'], ['SEAAIR', 'AIR']))
                        <a href="javascript:void(0)" class="btn btn-success btn-sm btn-ctd-download-detail"
                            onclick="downloadCTD('{{ $shipment['ctd_number'] }}', '{{ $shipment['job_id'] }}', this)">
                            CTD <i class="fas fa-download ms-1"></i>
                        </a>
                    @elseif(in_array($shipment['shipment_by'], ['SEAIMPORT', 'SEAEXPORT']))
                        <a href="javascript:void(0)" class="btn btn-success btn-sm btn-ctd-download-detail"
                            onclick="downloadCTD('{{ $shipment['ctd_number'] }}', '{{ $shipment['job_id'] }}', this)">
                            HBL <i class="fas fa-download ms-1"></i>
                        </a>
                    @elseif(in_array($shipment['shipment_by'], ['AIRIMPORT', 'AIREXPORT']))
                        <a href="javascript:void(0)" class="btn btn-success btn-sm btn-ctd-download-detail"
                            onclick="downloadCTD('{{ $shipment['ctd_number'] }}', '{{ $shipment['job_id'] }}', this)">
                            HAWB <i class="fas fa-download ms-1"></i>
                        </a>
                    @endif
                </div>
            </div>
        </div>
    </div>


    <div class="card-body p-9 pt-0">
        @if(in_array($shipment['shipment_by'], ['COURIER']))
            <x-shipment.booking-information-courier :shipment="$shipment" />
        @else
            <x-shipment.booking-information :shipment="$shipment" />
        @endif

        <div class="title-head-shipping-detail">
            <h4>Order Detail :</h4>
        </div>

        <div class="row mb-1">
            <div class="col-md-4">
                <x-list.box-list icon="weight" title="Gross Weight" :value="$shipment['order']['gross_weight'] ?? '-'" />
            </div>
            <div class="col-md-4">
                <x-list.box-list icon="ruler-combined" title="Measurement" :value="$shipment['order']['measurement'] ?? '-'" />
            </div>
            <div class="col-md-4">
                <x-list.box-list icon="balance-scale" title="Chargeable Weight" :value="$shipment['order']['chw'] ?? '-'" />
            </div>
        </div>

        <div class="row mb-1">
            <div class="col-md-4">
                <x-list.box-list icon="sort-amount-up" title="Quantity" :value="$shipment['order']['qty'] ?? '-'" />
            </div>
            <div class="col-md-4">
                <x-list.box-list icon="boxes" title="Packages" :value="$shipment['order']['pkgs'] ?? '-'" />
            </div>
            <div class="col-md-4">
                <x-list.box-list icon="weight-hanging" title="Total Vol. Weight" :value="$shipment['order']['vol_weight'] ?? '-'" />
            </div>
        </div>

        <div class="row mb-1">
            <div class="col-md-12">
                <x-list.box-list icon="box-open" title="Description Of Goods" :value="!empty($shipment['order']['description_of_goods'])
                    ? Str::of($shipment['order']['description_of_goods'])->toHtmlString()
                    : '-'" />
            </div>
        </div>

        <div class="title-head-shipping-detail">
            <h4>Detail :</h4>
        </div>

        <div class="table-responsive">
            <table class="table shipment-detail align-middle">
                <thead>
                    <tr>
                        <th class="custom-th">ORDER NO.</th>
                        <th class="custom-th">ART NO.</th>
                        <th class="custom-th">STYLE NO.</th>
                        <th class="custom-th">HS CODE</th>
                        <th class="custom-th">CONTAINER NO.</th>
                    </tr>
                </thead>
                <tbody>
                    @if (!empty($shipment['order_detail']) && is_array($shipment['order_detail']))
                        @foreach ($shipment['order_detail'] as $detail)
                            <tr class="custom-tr">
                                <td class="custom-td">{{ $detail['order_number'] ?? '-' }}</td>
                                <td class="custom-td">{{ $detail['art_number'] ?? '-' }}</td>
                                <td class="custom-td">{{ $detail['style_number'] ?? '-' }}</td>
                                <td class="custom-td">{{ $detail['hs_code'] ?? '-' }}</td>
                                <td class="custom-td">{{ $detail['container_number'] ?? '-' }}</td>
                            </tr>
                        @endforeach
                    @else
                        <tr class="custom-tr">
                            <td class="custom-td text-center" colspan="5">No order details available</td>
                        </tr>
                    @endif
                </tbody>
            </table>
        </div>

        <div class="title-head-shipping-detail">
            <h4>Dimension :</h4>
        </div>

        <div class="table-responsive">
            <table class="table shipment-detail align-middle">
                <thead>
                    <tr>
                        <th class="custom-th">NO. PCS</th>
                        <th class="custom-th">LENGTH</th>
                        <th class="custom-th">WIDTH</th>
                        <th class="custom-th">HEIGHT</th>
                        <th class="custom-th">VOLUME CBM</th>
                        <th class="custom-th">VOLUME WEIGHT</th>
                    </tr>
                </thead>
                <tbody>
                    @if (count($shipment['dimension']) > 0)
                        @foreach ($shipment['dimension'] as $dimension)
                            <tr class="custom-tr">
                                <td class="custom-td">{{ $dimension['no_pcs'] ?? '-' }}</td>
                                <td class="custom-td">{{ $dimension['length'] ?? '-' }}</td>
                                <td class="custom-td">{{ $dimension['width'] ?? '-' }}</td>
                                <td class="custom-td">{{ $dimension['height'] ?? '-' }}</td>
                                <td class="custom-td">{{ $dimension['volume_cbm'] ?? '-' }}</td>
                                <td class="custom-td">{{ $dimension['volume_weight'] ?? '-' }}</td>
                            </tr>
                        @endforeach
                    @else
                        <tr class="custom-tr">
                            <td class="custom-td text-center" colspan="6">No dimension details available</td>
                        </tr>
                    @endif
                </tbody>
            </table>
        </div>


        @if (in_array($shipment['shipment_by'], ['SEAAIR', 'SEAIMPORT', 'SEAEXPORT']))
            <div class="title-head-shipping-detail">
                <h4>Sailing Schedule :</h4>
            </div>
        @elseif(in_array($shipment['shipment_by'], ['AIR']))
            <div class="title-head-shipping-detail">
                <h4>Main Flight Detail :</h4>
            </div>
        @endif


        @if (in_array($shipment['shipment_by'], ['SEAAIR', 'SEAIMPORT', 'SEAEXPORT']))
            <x-shipment.sailing-schedule :shipment="$shipment" />
        @elseif(in_array($shipment['shipment_by'], ['AIR']))
            <x-shipment.flight-detail :shipment="$shipment" />
        @else
        @endif


        @if (!in_array($shipment['shipment_by'], ['WAREHOUSE', 'TRUCKING', 'COURIER', 'SEAIMPORT', 'SEAEXPORT']))
            <div class="title-head-shipping-detail" id="flight-detail-origin-title">
                <h4>
                    @if (in_array($shipment['shipment_by'], ['AIR']))
                        Flight Detail (Transit) *if any :
                    @else
                        Flight Detail :
                    @endif
                </h4>
            </div>

            @if (!in_array($shipment['shipment_by'], ['WAREHOUSE', 'TRUCKING', 'COURIER', 'AIRIMPORT', 'AIREXPORT']))
                <div class="row mb-1" id="flight-detail-origin-content">
                    <div class="col-md-3">
                        <x:list.box-list icon="plane" title="Carrier Name"
                            value="{{ $shipment['loading_plan']['carrier_name'] ?? '-' }}" />
                    </div>
                    <div class="col-md-3">
                        <x:list.box-list icon="file-alt" title="Loading Plan Number"
                            value="{{ $shipment['loading_plan']['loading_plan_number'] ?? '-' }}" />
                    </div>
                    <div class="col-md-3">
                        <x:list.box-list icon="file-alt" title="MAWB Number"
                            value="{{ $shipment['loading_plan']['mawb_number'] ?? '-' }}" />
                    </div>
                    <div class="col-md-3">
                        <x:list.box-list icon="clock" title="Cut-off Time"
                            value="{{ $shipment['loading_plan']['closing_time'] ?? '-' }}" date="true" />
                    </div>
                </div>
            @endif

            @if (in_array($shipment['shipment_by'], ['AIRIMPORT', 'AIREXPORT']))
                <div class="row mb-1" id="flight-detail-origin-content">
                    <div class="col-md-4">
                        <x:list.box-list icon="plane" title="Carrier Name"
                            value="{{ $shipment['loadingplandetail']['carrier_name'] ?? '-' }}" />
                    </div>
                    <div class="col-md-4">
                        <x:list.box-list icon="file-alt" title="Flight Number"
                            value="{{ $shipment['loadingplandetail']['flight_number'] ?? '-' }}" />
                    </div>
                    <div class="col-md-4">
                        <x:list.box-list icon="file-alt" title="Flight Closing Time"
                            value="{{ $shipment['closing_time_seaair'] ?? '-' }}" date="true" />
                    </div>
                    <div class="col-md-4">
                        <x:list.box-list icon="clock" title="ETD"
                            value="{{ $shipment['loadingplandetail']['date_departure'] ?? '-' }}" date="true" />
                    </div>
                    <div class="col-md-4">
                        <x:list.box-list icon="clock" title="ETA"
                            value="{{ $shipment['loadingplandetail']['date_arival'] ?? '-' }}" date="true" />
                    </div>
                    <div class="col-md-4">
                        <x:list.box-list icon="clock" title="Loading Plan Number"
                            value="{{ $shipment['loading_plan_local']['loading_plan_number'] ?? '-' }}" />
                    </div>
                </div>
            @endif

            <div class="table-responsive">
                <table class="table shipment-detail align-middle">
                    <thead>
                        <tr>
                            <th class="custom-th">FLIGHT NO.</th>
                            <th class="custom-th">AIRPORT DEPARTURE</th>
                            <th class="custom-th">DATE DEPARTURE</th>
                            <th class="custom-th">AIRPORT ARRIVAL</th>
                            <th class="custom-th">DATE ARRIVAL</th>
                        </tr>
                    </thead>
                    <tbody>
                        @if (!empty($shipment['loading_plan_detail']) && is_array($shipment['loading_plan_detail']))
                            @foreach ($shipment['loading_plan_detail'] as $detail)
                                <tr class="custom-tr">
                                    <td class="custom-td">{{ $detail['flight_number'] ?? '-' }}</td>
                                    <td class="custom-td">{{ $detail['port_departure_name'] ?? '-' }}</td>
                                    <td class="custom-td">
                                        @if (!empty($detail['date_departure']))
                                            {{ $detail['date_departure'] ? \Carbon\Carbon::parse($detail['date_departure'])->format('d M Y, H:i') : '-' }}
                                        @else
                                            -
                                        @endif
                                    </td>
                                    <td class="custom-td">{{ $detail['port_arival_name'] ?? '-' }}</td>
                                    <td class="custom-td">
                                        @if (!empty($detail['date_arival']))
                                            {{ $detail['date_arival'] ? \Carbon\Carbon::parse($detail['date_arival'])->format('d M Y, H:i') : '-' }}
                                        @else
                                            -
                                        @endif
                                    </td>
                                </tr>
                            @endforeach
                        @else
                            <tr class="custom-tr">
                                <td class="custom-td text-center" colspan="5">No flight details available</td>
                            </tr>
                        @endif
                    </tbody>
                </table>
            </div>
        @endif



        @if (!in_array($shipment['shipment_by'], ['SEAIMPORT', 'SEAEXPORT', 'AIRIMPORT', 'AIREXPORT', 'WAREHOUSE', 'TRUCKING', 'COURIER']))
            <div class="title-head-shipping-detail">
                <h4>Delivery Information :</h4>
            </div>

            <div class="row mb-1">
                <div class="col-md-6">
                    <x-list.box-list icon="truck" title="Truck Code" :value="$shipment['jobtruckdelivery']['truck_code'] ?? '-'" />
                </div>
                <div class="col-md-6">
                    <x-list.box-list icon="shipping-fast" title="Delivered" :value="$shipment['jobtruckdelivery']['delivered'] ?? '-'" />
                </div>
            </div>
        @endif

        @if (!in_array($shipment['shipment_by'], ['SEAIMPORT', 'SEAEXPORT', 'AIRIMPORT', 'AIREXPORT', 'WAREHOUSE', 'TRUCKING', 'COURIER']))
            <div class="row mb-1">
                <div class="col-md-6">
                    <div class="title-head-shipping-detail">
                        <h4>Destination Handling Agent :</h4>
                    </div>

                    @if (isset($shipment['destination_handling_agent']) && count($shipment['destination_handling_agent']) > 0)
                        @foreach ($shipment['destination_handling_agent'] as $agent)
                            <x:list.box-list icon="building" title="Office"
                                value="{{ $agent['office_name'] ?? '-' }}" />
                        @endforeach
                    @else
                        <span>No Data</span>
                    @endif
                </div>
                <div class="col-md-6">
                    <div class="title-head-shipping-detail">
                        <h4>Destination Partner :</h4>
                    </div>

                    @if (isset($shipment['destination_partner']) && count($shipment['destination_partner']) > 0)
                        @foreach ($shipment['destination_partner'] as $partner)
                            <x:list.box-list icon="globe-africa" title="Destination Partner"
                                value="{{ $partner['office_name'] ?? '-' }}" />
                        @endforeach
                    @else
                        <span>No Data</span>
                    @endif
                </div>
            </div>
        @endif

        @if (!in_array($shipment['shipment_by'], ['COURIER']))
            <div class="row mb-1">
                <div class="col-md-6">
                    <div class="title-head-shipping-detail">
                        <h4>Sales Office: :</h4>
                    </div>

                    @if (isset($shipment['sales_office']) && count($shipment['sales_office']) > 0)
                        @foreach ($shipment['sales_office'] as $office)
                            <x:list.box-list icon="building" title="Sales Office"
                                value="{{ $office['sales_office_name'] ?? '-' }}" />
                        @endforeach
                    @else
                        <span>No Data</span>
                    @endif
                </div>
                <div class="col-md-6">
                    <div class="title-head-shipping-detail">
                        <h4>Sales Person :</h4>
                    </div>

                    @if (isset($shipment['sales_person']) && count($shipment['sales_person']) > 0)
                        @foreach ($shipment['sales_person'] as $person)
                            <x:list.box-list icon="user" title="Sales Person"
                                value="{{ $person['sales_person_name'] ?? '-' }}" />
                        @endforeach
                    @else
                        <span>No Data</span>
                    @endif
                </div>
            </div>

            <div class="row mb-1">
                <div class="col-md-6">
                    <div class="title-head-shipping-detail">
                        <h4>Billing Customer: :</h4>
                    </div>

                    <x-list.box-list icon="users" title="Billing Customer" :value="$shipment['customer_name'] ?? '-'" />
                </div>
                <div class="col-md-6">
                    <div class="title-head-shipping-detail">
                        <h4>Customer Group :</h4>
                    </div>

                    <x-list.box-list icon="users" title="Customer Group" :value="$shipment['customer_group_name'] ?? '-'" />
                </div>
            </div>
       
            @if (in_array($shipment['shipment_by'], ['SEAIMPORT', 'SEAEXPORT', 'AIRIMPORT', 'AIREXPORT', 'WAREHOUSE', 'TRUCKING']))
                <div class="title-head-shipping-detail">
                    <h4>Local Transport Details :</h4>
                </div>

                <div class="table-responsive">
                    <table class="table shipment-detail align-middle">
                        <thead>
                            <tr>
                                <th class="custom-th">Driver</th>
                                <th class="custom-th">Driver Phone</th>
                                <th class="custom-th">Vehicle Number</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if (!empty($shipment['local_transport']) && is_array($shipment['local_transport']))
                                @foreach ($shipment['local_transport'] as $transport)
                                    <tr class="custom-tr">
                                        <td class="custom-td">{{ $transport['vehicle_driver'] ?? '-' }}</td>
                                        <td class="custom-td">{{ $transport['driver_phone'] ?? '-' }}</td>
                                        <td class="custom-td">{{ $transport['vehicle_number'] ?? '-' }}</td>
                                    </tr>
                                @endforeach
                            @else
                                <tr class="custom-tr">
                                    <td class="custom-td text-center" colspan="3">No local transport details available
                                    </td>
                                </tr>
                            @endif
                        </tbody>
                    </table>
                </div>

                <x-list.box-list icon="sticky-note" title="Notes Local Transport" :value="$shipment['order']['notes'] ?? '-'" />
            @endif

            <div class="title-head-shipping-detail">
                <h4>Documents :</h4>
            </div>

            @if (!in_array($shipment['shipment_by'], ['SEAIMPORT', 'SEAEXPORT', 'AIRIMPORT', 'AIREXPORT']))
                <div class="row mb-1">
                    <div
                        class="{{ in_array($shipment['shipment_by'], ['AIR', 'AIRIMPORT', 'AIREXPORT']) ? 'col-md-12' : 'col-md-6' }} mb-3">
                        <x:list.box-list-download name="ctd-file" title="CTD File"
                            value="{{ $shipment['ctd_number'] ?? '-' }}"
                            onclick="downloadCTD('{{ $shipment['ctd_number'] }}', '{{ $shipment['job_id'] }}', this)" />
                    </div>
                    @if (!in_array($shipment['shipment_by'], ['AIR', 'AIRIMPORT', 'AIREXPORT']))
                        <div class="col-md-6 mb-3">
                            <x:list.box-list-download name="final-alert" title="Final Alert"
                                value="final-alert-{{ $shipment['ctd_number'] ?? '-' }}"
                                onclick="downloadFinalAlert('{{ $shipment['ctd_number'] }}', '{{ $shipment['mother_vessel_id'] }}', '{{ $shipment['voyage_number_mother'] }}', '{{ $shipment['origin_id'] }}', '{{ $shipment['created_by'] }}', this)" />
                        </div>
                    @endif
                </div>
            @endif

            <div class="row mb-1">
                @php
                    $documentTypes = [
                        ['label' => 'Shipping Instruction', 'value' => 'si_doc'],
                        ['label' => 'Container Loading Sheet', 'value' => 'container_loading_doc'],
                        ['label' => 'Commercial Invoice', 'value' => 'com_invoices_doc'],
                        ['label' => 'MSDS', 'value' => 'msds_doc'],
                        ['label' => 'COO', 'value' => 'coo_doc'],
                        ['label' => 'Packing List', 'value' => 'packing_list_doc'],
                        ['label' => 'CFT', 'value' => 'cft_doc'],
                        ['label' => 'Others', 'value' => 'other_doc'],
                        ['label' => 'Bill Of Lading', 'value' => 'bil_doc', 'valueLoadingPlan' => 'lp_bl_doc'],
                        ['label' => 'Test Report', 'value' => 'test_report_doc'],
                        [
                            'label' => 'MAWB',
                            'value' => 'mawb_doc',
                            'valueLoadingPlan' => 'lp_mawb',
                            'type' => 'mawb_doc',
                            'visible' => true,
                        ],
                        [
                            'label' => 'Cargo Manifest',
                            'value' => 'cargo_manifest',
                            'valueLoadingPlan' => 'lp_cargo_manifest',
                            'type' => 'cargo_manifest',
                            'visible' => true,
                        ],
                        ['label' => 'Pictures', 'value' => 'pictures', 'type' => 'pictures', 'visible' => true],
                    ];

                    // Add conditional document types
                    if (isset($shipment['shipment_by'])) {
                        if (in_array($shipment['shipment_by'], ['SEAIMPORT', 'SEAEXPORT', 'AIRIMPORT', 'AIREXPORT', 'WAREHOUSE', 'TRUCKING', 'COURIER'])) {
                            array_unshift(
                                $documentTypes,
                                ['label' => 'Final Alert', 'value' => 'final_alert_doc'],
                                ['label' => 'HAWB', 'value' => 'ctd_doc'],
                            );
                        } else {
                            $documentTypes[] = [
                                'label' => 'Origin Debit Note',
                                'value' => 'debit_doc',
                                'valueLoadingPlan' => 'lp_origin_debit',
                            ];
                            $documentTypes[] = [
                                'label' => 'Attachment Of Goods',
                                'value' => 'attachment_goods',
                            ];
                        }
                    }
                @endphp

                @foreach ($documentTypes as $docType)
                    @php
                        $matchingDocs = collect($shipment['order_document'] ?? [])->filter(function ($doc) use ($docType) {
                            return $doc['type_document'] === ($docType['valueOrderDocuments'] ?? $docType['value']);
                        });
                    @endphp

                    <div class="col-md-4 mb-3">
                        @if ($matchingDocs->isNotEmpty())
                            <x-list.box-list-download name="{{ $docType['value'] }}" title="{{ $docType['label'] }}"
                                :value="$matchingDocs
                                    ->map(function ($doc) {
                                        return [
                                            'name' => $doc['name_file'],
                                            'id' => $doc['order_document_id'],
                                        ];
                                    })
                                    ->toArray()" onclick="handleDocumentClick(event)" />
                        @else
                            <div class="d-block w-100">
                                <div class="box-list">
                                    <div>
                                        <div class="box-list-title mb-2">{{ $docType['label'] }}</div>
                                        <span class="box-list-value">-</span>
                                    </div>
                                </div>
                            </div>
                        @endif
                    </div>
                @endforeach
            </div>

            @if (!in_array($shipment['shipment_by'], ['SEAIMPORT', 'SEAEXPORT', 'AIRIMPORT', 'AIREXPORT', 'WAREHOUSE', 'TRUCKING', 'COURIER']))
                <div class="title-head-shipping-detail">
                    <h4>Notes :</h4>
                </div>

                <div class="row mb-1">
                    <div class="col-md-12">
                        <div class="view-notes">
                            @foreach (['chat_origin' => 'Origin', 'chat_dxb' => 'DXB', 'chat_agent' => 'Agent'] as $chatKey => $sectionTitle)
                                <div class="title">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                        fill="currentColor" class="bi bi-journal-text" viewBox="0 0 16 16">
                                        <path
                                            d="M5 10.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z">
                                        </path>
                                        <path
                                            d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z">
                                        </path>
                                        <path
                                            d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z">
                                        </path>
                                    </svg>
                                    <span>{{ $sectionTitle }}</span>
                                </div>
                                @if (empty($shipment[$chatKey]))
                                    <div class="view-row-notes d-flex">
                                        <div class="note-view no-border">
                                            <div class="note-view-content">
                                                <p class="note-view-content-text text-muted">No data notes</p>
                                            </div>
                                        </div>
                                    </div>
                                @else
                                    @foreach ($shipment[$chatKey] as $note)
                                        <div class="view-row-notes d-flex">
                                            <div class="note-view">
                                                <div class="note-view-header">
                                                    <div class="note-view-header-sender">{{ $note['created_by'] }}</div>
                                                    <div style="display: flex; align-items: center; gap: 10px;">
                                                        {{ \Carbon\Carbon::parse($note['times'])->format('l, M d, Y') }}
                                                    </div>
                                                </div>
                                                <div class="note-view-content">
                                                    <p class="note-view-content-text">{{ $note['noted'] }}</p>
                                                </div>
                                                @if (isset($note['attachment']) && $note['attachment'] !== 'null')
                                                    <div class="note-view-content d-flex justify-content-end">
                                                        <span title="Download Image" class="note-view-content-text"
                                                            style="cursor: pointer;"
                                                            onclick="downloadNoteAttachment('{{ $note['attachment'] }}')">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="20"
                                                                height="20" fill="currentColor"
                                                                class="bi bi-image-fill" viewBox="0 0 16 16">
                                                                <path
                                                                    d="M.002 3a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-12a2 2 0 0 1-2-2V3zm1 9v1a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V9.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12zm5-6.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0z" />
                                                            </svg>
                                                        </span>
                                                    </div>
                                                @endif
                                            </div>
                                        </div>
                                    @endforeach
                                @endif
                            @endforeach
                        </div>
                    </div>
                </div>

                <div class="title-head-shipping-detail">
                    <h4>Additional Description (printed as attachment page) :</h4>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="ckeditor-content">
                            {!! $shipment['order']['additional_description'] ?? '-' !!}
                        </div>
                    </div>
                </div>
            @endif
        @endif


    </div>
</div>

<script>
    const API_BASE = `${window.location.protocol}//${'{!! in_array($type, ['seaair', 'crossair']) ? env('API_ORIGIN') : env('API_DXB') !!}'}`;

    function copyToClipboard(text) {
        navigator.clipboard.writeText(text).then(() => {
            Swal.fire({
                icon: 'success',
                title: 'Copied!',
                text: 'CTD Number copied to clipboard!',
                timer: 1500,
                showConfirmButton: false
            });
        });
    }

    async function downloadCTD(ctdNumber, jobId, element) {
        // Get the icon element
        const icon = element.querySelector('.fas');
        if (icon.classList.contains('fa-spinner')) return; // Prevent multiple clicks

        // Show loading state
        icon.classList.remove('fa-download');
        icon.classList.add('fa-spinner', 'fa-spin');

        try {
            const response = await fetch(
                `${API_BASE}/api/airbill/export?job_id=${jobId}&type=ctd&role=DXB Staff&office_id=533219ad-bfa1-4cf6-87f9-fce85748a647`, {
                    method: 'GET',
                    headers: {
                        'Content-Type': 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
                    },
                });

            if (!response.ok) {
                throw new Error('Network response was not ok');
            }

            // Get the blob from response
            const blob = await response.blob();

            // Create download link
            const url = window.URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = `CTD-${ctdNumber}.pdf`;
            document.body.appendChild(a);
            a.click();
            window.URL.revokeObjectURL(url);
            a.remove();

        } catch (error) {
            console.error('Download error:', error);
            Swal.fire({
                icon: 'error',
                title: 'Download Failed',
                text: 'Failed to download CTD file. Please try again.'
            });
        } finally {
            // Reset icon state
            icon.classList.remove('fa-spinner', 'fa-spin');
            icon.classList.add('fa-download');
        }
    }

    async function downloadFinalAlert(ctdNumber, motherVesselId, voyageNumberMother, originId, createdBy, element) {
        // Return if no mother vessel id
        // if (!motherVesselId) return;

        // Get the icon element
        const icon = element.querySelector('.fas');
        if (icon.classList.contains('fa-spinner')) return; // Prevent multiple clicks

        // Show loading state
        icon.classList.remove('fa-download');
        icon.classList.add('fa-spinner', 'fa-spin');

        try {
            // Extract prefix from CTD number (following Next.js logic exactly)
            const parts = ctdNumber.split("-");
            const extractedPart = parts[0].slice(0, -2);

            const response = await fetch(
                `${API_BASE}/api/finalalert/export?mother_vessel_id=${motherVesselId}&voyage_number_mother=${voyageNumberMother}&origin_id=${originId}&created_by=${createdBy}&prefix=${extractedPart}`, {
                    method: 'GET',
                    headers: {
                        'Content-Type': 'application/pdf',
                    },
                }
            );

            if (!response.ok) {
                throw new Error('Network response was not ok');
            }

            // Get the blob from response
            const blob = await response.blob();

            // Create download link
            const url = window.URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = `final-alert-${ctdNumber}.pdf`;
            document.body.appendChild(a);
            a.click();
            window.URL.revokeObjectURL(url);
            a.remove();

        } catch (error) {
            console.error('Download error:', error);
            Swal.fire({
                icon: 'error',
                title: 'Download Failed',
                text: 'Data not found'
            });
        } finally {
            // Reset icon state
            icon.classList.remove('fa-spinner', 'fa-spin');
            icon.classList.add('fa-download');
        }
    }

    async function downloadOrderDocument(documentId, nameFile, element) {
        // Ensure element is a DOM element
        if (!(element instanceof HTMLElement)) {
            console.error('Element is not a DOM element:', element);
            return;
        }

        // Get the icon element
        const icon = element.querySelector('.fas');
        if (icon.classList.contains('fa-spinner')) return; // Prevent multiple clicks

        // Show loading state
        icon.classList.remove('fa-download');
        icon.classList.add('fa-spinner', 'fa-spin');

        try {
            const encodedName = encodeURIComponent(nameFile);
            const response = await fetch(
                `${API_BASE}/api/order/download?job_id=${documentId}&name_file=${encodedName}`, {
                    method: 'GET',
                    headers: {
                        'Content-Type': 'application/pdf',
                    },
                });

            if (!response.ok) {
                throw new Error('Network response was not ok');
            }

            // Get the blob from response
            const blob = await response.blob();

            // Create download link
            const url = window.URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;

            // Check if the element with the class exists
            const textElement = element.querySelector('.text-gray-800');
            console.log(encodedName, 'encodedName');
            const fileName = encodedName.includes('%2F') ? decodeURIComponent(encodedName.split('%2F')[1]) :
                decodeURIComponent(encodedName);
            a.download = fileName;

            document.body.appendChild(a);
            a.click();
            window.URL.revokeObjectURL(url);
            a.remove();

        } catch (error) {
            console.error('Download error:', error);
            Swal.fire({
                icon: 'error',
                title: 'Download Failed',
                text: 'Failed to download document. Please try again.'
            });
        } finally {
            // Reset icon state
            icon.classList.remove('fa-spinner', 'fa-spin');
            icon.classList.add('fa-download');
        }
    }

    function handleDocumentClick(event) {
        const target = event.target.closest('.box-list-value');
        if (!target) return;

        const fileData = JSON.parse(target.dataset.file);
        downloadOrderDocument(fileData.id, fileData.name, target);
    }

    async function downloadNoteAttachment(attachment) {
        try {
            const response = await fetch(
                `${API_BASE}/api/notedsection/download?name_file=${attachment}`, {
                    method: 'GET',
                }
            );

            if (!response.ok) {
                throw new Error('Network response was not ok');
            }

            // Get the blob from response
            const blob = await response.blob();

            // Create download link
            const url = window.URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            // Get filename from attachment path
            const fileName = attachment.split('/').pop();
            a.download = fileName;

            document.body.appendChild(a);
            a.click();

            // Cleanup
            window.URL.revokeObjectURL(url);
            a.remove();

        } catch (error) {
            console.error('Download error:', error);
            Swal.fire({
                icon: 'error',
                title: 'Download Failed',
                text: 'Failed to download attachment. Please try again.'
            });
        }
    }
</script>

<style>
    .cursor-pointer {
        cursor: pointer;
    }

    .bg-light-success {
        background-color: #E8FFF3 !important;
    }

    .bg-light-primary {
        background-color: #F1FAFF !important;
    }

    .text-primary {
        color: #009EF7 !important;
    }

    .note-view.no-border {
        border: none !important;
        box-shadow: none !important;
    }
</style>
