@extends('layout.main-layout')
@section('title', 'Daybook')


@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="Daybook">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>
            <x:layout.card.toolbar
                createDataLink="{{ route('finance.master-data.daybook.create') }}"
                exportExcelLink="{{ route('finance.master-data.daybook.export.excel') }}"
                exportCsvLink="{{ route('finance.master-data.daybook.export.csv') }}"
                exportPdfLink="{{ route('finance.master-data.daybook.export.pdf') }}"
                withFilter="true"
            />
        </x:layout.card.header>
        <x:layout.card.body>
            <div class="filter-result daybook-filter-result mb-3" style="display: none;">
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
            <x:layout.table.wrapper id="daybook_table">
                <thead>
                    <x:layout.table.row>
                        <x:layout.table.heading widthPixel="50" title="No" />
                        <x:layout.table.heading widthPixel="100" title="Daybook Code" />
                        <x:layout.table.heading widthPixel="100" title="Daybook Name" />
                        <x:layout.table.heading widthPixel="100" title="Description" />
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
            <x:form.select2 label="Daybook Code" name="daybook_code" placeholder="Select Daybook Code" :model="request()" />
        </div>
    </x:layout.modal.filter-modal>
@endsection

@push('js')
@component('components.layout.table.datatable', [
    'id' => 'daybook_table',
    'url' => route('finance.master-data.daybook.list'),
    'dynamicParam' => true,
    'columns' => [
        [
            "data" => "DT_RowIndex",
            "name" => "DT_RowIndex",
            "orderable" => false,
            "searchable" => false
        ],
        [
            "data" => "code",
            "name" => "code",
        ],
        [
            "data" => "name",
            "name" => "name",
        ],
        [
            "data" => "description",
            "name" => "description",
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
                { name: 'daybook_code', label: 'Daybook Code' }
            ]
        });

        // Initialize clear filter handler
        new ClearFilterHandler({
            filterResultClass: '.daybook-filter-result',
            select2Fields: ['daybook_code'],
            datatableInstance: window.daybookDataTable
        });

        generateAjaxSelect2(
            'daybook_code',
            "{{ route('api.finance.master-data.daybook.filter-data') }}",
            'Select Daybook Code',
            function (result) {
                let pagingData = result.data;
                let hasMorePages = pagingData.next_page_url !== null;

                return {
                    results: pagingData.data.map(item => ({
                        id: item.id,
                        text: item.code + ' - ' + item.name
                    })),
                    pagination: {
                        more: hasMorePages
                    }
                };
            }
        );
    });
</script>
@endpush
