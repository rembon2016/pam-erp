@extends('layout.main-layout')
@section('title', 'Unit')

@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="Unit">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>
            <x:layout.card.toolbar
                createDataLink="{{ route('finance.master-data.unit.create') }}"
                exportExcelLink="{{ route('finance.master-data.unit.export.excel') }}"
                exportCsvLink="{{ route('finance.master-data.unit.export.csv') }}"
                exportPdfLink="{{ route('finance.master-data.unit.export.pdf') }}"
                withFilter="true"
            />
        </x:layout.card.header>
        <x:layout.card.body>
            <div class="filter-result unit-filter-result mb-3" style="display: none;">
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
            <x:layout.table.wrapper id="unit_table">
                <thead>
                    <x:layout.table.row>
                        <x:layout.table.heading widthPixel="50" title="No" />
                        <x:layout.table.heading widthPixel="100" title="Unit Code" />
                        <x:layout.table.heading widthPixel="100" title="Unit Name" />
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
            <x:form.select2 label="Unit Code" name="unit_code" placeholder="Select Unit Code" :model="request()" />
            <x:form.select2 label="Unit Name" name="unit_name" placeholder="Select Unit Name" :model="request()" />
        </div>
    </x:layout.modal.filter-modal>
@endsection

@push('js')
    @component('components.layout.table.datatable', [
        'id' => 'unit_table',
        'url' => route('finance.master-data.unit.list'),
        'dynamicParam' => true,
        'columns' => [
            [
                "data" => "DT_RowIndex",
                "name" => "DT_RowIndex",
                "orderable" => false,
                "searchable" => false
            ],
            [
                "data" => "unit_name",
                "name" => "unit_name",
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
                    { name: 'unit_code', label: 'Unit Code' },
                    { name: 'unit_name', label: 'Unit Name' }
                ]
            });

            // Initialize clear filter handler
            new ClearFilterHandler({
                filterResultClass: '.unit-filter-result',
                select2Fields: ['unit_code', 'unit_name'],
                datatableInstance: window.unitDataTable
            });

            ['unit_code', 'unit_name'].forEach(item => {
                let placeholder = item == 'unit_code' ? 'Select Unit Code' : 'Select Unit Name';

                generateAjaxSelect2(
                    item,
                    "{{ route('api.finance.master-data.unit.filter-data') }}",
                    placeholder,
                    function (result) {
                        let pagingData = result.data;
                        let hasMorePages = pagingData.next_page_url !== null;

                        if (item == 'unit_code') {
                            return {
                                results: pagingData.data.map(item => ({
                                    id: item.unit_id,
                                    text: item.unit_name
                                })),
                                pagination: {
                                    more: hasMorePages
                                }
                            };
                        } else {
                            return {
                                results: pagingData.data.map(item => ({
                                    id: item.unit_id,
                                    text: item.description
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
