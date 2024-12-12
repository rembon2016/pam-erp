@props([
    'id' => $id,
    'url' => $url,
    'columns' => $columns ?? [],
])

<script>
    "use strict";
    var KTDataTable = function() {
        var t, e;
        return {
            init: function() {
                (t = document.querySelector("#{{ $id }}")) && (t.querySelectorAll(
                    "tbody tr").forEach((t => {
                    const e = t.querySelectorAll("td"),
                        r = moment(e[3].innerHTML, "dd mm yyyy").format();
                    e[3].setAttribute("data-order", r)
                })), e = $(t).DataTable({
                    searchDelay: 500,
                    pageLength: 10,
                    processing: true,
                    serverSide: true,
                    ajax: "{{ $url }}",
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
                            const className = `td-${columnName}`;
                            const idName = `td-${columnName}-${meta.row}`;

                            const columnDef = meta.settings.aoColumns[meta.col];
                            const cutText = columnDef.cutText !== false;

                            const displayData = data === null || data === '' ? '-' : (
                                cutText && data.length > 25 ? data.substring(0, 22) +
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
                                    additionalClass = 'other-class';
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

                                return `<span class="${className} ${additionalClass} badge" id="${idName}" style="background-color: ${bgColor}; color: ${textColor}; padding: 8px; border-radius: 4px;">${displayData}</span>`;
                            }

                            // Check if the column is action
                            if (columnName === 'action') {
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
                                const transitVia = row.transit_via === "DUBAI" ? "DXB" 
                                    : row.transit_via === "SINGAPORE" ? "SIN"
                                    : row.transit_via === "LA" ? "LAX" 
                                    : row.transit_via === "SEATTLE" ? "SEA"
                                    : row.shipment_by === "AIR" ? "AIR"
                                    : row.transit_via;
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
