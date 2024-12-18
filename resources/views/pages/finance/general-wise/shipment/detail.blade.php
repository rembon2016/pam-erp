@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="Order Detail">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="General Wise" />
        <x:layout.breadcrumb.item pageName="Shipment"
            href="{{ route('finance.general-wise.shipment.index', ['type' => $type]) }}" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x-shipment.detail-card :shipment="$shipment" :type="$type" />
    </x:layout.card.wrapper>
@endsection


