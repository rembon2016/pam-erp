@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="Port">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
        <x:layout.breadcrumb.item pageName="Port" href="{{ route('finance.master-data.port.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>
            <x:layout.card.toolbar
                createDataLink="{{ route('finance.master-data.port.create') }}"
                exportExcelLink="{{ route('finance.master-data.port.export.excel') }}"
                exportCsvLink="{{ route('finance.master-data.port.export.csv') }}"
                exportPdfLink="{{ route('finance.master-data.port.export.pdf') }}"
            />
        </x:layout.card.header>
        <x:layout.card.body>
            <x:layout.table.wrapper id="port_table">
                <thead>
                    <x:layout.table.row>
                        <x:layout.table.heading widthPixel="50" title="No" />
                        <x:layout.table.heading widthPixel="100" title="Port Name" />
                        <x:layout.table.heading widthPixel="100" title="Port Code" />
                        <x:layout.table.heading widthPixel="100" title="Country" />
                        <x:layout.table.heading widthPixel="100" title="Transport Mode" />
                        <x:layout.table.heading widthPixel="100" title="Status" />
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
    'id' => 'port_table',
    'url' => route('finance.master-data.port.list'),
    'columns' => [
        [
            "data" => "DT_RowIndex",
            "name" => "DT_RowIndex",
            "orderable" => false,
            "searchable" => false
        ],
        [
            "data" => "port_name",
            "name" => "port_name",
        ],
        [
            "data" => "port_code",
            "name" => "port_code",
        ],
        [
            "data" => "country_name",
            "name" => "country_name",
        ],
        [
            "data" => "transport_mode",
            "name" => "transport_mode",
        ],
        [
            "data" => "status",
            "name" => "status",
        ],
        [
            "data" => "action",
            "name" => "action",
        ],
    ]
])
@endcomponent
@endpush
