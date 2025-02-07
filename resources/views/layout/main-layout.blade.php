<!DOCTYPE html>
<html lang="en" data-layout="vs

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description"
        content="{{ config('app.name') }}">
    <meta name="keywords"
        content="admin, pam, pamcargo, pamcargo, pds, pds erp, erp, finance">
    <meta name="author" content="Dreamguys - Bootstrap Admin Template">
    <!-- Twitter -->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:site" content="@dreamstechnologies">
    <meta name="twitter:title" content="Finance & Accounting | {{ config('app.name') }}">
    <meta name="twitter:description"
        content="{{ config('app.name') }}">
    <meta name="twitter:image" content="https://kanakku.dreamstechnologies.com/assets/img/kanakku.jpg">
    <meta name="twitter:image:alt" content="{{ config('app.anme') }}">

    <!-- Facebook -->
    <meta property="og:url" content="https://kanakku.dreamstechnologies.com/">
    <meta property="og:title" content="Finance & Accounting | {{ config('app.name') }}">
    <meta property="og:description"
        content="{{ config('app.name') }}">
    <meta property="og:image" content="https://kanakku.dreamstechnologies.com/assets/img/kanakku.jpg">
    <meta property="og:image:secure_url" content="https://kanakku.dreamstechnologies.com/assets/img/kanakku.jpg">
    <meta property="og:image:type" content="image/png">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="600">
    <title>{{ config('app.name') }} - @yield('title')</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="{{ URL::asset('/assets/img/favicon.png') }}">

    @include('layout.partials.head')
</head>
    <body>
    <!-- Main Wrapper -->
    <div class="main-wrapper">

    {{-- Header/Navbar Component --}}
    @include('layout.partials.header')

    {{-- Sidebar Component --}}
    @include('layout.partials.sidebar')

    {{-- Main Contennt --}}

    <div class="page-wrapper">
        <div class="content container-fluid">
            @yield('body')
        </div>
    </div>
    {{-- End Main Content --}}

    {{-- @component('components.add-modal-popup')
    @endcomponent
    @component('components.edit-modal-popup')
    @endcomponent
    @component('components.modal-popup')
    @endcomponent --}}

    </div>

    <!-- End Main Wrapper -->
    {{-- @include('layout.partials.theme-settings') --}}

    @include('layout.partials.footer-scripts')
</body>

</html>
