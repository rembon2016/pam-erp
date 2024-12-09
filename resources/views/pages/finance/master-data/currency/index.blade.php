@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="Currency">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
        <x:layout.breadcrumb.item pageName="Currency" href="{{ route('finance.master-data.currency.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>
            <x:layout.card.toolbar
                createDataLink="{{ route('finance.master-data.currency.create') }}"
                exportExcelLink="{{ route('finance.master-data.currency.export.excel') }}"
                exportCsvLink="{{ route('finance.master-data.currency.export.csv') }}"
                exportPdfLink="{{ route('finance.master-data.currency.export.pdf') }}"
            />
        </x:layout.card.header>
        <x:layout.card.body>
            <x:layout.table.wrapper id="currency_table">
                <thead>
                    <x:layout.table.row>
                        <x:layout.table.heading widthPixel="50" title="No" />
                        <x:layout.table.heading widthPixel="100" title="Currency Code" />
                        <x:layout.table.heading widthPixel="100" title="Currency Name" />
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
    'id' => 'currency_table',
    'url' => route('finance.master-data.currency.list'),
    'columns' => [
        [
            "data" => "DT_RowIndex",
            "name" => "DT_RowIndex",
            "orderable" => false,
            "searchable" => false
        ],
        [
            "data" => "currency_code",
            "name" => "currency_code",
        ],
        [
            "data" => "currency_name",
            "name" => "currency_name",
        ],
        [
            "data" => "action",
            "name" => "action",
        ],
    ]
])
@endcomponent
@endpush
