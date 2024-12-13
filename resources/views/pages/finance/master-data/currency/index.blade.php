@extends('layout.app')
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
            <x:form.select label="Currency Code" name="currency_code" defaultOption="Select Currency Code" :model="request()">
                @foreach ($currencies->pluck('currency_code') as $code)
                    <option value="{{ $code }}" @selected($code == request()->query('currency_code'))>{{ $code }}</option>
                @endforeach
            </x:form.select>
            <x:form.select label="Currency Name" name="currency_name" defaultOption="Select Currency Name" :model="request()">
                @foreach ($currencies->pluck('currency_name') as $name)
                    <option value="{{ $name }}" @selected($name == request()->query('currency_name'))>{{ $name }}</option>
                @endforeach
            </x:form.select>
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
@endpush
