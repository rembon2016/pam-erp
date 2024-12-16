<div class="card-toolbar flex-row-fluid justify-content-start gap-2 w-100">

    <button type="button" class="button-export">
        Export All Data to CSV
        <svg width="10" height="13" viewBox="0 0 10 13" fill="none" xmlns="http://www.w3.org/2000/svg"
            class="ms-2">
            <path
                d="M1.66667 0C0.747396 0 0 0.728711 0 1.625V11.375C0 12.2713 0.747396 13 1.66667 13H8.33333C9.2526 13 10 12.2713 10 11.375V4.0625H6.66667C6.20573 4.0625 5.83333 3.69941 5.83333 3.25V0H1.66667ZM6.66667 0V3.25H10L6.66667 0ZM4.05469 6.35273L5 7.67051L5.94531 6.35273C6.14323 6.07598 6.53385 6.00996 6.8151 6.20293C7.09635 6.3959 7.16667 6.77676 6.96875 7.05098L5.76302 8.73438L6.97135 10.4152C7.16927 10.692 7.10156 11.0703 6.81771 11.2633C6.53385 11.4563 6.14583 11.3902 5.94792 11.1135L5 9.7957L4.05469 11.1135C3.85677 11.3902 3.46615 11.4563 3.1849 11.2633C2.90365 11.0703 2.83333 10.6895 3.03125 10.4152L4.23698 8.73438L3.02865 7.05352C2.83073 6.77676 2.89844 6.39844 3.18229 6.20547C3.46615 6.0125 3.85417 6.07852 4.05208 6.35527L4.05469 6.35273Z"
                fill="#F8F8F8"></path>
        </svg>
    </button>
    <button type="button" class="button-download-multiple-doc">
        Download Multiple Doc
        <svg width="20px" height="20px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"
            class="ms-2" stroke="#ffffff">
            <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
            <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
            <g id="SVGRepo_iconCarrier">
                <path d="M8.5 7L8.5 14M8.5 14L11 11M8.5 14L6 11" stroke="#ffffff" stroke-width="1.5"
                    stroke-linecap="round" stroke-linejoin="round"></path>
                <path d="M15.5 7L15.5 14M15.5 14L18 11M15.5 14L13 11" stroke="#ffffff" stroke-width="1.5"
                    stroke-linecap="round" stroke-linejoin="round"></path>
                <path d="M18 17H12H6" stroke="#ffffff" stroke-width="1.5" stroke-linecap="round"></path>
                <path
                    d="M22 12C22 16.714 22 19.0711 20.5355 20.5355C19.0711 22 16.714 22 12 22C7.28595 22 4.92893 22 3.46447 20.5355C2 19.0711 2 16.714 2 12C2 7.28595 2 4.92893 3.46447 3.46447C4.92893 2 7.28595 2 12 2C16.714 2 19.0711 2 20.5355 3.46447C21.5093 4.43821 21.8356 5.80655 21.9449 8"
                    stroke="#ffffff" stroke-width="1.5" stroke-linecap="round"></path>
            </g>
        </svg>
    </button>
</div>

<div class="w-100 d-flex justify-content-end mt-4">
    <div class="card-title">
        <div class="d-flex align-items-center position-relative my-1">
            <span class="fs-6">Search</span>
            <input type="text" 
                id="datatableSearch"
                data-kt-ecommerce-order-filter="search"
                class="form-control mb-1 ms-2 search-input" 
                placeholder="" 
                autocomplete="off"
            />
        </div>
        <div id="kt_ecommerce_report_customer_orders_export" class="d-none"></div>
    </div>
</div>
