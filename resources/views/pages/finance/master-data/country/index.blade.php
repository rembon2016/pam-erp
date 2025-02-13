@extends('layout.main-layout')
@section('title', 'Country')

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
                withFilter="true"
            />
        </x:layout.card.header>
        <x:layout.card.body>
            <div class="filter-result mb-3" style="display: none;">
                <span class="fw-bold">Filter by </span>
                <span class="filter-values"></span>
            </div>
            <x:layout.table.wrapper id="country_table">
                <thead>
                    <x:layout.table.row>
                        <x:layout.table.heading widthPixel="50" title="No" />
                        <x:layout.table.heading widthPixel="100" title="Country Name" />
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

    <x:layout.modal.filter-modal>
        <div class="col-12">
            <x:form.select label="Country Code" name="country_code" defaultOption="Select Country Code" :model="request()" />
            <x:form.select label="Country Name" name="country_name" defaultOption="Select Country Name" :model="request()" />
        </div>
    </x:layout.modal.filter-modal>
@endsection

@push('js')
@component('components.layout.table.datatable', [
    'id' => 'country_table',
    'url' => route('finance.master-data.country.list'),
    'dynamicParam' => true,
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

<script src="{{ asset('assets/js/custom/filter-handler.js') }}"></script>
<script>
    $(document).ready(function () {
        // Initialize filter handler with configuration
        new FilterHandler({
            filters: [
                { name: 'country_code', label: 'Country Code' },
                { name: 'country_name', label: 'Country Name' }
            ]
        });

        ['country_code', 'country_name'].forEach(item => {
            let placeholder = item == 'country_code' ? 'Select Country Code' : 'Select Country Name';
            generateAjaxSelect2(
                item,
                "{{ route('api.finance.master-data.country.filter-data') }}",
                placeholder,
                function (result) {
                    let pagingData = result.data;
                    let hasMorePages = pagingData.next_page_url !== null;

                    if (item == 'country_code') {
                        return {
                            results: pagingData.data.map(item => ({
                                id: item.id,
                                text: item.country_code
                            })),
                            pagination: {
                                more: hasMorePages
                            }
                        };
                    } else {
                        return {
                            results: pagingData.data.map(item => ({
                                id: item.id,
                                text: item.country_name
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
