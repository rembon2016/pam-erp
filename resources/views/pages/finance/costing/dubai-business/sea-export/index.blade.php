@extends('layout.app')

@section('body')
       <x:layout.breadcrumb.wrapper module="Costing" pageName="Sea Export">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Costing" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>

            <x:layout.card.toolbar
                exportCsvLink="{{ route('finance.costing.dubai-business.sea-export.export.csv') }}"
                withFilter="true"
            />
        </x:layout.card.header>
        <x:layout.card.body>
            <div class="filter-result mb-3" style="display: none;">
                <span class="fw-bold">Filter by </span>
                <span class="filter-values"></span>

                {{-- <button class="btn-clear clear-filter">Clear Filter</button> --}}
            </div>
            <x:layout.table.wrapper id="sea-air_table">
                <thead>
                    <x:layout.table.row>

                       <x:layout.table.heading widthPixel="50" title="No" />
                        <x:layout.table.heading widthPixel="100" title="Job Order Code" />
                        <x:layout.table.heading widthPixel="100" title="Vessel" />
                        <x:layout.table.heading widthPixel="100" title="Voyage" />
                        <x:layout.table.heading widthPixel="100" customClass="text-center" title="ETA" />
                        <x:layout.table.heading widthPixel="100" customClass="text-center" title="Origin" />
                        <x:layout.table.heading widthPixel="100" customClass="text-center" title="Job Order Date" />
                        <x:layout.table.heading widthPixel="100" customClass="text-center" title="Status" />
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
            <x:form.select label="Vessel" name="vessel_filter" placeholder="Select Vessel Name" :model="request()">
            </x:form.select>
            <x:form.select label="Voyage" name="voyage_filter" placeholder="Select Voyage Name" :model="request()">
            </x:form.select>
            <x:form.select label="Origin" name="origin_filter" placeholder="Select Origin Name" :model="request()">
            </x:form.select>
        </div>
    </x:layout.modal.filter-modal>
@endsection

@push('js')
@component('components.layout.table.datatable', [
    'id' => 'sea-air_table',
    'url' => route('finance.costing.dubai-business.sea-export.list'), // Sesuaikan route sesuai kebutuhan Anda
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
            "data" => "vessel",
            "name" => "vessel",
        ],
        [
            "data" => "voyage",
            "name" => "voyage",
        ],
        [
            "data" => "eta",
            "name" => "eta",
        ],
        [
            "data" => "origin",
            "name" => "origin",
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
