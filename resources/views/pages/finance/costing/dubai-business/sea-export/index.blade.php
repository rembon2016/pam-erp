@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="Costing" pageName="Sea Export">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Costing" />
    </x:layout.breadcrumb.wrapper>

    <div id="kt_app_content" class="app-content flex-column-fluid">
        <!--begin::Content container-->
        <div id="kt_app_content_container" class="app-container container-xxl">
            <!--begin::Products-->
            <div class="card card-flush">
                <!--begin::Card header-->
                <div class="card-header align-items-center py-5 gap-2 gap-md-5">
                    <!--begin::Card toolbar-->
                    <div class="card-toolbar flex-row-fluid justify-content-start gap-2">
                        <!--begin::Filter menu-->

                        <!--end::Filter menu-->

                        <!--begin::Export dropdown-->
                        <button type="button" class="btn btn-sm custom-btn custom-btn-outline-primary" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">
                            <i class="bx bx-export"></i>
                            Export
                        </button>
                        <!--begin::Menu-->
                        <div id="kt_ecommerce_report_customer_orders_export_menu"
                            class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-semibold fs-7 w-200px py-4"
                            data-kt-menu="true">
                            <!--begin::Menu item-->

                            <!--end::Menu item-->
                            <!--begin::Menu item-->
                            <div class="menu-item px-3">
                                <a href="{{ route('finance.costing.dubai-business.sea-export.export.csv') }}" class="menu-link px-3" data-kt-ecommerce-export="csv">Export as CSV</a>
                            </div>

                            <!--end::Menu item-->
                        </div>
                        <!--end::Menu-->
                        <!--end::Export dropdown-->
                    </div>
                    <!--end::Card toolbar-->

                    <!--begin::Card title-->
                    <div class="card-title">
                        <!--begin::Search-->
                        <div class="d-flex align-items-center position-relative my-1">
                            <!--begin::Svg Icon | path: icons/duotune/general/gen021.svg-->
                            <span class="svg-icon svg-icon-1 position-absolute ms-4">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <rect opacity="0.5" x="17.0365" y="15.1223" width="8.15546" height="2" rx="1"
                                        transform="rotate(45 17.0365 15.1223)" fill="currentColor" />
                                    <path
                                        d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z"
                                        fill="currentColor" />
                                </svg>
                            </span>
                            <!--end::Svg Icon-->
                            <input type="text" data-kt-ecommerce-order-filter="search"
                                class="form-control form-control-solid w-250px ps-14" placeholder="Search Data..." />
                        </div>
                        <!--end::Search-->
                        <!--begin::Export buttons-->
                        <div id="kt_ecommerce_report_customer_orders_export" class="d-none"></div>
                        <!--end::Export buttons-->
                    </div>
                    <!--end::Card title-->
                </div>
                <!--end::Card header-->
                <!--begin::Card body-->
                <div class="card-body pt-0">
                    <!--begin::Table-->
                    <table class="table align-middle table-row-dashed fs-6 gy-5"
                        id="sea-air_table">
                        <!--begin::Table head-->
                        <thead>
                            <!--begin::Table row-->
                            <tr class="text-start text-gray-400 fw-bold fs-7 text-uppercase gs-0">
                                <th class="min-w-50px">No</th>
                                <th class="min-w-100px">Job Order Code</th>
                                <th class="min-w-100px">Vessel</th>
                                <th class="min-w-100px">Voyage</th>
                                <th class="text-center">ETA</th>
                                <th class="text-center">Origin</th>
                                <th class="text-center">Job Order Date</th>
                                <th class="text-center">Status</th>
                                <th class="text-center">Action</th>
                            </tr>
                            <!--end::Table row-->
                        </thead>
                        <!--end::Table head-->
                        <!--begin::Table body-->
                        <tbody class="fw-semibold text-gray-600">
                        </tbody>
                        <!--end::Table body-->
                    </table>
                    <!--end::Table-->
                </div>
                <!--end::Card body-->
            </div>
            <!--end::Products-->
        </div>
        <!--end::Content container-->
    </div>
@endsection

@push('js')
<script>

    "use strict";
    var KTDataTable = function() {
        var t, e;
        return {
            init: function() {

                (t = document.querySelector("#sea-air_table")) && (t.querySelectorAll(
                        "tbody tr").forEach((t => {
                        const e = t.querySelectorAll("td"),
                            r = moment(e[3].innerHTML, "dd mm yyyy").format();
                        e[3].setAttribute("data-order", r)
                    })), e = $(t).DataTable({
                        searchDelay: 500,
                        pageLength: 10,
                        processing: true,
                        serverSide: true,
                        ajax: "{{ route('finance.costing.dubai-business.sea-export.list') }}",
                        columns: [{"data":"DT_RowIndex","name":"DT_RowIndex","orderable":false,"searchable":false},{"data":"job_order_code","name":"job_order_code"},{"data":"vessel","name":"vessel"},{"data":"voyage","name":"voyage"},{"data":"eta","name":"eta"},{"data":"origin","name":"origin"},{"data":"job_order_date","name":"job_order_date"},{"data":"status","name":"status"},{"data":"action","name":"action"}]

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
