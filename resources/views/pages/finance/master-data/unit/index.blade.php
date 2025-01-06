@extends('layout.app')
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
            <div class="filter-result mb-3" style="display: none;">
                <span class="fw-bold">Filter by </span>
                <span class="filter-values"></span>
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
            <x:form.select label="Unit Code" name="unit_code" defaultOption="Select Unit Code" :model="request()">
                @foreach ($units->pluck('unit_name') as $code)
                    <option value="{{ $code }}" @selected($code == request()->query('unit_code'))>{{ $code }}</option>
                @endforeach
            </x:form.select>
            <x:form.select label="Unit Name" name="unit_name" defaultOption="Select Unit Name" :model="request()">
                @foreach ($units->pluck('description') as $name)
                    <option value="{{ $name }}" @selected($name == request()->query('unit_name'))>{{ $name }}</option>
                @endforeach
            </x:form.select>
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
<script>
    $(document).ready(function () {
        new FilterHandler({
            filters: [
                { name: 'unit_code', label: 'Unit Code' },
                { name: 'unit_name', label: 'Unit Name' }
            ]
        });
    });
</script>
@endpush
