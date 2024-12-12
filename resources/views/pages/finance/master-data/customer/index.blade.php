@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="Customer">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>
            <x:layout.card.toolbar
                createDataLink="{{ route('finance.master-data.customer.create') }}"
                exportExcelLink="{{ route('finance.master-data.customer.export.excel') }}"
                exportCsvLink="{{ route('finance.master-data.customer.export.csv') }}"
                exportPdfLink="{{ route('finance.master-data.customer.export.pdf') }}"
            />
        </x:layout.card.header>
        <x:layout.card.body>
            <x:layout.table.wrapper id="customer_table">
                <thead>
                    <x:layout.table.row>
                        <x:layout.table.heading widthPixel="50" title="No" />
                        <x:layout.table.heading widthPixel="100" title="Customer Code" />
                        <x:layout.table.heading widthPixel="100" title="Customer Name" />
                        <x:layout.table.heading widthPixel="100" title="Customer Type" />
                        <x:layout.table.heading widthPixel="100" title="Contact Person" />
                        <x:layout.table.heading widthPixel="100" title="Contact No." />
                        <x:layout.table.heading widthPixel="100" title="Bank Account No." />
                        <x:layout.table.heading widthPixel="100" title="Bank Name" />
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
    'id' => 'customer_table',
    'url' => route('finance.master-data.customer.list'),
    'columns' => [
        [
            "data" => "DT_RowIndex",
            "name" => "DT_RowIndex",
            "orderable" => false,
            "searchable" => false
        ],
        [
            "data" => "customer_code",
            "name" => "customer_code",
        ],
        [
            "data" => "customer_name",
            "name" => "customer_name",
        ],
        [
            "data" => "customer_type",
            "name" => "customer_type",
        ],
        [
            "data" => "contact_person",
            "name" => "contact_person",
        ],
        [
            "data" => "contact_no",
            "name" => "contact_no",
        ],
        [
            "data" => "bank_account_no",
            "name" => "bank_account_no",
        ],
        [
            "data" => "bank_name",
            "name" => "bank_name",
        ],
        [
            "data" => "action",
            "name" => "action",
        ],
    ]
])
@endcomponent
@endpush
