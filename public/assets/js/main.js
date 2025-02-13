function generateRandomString(length) {
    let result = '';
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const charactersLength = characters.length;
    let counter = 0;
    while (counter < length) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
      counter += 1;
    }
    return result;
}

function debounce(func, delay) {
    let timeout;
    return function(...args) {
        clearTimeout(timeout);
        timeout = setTimeout(() => func.apply(this, args), delay);
    };
}

async function generateAjaxSelect2(id, url, placeholder, processFunction, selectedValue = []) {
    const currentUrl = new URL(window.location.href)
    const queryParamValue = currentUrl.searchParams.get(id);

    $(`#${id}`).select2({
        ajax: {
            url,
            dataType: 'json',
            delay: 250,
            data: function (params) {
                return {
                    search: params.term,
                    page: params.page || 1
                };
            },
            processResults: processFunction,
            cache: true
        },
        placeholder: placeholder,
    });


    if (selectedValue.length > 1) {
        const option = new Option(selectedValue[1], selectedValue[0], true, true);
        $(`#${id}`).append(option).trigger('change');
    } else {
        if (queryParamValue) {
            const option = new Option(queryParamValue, queryParamValue, true, true);
            $(`#${id}`).append(option).trigger('change');
        }
    }
}

function syncSelect2Element(elementWrapper, executedFunction) {
    $(elementWrapper).find('select[data-control="select2"]').each(function (index) {
        $(this).select2('destroy');
    });

    if (typeof executedFunction === "function") {
        executedFunction();
    }

    setTimeout(() => {
        $(elementWrapper).find('select[data-control="select2"]').each(function (index) {
            $(this).select2();
        });
    }, 500);
}

function clearValueInDynamicRow(rowItem) {
    $(rowItem).find('input, select').val('');
    $(rowItem).find('select[data-control="select2"]').val('').trigger('change');
}

function rearrangeNameAttribute(rowItem, wrapperElement, rowClass = '.dynamic-row-item', row_index = 0) {
    $(rowItem).find('input, select').each(function (index) {
        const nameAttr = $(this).attr('name');
        const currentIndex = $(wrapperElement).find(rowClass).length;
        const finalNameAttr = nameAttr.replace(`[${row_index}]`, `[${currentIndex}]`);

        $(this).attr('name', finalNameAttr);
    })
}

$(document).off('click', 'button[data-type="add-dynamic-row"]').on('click', 'button[data-type="add-dynamic-row"]', function (event) {
    const dynamicRowWrapper = $(".dynamic-row-wrapper");
    const clonedFirstRowItem = $(dynamicRowWrapper).find('.dynamic-row-item').eq(0).clone();
    clearValueInDynamicRow(clonedFirstRowItem);

    if (dynamicRowWrapper.attr('data-array-type') === "associative") {
        rearrangeNameAttribute(clonedFirstRowItem, dynamicRowWrapper);
    }

    $(dynamicRowWrapper).append(clonedFirstRowItem);
});

$(document).off('click', 'button[data-type="delete-dynamic-row"]').on('click', 'button[data-type="delete-dynamic-row"]', function (event) {
    const dynamicRowWrapper = $(".dynamic-row-wrapper");
    const rowItem = $(this).parents('.dynamic-row-item');
    const remainingRowItem = $(dynamicRowWrapper).find('.dynamic-row-item').length;

    if (remainingRowItem == 1) {
        clearValueInDynamicRow(
            $(".dynamic-row-wrapper").find('.dynamic-row-item').eq(0)
        )
    } else {
        $(rowItem).remove();
    }

    if ($(dynamicRowWrapper).attr('data-array-type') === "associative") {
        $(".dynamic-row-item").each(function (index) {
            $(this).find('input, select').each(function (ind) {
                const nameAttr = $(this).attr('name');
                const indexStartOfArray = nameAttr.indexOf('[');
                const indexEndOfArray = nameAttr.indexOf(']');
                const indexElement = nameAttr.slice(indexStartOfArray, indexEndOfArray);
                const finalNameAttr = nameAttr.replace(indexElement, `[${index}`);

                $(this).attr('name', finalNameAttr);
            })
        });
    }
});

$(document).off('click', '.confirm-btn').on('click', '.confirm-btn', function (event) {
    event.preventDefault();
    const actionLink = $(this).data('href');

    Swal.fire({
        title: "Are you sure to do this action?",
        showDenyButton: true,
        confirmButtonText: "Yes",
        icon: "warning"
    }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            window.location.href = actionLink;
        }
    });
})

$(document).ready(function () {
    $("[data-control='select2']").each(function () {
        const select_placeholder = $(this).data('placeholder');
        $(this).select2({
            placeholder: select_placeholder,
            width: "100%",
        })
    })
});
