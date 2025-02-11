@extends('layout.main-layout')
@section('title', 'Debit Note for Non Trade')

@section('body')
    <x:layout.breadcrumb.wrapper module="General Transaction" pageName="Debit Note for Non Trade">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="General Transaction" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>
            <x:layout.card.toolbar
                createDataLink="{{ route('finance.general-transaction.debit-note.create', ['type' => 'non-trade']) }}"
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
                        <x:layout.table.heading widthPixel="100" title="Debit/Credit Note No." />
                        <x:layout.table.heading widthPixel="100" title="Date" />
                        <x:layout.table.heading widthPixel="100" title="Party Name" />
                        <x:layout.table.heading widthPixel="100" title="Description" />
                        <x:layout.table.heading widthPixel="100" title="Amount" />
                        <x:layout.table.heading widthPixel="100" title="Amount in AED" />
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
            <x:form.select2 label="Party Name" name="Party Name" placeholder="Select Party Name" :model="request()">
                @foreach (['party a', 'party b'] as $party)
                    <option value="{{ $party }}">
                        {{ Str::title($party) }}
                    </option>
                @endforeach
            </x:form.select2>
        </div>
    </x:layout.modal.filter-modal>
@endsection
