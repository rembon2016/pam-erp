@extends('layout.main-layout')
@section('title', 'Port')

@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="Port">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
        <x:layout.breadcrumb.item pageName="Port" href="{{ route('finance.master-data.port.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>
            <x:layout.card.toolbar
                createDataLink="{{ route('finance.master-data.port.create') }}"
                exportExcelLink="{{ route('finance.master-data.port.export.excel') }}"
                exportCsvLink="{{ route('finance.master-data.port.export.csv') }}"
                exportPdfLink="{{ route('finance.master-data.port.export.pdf') }}"
                withFilter="true"
            />
        </x:layout.card.header>
        <x:layout.card.body>
            <div class="filter-result mb-3" style="display: none;">
                <span class="fw-bold">Filter by </span>
                <span class="filter-values"></span>
            </div>
            <x:layout.table.wrapper id="port_table">
                <thead>
                    <x:layout.table.row>
                        <x:layout.table.heading widthPixel="50" title="No" />
                        <x:layout.table.heading widthPixel="100" title="Port Name" />
                        <x:layout.table.heading widthPixel="100" title="Port Code" />
                        <x:layout.table.heading widthPixel="100" title="Country" />
                        <x:layout.table.heading widthPixel="100" title="Transport Mode" />
                        <x:layout.table.heading widthPixel="100" title="Status" />
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
            <x:form.select label="Port Name" name="port_name" defaultOption="Select Port Name" :model="request()">
            </x:form.select>
            <x:form.select label="Port Code" name="port_code" defaultOption="Select Port Code" :model="request()">
            </x:form.select>
        </div>
    </x:layout.modal.filter-modal>
@endsection

@push('js')
@component('components.layout.table.datatable', [
    'id' => 'port_table',
    'url' => route('finance.master-data.port.list'),
    'dynamicParam' => true,
    'columns' => [
        [
            "data" => "DT_RowIndex",
            "name" => "DT_RowIndex",
            "orderable" => false,
            "searchable" => false
        ],
        [
            "data" => "port_name",
            "name" => "port_name",
        ],
        [
            "data" => "port_code",
            "name" => "port_code",
        ],
        [
            "data" => "country_name",
            "name" => "country_name",
        ],
        [
            "data" => "transport_mode",
            "name" => "transport_mode",
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

<script>
    $(document).ready(function () {
        ['port_name', 'port_code'].forEach(item => {
            let labelText = item.split('_').map(word => word.charAt(0).toUpperCase() + word.slice(1).toLowerCase()).join(' ')
            let labelName = 'Select ' + labelText;
            let url = "{{ route('api.finance.master-data.port.data_filter', ['column' => ':column']) }}";
            url = url.replace(':column', item);

            generateAjaxSelect2(
                item,
                url,
                labelName,
                function (result) {
                    return {
                        results: getMappingResult(item, result),
                    };
                }
            );
        })
    })

    function getMappingResult(columnName, result) {
        return result.data.map(item => ({
            id: item.port_id,
            text: columnName == 'port_name' ? item.port_name : item.port_code
        }))
    }
</script>
@endpush
