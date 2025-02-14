@extends('layout.main-layout')
@section('title', 'Payment Method')

@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="Payment Method">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>
            <x:layout.card.toolbar
                createDataLink="{{ route('finance.master-data.payment-method.create') }}"
                exportExcelLink="{{ route('finance.master-data.payment-method.export.excel') }}"
                exportCsvLink="{{ route('finance.master-data.payment-method.export.csv') }}"
                exportPdfLink="{{ route('finance.master-data.payment-method.export.pdf') }}"
                withFilter="true"
            />
        </x:layout.card.header>
        <x:layout.card.body>
            <div class="filter-result payment-method-filter-result mb-3" style="display: none;">
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
            <x:layout.table.wrapper id="payment_method_table">
                <thead>
                    <x:layout.table.row>
                        <x:layout.table.heading widthPixel="50" title="No" />
                        <x:layout.table.heading widthPixel="100" title="Payment Terms" />
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
            <x:form.select2 label="Payment Term Name" name="payment_terms" placeholder="Select Payment Terms" :model="request()" />
        </div>
    </x:layout.modal.filter-modal>
@endsection

@push('js')
@component('components.layout.table.datatable', [
    'id' => 'payment_method_table',
    'url' => route('finance.master-data.payment-method.list'),
    'dynamicParam' => true,
    'columns' => [
        [
            "data" => "DT_RowIndex",
            "name" => "DT_RowIndex",
            "orderable" => false,
            "searchable" => false
        ],
        [
            "data" => "payment_terms",
            "name" => "payment_terms",
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
                { name: 'payment_terms', label: 'Payment Term Name' }
            ]
        });

        // Initialize clear filter handler
        new ClearFilterHandler({
            filterResultClass: '.payment-method-filter-result',
            select2Fields: ['payment_terms'],
            datatableInstance: window.paymentMethodDataTable
        });

        generateAjaxSelect2(
            'payment_terms',
            "{{ route('api.finance.master-data.payment-term.filter-data') }}",
            'Select Payment Terms',
            function (result) {
                let pagingData = result.data;
                let hasMorePages = pagingData.next_page_url !== null;

                return {
                    results: pagingData.data.map(item => ({
                        id: item.payment_terms,
                        text: item.payment_terms
                    })),
                    pagination: {
                        more: hasMorePages
                    }
                };
            }
        );
    });
</script>
@endpush
