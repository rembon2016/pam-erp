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

function clearValueInDynamicRow(rowItem) {
    $(rowItem).find('input, select').val('');
}

function rearrangeNameAttribute(rowItem, row_index = 0) {
    $(rowItem).find('input, select').each(function (index) {
        const nameAttr = $(this).attr('name');
        const currentIndex = $(".dynamic-row-wrapper .dynamic-row-item").length;
        const finalNameAttr = nameAttr.replace(`[${row_index}]`, `[${currentIndex}]`);

        $(this).attr('name', finalNameAttr);
    })
}

$(document).off('click', 'button[data-type="add-dynamic-row"]').on('click', 'button[data-type="add-dynamic-row"]', function (event) {
    const dynamicRowWrapper = $(".dynamic-row-wrapper");
    const clonedFirstRowItem = $(dynamicRowWrapper).find('.dynamic-row-item').eq(0).clone();
    clearValueInDynamicRow(clonedFirstRowItem);

    if (dynamicRowWrapper.attr('data-array-type') === "associative") {
        rearrangeNameAttribute(clonedFirstRowItem);
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
                console.log(finalNameAttr, indexElement, index);

                $(this).attr('name', finalNameAttr);
            })
        });
    }
});
