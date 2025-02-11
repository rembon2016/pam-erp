@if(session('toastSuccess'))
    <script>
        $(document).ready(function(){
            iziToast.success({
                title: 'Success',
                message : '{{ session('toastSuccess') }}',
                position: 'topRight'
            });
        })
    </script>
@endif

@if(session('toastError'))
    <script>
        $(document).ready(function(){
            iziToast.error({
                title: 'Failed',
                message : '{{ session('toastError') }}',
                position: 'topRight'
            });
        })
    </script>
@endif

@if(session('toastInfo'))
    <script>
        $(document).ready(function(){
            iziToast.info({
                title: 'Info'
                message : '{{ session('toastInfo') }}',
            });
        })
    </script>
@endif

@if(session('toastWarning'))
    <script>
        $(document).ready(function(){
            iziToast.warning({
                title: 'Caution'
                message : '{{ session('toastWarning') }}',
            });
        })
    </script>
@endif
