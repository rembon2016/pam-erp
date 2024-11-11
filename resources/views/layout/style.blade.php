<link rel="canonical" href="https://preview.keenthemes.com/metronic8" />
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="shortcut icon" href="{{ asset('assets/icon/fav.png') }}" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700" />
<link href="{{ asset('assets/plugins/datatables/datatables.bundle.css') }}" rel="stylesheet" type="text/css" />
<link href="{{ asset('assets/plugins/global/plugins.bundle.css') }}" rel="stylesheet" type="text/css" />
<link href="{{ asset('assets/css/style.bundle.css') }}" rel="stylesheet" type="text/css" />
<script src="{{ asset('assets/plugins/global/plugins.bundle.js') }}"></script>
<link rel="stylesheet" href="{{ asset('assets/plugins/iziToast/css/iziToast.min.css') }}">
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.css">

<link rel="stylesheet" href="{{ asset('assets/css/custom.css') }}">
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/@eonasdan/tempus-dominus@6.7.7/dist/css/tempus-dominus.min.css"
    crossorigin="anonymous">

@stack('css')
<style>
    .feedback-invalid {
        color: #f1416c !important;
        font-size: .95rem !important;
        margin-top: .5rem !important;
    }

    .f-badge {
        position: absolute;
        right: -6px;
        top: -10px;
        color: #fff;
        background: #db4b4b;
        font-size: 9px;
        border-radius: 50%;
        padding: 4px;
        width: 20px;
    }

    span.select2-container .select2-selection--single {
        height: auto;
    }

    .table-drag-custom .card-header {
        width: 315px;
    }

    .table-drag-custom .card-flush,
    .table-drag-custom,
    .table-drag-custom .main-body {
        min-height: 650px;
        overflow-y: auto
    }

    .table-drag-custom .card-bordered {
        margin: 10px
    }

    .table-row-dashed tr {
        text-transform: capitalize !important;
    }

    .action-btn * {
        pointer-events: none;
    }
</style>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
