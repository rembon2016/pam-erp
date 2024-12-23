@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="Billing" pageName="Invoice">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Billing" />
        <x:layout.breadcrumb.item pageName="Invoice" href="{{ route('finance.billing.invoice.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>
            <x:layout.card.toolbar
                {{-- createDataLink="{{ route('finance.billing.invoice.create') }}" --}}
                {{-- exportExcelLink="{{ route('finance.billing.invoice.export.excel') }}"
                exportCsvLink="{{ route('finance.billing.invoice.export.csv') }}"
                exportPdfLink="{{ route('finance.billing.invoice.export.pdf') }}" --}}
                withFilter="true"
            />
        </x:layout.card.header>
        <x:layout.card.body>
            <x:layout.table.wrapper id="invoice_table">
                <thead>
                    <x:layout.table.row>
                        <x:layout.table.heading widthPixel="50" title="No" />
                        <x:layout.table.heading widthPixel="100" title="Invoice No" />
                        <x:layout.table.heading widthPixel="100" title="Invoice Date" />
                        <x:layout.table.heading widthPixel="100" title="Invoice Due Date" />
                        <x:layout.table.heading widthPixel="100" title="Customer Name" />
                        <x:layout.table.heading widthPixel="100" title="Amount in USD" />
                        <x:layout.table.heading widthPixel="100" title="Amount in AED" />
                        <x:layout.table.heading widthPixel="50" title="Approval" />
                        <x:layout.table.heading widthPixel="50" title="Status" />
                        <x:layout.table.heading widthPixel="100" customClass="text-center" title="Action" />
                    </x:layout.table.row>
                </thead>
                <tbody class="fw-semibold text-gray-600">
                </tbody>
            </x:layout.table.wrapper>
        </x:layout.card.body>
    </x:layout.card.wrapper>

    {{-- <x:layout.modal.filter-modal>
        <div class="col-12">
            <x:form.select label="Invoice Code" name="invoice_code" defaultOption="Select Invoice Code" :model="request()">
                @foreach ($currencies->pluck('invoice_code') as $code)
                    <option value="{{ $code }}" @selected($code == request()->query('invoice_code'))>{{ $code }}</option>
                @endforeach
            </x:form.select>
            <x:form.select label="Invoice Name" name="invoice_name" defaultOption="Select Invoice Name" :model="request()">
                @foreach ($currencies->pluck('invoice_name') as $name)
                    <option value="{{ $name }}" @selected($name == request()->query('invoice_name'))>{{ $name }}</option>
                @endforeach
            </x:form.select>
        </div>
    </x:layout.modal.filter-modal> --}}
@endsection

@push('js')
@component('components.layout.table.datatable', [
    'id' => 'invoice_table',
    'url' => route('finance.billing.invoice.list'),
    'dynamicParam' => true,
    'columns' => [
        [
            "data" => "DT_RowIndex",
            "name" => "DT_RowIndex",
            "orderable" => false,
            "searchable" => false
        ],
        [
            "data" => "invoice_no",
            "name" => "invoice_no",
        ],
        [
            "data" => "invoice_date",
            "name" => "invoice_date",
        ],
        [
            "data" => "invoice_due_date",
            "name" => "invoice_due_date",
        ],
        [
            "data" => "customer_billing_id",
            "name" => "customer_billing_id",
        ],
        [
            "data" => "total",
            "name" => "total",
        ],
        [
            "data" => "total",
            "name" => "total",
        ],
        [
            "data" => "approval",
            "name" => "approval",
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
