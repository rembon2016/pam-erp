@extends('layout.main-layout')
@section('title', 'Port')

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
                withFilter="true"
            />
        </x:layout.card.header>
        <x:layout.card.body>
            <div class="filter-result port-filter-result mb-3" style="display: none;">
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

    <x:layout.modal.filter-modal>
        <div class="col-12">
            <x:form.select2 label="Port Name" name="port_name" placeholder="Select Port Name" :model="request()" />
            <x:form.select2 label="Port Code" name="port_code" placeholder="Select Port Code" :model="request()" />
        </div>
    </x:layout.modal.filter-modal>
@endsection

@push('js')
@component('components.layout.table.datatable', [
    'id' => 'port_table',
    'url' => route('finance.master-data.port.list'),
    'dynamicParam' => true,
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

<script src="{{ asset('assets/js/custom/filter-handler.js') }}"></script>
<script src="{{ asset('assets/js/custom/clear-filter-handler.js') }}"></script>
<script>
    $(document).ready(function () {
        // Initialize filter handler
        const filterHandler = new FilterHandler({
            filters: [
                { name: 'port_name', label: 'Port Name' },
                { name: 'port_code', label: 'Port Code' }
            ]
        });

        // Initialize clear filter handler
        new ClearFilterHandler({
            filterResultClass: '.port-filter-result',
            select2Fields: ['port_name', 'port_code'],
            datatableInstance: window.portDataTable
        });

        ['port_name', 'port_code'].forEach(item => {
            let placeholder = item == 'port_name' ? 'Select Port Name' : 'Select Port Code';

            generateAjaxSelect2(
                item,
                "{{ route('api.finance.master-data.port.filter-data') }}",
                placeholder,
                function (result) {
                    let pagingData = result.data;
                    let hasMorePages = pagingData.next_page_url !== null;

                    if (item == 'port_name') {
                        return {
                            results: pagingData.data.map(item => ({
                                id: item.port_id,
                                text: item.port_name
                            })),
                            pagination: {
                                more: hasMorePages
                            }
                        };
                    } else {
                        return {
                            results: pagingData.data.map(item => ({
                                id: item.port_id,
                                text: item.port_code
                            })),
                            pagination: {
                                more: hasMorePages
                            }
                        };
                    }
                }
            );
        })
    })
</script>
@endpush
