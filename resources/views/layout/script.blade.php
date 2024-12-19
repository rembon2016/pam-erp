<script type="text/javascript">
    var hostUrl = "assets/";
</script>

<script src="{{ asset('assets/js/scripts.bundle.js') }}"></script>
<script src="{{ asset('assets/plugins/datatables/datatables.bundle.js') }}"></script>
<script src="{{ asset('assets/js/widgets.bundle.js') }}"></script>
<script src="{{ asset('assets/js/custom/widgets.js') }}"></script>
<script src="{{ asset('assets/plugins/custom/tinymce/tinymce.bundle.js') }}"></script>
<script src="{{ asset('assets/plugins/iziToast/js/iziToast.min.js') }}"></script>
<script src="{{ asset('assets/js/custom.js') }}"></script>
<script src="{{ asset('assets/js/custom/authentication/sign-in/general.js') }}"></script>

<!-- Popperjs -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" crossorigin="anonymous">
</script>
<!-- Tempus Dominus JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/@eonasdan/tempus-dominus@6.7.7/dist/js/tempus-dominus.min.js"
    crossorigin="anonymous"></script>
<script src="{{ asset('assets/js/main.js') }}"></script>
<script src="{{ asset('assets/js/history-shipping-icons.js') }}"></script>
<script src="{{ asset('assets/js/dynamic-modal.js') }}"></script>

@include('utils.alert')
@include('utils.izitoast')
@stack('js')
<script>
    $(".datepicker").daterangepicker({
        singleDatePicker: true,
        showDropdowns: true,
        locale: {
            format: "YYYY-MM-DD"
        }
    });

    $(".timepicker").daterangepicker({
        timePicker: true,
        singleDatePicker: true,
        timePicker24Hour: true,
        timePickerIncrement: 1,
        timePickerSeconds: true,
        locale: {
            format: "HH:mm:ss"
        }
    }).on('show.daterangepicker', function(ev, picker) {
        picker.container.find(".calendar-table").hide();
    }).on('showCalendar.daterangepicker', function(ev, picker) {
        picker.container.find('.calendar-table').remove();
        picker.container.find('.ranges').remove();
    });


    function deleteConfirmation(event) {
        event.preventDefault();
        const urlToRedirect = event.currentTarget.getAttribute('href');

        Swal.fire({
            title: 'Are you sure you want to delete this item?',
            icon: "info",
            showCancelButton: true,
            confirmButtonText: 'Yes',
            cancelButtonText: 'Cancel',
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = urlToRedirect;
            }
        })
    }

    const basicTinyMceOptions = {
        selector: ".tinymce-simple-editor",
        height : "300",
        menubar: false,
        toolbar: [
            "bold italic underline"
        ]
    };
    if ( KTThemeMode.getMode() === "dark" ) {
        options["skin"] = "oxide-dark";
        options["content_css"] = "dark";
    }

    tinymce.init(basicTinyMceOptions);

</script>
