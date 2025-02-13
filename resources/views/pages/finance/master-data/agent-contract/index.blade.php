@extends('layout.main-layout')
@section('title', 'Agent Contract')

@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="Agent Contract">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>
            <x:layout.card.toolbar
                createDataLink="{{ route('finance.master-data.agent-contract.create') }}"
                exportExcelLink="{{ route('finance.master-data.agent-contract.export.excel') }}"
                exportCsvLink="{{ route('finance.master-data.agent-contract.export.csv') }}"
                exportPdfLink="{{ route('finance.master-data.agent-contract.export.pdf') }}"
                withFilter="true"
            />
        </x:layout.card.header>
        <x:layout.card.body>
            <div class="filter-result mb-3" style="display: none;">
                <span class="fw-bold">Filter by </span>
                <span class="filter-values"></span>
            </div>
            <x:layout.table.wrapper id="agent_contract_table">
                <thead>
                    <x:layout.table.row>
                        <x:layout.table.heading widthPixel="50" title="No" />
                        <x:layout.table.heading widthPixel="100" title="Contract No" />
                        <x:layout.table.heading widthPixel="100" title="Customer Code" />
                        <x:layout.table.heading widthPixel="100" title="Customer Name" />
                        <x:layout.table.heading widthPixel="100" title="Service" />
                        <x:layout.table.heading widthPixel="100" title="Contract Date" />
                        <x:layout.table.heading widthPixel="100" title="Valid From" />
                        <x:layout.table.heading widthPixel="100" title="Valid To" />
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
            <x:form.select2 label="Customer" name="customer" placeholder="Select Contract No" :model="request()" />
        </div>
        <div class="col-12">
            <x:form.select2 label="Service" name="service_type" placeholder="Select Service" :model="request()" />
        </div>
    </x:layout.modal.filter-modal>
@endsection

@push('js')
@component('components.layout.table.datatable', [
    'id' => 'agent_contract_table',
    'url' => route('finance.master-data.agent-contract.list'),
    'dynamicParam' => true,
    'columns' => [
        [
            "data" => "DT_RowIndex",
            "name" => "DT_RowIndex",
            "orderable" => false,
            "searchable" => false
        ],
        [
            "data" => "contract_no",
            "name" => "contract_no",
        ],
        [
            "data" => "customer_code",
            "name" => "customer_code",
        ],
        [
            "data" => "customer_id",
            "name" => "customer_id",
        ],
        [
            "data" => "service_type_id",
            "name" => "service_type_id",
        ],
        [
            "data" => "contract_date",
            "name" => "contract_date",
        ],
        [
            "data" => "contract_start",
            "name" => "contract_start",
        ],
        [
            "data" => "contract_end",
            "name" => "contract_end",
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
        // Initialize filter handler
        new FilterHandler({
            filters: [
                { name: 'customer', label: 'Customer' },
                { name: 'service_type', label: 'Service' },
            ]
        });

        // Existing select2 initialization
        ['customer', 'service_type'].forEach(item => {
            let placeholder = item == 'customer' ? 'Select Customer' : 'Select Service Type';
            let url = item == 'customer'
                ? "{{ route('api.finance.master-data.customer.filter-data') }}"
                : "{{ route('api.finance.master-data.service-type.filter-data') }}";

            generateAjaxSelect2(
                item,
                url,
                placeholder,
                function (result) {
                    let pagingData = result.data;
                    let hasMorePages = pagingData.next_page_url !== null;

                    if (item == 'customer') {
                        return {
                            results: pagingData.data.map(item => ({
                                id: item.id,
                                text: item.customer_name
                            })),
                            pagination: {
                                more: hasMorePages
                            }
                        };
                    } else {
                        return {
                            results: pagingData.data.map(item => ({
                                id: item.id,
                                text: item.service_code
                            })),
                            pagination: {
                                more: hasMorePages
                            }
                        };
                    }
                }
            );
        })
    })
</script>
@endpush
