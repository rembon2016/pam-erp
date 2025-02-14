@extends('layout.main-layout')
@section('title', 'Customer')

@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="Customer">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>

            <x:layout.card.toolbar
                createDataLink="{{ route('finance.master-data.customer.create') }}"
                exportExcelLink="{{ route('finance.master-data.customer.export.excel') }}"
                exportCsvLink="{{ route('finance.master-data.customer.export.csv') }}"
                exportPdfLink="{{ route('finance.master-data.customer.export.pdf') }}"
                withFilter="true"
                featureName="master_customer"
                moduleName="finance"
            />
        </x:layout.card.header>
        <x:layout.card.body>
            <div class="filter-result customer-filter-result mb-3" style="display: none;">
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
            <x:layout.table.wrapper id="customer_table">
                <thead>
                    <x:layout.table.row>
                        <x:layout.table.heading widthPixel="50" title="No" />
                        <x:layout.table.heading widthPixel="100" title="Customer Code" />
                        <x:layout.table.heading widthPixel="100" title="Customer Name" />
                        <x:layout.table.heading widthPixel="100" title="Customer Type" />
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
            <input type="hidden" id="customer_id" name="customer_id">
            <x:form.select2 label="Customer Name" name="customer_name" placeholder="Select Customer Name" :model="request()" />
            <x:form.select2 label="Customer Type" name="customer_type[]" id="customer_type" placeholder="Select Customer Type" :model="request()" multiple="true">
                @foreach ($customerTypes as $customerType)
                    <option value="{{ $customerType }}">{{ $customerType }}</option>
                @endforeach
            </x:form.select2>
        </div>
    </x:layout.modal.filter-modal>
@endsection

@push('js')
@component('components.layout.table.datatable', [
    'id' => 'customer_table',
    'url' => route('finance.master-data.customer.list'),
    'dynamicParam' => true,
    'columns' => [
        [
            "data" => "DT_RowIndex",
            "name" => "DT_RowIndex",
            "orderable" => false,
            "searchable" => false
        ],
        [
            "data" => "customer_code",
            "name" => "customer_code",
        ],
        [
            "data" => "customer_name",
            "name" => "customer_name",
        ],
        [
            "data" => "customer_type",
            "name" => "customer_type",
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
                { name: 'customer_name', label: 'Customer Name' },
                { name: 'customer_type[]', label: 'Customer Type' }
            ]
        });

        // Set initial values from URL parameters for select2
        let initialCustomerTypes = new URLSearchParams(window.location.search).getAll('customer_type_name[]');
        if (initialCustomerTypes && initialCustomerTypes.length && initialCustomerTypes[0] !== '') {
            customerTypeNameElement.val(initialCustomerTypes);
            customerTypeNameElement.trigger('change');
        }

        // Initialize clear filter handler
        new ClearFilterHandler({
            filterResultClass: '.customer-filter-result',
            select2Fields: ['customer_name', 'customer_type'],
            datatableInstance: window.customerDataTable
        });

        // Select 2 Data Binding
        generateAjaxSelect2(
            'customer_name',
            "{{ route('api.finance.master-data.customer.filter-data') }}",
            'Select Customer Name',
            function (result) {
                let pagingData = result.data;
                let hasMorePages = pagingData.next_page_url !== null;

                return {
                    results: pagingData.data.map(item => ({
                        id: item.customer_name,
                        text: item.customer_name,
                        customer_id: item.id,
                    })),
                    pagination: {
                        more: hasMorePages
                    }
                };
            }
        );

        $('#customer_name').change(function () {
            const selectedData = $(this).select2('data')[0];
            if (selectedData && selectedData.customer_id) {
                $('#customer_id').val(selectedData.customer_id);
            } else {
                $('#customer_id').val('');
            }
        });
    })
</script>
@endpush
