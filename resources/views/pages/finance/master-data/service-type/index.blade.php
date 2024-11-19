@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="Service Type">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>
            <x:layout.card.toolbar
                createDataLink="{{ route('finance.master-data.service-type.create') }}"
                exportExcelLink="{{ route('finance.master-data.service-type.export.excel') }}"
                exportCsvLink="{{ route('finance.master-data.service-type.export.csv') }}"
                exportPdfLink="{{ route('finance.master-data.service-type.export.pdf') }}"
            />
        </x:layout.card.header>
        <x:layout.card.body>
            <x:layout.table.wrapper id="service_type_table">
                <thead>
                    <x:layout.table.row>
                        <x:layout.table.heading widthPixel="50" title="No" />
                        <x:layout.table.heading widthPixel="100" title="Service Code" />
                        <x:layout.table.heading widthPixel="100" title="Service Name" />
                        <x:layout.table.heading widthPixel="100" customClass="text-center" title="Action" />
                    </x:layout.table.row>
                </thead>
                <tbody class="fw-semibold text-gray-600">
                </tbody>
            </x:layout.table.wrapper>
        </x:layout.card.body>
    </x:layout.card.wrapper>
@endsection

@push('js')
<script>

    "use strict";
    var KTDataTable = function() {
        var t, e;
        return {
            init: function() {

                (t = document.querySelector("#service_type_table")) && (t.querySelectorAll(
                        "tbody tr").forEach((t => {
                        const e = t.querySelectorAll("td"),
                            r = moment(e[3].innerHTML, "dd mm yyyy").format();
                        e[3].setAttribute("data-order", r)
                    })), e = $(t).DataTable({
                        searchDelay: 500,
                        pageLength: 10,
                        processing: true,
                        serverSide: true,
                        ajax: "{{ route('finance.master-data.service-type.list') }}",
                        columns: [
                            {
                                "data": "DT_RowIndex",
                                "name": "DT_RowIndex",
                                "orderable": false,
                                "searchable": false
                            },
                            {
                                "data": "service_code",
                                "name": "service_code"
                            },
                            {
                                "data":"service_name",
                                "name":"service_name"
                            },
                            {
                                "data":"action",
                                "name":"action"
                            }
                        ]
                    }), document.querySelector('[data-kt-ecommerce-order-filter="search"]').addEventListener(
                        "keyup", (function(t) {

                                e.search(t.target.value).draw()

                        })), (() => {
                        const t = document.querySelector('[data-kt-ecommerce-order-filter="status"]');
                        $(t).on("change", (t => {
                            let r = t.target.value;
                            "all" === r && (r = ""), e.column(2).search(r).draw()
                        }))
                    })())
            }
        }
    }();

    KTUtil.onDOMContentLoaded((function() {
        KTDataTable.init()
    }));
</script>
@endpush
