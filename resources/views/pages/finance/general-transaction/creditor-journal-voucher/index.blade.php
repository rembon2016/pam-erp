@extends('layout.main-layout')
@section('title', 'Creditor Journal Voucher')

@section('body')
    <x:layout.breadcrumb.wrapper module="General Transaction" pageName="Creditor Journal Voucher">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="General Transaction" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>
            <x:layout.card.toolbar
                createDataLink="{{ route('finance.general-transaction.creditor-journal-voucher.create') }}"
                exportExcelLink="{{ route('finance.master-data.charge.export.excel') }}"
                exportCsvLink="{{ route('finance.master-data.charge.export.csv') }}"
                exportPdfLink="{{ route('finance.master-data.charge.export.pdf') }}"
                withFilter="true"
            />
        </x:layout.card.header>
        <x:layout.card.body>
            <div class="filter-result mb-3" style="display: none;">
                <span class="fw-bold">Filter by </span>
                <span class="filter-values"></span>
            </div>
            <x:layout.table.wrapper id="creditor-journal-voucher-table">
                <thead>
                    <x:layout.table.row>
                        <x:layout.table.heading widthPixel="50" title="No" />
                        <x:layout.table.heading widthPixel="100" title="CRJ No." />
                        <x:layout.table.heading widthPixel="100" title="Invoice/Credit Note" />
                        <x:layout.table.heading widthPixel="100" title="Date" />
                        <x:layout.table.heading widthPixel="100" title="Due Date" />
                        <x:layout.table.heading widthPixel="100" title="Customer Name" />
                        <x:layout.table.heading widthPixel="100" title="Amount" />
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
            <x:form.select2 label="Daybook Code" name="daybook_code" placeholder="Select Daybook Code" :model="request()">
                @foreach (['revenue', 'expense'] as $daybook)
                    <option value="{{ $daybook }}">
                        {{ Str::title($daybook) }}
                    </option>
                @endforeach
            </x:form.select2>
        </div>
        <div class="col-12">
            <x:form.select2 label="Customer Name" name="customer_name" placeholder="Select Customer Name" :model="request()">
                @foreach (['revenue', 'expense'] as $account)
                    <option value="{{ $account }}">
                        {{ Str::title($account) }}
                    </option>
                @endforeach
            </x:form.select2>
        </div>
    </x:layout.modal.filter-modal>
@endsection
