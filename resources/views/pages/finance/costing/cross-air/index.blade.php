@extends('layout.main-layout')
@section('title', 'Cross Air Costing')

@section('body')
     <x:layout.breadcrumb.wrapper module="Costing" pageName="Cross Air">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Costing" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>

            <x:layout.card.toolbar
                exportCsvLink="{{ route('finance.costing.cross-air.export.csv') }}"
                withFilter="true"
            />
        </x:layout.card.header>
        <x:layout.card.body>
            <div class="filter-result mb-3" style="display: none;">
                <span class="fw-bold">Filter by </span>
                <span class="filter-values"></span>

                {{-- <button class="btn-clear clear-filter">Clear Filter</button> --}}
            </div>
            <x:layout.table.wrapper id="cross-air_table">
                <thead>
                    <x:layout.table.row>

                      <x:layout.table.heading widthPixel="50" title="No" />
                        <x:layout.table.heading widthPixel="100" title="Job Order Code" />
                        <x:layout.table.heading widthPixel="100" title="MAWB Number" />
                        <x:layout.table.heading widthPixel="100" title="Carrier" />
                        <x:layout.table.heading widthPixel="100" customClass="text-center" title="ETD" />
                        <x:layout.table.heading widthPixel="100" customClass="text-center" title="ETA" />
                        <x:layout.table.heading widthPixel="100" customClass="text-center" title="Job Order Date" />
                        <x:layout.table.heading widthPixel="100" customClass="text-center" title="Status" />
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
            <x:form.select label="MAWB Number" name="mawb_number_filter" placeholder="Select MAWB Number Name" :model="request()">
            </x:form.select>
            <x:form.select label="Carrier" name="carrier_filter" placeholder="Select Carrier Name" :model="request()">
            </x:form.select>
        </div>
    </x:layout.modal.filter-modal>
@endsection

@push('js')
    @component('components.layout.table.datatable', [
        'id' => 'cross-air_table',
        'url' => route('finance.costing.cross-air.list'), // Sesuaikan route sesuai kebutuhan Anda
        'dynamicParam' => true,
        'columns' => [
            [
                "data" => "DT_RowIndex",
                "name" => "DT_RowIndex",
                "orderable" => false,
                "searchable" => false
            ],
            [
                "data" => "job_order_code",
                "name" => "job_order_code",
            ],
            [
                "data" => "mawb_number",
                "name" => "mawb_number",
            ],
            [
                "data" => "carrier",
                "name" => "carrier",
            ],
            [
                "data" => "etd",
                "name" => "etd",
            ],
            [
                "data" => "eta",
                "name" => "eta",
            ],
            [
                "data" => "job_order_date",
                "name" => "job_order_date",
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
            ['mawb_number_filter', 'carrier_filter'].forEach(item => {
                let columnName = item.replace('_filter', '');
                let labelName = 'Select ' + columnName.charAt(0).toUpperCase() + columnName.slice(1);
                let url = "{{ route('api.finance.costing.cross_air.data_filter', ['column' => ':column']) }}";
                url = url.replace(':column', columnName);

                generateAjaxSelect2(
                    item,
                    url,
                    labelName,
                    function (result) {
                        return {
                            results: getMappingResult(columnName, result),
                        };
                    }
                );
            })
        })

        function getMappingResult(columnName, result) {
            if (columnName === 'mawb_number') {
                return result.data.map(item => ({
                    id: item.mawb_number,
                    text: item.mawb_number
                }));
            } else if (columnName === 'carrier') {
                return result.data.map(item => ({
                    id: item.carrier_id,
                    text: item.carrier_name
                }));
            }
        }
    </script>
@endpush
