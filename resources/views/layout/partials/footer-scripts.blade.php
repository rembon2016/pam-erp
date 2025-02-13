<!-- jQuery -->
<script src="{{ asset('/assets-v2/js/jquery-3.7.1.min.js') }}"></script>

<!-- Bootstrap Core JS -->
<script src="{{ asset('/assets-v2/js/bootstrap.bundle.min.js') }}"></script>

<!-- Feather Icon JS -->
<script src="{{ asset('/assets-v2/js/feather.min.js') }}"></script>
<script src="{{ asset('/assets-v2/js/jspdf.min.js') }}"></script>

<!-- Slimscroll JS -->
<script src="{{ asset('/assets-v2/plugins/slimscroll/jquery.slimscroll.min.js') }}"></script>

<!-- Datatable JS -->
<script src="{{ asset('/assets-v2/plugins/datatables/datatables.min.js') }}"></script>

<!-- select Js -->
<script src="{{ asset('/assets-v2/plugins/select2/js/select2.min.js') }}"></script>

<!-- apexChart JS -->
<script src="{{ asset('/assets-v2/plugins/apexchart/apexcharts.min.js') }}"></script>
{{-- <script src="{{ asset('/assets-v2/plugins/apexchart/chart-data.js') }}"></script> --}}

<!-- Chart JS -->
<script src="{{ asset('/assets-v2/plugins/chartjs/chart.min.js') }}"></script>
{{-- <script src="{{ asset('/assets-v2/plugins/chartjs/chart-data.js') }}"></script> --}}

<!-- morrisChart JS -->
<script src="{{ asset('/assets-v2/plugins/morris/raphael-min.js') }}"></script>
<script src="{{ asset('/assets-v2/plugins/morris/morris.min.js') }}"></script>
{{-- <script src="{{ asset('/assets-v2/plugins/morris/chart-data.js') }}"></script> --}}

<!-- c3Chart JS -->
<script src="{{ asset('/assets-v2/plugins/c3-chart/d3.v5.min.js') }}"></script>
<script src="{{ asset('/assets-v2/plugins/c3-chart/c3.min.js') }}"></script>
{{-- <script src="{{ asset('/assets-v2/plugins/c3-chart/chart-data.js') }}"></script> --}}

<!-- Plyr JS -->
<script src="{{ asset('/assets-v2/plugins/scrollbar/scrollbar.min.js') }}"></script>
<script src="{{ asset('/assets-v2/plugins/scrollbar/custom-scroll.js') }}"></script>

<!-- Counter JS -->
<script src="{{ asset('/assets-v2/plugins/countup/jquery.counterup.min.js') }}"></script>
<script src="{{ asset('/assets-v2/plugins/countup/jquery.waypoints.min.js') }}"></script>
<script src="{{ asset('/assets-v2/plugins/countup/jquery.missofis-countdown.js') }}"></script>

<!-- Sweetalert 2 -->
<script src="{{ asset('/assets-v2/plugins/sweetalert/sweetalert2.all.min.js') }}"></script>
<script src="{{ asset('/assets-v2/plugins/sweetalert/sweetalerts.min.js') }}"></script>

{{-- <script src="{{ asset('/assets-v2/plugins/select2/js/custom-select.js') }}"></script> --}}

<!-- multiselect JS -->
<script src="{{ asset('/assets-v2/js/jquery-ui.min.js') }}"></script>

<!-- lightbox JS -->
<script src="{{ asset('/assets-v2/plugins/lightbox/glightbox.min.js') }}"></script>
<script src="{{ asset('/assets-v2/plugins/lightbox/lightbox.js') }}"></script>

<!-- Dragula JS -->
<script src="{{ asset('/assets-v2/plugins/dragula/js/dragula.min.js') }}"></script>
<script src="{{ asset('/assets-v2/plugins/dragula/js/drag-drop.min.js') }}"></script>

<!-- Summernote JS -->
<script src="{{ asset('/assets-v2/plugins/summernote/summernote-lite.min.js') }}"></script>

<!-- Fileupload JS -->
<script src="{{ asset('/assets-v2/plugins/fileupload/fileupload.min.js') }}"></script>

<!-- Form Validation JS -->
<script src="{{ asset('/assets-v2/js/form-validation.js') }}"></script>

<!-- Datetimepicker JS -->
<script src="{{ asset('/assets-v2/plugins/moment/moment.min.js') }}"></script>
<script src="{{ asset('/assets-v2/js/bootstrap-datetimepicker.min.js') }}"></script>
<script src="{{ asset('/assets-v2/plugins/daterangepicker/daterangepicker.js') }}"></script>

{{-- iziToast JS --}}
<script src="{{ asset('assets/plugins/iziToast/js/iziToast.min.js') }}"></script>

{{-- DataTables JS --}}
<script src="{{ asset('/assets-v2/js/jquery.dataTables.min.js')}}"></script>
<script src="{{ asset('/assets-v2/js/dataTables.bootstrap5.min.js')}}"></script>

<script src="{{ asset('/assets-v2/js/html2canvas.min.js') }}"></script>

@include('utils.alert')
@include('utils.izitoast')

{{-- @livewireScriptConfig --}}

<!-- Theme Settings JS -->
<script src="{{ asset('/assets-v2/js/theme-settings.js') }}"></script>
<script src="{{ asset('/assets-v2/js/greedynav.js') }}"></script>

<!-- Custom JS -->
<script src="{{ asset('/assets-v2/js/script.js') }}"></script>
<script src="{{ asset('assets/js/main.js') }}"></script>
<script src="{{ asset('assets/js/history-shipping-icons.js') }}"></script>

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
</script>
