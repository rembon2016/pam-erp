@props([
    'id' => $id,
    'url' => $url,
    'columns' => $columns ?? [],
    'API_BASE' => $API_BASE,
])

<script>
    "use strict";
    var KTDataTable = function() {
        var t, e;
        return {
            init: function() {
                t = document.querySelector("#{{ $id }}");
                if (!t) return;

                e = $(t).DataTable({
                    searchDelay: 500,
                    pageLength: 10,
                    processing: true,
                    serverSide: true,
                    search: {
                        return: true,
                        smart: true
                    },
                    ajax: {
                        url: "{{ $url }}",
                        type: 'GET',
                        data: function(d) {
                            // Get existing select2 data
                            let vesselData = null;
                            let consigneeData = null;
                            let carrierData = null;
                            let shipperData = null;

                            if ($('#vessel').length) {
                                const vesselSelect = $('#vessel');
                                vesselData = vesselSelect.select2('data')[0];
                            }

                            if ($('#carrier').length) {
                                const carrierSelect = $('#carrier');
                                carrierData = carrierSelect.select2('data')[0];
                            }

                            if ($('#shipper').length) {
                                const shipperSelect = $('#shipper');
                                shipperData = shipperSelect.select2('data')[0];
                            }

                            if ($('#consignee').length) {
                                const consigneeSelect = $('#consignee');
                                consigneeData = consigneeSelect.select2('data')[0];
                            }

                            let statusData = null;
                            if ($('#status').length) {
                                const statusSelect = $('#status');
                                statusData = statusSelect.select2('data')[0];
                            }

                            // Get search value from external search box
                            const searchValue = $('#datatableSearch').val();

                            // Get all filter values
                            const filters = {
                                shipment_by: $('#shipment_by').length ? $('#shipment_by')
                                    .val() : null,
                                origin_name: $('#origin').length ? $('#origin').val() : null,
                                port_destination_name: $('#destination').length ? $(
                                    '#destination').val() : null,
                                mother_vessel_name: $('#vessel').length ? $('#vessel').val() :
                                    null,
                                carrier_id: carrierData ? carrierData.carrier_id : null,
                                eta: $('#eta').length ? $('#eta').val() : null,
                                shipper_id: shipperData ? shipperData.shipper_id : null,
                                consignee_id: consigneeData ? consigneeData.consignee_id : null,
                                status_shipment: statusData ? statusData.text : null,
                                voyage_number_mother: vesselData ? vesselData
                                    .voyage_number_mother : null,
                                mother_vessel_id: vesselData ? vesselData.mother_vessel_id :
                                    null,
                                search: searchValue || d.search.value
                            };

                            // Handle ETD date range
                            const fromDate = $('#from_date_etd').val();
                            const toDate = $('#to_date_etd').val();
                            if (fromDate && toDate) {
                                // Send as a simple string
                                d.etd = fromDate + ',' + toDate;
                            }

                            // Remove empty/null/undefined filters
                            Object.keys(filters).forEach(key => {
                                if (!filters[key] ||
                                    (Array.isArray(filters[key]) && filters[key].length ===
                                        0) ||
                                    filters[key] === 'null' ||
                                    filters[key] === 'undefined') {
                                    delete filters[key];
                                }
                            });

                            // Merge the remaining filters with DataTables parameters
                            return {
                                ...d,
                                ...filters
                            };
                        },
                        dataSrc: function(json) {
                            return json.data.map(function(item) {
                                // Function to flatten nested objects
                                function flattenObject(obj, prefix = '') {
                                    return Object.keys(obj).reduce((acc, key) => {
                                        const pre = prefix.length ? prefix + '.' :
                                            '';
                                        if (typeof obj[key] === 'object' && obj[
                                            key] !== null && !Array.isArray(obj[
                                                key])) {
                                            Object.assign(acc, flattenObject(obj[
                                                key], pre + key));
                                        } else {
                                            acc[pre + key] = obj[key];
                                        }
                                        return acc;
                                    }, {});
                                }

                                // Flatten the item and merge it back with the original
                                return {
                                    ...item,
                                    ...flattenObject(item)
                                };
                            });
                        }
                    },
                    columns: @json($columns),
                    language: {
                        info: "_START_-_END_ of _TOTAL_",
                        infoFiltered: ""
                    },
                    columnDefs: [{
                        targets: '_all',
                        render: function(data, type, row, meta) {
                            if (type !== 'display' && type !== 'filter') {
                                return data;
                            }

                            const columnName = meta.settings.aoColumns[meta.col].data;

                            // Check if the column data exists in the row
                            if (!row.hasOwnProperty(columnName) || row[columnName] ===
                                null || row[columnName] === undefined) {
                                return '-';
                            }

                            const className = `td-${columnName}`;
                            const idName = `td-${columnName}-${meta.row}`;

                            const columnDef = meta.settings.aoColumns[meta.col];
                            const cutText = columnDef.cutText !== false;

                            const displayData = data === null || data === '' || data ===
                                undefined ? '-' : (
                                    cutText && typeof data === 'string' && data.length >
                                    25 ? data.substring(0, 22) +
                                    '...' : data);

                            // Add CTD Number linking
                            if (columnName === 'ctd_number') {
                                const shipmentType = (row.shipment_by || '').toLowerCase();
                                const jobId = row.job_id || '';
                                return `
                                    <a href="/finance/general-wise/shipment/${shipmentType}/${jobId}" class="ctd-number-text">
                                        ${displayData}
                                    </a>
                                `;
                            }

                            // Checked shipment list table start ================================
                            // Check if the column is shipment_type
                            let additionalClass = '';
                            if (columnName === 'shipment_type') {
                                if (data === 'SA') {
                                    additionalClass = 'sa-class';
                                } else if (data === 'CA') {
                                    additionalClass = 'ca-class';
                                } else {
                                    additionalClass = 'db-class';
                                }
                            }

                            // Check if the column is vessel_voyage
                            if (columnName === 'vessel_voyage' && data) {
                                const parts = data.split('<br>');
                                const firstVessel = parts[0] ?
                                    `<span class="first-vessel">${parts[0]}</span><br>` :
                                    '';
                                const secondVessel = parts[1] ?
                                    `<span class="second-vessel">${parts[1]}</span>` : '';
                                return `<span class="${className} ${additionalClass}" id="${idName}">${firstVessel}${secondVessel}</span>`;
                            }

                            if (columnName === 'status_shipment') {
                                let bgColor, textColor;

                                if ([1].includes(row.status_shipment_id)) {
                                    bgColor = "#ccddf1";
                                    textColor = "#234eeb";
                                } else if ([2, 3, 4, 5, 6, 7, 10].includes(row
                                        .status_shipment_id)) {
                                    bgColor = "#efd0f1";
                                    textColor = "#ad1cb3";
                                } else if ([8, 9, 29, 30, 31, 32, 33, 34, 35].includes(row
                                        .status_shipment_id)) {
                                    bgColor = "#d6e0ff";
                                    textColor = "#2d49a7";
                                } else if ([36, 37, 38].includes(row.status_shipment_id)) {
                                    bgColor = "#cbf3f2";
                                    textColor = "#097674";
                                } else if ([39].includes(row.status_shipment_id)) {
                                    bgColor = "#cbffbd";
                                    textColor = "#349b20";
                                } else if ([11, 26].includes(row.status_shipment_id)) {
                                    bgColor = "#ffe1e1";
                                    textColor = "#b91518";
                                } else {
                                    bgColor = "#e6e7fa";
                                    textColor = "#5355ad";
                                }

                                return `<span class="${className} ${additionalClass} badge status-badge" 
                                              id="${idName}" 
                                              style="background-color: ${bgColor}; color: ${textColor}; padding: 8px; border-radius: 4px; cursor: pointer;"
                                              data-ctd="${row.ctd_number}"
                                              data-job-id="${row.job_id}">${displayData}</span>`;
                            }

                            // Check if the column is action
                            if (columnName === 'action' && row.job_id && row.shipment_by) {
                                // Convert shipment_by to lowercase and handle potential undefined
                                const shipmentType = (row.shipment_by || '').toLowerCase();
                                const jobId = row.job_id || '';

                                return `
                                    <div class="d-flex gap-2 justify-content-center">
                                        <a href="/finance/general-wise/shipment/${shipmentType}/${jobId}" class="btn-view-shipment">
                                            <svg width="16" height="11" viewBox="0 0 16 11" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M8 1.46667C9.33726 1.46218 10.6486 1.83831 11.7834 2.5518C12.9181 3.26529 13.8301 4.28718 14.4145 5.5C13.2145 7.97133 10.7636 9.53333 8 9.53333C5.23636 9.53333 2.78545 7.97133 1.58545 5.5C2.1699 4.28718 3.08191 3.26529 4.21664 2.5518C5.35136 1.83831 6.66274 1.46218 8 1.46667ZM8 0C4.36364 0 1.25818 2.28067 0 5.5C1.25818 8.71933 4.36364 11 8 11C11.6364 11 14.7418 8.71933 16 5.5C14.7418 2.28067 11.6364 0 8 0ZM8 3.66667C8.48221 3.66667 8.94467 3.85982 9.28565 4.20364C9.62662 4.54745 9.81818 5.01377 9.81818 5.5C9.81818 5.98623 9.62662 6.45255 9.28565 6.79636C8.94467 7.14018 8.48221 7.33333 8 7.33333C7.51779 7.33333 7.05533 7.14018 6.71435 6.79636C6.37338 6.45255 6.18182 5.98623 6.18182 5.5C6.18182 5.01377 6.37338 4.54745 6.71435 4.20364C7.05533 3.85982 7.51779 3.66667 8 3.66667ZM8 2.2C6.19636 2.2 4.72727 3.68133 4.72727 5.5C4.72727 7.31867 6.19636 8.8 8 8.8C9.80364 8.8 11.2727 7.31867 11.2727 5.5C11.2727 3.68133 9.80364 2.2 8 2.2Z" fill="#F8F8F8"/>
                                        </svg>
                                    </a>
                                </div>
                                `;
                            }

                            if (columnName === 'transit_via') {
                                const transitVia = row.transit_via === "DUBAI" ? "DXB" :
                                    row.transit_via === "SINGAPORE" ? "SIN" :
                                    row.transit_via === "LA" ? "LAX" :
                                    row.transit_via === "SEATTLE" ? "SEA" :
                                    row.shipment_by === "AIR" ? "AIR" :
                                    row.transit_via;
                                return `<span class="${className} ${additionalClass}" id="${idName}">${transitVia}</span>`;
                            }

                            // Checked shipment list table end ================================
                            return `<span class="${className} ${additionalClass}" id="${idName}">${displayData}</span>`;
                        },
                        createdCell: function(td, cellData, rowData, row, col) {
                            const columnName = this.api().settings()[0].aoColumns[col].data;
                            $(td).addClass(`td-${columnName}`);
                            $(td).attr('id', `td-${columnName}-${row}`);
                        }
                    }]
                });

                // Store DataTable instance globally
                window.shipmentDataTable = e;

                // Add debounce function
                function debounce(func, wait) {
                    let timeout;
                    return function(...args) {
                        clearTimeout(timeout);
                        timeout = setTimeout(() => func.apply(this, args), wait);
                    };
                }

                // Connect external search box to DataTable with debounce
                $('#datatableSearch').on('keyup', debounce(function() {
                    window.shipmentDataTable.search(this.value).draw();
                }, 1000)); // 1000ms = 1 second delay

                // Optional: Add enter key handler (immediate search)
                $('#datatableSearch').on('keypress', function(event) {
                    if (event.which == 13) { // Enter key
                        event.preventDefault();
                        window.shipmentDataTable.search(this.value).draw();
                    }
                });
            }
        }
    }();

    // Initialize on DOM load
    KTUtil.onDOMContentLoaded(function() {
        KTDataTable.init();
    });

    // Move the sidebar initialization outside of the DataTable initialization
    document.addEventListener('DOMContentLoaded', function() {
        // Add styles first
        const sidebarStyles = `
            .right-sidebar {
                position: fixed;
                top: 0;
                right: -400px;
                width: 330px;
                height: 100vh;
                background: white;
                box-shadow: -2px 0 5px rgba(0,0,0,0.2);
                transition: right 0.3s ease;
                z-index: 9999;
                overflow-y: auto;
                padding: 20px;
            }

            .right-sidebar.open {
                right: 0;
            }

            .sidebar-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }

            .close-sidebar {
                border: none;
                background: none;
                font-size: 24px;
                cursor: pointer;
            }

            /* Vertical Timeline Styles */
            .vertical-timeline {
                position: relative;
                padding: 20px 0;
            }

            .vertical-timeline::before {
                content: '';
                position: absolute;
                left: 15px;
                top: 0;
                bottom: 0;
                width: 2px;
                background: #4CAF50;
            }

            .timeline-item {
                position: relative;
                margin-bottom: 30px;
                margin-left: 40px;
            }

            .timeline-dot {
                position: absolute;
                left: -40px;
                width: 30px;
                height: 30px;
                border-radius: 50%;
                background: white;
                border: 2px solid #4CAF50;
                display: flex;
                align-items: center;
                justify-content: center;
                box-shadow: 0 0 0 4px #fff,inset 0 2px 0 rgba(0,0,0,.08),0 3px 0 4px rgba(0,0,0,.05)
            }

            .timeline-dot.active {
                background: #32CD32;
            }

            .timeline-dot.inactive {
                background: rgb(147, 164, 152);
            }

            .timeline-card {
                background: #f8f9fa;
                border-radius: 8px;
                padding: 15px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }

            .timeline-card.active {
                background: linear-gradient(to right, rgb(50, 205, 50), rgb(173, 255, 47));
            }

            .timeline-card h4 {
                margin: 0;
                color: #333;
                font-size: 13px;
                font-weight: 600;
            }

            .timeline-details {
                font-size: 13px;
                color: #666;
            }

            .timeline-details.active, .timeline-details.active p {
                color: #fff;
                font-weight: 500;
            }

            .timeline-date {
                color: #2196F3;
                font-weight: 500;
                margin: 5px 0;
            }

            .timeline-location {
                color: #666;
                margin: 5px 0;
            }

            .timeline-email {
                color: #666;
                margin: 5px 0;
            }

            .timeline-secondary-date {
                color: #999;
                font-size: 12px;
                margin: 5px 0;
            }

            .timeline-loading {
                text-align: center;
                padding: 20px;
            }

            .timeline-error {
                color: #dc3545;
                text-align: center;
                padding: 20px;
            }

            .title-history-active {
                background-color: rgb(203, 255, 189);
                padding: 10px;
                border-radius: 10px;
            }

            .title-history-inactive {
                    background-color: #A9A9A9;
                    padding: 10px;
                    color: #fff;
                    font-size: 14px;
                    border-radius: 10px;
            }

            div.title-history-active h4 {
                margin-bottom: 0;
                font-size: 13px;
                font-weight: bold;
                color: rgb(52, 155, 23);
            }
            
            div.title-history-active .timeline-date {
                font-size: 12px;
                font-weight: bold;
                color: rgb(52, 155, 23);
            }

            div.title-history-inactive h4 {
                color: #fff;
            }
        `;

        const styleSheet = document.createElement("style");
        styleSheet.textContent = sidebarStyles;
        document.head.appendChild(styleSheet);

        // Create and append sidebar HTML if it doesn't exist
        if (!document.getElementById('rightSidebar')) {
            const sidebarHTML = `
                <div id="rightSidebar" class="right-sidebar">
                    <div class="sidebar-header">
                        <h5>History Shipping</h5>
                        <button class="close-sidebar">&times;</button>
                    </div>
                    <div class="sidebar-content">
                        <p><strong>CTD Number:</strong> <span id="selectedCTD"></span></p>
                        <div class="vertical-timeline">
                            <!-- Timeline items will be dynamically inserted here -->
                        </div>
                    </div>
                </div>
            `;
            document.body.insertAdjacentHTML('beforeend', sidebarHTML);
        }

        // Add click event listeners
        document.addEventListener('click', function(e) {
            // Handle status badge click
            if (e.target.classList.contains('status-badge')) {
                const sidebar = document.getElementById('rightSidebar');
                const ctdNumber = e.target.dataset.ctd;
                const jobId = e.target.dataset.jobId;

                if (!sidebar) {
                    console.error('Sidebar element not found!');
                    return;
                }

                // Update CTD number in sidebar
                const ctdElement = document.getElementById('selectedCTD');
                if (ctdElement) {
                    ctdElement.textContent = ctdNumber;
                }

                // Show loading state
                const timelineElement = sidebar.querySelector('.vertical-timeline');
                if (timelineElement) {
                    timelineElement.innerHTML = `
                        <div class="timeline-loading">
                            <div class="spinner"></div>
                            <p>Loading shipping history...</p>
                        </div>
                    `;
                }

                // Open sidebar first
                sidebar.classList.add('open');

                // Then fetch data
                const gmt = getTimeZone();
                const encodedGMT = encodeURIComponent(gmt);

                fetch(`${API_BASE}/api/historijob/list?job_id=${jobId}&gmt=${encodedGMT}`)
                    .then(response => {
                        if (!response.ok) throw new Error('Network response was not ok');
                        return response.json();
                    })
                    .then(data => {
                        if (data.status && Array.isArray(data.data)) {
                            const sortedData = data.data.sort((a, b) =>
                                (a.no_urut || 0) - (b.no_urut || 0) ||
                                new Date(a.tgl_aktual_real || 0) - new Date(b.tgl_aktual_real ||
                                    0)
                            );

                            const timelineHTML = generateTimelineHTML(sortedData);
                            if (timelineElement) {
                                timelineElement.innerHTML = timelineHTML;
                            }
                        } else {
                            throw new Error('Invalid data format');
                        }
                    })
                    .catch(error => {
                        console.error('Failed to fetch shipping history:', error);
                        if (timelineElement) {
                            timelineElement.innerHTML = `
                                <div class="timeline-error">
                                    <p>Failed to load shipping history. Please try again.</p>
                                </div>
                            `;
                        }
                    });
            }

            // Handle close button click
            if (e.target.classList.contains('close-sidebar')) {
                const sidebar = document.getElementById('rightSidebar');
                if (sidebar) {
                    sidebar.classList.remove('open');
                }
            }
        });

        // Add this new event listener for clicks outside
        document.addEventListener('click', function(e) {
            const sidebar = document.getElementById('rightSidebar');
            const isClickInside = sidebar?.contains(e.target);
            const isStatusBadge = e.target.classList.contains('status-badge');

            // Close sidebar if click is outside and sidebar is open
            if (sidebar && !isClickInside && !isStatusBadge && sidebar.classList.contains('open')) {
                sidebar.classList.remove('open');
            }
        });
    });

    // Function to generate timeline HTML from API data
    function generateTimelineHTML(historyData) {
        return historyData.map(item => {
            // Check if tgl_aktual exists
            const hasTglAktual = item.tgl_aktual != null && item.tgl_aktual !== undefined;
            const dotClass = hasTglAktual ? 'active' : 'inactive';

            return `
                <div class="timeline-item">
                    <div class="timeline-dot ${dotClass}"></div>
                    <div class="timeline-card ${hasTglAktual ? 'active' : 'inactive'}">
                        <div class="title-history-${hasTglAktual ? 'active' : 'inactive'}">
                            <div style="display: flex; justify-content: space-between; align-items: center;">
                                <h4>${item.status_name}</h4> 
                                <span class="icon-history"">
                                     ${getStatusIcon(item.status_name, hasTglAktual)}
                                </span>
                            </div>
                            <p class="timeline-date ${hasTglAktual ? '' : 'd-none'}">${formatDateTime(item.tgl_aktual_real)}</p>
                        </div>
                        ${hasTglAktual ? `
                            <div class="timeline-details ${hasTglAktual ? 'active' : 'inactive'}">
                               
                                <p class="timeline-location">${item.location || ''}</p>
                                <p class="timeline-email">${item.created_by || '-'}</p>
                                <p class="timeline-secondary-date">${formatDateTime(item.date_modified || item.date_created)}</p>
                            </div>
                        ` : `
                            <div class="timeline-details">
                                <p>-</p>
                            </div>
                        `}
                    </div>
                </div>
            `;
        }).join('');
    }

    // Helper function to format datetime
    function formatDateTime(dateString) {
        if (!dateString) return '';
        const date = new Date(dateString);

        // Format the date and time
        const formattedDate = date.toLocaleString('en-GB', {
            day: '2-digit',
            month: 'short',
            year: 'numeric',
            hour: '2-digit',
            minute: '2-digit',
            hour12: false
        });

        return formattedDate;
    }

    // Add this function definition before the event listeners
    function getTimeZone(zoneName = "shortOffset") {
        try {
            // set up formatter
            const formatter = new Intl.DateTimeFormat(undefined, {
                timeZoneName: zoneName
            });

            // run formatter on current date and find timezone part
            const timeZonePart = formatter
                .formatToParts(Date.now())
                .find(part => part.type === "timeZoneName");

            return timeZonePart ? timeZonePart.value : "GMT+7"; // fallback to GMT+7
        } catch (error) {
            console.error('Error getting timezone:', error);
            return "GMT+7"; // fallback to GMT+7
        }
    }

    // Add click handler for clear button
    $('#btn-clear').on('click', function() {
        // Clear all select2 fields first
        const select2Fields = ['#shipment_by', '#origin', '#destination', '#vessel', '#eta', '#status',
            '#carrier', '#shipper', '#consignee'
        ];

        // Create a promise array for all select2 clear operations
        const clearPromises = select2Fields.map(field => {
            return new Promise(resolve => {
                if ($(field).length) { // Only clear if element exists
                    $(field).val(null).trigger('change');
                }
                setTimeout(resolve, 100);
            });
        });

        // Clear date inputs
        $('#from_date_etd, #to_date_etd').val('');

        // Clear search input
        $('#datatableSearch').val('');

        // Wait for all select2 fields to be cleared before reloading DataTable
        Promise.all(clearPromises).then(() => {
            // Get the DataTable instance
            var dataTable = window.shipmentDataTable;
            if (dataTable) {
                // Force clear the Ajax parameters before redrawing
                dataTable.ajax.params = function(d) {
                    // Reset all filter parameters
                    delete d.status_shipment;
                    delete d.origin_name;
                    delete d.port_destination_name;
                    delete d.mother_vessel_name;
                    delete d.eta;
                    delete d.voyage_number_mother;
                    delete d.mother_vessel_id;
                    return d;
                };

                // Clear search and reset to first page
                dataTable
                    .search('')
                    .page.len(10) // Reset page length to default (10)
                    .page(0) // Go to first page
                    .draw(true); // Force redraw with true to reset all parameters
            }
        });
    });

    // Add this after your DataTable initialization
    $('#shipment_table tbody').on('change', 'input[type="checkbox"]', function() {
        $(this).closest('tr').toggleClass('selected-row', this.checked);
    });

    // Handle "Select All" checkbox
    $('#select_all').on('change', function() {
        var isChecked = this.checked;
        $('#shipment_table tbody input[type="checkbox"]').each(function() {
            this.checked = isChecked;
            $(this).closest('tr').toggleClass('selected-row', isChecked);
        });
    });
</script>

<style>
    .selected-row {
        background-color: #f5f5f5 !important;
        /* Light grey background */
    }

    .total-order-section {
        margin-top: 20px;
        display: none;
    }

    .total-order-grid {
        display: flex;
        gap: 0px;
        border-radius: 8px;
        margin-top: 10px;
    }

    .total-order-item {
        background-color: white;
        margin-right: 10px;
        padding: 4px 10px;
        border-radius: 10px;
        font-size: 13px;
        font-weight: 500;
        display: flex;
        border: 1px dashed rgb(196, 190, 190);
        align-items: center;
    }

    .total-order-label {
        font-size: 0.875rem;
        color: #6c757d;
        margin-bottom: 0;
        margin-right: 10px;
    }

    .total-order-value {
        font-size: 1.05rem;
        font-weight: 600;
        color: #2d49a7;
    }
</style>
