@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="Customer Contract History">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>
            <x:layout.card.toolbar
                exportExcelLink="{{ route('finance.master-data.customer-contract.export.excel') }}"
                exportCsvLink="{{ route('finance.master-data.customer-contract.export.csv') }}"
                exportPdfLink="{{ route('finance.master-data.customer-contract.export.pdf') }}"
            />
        </x:layout.card.header>
        <x:layout.card.body>
            <x:layout.table.wrapper id="history_customer_contract_table">
                <thead>
                    <x:layout.table.row>
                        <x:layout.table.heading widthPixel="50" title="No" />
                        <x:layout.table.heading widthPixel="100" title="Contract No" />
                        <x:layout.table.heading widthPixel="100" title="Customer Code" />
                        <x:layout.table.heading widthPixel="100" title="Customer Name" />
                        <x:layout.table.heading widthPixel="100" title="Valid From" />
                        <x:layout.table.heading widthPixel="100" title="Valid To" />
                        <x:layout.table.heading widthPixel="100" title="Updated Date" />
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
        'id' => 'history_customer_contract_table',
        'url' => route('finance.master-data.customer-contract.history-list', $id),
        'dynamicParam' => true,
        'columns' => [
            [
                "data" => "DT_RowIndex",
                "name" => "DT_RowIndex",
                "orderable" => false,
                "searchable" => false
            ],
            [
                "data" => "contract_no",
                "name" => "contract_no",
            ],
            [
                "data" => "customer_code",
                "name" => "customer_code",
            ],
            [
                "data" => "customer_id",
                "name" => "customer_id",
            ],
            [
                "data" => "contract_start",
                "name" => "contract_start",
            ],
            [
                "data" => "contract_end",
                "name" => "contract_end",
            ],
            [
                "data" => "updated_date",
                "name" => "updated_date",
            ],
            [
                "data" => "action",
                "name" => "action",
            ],
        ]
    ])
    @endcomponent
@endpush
