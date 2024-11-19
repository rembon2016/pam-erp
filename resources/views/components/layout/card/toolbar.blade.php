@props([
    'createDataLink' => $createDataLink ?? null,
    'exportExcelLink' => $exportExcelLink ?? null,
    'exportCsvLink' => $exportCsvLink ?? null,
    'exportPdfLink' => $exportPdfLink ?? null,
])

<div class="card-toolbar flex-row-fluid justify-content-start gap-2">

    @if (!empty($createDataLink))
        <a href="{{ $createDataLink }}" class="btn btn-sm custom-btn custom-btn-primary">
            <i class="bx bx-plus"></i>
            Add
        </a>
    @endif

    <button type="button" class="btn btn-sm custom-btn custom-btn-outline-primary" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">
        <i class="bx bx-export"></i>
        Export
    </button>
    <div id="kt_ecommerce_report_customer_orders_export_menu"
        class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-semibold fs-7 w-200px py-4"
        data-kt-menu="true">
        @if (!empty($exportExcelLink))
            <div class="menu-item px-3">
                <a href="{{ $exportExcelLink }}" class="menu-link px-3" data-kt-ecommerce-export="excel">Export as Excel</a>
            </div>
        @endif
        @if (!empty($exportCsvLink))
            <div class="menu-item px-3">
                <a href="{{ $exportCsvLink }}" class="menu-link px-3" data-kt-ecommerce-export="csv">Export as CSV</a>
            </div>
        @endif
        @if (!empty($exportPdfLink))
            <div class="menu-item px-3">
                <a href="{{ $exportPdfLink }}" class="menu-link px-3" data-kt-ecommerce-export="pdf">Export as PDF</a>
            </div>
        @endif
    </div>
</div>

<div class="card-title">
    <div class="d-flex align-items-center position-relative my-1">
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
        <input type="text" data-kt-ecommerce-order-filter="search"
            class="form-control form-control-solid w-250px ps-14" placeholder="Search Data..." />
    </div>
    <div id="kt_ecommerce_report_customer_orders_export" class="d-none"></div>
</div>
