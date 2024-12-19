@props([
    'createDataLink' => $createDataLink ?? null,
    'exportExcelLink' => $exportExcelLink ?? null,
    'exportCsvLink' => $exportCsvLink ?? null,
    'exportPdfLink' => $exportPdfLink ?? null,
    'customLink' => $customLink ?? [],
    'withFilter' => $withFilter ?? false,
])

<div class="card-toolbar flex-row-fluid justify-content-start gap-2">

    <div class="d-flex align-items-center gap-2">
        @if (!empty($createDataLink))
            <a href="{{ $createDataLink }}" class="btn btn-sm custom-btn custom-btn-primary">
                <i class="bx bx-plus"></i>
                Add
            </a>
        @endif

        @if (!empty($customLink))
            @if(isset($customLink['link']))
                <a href="{{ $customLink['link'] }}" class="btn btn-sm custom-btn custom-btn-primary" id="custom-link-button">
                    @if (!empty($customLink['icon']))
                        <i class="{{ $customLink['icon'] }}"></i>
                    @endif
                    {{ $customLink['text'] }}
                </a>
            @elseif (isset($customLink['is_modal']))
                <button type="button" class="btn btn-sm custom-btn custom-btn-primary" data-bs-toggle="modal" data-bs-target="#custom_link_modal" id="custom-link-button">
                    @if (!empty($customLink['icon']))
                        <i class="{{ $customLink['icon'] }}"></i>
                    @endif
                    {{ $customLink['text'] }}
                </button>
            @else
                <button type="button" class="btn btn-sm custom-btn custom-btn-primary" id="custom-link-button">
                    @if (!empty($customLink['icon']))
                        <i class="{{ $customLink['icon'] }}"></i>
                    @endif
                    {{ $customLink['text'] }}
                </button>
            @endif
        @endif
    </div>

    @if (!empty($exportExcelLink) && !empty($exportCsvLink) && !empty($exportPdfLink))
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
    @endif
</div>

<div class="card-title">
    @if ($withFilter)
        <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#filter_table_modal">
            <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 22 22" fill="none">
                <path d="M1.03125 4.125H20.9688C21.2423 4.125 21.5046 4.23365 21.698 4.42705C21.8913 4.62044 22 4.88275 22 5.15625C22 5.42975 21.8913 5.69206 21.698 5.88545C21.5046 6.07885 21.2423 6.1875 20.9688 6.1875H1.03125C0.757746 6.1875 0.495443 6.07885 0.302046 5.88545C0.108649 5.69206 0 5.42975 0 5.15625C0 4.88275 0.108649 4.62044 0.302046 4.42705C0.495443 4.23365 0.757746 4.125 1.03125 4.125ZM4.125 10.6562C4.125 10.3827 4.23365 10.1204 4.42705 9.92705C4.62044 9.73365 4.88275 9.625 5.15625 9.625H16.8438C17.1173 9.625 17.3796 9.73365 17.573 9.92705C17.7663 10.1204 17.875 10.3827 17.875 10.6562C17.875 10.9298 17.7663 11.1921 17.573 11.3855C17.3796 11.5789 17.1173 11.6875 16.8438 11.6875H5.15625C4.88275 11.6875 4.62044 11.5789 4.42705 11.3855C4.23365 11.1921 4.125 10.9298 4.125 10.6562ZM8.25 16.1562C8.25 15.8827 8.35865 15.6204 8.55205 15.427C8.74544 15.2337 9.00775 15.125 9.28125 15.125H12.7188C12.9923 15.125 13.2546 15.2337 13.448 15.427C13.6413 15.6204 13.75 15.8827 13.75 16.1562C13.75 16.4298 13.6413 16.6921 13.448 16.8855C13.2546 17.0788 12.9923 17.1875 12.7188 17.1875H9.28125C9.00775 17.1875 8.74544 17.0788 8.55205 16.8855C8.35865 16.6921 8.25 16.4298 8.25 16.1562Z" fill="#DA7E0D"/>
            </svg>
        </button>
    @endif

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
            class="data-search form-control form-control-solid w-250px ps-14" placeholder="Search Data..." />
    </div>
    <div id="kt_ecommerce_report_customer_orders_export" class="d-none"></div>
</div>
