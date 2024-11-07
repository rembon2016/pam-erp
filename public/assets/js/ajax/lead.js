function ajaxUpdateLeadStage(url, lead_pipeline_stage_id) {
    const _token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

    return $.ajax({
        url,
        method: 'POST',
        headers: {
            'X-CSRF-TOKEN': _token,
        },
        data: {
            lead_pipeline_stage_id,
        },
        success: function (result) {
            return result;
        },
        error: function(error) {
            console.error(error);
            return error;
        }
    })
}