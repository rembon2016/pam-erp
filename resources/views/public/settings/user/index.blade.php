@extends('layout.main-layout')
@section('title', 'User')

@section('body')
<x:layout.breadcrumb.wrapper module="Settings" pageName="User">
    <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
    <x:layout.breadcrumb.item pageName="Settings" />
</x:layout.breadcrumb.wrapper>

{{-- <div id="kt_app_content" class="app-content flex-column-fluid">
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
                    <a href="{{ route('settings.user.create') }}" class="btn btn-sm custom-btn custom-btn-primary">
                        <i class="bx bx-plus"></i>
                        Add
                    </a>

                    <!--begin::Export dropdown-->
                    <button type="button" class="btn btn-sm custom-btn custom-btn-outline-primary"
                        data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">
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
                            <a href="{{ route('settings.user.export.csv') }}" class="menu-link px-3"
                                data-kt-ecommerce-export="csv">Export as CSV</a>
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
                <table class="table align-middle table-row-dashed fs-6 gy-5" id="user_table">
                    <!--begin::Table head-->
                    <thead>
                        <!--begin::Table row-->
                        <tr class="text-start text-gray-400 fw-bold fs-7 text-uppercase gs-0">
                            <th class="min-w-50px">No</th>
                            <th class="min-w-100px">Name</th>
                            <th class="min-w-100px">Email</th>
                            <th class="min-w-100px">Roles</th>
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
</div> --}}

<div class="d-flex justify-content-end mb-3">
    <div class="list-btn">
        <ul class="filter-list">
            <li>
                <a class="btn btn-filters w-auto popup-toggle" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-original-title="Filter">
                    <span class="me-2">
                        <img src="{{ asset('assets-v2/img/icons/filter-icon.svg') }}" alt="filter">
                    </span>
                        Filter
                </a>
            </li>
            <li>
                <div class="dropdown dropdown-action" data-bs-toggle="tooltip" data-bs-placement="bottom"
                    data-bs-original-title="Download">
                    <a href="#" class="btn-filters" data-bs-toggle="dropdown" aria-expanded="false"><span><i
                                class="fe fe-download"></i></span></a>
                    <div class="dropdown-menu dropdown-menu-end">
                        <ul class="d-block">
                            {{-- <li>
                                <a class="d-flex align-items-center download-item" href="javascript:void(0);">
                                    <i class="far fa-file-excel me-2"></i>
                                    Excel
                                </a>
                            </li> --}}
                            <li>
                                <a class="d-flex align-items-center download-item" href="{{ route('settings.user.export.csv') }}">
                                    <i class="far fa-file-text me-2"></i>
                                    CSV
                                </a>
                            </li>
                            {{-- <li>
                                <a class="d-flex align-items-center download-item" href="javascript:void(0);">
                                    <i class="far fa-file-pdf me-2"></i>
                                    PDF
                                </a>
                            </li> --}}
                        </ul>
                    </div>
                </div>
            </li>
            <li>
                <a class="btn btn-primary" href="{{ route('settings.user.create') }}">
                    <i class="fa fa-plus-circle me-2" aria-hidden="true"></i> Add User
                </a>
            </li>

        </ul>
    </div>
</div>

<div class="row">
    <div class="col-sm-12">
        <div class="card-table">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-center table-hover" id="user_table">
                        <thead class="thead-light">
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Roles </th>
                                <th class="no-sort">Actions</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('js')
<script>
    // "use strict";
    // var KTDataTable = function() {
    //     var t, e;
    //     return {
    //         init: function() {

    //             (t = document.querySelector("#user_table")) && (t.querySelectorAll(
    //                     "tbody tr").forEach((t => {
    //                     const e = t.querySelectorAll("td"),
    //                         r = moment(e[3].innerHTML, "dd mm yyyy").format();
    //                     e[3].setAttribute("data-order", r)
    //                 })), e = $(t).DataTable({
    //                     searchDelay: 500,
    //                     pageLength: 10,
    //                     processing: true,
    //                     serverSide: true,
    //                     ajax: "{{ route('settings.user.list') }}",
    //                     columns: [{"data":"DT_RowIndex","name":"DT_RowIndex","orderable":false,"searchable":false},{"data":"name","name":"name"},{"data":"email","name":"email"},{"data":"roles","name":"roles"},{"data":"action","name":"action"}]

    //                 }), document.querySelector('[data-kt-ecommerce-order-filter="search"]').addEventListener(
    //                     "keyup", (function(t) {

    //                             e.search(t.target.value).draw()

    //                     })), (() => {
    //                     const t = document.querySelector('[data-kt-ecommerce-order-filter="status"]');
    //                     $(t).on("change", (t => {
    //                         let r = t.target.value;
    //                         "all" === r && (r = ""), e.column(2).search(r).draw()
    //                     }))
    //                 })())
    //         }
    //     }
    // }();

    // KTUtil.onDOMContentLoaded((function() {
    //     KTDataTable.init()
    // }));

    $("#user_table").DataTable({
			bFilter: false,
			autoWidth: false,
			sDom: 'fBtlpi',
			ordering: true,
            searchDelay: 500,
            pageLength: 10,
            processing: true,
            serverSide: true,
            ajax: "{{ route('settings.user.list') }}",
            columns: [{"data":"DT_RowIndex","name":"DT_RowIndex","orderable":false,"searchable":false},{"data":"name","name":"name"},{"data":"email","name":"email"},{"data":"roles","name":"roles"},{"data":"action","name":"action"}],
			columnDefs: [ {
				"targets": 'no-sort',
				"orderable": false,
		  	} ],
			language: {
				search: ' ',
				sLengthMenu: '_MENU_',
				paginate: {
					next: 'Next <i class=" fa fa-angle-double-right ms-2"></i>',
					previous: '<i class="fa fa-angle-double-left me-2"></i> Previous'
				},
			 },
			initComplete: (settings, json)=>{
				$('.dataTables_filter').appendTo('#tableSearch');
				$('.dataTables_filter').appendTo('.search-input');
			},
    })


</script>
@endpush
