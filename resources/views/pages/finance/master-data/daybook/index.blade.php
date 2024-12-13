@extends('layout.app')
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
            <x:form.select label="Daybook Code" name="daybook_code" defaultOption="Select Daybook Code" :model="request()">
                @foreach ($daybook_codes as $code)
                    <option value="{{ $code }}" @selected($code == request()->query('daybook_code'))>{{ $code }}</option>
                @endforeach
            </x:form.select>
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
@endpush
