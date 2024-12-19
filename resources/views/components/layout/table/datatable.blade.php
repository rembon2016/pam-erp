@props([
    'id' => $id,
    'url' => $url,
    'columns' => $columns ?? [],
    'dynamicParam' => $dynamicParam ?? false
])

<script>
    "use strict";

    let ajaxUrl = "{{ $url }}";

    @if ($dynamicParam)
        const currentUrl = window.location.href;
        const urlObject = new URL(currentUrl);
        const params = urlObject.searchParams;
        const groupedParams = Array.from(params.entries()).map(([key, value]) => `${key}=${value}`).join('&');

        ajaxUrl += "?" + groupedParams;
    @endif

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
                        ajax: ajaxUrl,
                        columns: @json($columns),
                        columnDefs: [
                        {
                            // Optional: Adjust render logic for specific columns directly in JS
                            targets: '_all',
                            render: function(data, type, row, meta) {
                                // If the data is null, display 'N/A'
                                return data === null ? 'N/A' : data;
                            }
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
