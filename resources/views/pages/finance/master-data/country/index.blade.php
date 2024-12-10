@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="Country">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
        <x:layout.breadcrumb.item pageName="Port" href="{{ route('finance.master-data.country.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>
            <x:layout.card.toolbar
                createDataLink="{{ route('finance.master-data.country.create') }}"
                exportExcelLink="{{ route('finance.master-data.country.export.excel') }}"
                exportCsvLink="{{ route('finance.master-data.country.export.csv') }}"
                exportPdfLink="{{ route('finance.master-data.country.export.pdf') }}"
            />
        </x:layout.card.header>
        <x:layout.card.body>
            <x:layout.table.wrapper id="country_table">
                <thead>
                    <x:layout.table.row>
                        <x:layout.table.heading widthPixel="50" title="No" />
                        <x:layout.table.heading widthPixel="100" title="Country" />
                        <x:layout.table.heading widthPixel="100" title="Country Code" />
                        <x:layout.table.heading widthPixel="100" title="Region" />
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
    'id' => 'country_table',
    'url' => route('finance.master-data.country.list'),
    'columns' => [
        [
            "data" => "DT_RowIndex",
            "name" => "DT_RowIndex",
            "orderable" => false,
            "searchable" => false
        ],
        [
            "data" => "country_name",
            "name" => "country_name",
        ],
        [
            "data" => "country_code",
            "name" => "country_code",
        ],
        [
            "data" => "region_name",
            "name" => "region_name",
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
