@extends('layout.main-layout')
@section('title', 'Currency')

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
                withFilter="true"
            />
        </x:layout.card.header>
        <x:layout.card.body>
            <div class="filter-result currency-filter-result mb-3" style="display: none;">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <span class="fw-bold">Filter by </span>
                        <span class="filter-values"></span>
                    </div>
                    <button type="button" class="btn btn-sm btn-light-danger" id="clear-filter-btn">
                        <i class="fas fa-times me-1"></i>Clear Filter
                    </button>
                </div>
            </div>
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

    <x:layout.modal.filter-modal>
        <div class="col-12">
            <x:form.select2 label="Currency Code" name="currency_code" placeholder="Select Currency Code" :model="request()" />
            <x:form.select2 label="Currency Name" name="currency_name" placeholder="Select Currency Name" :model="request()" />
        </div>
    </x:layout.modal.filter-modal>
@endsection

@push('js')
@component('components.layout.table.datatable', [
    'id' => 'currency_table',
    'url' => route('finance.master-data.currency.list'),
    'dynamicParam' => true,
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

<script src="{{ asset('assets/js/custom/filter-handler.js') }}"></script>
<script src="{{ asset('assets/js/custom/clear-filter-handler.js') }}"></script>
<script>
    $(document).ready(function () {
        // Initialize filter handler
        const filterHandler = new FilterHandler({
            filters: [
                { name: 'currency_code', label: 'Currency Code' },
                { name: 'currency_name', label: 'Currency Name' }
            ]
        });

        // Initialize clear filter handler
        new ClearFilterHandler({
            filterResultClass: '.currency-filter-result',
            select2Fields: ['currency_code', 'currency_name'],
            datatableInstance: window.currencyDataTable
        });

        // Select 2 Data Binding
        ['currency_code', 'currency_name'].forEach(item => {
            let placeholder = item == 'currency_code' ? 'Select Currency Code' : 'Select Currency Name';
            generateAjaxSelect2(
                item,
                "{{ route('api.finance.master-data.currency.filter-data') }}",
                placeholder,
                function (result) {
                    let pagingData = result.data;
                    let hasMorePages = pagingData.next_page_url !== null;

                    if (item == 'currency_code') {
                        return {
                            results: pagingData.data.map(item => ({
                                id: item.id,
                                text: item.currency_code
                            })),
                            pagination: {
                                more: hasMorePages
                            }
                        };
                    } else {
                        return {
                            results: pagingData.data.map(item => ({
                                id: item.id,
                                text: item.currency_name
                            })),
                            pagination: {
                                more: hasMorePages
                            }
                        };
                    }
                }
            );
        })
    });
</script>
@endpush
