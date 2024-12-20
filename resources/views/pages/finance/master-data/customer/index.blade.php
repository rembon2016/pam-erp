@extends('layout.app')

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
            />
        </x:layout.card.header>
        <x:layout.card.body>
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
            <x:form.select label="Customer Name" name="customer_name" defaultOption="Select Customer Name" :model="request()">
                @foreach ($customers->pluck('customer_name') as $item)
                    <option value="{{ $item }}" @selected($item == request()->query('customer_name'))>
                        {{ $item }}
                    </option>
                @endforeach
            </x:form.select>
            <x:form.select2 label="Customer Type" name="customer_type_name[]" placeholder="Select Customer Type" :model="request()" multiple="true">
                @foreach ($customerTypes as $type)
                    <option value="{{ $type }}" @selected($type == request()->query('customer_type_name'))>
                        {{ $type }}
                    </option>
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

<script>
    $(document).ready(function () {
        let selectedCustomerType = new Set()
        let multipleSelectStyles = [
            'display:flex;',
            'flex-wrap:wrap;',
            'flex-direction:row;',
            'row-gap:10px;'
        ]

        let customerTypeNameElement = $('select[name="customer_type_name[]"]')
        $('ul.select2-selection__rendered').attr('style', multipleSelectStyles.join(' '))

        customerTypeNameElement.on('change', function () {
            selectedCustomerType.clear()
            selectedCustomerType.add($(this).val())

        })

        let customerTypeValue = JSON.stringify(Array.from(selectedCustomerType))
        customerTypeNameElement.val(customerTypeValue)
    })
</script>
@endpush
