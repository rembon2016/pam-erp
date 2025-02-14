@extends('layout.main-layout')
@section('title', 'GL Charge Master')

@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="GL Charge Master">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>
            <x:layout.card.toolbar
                :customLink="[
                    'link' => route('finance.master-data.charge.create.multiple'),
                    'text' => 'Add Multiple Charge',
                    'icon' => 'bx bx-plus'
                ]"
                createDataLink="{{ route('finance.master-data.charge.create') }}"
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
            <x:layout.table.wrapper id="charge_table">
                <thead>
                    <x:layout.table.row>
                        <x:layout.table.heading widthPixel="50" title="No" />
                        <x:layout.table.heading widthPixel="100" title="Charge Code" />
                        <x:layout.table.heading widthPixel="100" title="Charge Name" />
                        <x:layout.table.heading widthPixel="100" title="Transport Type" />
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
            <x:form.select2 label="Revenue Account" name="revenue" placeholder="Select Account" :model="request()" />
        </div>
        <div class="col-12">
            <x:form.select2 label="Cost Account" name="cost" placeholder="Select Account" :model="request()" />
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
            "data" => "transport_type",
            "name" => "transport_type",
        ],
        [
            "data" => "revenue_account",
            "name" => "revenue_account",
        ],
        [
            "data" => "cost_account",
            "name" => "cost_account",
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

<script src="{{ asset('assets/js/custom/filter-handler.js') }}"></script>
<script>
    $(document).ready(function () {
        new FilterHandler({
            filters: [
                { name: 'charge_code', label: 'Charge Code' },
                { name: 'charge_name', label: 'Charge Name' }
            ]
        });

        ['revenue', 'cost'].forEach(item => {
            generateAjaxSelect2(
                item,
                "{{ route('api.finance.master-data.charge.filter-data') }}",
                'Select Account',
                function (result) {
                    let pagingData = result.data;
                    let hasMorePages = pagingData.next_page_url !== null;

                    return {
                        results: pagingData.data.map(item => ({
                            id: item.id,
                            text: (item.code ?? 'N/A') + ': ' + item.account_name
                        })),
                        pagination: {
                            more: hasMorePages
                        }
                    };
                }
            );
        })
    });
</script>
@endpush
