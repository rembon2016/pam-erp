@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="{{ $page }}">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="General Wise" />
        <x:layout.breadcrumb.item pageName="Shipment" href="{{ route('finance.general-wise.shipment.index',['type'=>$type]) }}" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>
             <x:layout.card.toolbar-shipment />
             <div  class="col-12">
             <x:filter-shipment type="{{ $type }}"/>
             </div>
        </x:layout.card.header>
        <x:layout.card.body>
            <x:layout.table.wrapper id="shipment_table">
                <thead>
                    <x:layout.table.row>
                        <th><input type="checkbox" class="row-checkbox" id="select_all"></th>
                        <x:layout.table.heading widthPixel="100" title="CTD NUMBER" />
                        <x:layout.table.heading widthPixel="100" title="SHIPMENT STATUS" />
                        <x:layout.table.heading widthPixel="100" title="SHIPPER" />
                        <x:layout.table.heading widthPixel="100" title="CONSIGNEE" />
                        <x:layout.table.heading widthPixel="100" title="ORIGIN" />
                        <x:layout.table.heading widthPixel="100" title="DESTINATION" />
                        <x:layout.table.heading widthPixel="100" title="PIECES" />
                        <x:layout.table.heading widthPixel="100" title="PKGS" />
                        <x:layout.table.heading widthPixel="100" title="GWT/KGS" />
                        <x:layout.table.heading widthPixel="100" title="CHW/KGS" />
                        <x:layout.table.heading widthPixel="100" title="CBM/M3" />
                        <x:layout.table.heading widthPixel="100" title="TERMS" />
                         <x:layout.table.heading widthPixel="100" title="SHIPMENT BY" />
                          <x:layout.table.heading widthPixel="200" title="VESSEL/CARRIER" />
                           <x:layout.table.heading widthPixel="100" title="ETD" />
                            <x:layout.table.heading widthPixel="100" title="ATD" />
                            <x:layout.table.heading widthPixel="100" title="ETA Transit Hub" />
                             <x:layout.table.heading widthPixel="100" title="ATA Transit Hub" />
                        <x:layout.table.heading widthPixel="100" title="ROUTED" />
                        <x:layout.table.heading widthPixel="100" customClass="text-center" title="Action" />
                    </x:layout.table.row>
                </thead>
                <tbody class="fw-semibold text-gray-600">
                </tbody>
            </x:layout.table.wrapper>
        </x:layout.card.body>
    </x:layout.card.wrapper>
@endsection

@push('js')
@component('components.layout.table.datatable', [
    'id' => 'shipment_table',
    'url' => route('finance.general-wise.shipment.list',['type'=>$type]),
    'columns' => [
       [
            "data" => "checkbox",
            "name" => "checkbox",
            "orderable" => false,
        ],
        [
            "data" => "ctd_number",
            "name" => "ctd_number",
            "orderable" => false,
        ],
        [
            "data" => "status_shipment",
            "name" => "status_shipment",
            "orderable" => false,
        ],
        [
            "data" => "shipper_name",
            "name" => "shipper_name",
            "orderable" => false,
        ],
        [
            "data" => "consigne_name",
            "name" => "consigne_name",
            "orderable" => false,
        ],
        [
            "data" => "origin_name",
            "name" => "origin_name",
            "orderable" => false,
        ],
        [
            "data" => "destination_name",
            "name" => "destination_name",
            "orderable" => false,
        ],
        [
            "data" => "order.qty",
            "name" => "order.qty",
            "orderable" => false,
        ],
        [
            "data" => "order.pkgs",
            "name" => "order.pkgs",
            "orderable" => false,
        ],
        [
            "data" => "order.gross_weight",
            "name" => "order.gross_weight",
            "orderable" => false,
        ],
        [
            "data" => "order.chw",
            "name" => "order.chw",
            "orderable" => false,
        ],
        [
            "data" => "order.measurement",
            "name" => "order.measurement",
            "orderable" => false,
        ],
        [
            "data" => "freight_term",
            "name" => "freight_term",
            "orderable" => false,
        ],
        [
            "data" => "shipment_type",
            "name" => "shipment_type",
            "orderable" => false,
        ],
        [
            "data" => "vessel_voyage",
            "name" => "vessel_voyage",
            "orderable" => false,
        ],
        [
            "data" => "estimated_time_departure",
            "name" => "estimated_time_departure",
            "orderable" => false,
        ],
        [
            "data" => "atd",
            "name" => "atd",
            "orderable" => false,
        ],
        [
            "data" => "eta",
            "name" => "eta",
            "orderable" => false,
        ],
                [
            "data" => "ata",
            "name" => "ata",
            "orderable" => false,
        ],
        [
            "data" => "transit_via",
            "name" => "transit_via",
            "orderable" => false,
        ],

        [
            "data" => "action",
            "name" => "action",
            "orderable" => false,
        ],
    ]
])
@endcomponent
<script>
    $(document).ready(function() {
        // When the header checkbox is clicked
        $('#select_all').on('click', function() {
            // Check or uncheck all row checkboxes based on the header checkbox state
            $('.row-checkbox').prop('checked', this.checked);
        });

        // Optional: If you want to uncheck the header checkbox if any row checkbox is unchecked
        $('.row-checkbox').on('click', function() {
            if ($('.row-checkbox:checked').length === $('.row-checkbox').length) {
                $('#select_all').prop('checked', true);
            } else {
                $('#select_all').prop('checked', false);
            }
        });
    });
</script>
@endpush
