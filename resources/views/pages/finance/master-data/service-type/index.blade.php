@extends('layout.main-layout')
@section('title', 'Service Type')

@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="Service Type">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>
            <x:layout.card.toolbar
                createDataLink="{{ route('finance.master-data.service-type.create') }}"
                exportExcelLink="{{ route('finance.master-data.service-type.export.excel') }}"
                exportCsvLink="{{ route('finance.master-data.service-type.export.csv') }}"
                exportPdfLink="{{ route('finance.master-data.service-type.export.pdf') }}"
                withFilter="true"
            />
        </x:layout.card.header>
        <x:layout.card.body>
            <div class="filter-result mb-3" style="display: none;">
                <span class="fw-bold">Filter by </span>
                <span class="filter-values"></span>
            </div>
            <x:layout.table.wrapper id="service_type_table">
                <thead>
                    <x:layout.table.row>
                        <x:layout.table.heading widthPixel="50" title="No" />
                        <x:layout.table.heading widthPixel="100" title="Service Code" />
                        <x:layout.table.heading widthPixel="100" title="Service Name" />
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
            <x:form.select2 label="Service Type Code" name="service_code" placeholder="Select Service Type Code" :model="request()" />
            <x:form.select2 label="Service Type Name" name="service_name" placeholder="Select Service Type Name" :model="request()" />
        </div>
    </x:layout.modal.filter-modal>
@endsection

@push('js')
@component('components.layout.table.datatable', [
    'id' => 'service_type_table',
    'url' => route('finance.master-data.service-type.list'),
    'dynamicParam' => true,
    'columns' => [
        [
            "data" => "DT_RowIndex",
            "name" => "DT_RowIndex",
            "orderable" => false,
            "searchable" => false
        ],
        [
            "data" => "service_code",
            "name" => "service_code",
        ],
        [
            "data" => "service_name",
            "name" => "service_name",
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
        new FilterHandler({
            filters: [
                { name: 'service_code', label: 'Service Type Code' },
                { name: 'service_name', label: 'Service Type Name' }
            ]
        });

        ['service_code', 'service_name'].forEach(item => {
            let placeholder = item == 'service_code' ? 'Select Service Type Code' : 'Select Service Type Name';

            generateAjaxSelect2(
                item,
                "{{ route('api.finance.master-data.service-type.filter-data') }}",
                placeholder,
                function (result) {
                    let pagingData = result.data;
                    let hasMorePages = pagingData.next_page_url !== null;

                    if (item == 'service_code') {
                        return {
                            results: pagingData.data.map(item => ({
                                id: item.id,
                                text: item.service_code
                            })),
                            pagination: {
                                more: hasMorePages
                            }
                        };
                    } else {
                        return {
                            results: pagingData.data.map(item => ({
                                id: item.id,
                                text: item.service_name
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
