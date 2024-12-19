@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="Billing" pageName="Billing Customer - Not Linked">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Billing" />
        <x:layout.breadcrumb.item pageName="Invoice" href="{{ route('finance.billing.invoice.index') }}" />
    </x:layout.breadcrumb.wrapper>

    @component('components.invoice.form-tab', [
        'tabs' => [
            [
                'link' => route('finance.billing.invoice.create.not-linked-billing-customer'),
                'text' => 'Billing Customer - Not Linked',
                'activeCondition' => request()->routeIs('finance.billing.invoice.create.not-linked-billing-customer'),
            ],
            [
                'link' => route('finance.billing.invoice.create.linked-billing-customer'),
                'text' => 'Billing Customer - Linked',
                'activeCondition' => request()->routeIs('finance.billing.invoice.create.linked-billing-customer'),
            ]
        ]
    ])
    @endcomponent

    <x:form.wrapper action="" method="GET">
        <div class="row">
            <div class='col-md-3'>
                <x:form.select label="Service Type" name="service_type" defaultOption="Select Service Type" :model="request()">
                    @foreach ($service_types as $item)
                        <option value="{{ $item->id }}" @selected($item->id == request()->query('service_type'))>{{ $item->service_name }}</option>
                    @endforeach
                </x:form.select>
            </div>
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
                <x:form.select2 label="Vessel" name="mother_vessel_name" placeholder="Select Vessel" :model="request()">
                    @foreach ($vessels as $item)
                        <option value="{{ $item['mother_vessel_name'] }}" @selected($item['mother_vessel_name'] == request()->query('mother_vessel_name'))>{{ "{$item['mother_vessel_name']} - {$item['voyage_number_mother']}" }}</option>
                    @endforeach
                </x:form.select>
            </div>
            <div class='col-md-3'>
                <x:form.select2 label="Voyage" name="voyage" placeholder="Select Voyage" :model="request()">
                    @foreach ($voyages as $item)
                    <option value="{{ $item['voyage_number_mother'] }}" @selected($item['voyage_number_mother'] == request()->query('year'))>{{ $item['voyage_number_mother'] }}</option>
                    @endforeach
                </x:form.select>
            </div>
            <div class='col-md-3'>
                <x:form.select2 label="Origin" name="origin" placeholder="Select Origin" :model="request()">
                    @foreach ($origins as $item)
                    <option value="{{ $item['origin_name'] }}" @selected($item['origin_name'] == request()->query('origin'))>{{ $item['origin_name'] }}</option>
                    @endforeach
                </x:form.select>
            </div>
        </div>
        <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
            <x:form.cancel-button href="{{ route('finance.billing.invoice.create.not-linked-billing-customer') }}" label="Reset Filter" />
            <x:form.submit-button label="Apply Filter" />
        </div>
    </x:form.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>
            <x:layout.card.toolbar
                :customLink="[
                    'link' => '/',
                    'text' => 'Update Multiple Billing Customer'
                ]"
                withFilter="true"
            />
        </x:layout.card.header>
        <x:layout.card.body>
            <x:layout.table.wrapper id="currency_table">
                <thead>
                    <x:layout.table.row>
                        <x:layout.table.heading widthPixel="50" title="#" />
                        <x:layout.table.heading widthPixel="50" title="No" />
                        <x:layout.table.heading widthPixel="100" title="CTD No" />
                        <x:layout.table.heading widthPixel="100" title="Job Order No" />
                        <x:layout.table.heading widthPixel="100" title="Origin" />
                        <x:layout.table.heading widthPixel="100" title="Qty" />
                        <x:layout.table.heading widthPixel="100" title="CHW" />
                    </x:layout.table.row>
                </thead>
                <tbody class="fw-semibold text-gray-600 not-linked-body">
                </tbody>
            </x:layout.table.wrapper>
        </x:layout.card.body>
    </x:layout.card.wrapper>
@endsection
