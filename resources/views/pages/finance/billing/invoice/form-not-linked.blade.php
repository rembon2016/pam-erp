@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="Billing" pageName="Billing Customer - Not Linked">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Billing" />
        <x:layout.breadcrumb.item pageName="Invoice" href="{{ route('finance.billing.invoice.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:form.wrapper action="" method="GET">
        <div class="row">
            <div class='col-md-3'>
                <x:form.select label="Month" name="month" defaultOption="Select Month" :model="request()">
                    @foreach ($months as $item)
                        <option value="{{ $loop->iteration }}" @selected($item == request()->query('month'))>{{ $item }}</option>
                    @endforeach
                </x:form.select>
            </div>
            <div class='col-md-3'>
                <x:form.select label="Year" name="year" defaultOption="Select Year" :model="request()">
                    @foreach ($years as $item)
                    <option value="{{ $item }}" @selected($item == request()->query('year'))>{{ $item }}</option>
                    @endforeach
                </x:form.select>
            </div>
            <div class="col-md-3">
                <x:form.input type="date" label="Start Date" name="start_date" placeholder="Choose Date" :model="request()" />
            </div>
            <div class="col-md-3">
                <x:form.input type="date" label="End Date" name="end_date" placeholder="Choose Date" :model="request()" />
            </div>
            <div class='col-md-3'>
                <x:form.select label="Vessel" name="vessel" defaultOption="Select Vessel" :model="request()">
                    @foreach ($years as $item)
                    <option value="{{ $item }}" @selected($item == request()->query('year'))>{{ $item }}</option>
                    @endforeach
                </x:form.select>
            </div>
            <div class='col-md-3'>
                <x:form.select label="Voyage" name="voyage" defaultOption="Select Voyage" :model="request()">
                    @foreach ($years as $item)
                    <option value="{{ $item }}" @selected($item == request()->query('year'))>{{ $item }}</option>
                    @endforeach
                </x:form.select>
            </div>
            <div class='col-md-3'>
                <x:form.select label="Origin" name="origin" defaultOption="Select Origin" :model="request()">
                    @foreach ($years as $item)
                    <option value="{{ $item }}" @selected($item == request()->query('year'))>{{ $item }}</option>
                    @endforeach
                </x:form.select>
            </div>
        </div>
        <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
            <x:form.cancel-button href="{{ route('finance.billing.invoice.index') }}" label="Cancel" />
            <x:form.submit-button label="Submit" />
        </div>
    </x:form.wrapper>
@endsection
