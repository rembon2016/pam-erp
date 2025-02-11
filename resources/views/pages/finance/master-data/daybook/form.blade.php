@extends('layout.main-layout')
@section('title')
    {{ $data['page'] }}
@endsection


@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="{!! $data['page'] !!}">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
        <x:layout.breadcrumb.item pageName="Daybook" href="{{ route('finance.master-data.daybook.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:form.wrapper action="{{ $data['action'] }}" method="{{ $data['method'] }}">
        <div class="row">
            <div class='col-md-4'>
                <x:form.input label="Daybook Code" name="code" placeholder="Type Code of Daybook" :model="$daybook" required="true" />
            </div>
            <div class='col-md-4'>
                <x:form.input label="Daybook Name" name="name" placeholder="Type Name of Daybook" :model="$daybook" required="true" />
            </div>
            <div class='col-md-4'>
                <x:form.input label="Type" name="type" placeholder="Type of Daybook" :model="$daybook" required="true" />
            </div>
            <div class='col-12'>
                <x:form.textarea label="Description" name="description" placeholder="Type of Daybook" :model="$daybook" required="true" />
            </div>
        </div>
        <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
            <x:form.cancel-button href="{{ route('finance.master-data.daybook.index') }}" label="Cancel" />
            <x:form.submit-button label="Submit" />
        </div>
    </x:form.wrapper>
@endsection
