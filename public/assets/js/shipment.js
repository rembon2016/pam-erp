

"use strict";
var KTDataTable = function() {
    var t, e;
    return {
        init: function(query = '') {
            
            (t = document.querySelector("#shipment_table")) && (t.querySelectorAll(
                    "tbody tr").forEach((t => {
                    const e = t.querySelectorAll("td"),
                        r = moment(e[3].innerHTML, "dd mm yyyy").format();
                    e[3].setAttribute("data-order", r)
                })), e = $(t).DataTable({
                    searchDelay: 500,
                    pageLength: 10,
                    processing: true,
                    serverSide: true,
                    ajax: function (data, callback, settings) {
                        // Your custom logic to handle data request
                        $.ajax({
                            url: origin+"api/shippinginstruction?page=1&limit=10"+param_shipment+query,
                            type: 'GET',
                             data: function (d) {
                                d.page = d.start / d.length + 1;
                                d.limit = d.length;
                                d.search = d.search.value;
                                // Add additional parameters as needed
                            },
                            success: function (result) {
                                callback({
                                    recordsTotal: result.records.totalFilter,
                                    recordsFiltered: result.records.totalData,
                                    data: result.data,
                                });
                            },
                        });
                    },
                   
                    columns: [{
                        "data": "ctd_number",
                        "name": "ctd_number"
                    }, {
                        "data": "status_shipment",
                        "name": "status_shipment"
                    }, {
                        "data": "shipper_name",
                        "name": "shipper_name"
                    },{
                        "data": "consigne_name",
                        "name": "consigne_name"
                    },{
                        "data": "consignee.group.customer_group_name",
                        "name": "customer_group_name",
                        render: function (data, type, full, meta) {
                            if(full.consignee == null){
                                return '';
                            }else{
                                if(full.consignee.group == null){
                                    return '';
                                }else{
                                    return data !== null ? data : '';
                                }
                            }
                        },
                    },{
                        "data": "port_destination_code",
                        "name": "port_destination_code"
                    },{
                        "data": "order.qty",
                        "name": "order.qty",
                        render: function (data, type, full, meta) {
                            if(full.order == null){
                                return '';
                            }else{
                                return data !== null ? convertNumberFormat(data) : '';
                            }
                        },
                    },{
                        "data": "order.gross_weight",
                        "name": "order.gross_weight",
                        render: function (data, type, full, meta) {
                             if(full.order == null){
                                return '';
                            }else{
                                return data !== null ? convertNumberFormat(data) : '';
                            }
                        },
                    },{
                        "data": "order.measurement",
                        "name": "order.measurement",
                        render: function (data, type, full, meta) {
                             if(full.order == null){
                                return '';
                            }else{
                                return data !== null ? convertNumberFormat(data) : '';
                            }
                        },
                    },{
                        "data": "order.chw",
                        "name": "order.chw",
                        render: function (data, type, full, meta) {
                             if(full.order == null){
                                return '';
                            }else{
                                return data !== null ? convertNumberFormat(data) : '';
                            }
                        },
                    },{
                        "data": null,
                        "name": "mother_vessel_name",
                        render: function (data, type, full, meta) {
                            // Combine the two columns as desired
                            if(full.mother_vessel_name != '' && full.mother_vessel_name != null){
                                return full.mother_vessel_name + ' - ' + full.voyage_number_mother;
                            }else{
                                return '';
                            }
                            
                        },
                    },{
                        "data": "estimated_time_departure",
                        "name": "estimated_time_departure",
                    },{
                        "data": "eta_dubai",
                        "name": "eta_dubai",
                        render: function (data, type, full, meta) {
                            return data !== null ? data : '';
                        },
                    },{
                        "data": "origin_name",
                        "name": "origin_name"
                    },{
                        "data": "order.pkgs",
                        "name": "order.pkgs",
                        render: function (data, type, full, meta) {
                             if(full.order == null){
                                return '';
                            }else{
                                return data !== null ? data : '';
                            }
                        },
                    },{
                        "data": "freight_term",
                        "name": "freight_term",
                        render: function (data, type, full, meta) {
                            return data !== null ? data : '';
                        },
                    },{
                        "data": "transit_via",
                        "name": "transit_via",
                        render: function (data, type, full, meta) {
                            return data !== null ? data : '';
                        },
                    }, {
                        "data": null,
                        "name": "shipment_by",
                        render: function (data, type, full, meta) {
                            if(full.shipment_by == "SEAAIR"){
                                return 'SA';
                            }else{
                                return 'CA';
                            }
                        },
                    },{
                        "data": null,
                        "name": "action",
                        render: function (data, type, full, meta) {
                            // Combine the two columns as desired
                            return '<button class="custom-button btn-view-index" id="View" title="View"><svg width="16" height="11" viewBox="0 0 16 11" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M8 1.46667C9.33726 1.46218 10.6486 1.83831 11.7834 2.5518C12.9181 3.26529 13.8301 4.28718 14.4145 5.5C13.2145 7.97133 10.7636 9.53333 8 9.53333C5.23636 9.53333 2.78545 7.97133 1.58545 5.5C2.1699 4.28718 3.08191 3.26529 4.21664 2.5518C5.35136 1.83831 6.66274 1.46218 8 1.46667ZM8 0C4.36364 0 1.25818 2.28067 0 5.5C1.25818 8.71933 4.36364 11 8 11C11.6364 11 14.7418 8.71933 16 5.5C14.7418 2.28067 11.6364 0 8 0ZM8 3.66667C8.48221 3.66667 8.94467 3.85982 9.28565 4.20364C9.62662 4.54745 9.81818 5.01377 9.81818 5.5C9.81818 5.98623 9.62662 6.45255 9.28565 6.79636C8.94467 7.14018 8.48221 7.33333 8 7.33333C7.51779 7.33333 7.05533 7.14018 6.71435 6.79636C6.37338 6.45255 6.18182 5.98623 6.18182 5.5C6.18182 5.01377 6.37338 4.54745 6.71435 4.20364C7.05533 3.85982 7.51779 3.66667 8 3.66667ZM8 2.2C6.19636 2.2 4.72727 3.68133 4.72727 5.5C4.72727 7.31867 6.19636 8.8 8 8.8C9.80364 8.8 11.2727 7.31867 11.2727 5.5C11.2727 3.68133 9.80364 2.2 8 2.2Z" fill="#F8F8F8"></path></svg></button>';
                        },
                    }]

                }),
                (() => {
                    const e = "List Departement";
                    new $.fn.dataTable.Buttons(t, {
                            buttons: [{
                                extend: "copyHtml5",
                                title: e
                            }, {
                                extend: "excelHtml5",
                                title: e
                            }, {
                                extend: "csvHtml5",
                                title: e
                            }, {
                                extend: "pdfHtml5",
                                title: e
                            }]
                        }).container().appendTo($("#kt_ecommerce_report_customer_orders_export")),
                        document
                        .querySelectorAll(
                            "#kt_ecommerce_report_customer_orders_export_menu [data-kt-ecommerce-export]"
                            )
                        .forEach((t => {
                            t.addEventListener("click", (t => {
                                t.preventDefault();
                                const e = t.target.getAttribute(
                                    "data-kt-ecommerce-export");
                                document.querySelector(".dt-buttons .buttons-" + e)
                                    .click()
                            }))
                        }))
                })(), document.querySelector('[data-kt-ecommerce-order-filter="search"]').addEventListener(
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

$(".datepickerx").flatpickr({
    dateFormat: "Y-m-d",
});
function convertNumberFormat(number) {
    var convertedNumber = number.toString().replace(".", ".");
    var parts = convertedNumber.split(",");
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");

    return parts.join(",");
  }

function buildFilterParamsQuery(filters) {
    var queryString = '';

    Object.entries(filters).forEach(([key, value]) => {
        if (value && value !== '-') {
            if (queryString !== '') {
                queryString += '&';
            }
            queryString += `${key}=${value}`;
        }
    });

    return queryString;
}

function confirmation(ev) {
    ev.preventDefault();
    var urlToRedirect = ev.currentTarget.getAttribute(
    'href'); //use currentTarget because the click may be on the nested i tag and not a tag causing the href to be empty
    console.log(urlToRedirect);
    Swal.fire({
        title: 'Are you sure you want to delete this item?',
        showCancelButton: true,
        confirmButtonText: 'Ya',
        cancelButtonText: 'Tidak',
    }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            window.location.href = urlToRedirect;
        } else if (result.isDenied) {

        }
    }) // verify if this is the right URL

}
$( "#filter" ).on( "click", async function() {
    var origin = $("#origin").val();
    var port_id = $("#port_id").val();
    var vessel = $("#vessel").val();
    var transit_hub = $("#transit_hub").val();

    var start_date = $("#start_date").val();
    var end_date = $("#end_date").val();



    var filters = {
        origin_name: origin,
        mother_vessel_name:vessel,
        port_of_destination: port_id,
        eta: transit_hub,
        date_start: start_date,
        date_end: end_date
    };

    var queryString = buildFilterParamsQuery(filters);
$("#shipment_table").DataTable().destroy();
KTDataTable.init(queryString);

});