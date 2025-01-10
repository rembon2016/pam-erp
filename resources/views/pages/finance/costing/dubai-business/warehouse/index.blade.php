@extends('layout.app')

@section('body')
      <x:layout.breadcrumb.wrapper module="Costing" pageName="Warehouse">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Costing" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>

            <x:layout.card.toolbar
                exportCsvLink="{{ route('finance.costing.dubai-business.warehouse.export.csv') }}"
                withFilter="true"
            />
        </x:layout.card.header>
        <x:layout.card.body>
            <div class="filter-result mb-3" style="display: none;">
                <span class="fw-bold">Filter by </span>
                <span class="filter-values"></span>

                {{-- <button class="btn-clear clear-filter">Clear Filter</button> --}}
            </div>
            <x:layout.table.wrapper id="cross-air_table">
                <thead>
                    <x:layout.table.row>

                      <x:layout.table.heading widthPixel="50" title="No" />
                        <x:layout.table.heading widthPixel="100" title="Job Order Code" />
                        <x:layout.table.heading widthPixel="100" title="CTD Number" />
                        <x:layout.table.heading widthPixel="100"  title="Job Order Date" />
                        <x:layout.table.heading widthPixel="50"  title="Status" />
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

        </div>
    </x:layout.modal.filter-modal>
@endsection

@push('js')
@component('components.layout.table.datatable', [
    'id' => 'cross-air_table',
    'url' => route('finance.costing.dubai-business.warehouse.list'), // Sesuaikan route sesuai kebutuhan Anda
    'dynamicParam' => true,
    'columns' => [
        [
            "data" => "DT_RowIndex",
            "name" => "DT_RowIndex",
            "orderable" => false,
            "searchable" => false
        ],
        [
            "data" => "job_order_code",
            "name" => "job_order_code",
        ],
        [
            "data" => "ctd_no",
            "name" => "ctd_no",
        ],
        [
            "data" => "job_order_date",
            "name" => "job_order_date",
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
