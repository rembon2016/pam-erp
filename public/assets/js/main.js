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

$(document).off('click', 'button[data-type="add-dynamic-row"]').on('click', 'button[data-type="add-dynamic-row"]', function (event) {
    const dynamicRowWrapper = $(".dynamic-row-wrapper");
    const clonedFirstRowItem = $(dynamicRowWrapper).find('.dynamic-row-item').eq(0).clone();
    clearValueInDynamicRow(clonedFirstRowItem);

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
});
