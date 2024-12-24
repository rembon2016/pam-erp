@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="GL Charge Master">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>
            <x:layout.card.toolbar
                createDataLink="{{ route('finance.master-data.charge.create') }}"
                exportExcelLink="{{ route('finance.master-data.charge.export.excel') }}"
                exportCsvLink="{{ route('finance.master-data.charge.export.csv') }}"
                exportPdfLink="{{ route('finance.master-data.charge.export.pdf') }}"
                withFilter="true"
            />
        </x:layout.card.header>
        <x:layout.card.body>
            <x:layout.table.wrapper id="charge_table">
                <thead>
                    <x:layout.table.row>
                        <x:layout.table.heading widthPixel="50" title="No" />
                        <x:layout.table.heading widthPixel="100" title="Charge Code" />
                        <x:layout.table.heading widthPixel="100" title="Charge Name" />
                        <x:layout.table.heading widthPixel="100" title="Revenue Account" />
                        <x:layout.table.heading widthPixel="100" title="Cost Account" />
                        <x:layout.table.heading widthPixel="100" title="Agreed Rate Charge" />
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
            <x:form.select label="Charge Code" name="charge_code" defaultOption="Select Charge Code" :model="request()">
                @foreach ($charges->pluck('charge_code') as $code)
                    <option value="{{ $code }}" @selected($code == request()->query('charge_code'))>{{ $code }}</option>
                @endforeach
            </x:form.select>
            <x:form.select label="Charge Name" name="charge_name" defaultOption="Select Charge Name" :model="request()">
                @foreach ($charges->pluck('charge_name') as $name)
                    <option value="{{ $name }}" @selected($name == request()->query('charge_name'))>{{ $name }}</option>
                @endforeach
            </x:form.select>
        </div>
    </x:layout.modal.filter-modal>
@endsection

@push('js')
@component('components.layout.table.datatable', [
    'id' => 'charge_table',
    'url' => route('finance.master-data.charge.list'),
    'dynamicParam' => true,
    'columns' => [
        [
            "data" => "DT_RowIndex",
            "name" => "DT_RowIndex",
            "orderable" => false,
            "searchable" => false
        ],
        [
            "data" => "charge_code",
            "name" => "charge_code",
        ],
        [
            "data" => "charge_name",
            "name" => "charge_name",
        ],
        [
            "data" => "revenue_id",
            "name" => "revenue_id",
        ],
        [
            "data" => "cost_id",
            "name" => "cost_id",
        ],
        [
            "data" => "is_agreed_rate",
            "name" => "is_agreed_rate",
        ],
        [
            "data" => "action",
            "name" => "action",
        ],
    ]
])
@endcomponent
@endpush
