@if(Session::has('fail'))
    <script>
        iziToast.error({
            title: 'Error',
            message: "{{ Session::get('fail') }}",
            position: 'topRight',
        });
    </script>
@endif
