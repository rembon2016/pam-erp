@if ($message = Session::get('success'))
    <script>
        Swal.fire({
            text: `{!! $message ?? 'Success' !!}`,
            icon: "success",
            buttonsStyling: !1,
            confirmButtonText: "Ok",
            timer: 5000,
            customClass: {
                confirmButton: "btn btn-primary",
            },
        });
    </script>
@endif

@if ($message = Session::get('error'))
    <script>
        Swal.fire({
            text: `{!! $message ?? 'Something went wrong!' !!}`,
            icon: "error",
            buttonsStyling: !1,
            confirmButtonText: "Ok",
            timer: 5000,
            customClass: {
                confirmButton: "btn btn-primary",
            },
        });
    </script>
@endif

@if ($message = Session::get('info'))
    <script>
        Swal.fire({
            text: `{!! $message !!}`,
            icon: "info",
            buttonsStyling: !1,
            confirmButtonText: "Ok",
            timer: 5000,
            customClass: {
                confirmButton: "btn btn-primary",
            },
        });
    </script>
@endif


@if (Session::has('errors'))
    <script>
        @foreach ($errors->all() as $error)
        Swal.fire({
            text: `{!! $error ?? 'Something went wrong!' !!}`,
            icon: "error",
            buttonsStyling: !1,
            confirmButtonText: "Ok",
            timer: 5000,
            customClass: {
                confirmButton: "btn btn-primary",
            },
        });
        @endforeach
    </script>
@endif
