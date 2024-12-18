@props(['shipment'])

<div class="row" id="sailing-schedule-detail">
    <div class="row mb-4">
        <div class="col-md-6">
            <x:list.box-list icon="ship" title="Mother Vessel"
                value="{{ $shipment['mother_vessel_name'] ?? '-' }}" />
        </div>
        <div class="col-md-6">
            <x:list.box-list icon="dharmachakra" title="Feeder Vessel Name"
                value="{{ $shipment['feeder_vessel_name'] ?? '-' }}" />
        </div>
    </div>
    <div class="row mb-4">
        <div class="col-md-6">
            <x:list.box-list icon="clock" title="Mother Vessel Voyage Number"
                value="{{ $shipment['voyage_number_mother'] ?? '-' }}" />
        </div>
        <div class="col-md-6">
            <x:list.box-list icon="compass" title="Feeder Vessel Voyage Number"
                value="{{ $shipment['voyage_number_feeder'] ?? '-' }}" />
        </div>
    </div>
    <div class="row mb-4">
        <div class="col-md-6">
            <x:list.box-list icon="calendar-check" title="Estimated Time Departure"
                value="{{ $shipment['estimated_time_departure'] ?? '-' }}" date="true" />
        </div>
        <div class="col-md-6">
            <x:list.box-list icon="clock" title="Estimated Time Arrival Transit Hub"
                value="{{ $shipment['eta_dubai'] ?? '-' }}" date="true" />
        </div>
    </div>
    <div class="row mb-4">
        <div class="col-md-6">
            <x:list.box-list icon="calendar" title="Closing Time"
                value="{{ $shipment['time_closing_mother'] ?? '-' }}" date="true" />
        </div>
        <div class="col-md-6">
            <x:list.box-list icon="anchor" title="Shipping Line"
                value="{{ $shipment['loadingreport']['shipping_line_name'] ?? '-' }}" />
        </div>
    </div>
    <div class="row mb-4">
        <div class="col-md-6">
            <x:list.box-list icon="hourglass-end" title="Onboard Date"
                value="{{ $shipment['onBoardDate'] ?? '-' }}" date="true" />
        </div>
        <div class="col-md-6">
            <x:list.box-list icon="clock" title="Actual Arrival Date"
                value="{{ $shipment['actualArrivalDate'] ?? '-' }}" date="true" />
        </div>
    </div>
    <div class="row mb-4">
        <div class="col-md-6">
            <x:list.box-list icon="shipping-fast" title="Total Transit Time"
                value="{{ $shipment['days_closed']['days'] ?? '-' }}" />
        </div>
        <div class="col-md-6">
            <x:list.box-list icon="calendar-check" title="Closed Shipment By"
                value="{{ $shipment['days_closed']['user'] ?? '-' }}" />
        </div>
    </div>
    <div class="row mb-4">
        <div class="col-md-6">
            <x:list.box-list icon="user-check" title="Date Arrived At Transit Hub"
                value="{{ $shipment['arrived']['tgl_aktual'] ?? '-' }}" date="true" />
        </div>
        <div class="col-md-6">
            <x:list.box-list icon="calendar" title="Date Arrived At Destination"
                value="{{ $shipment['destination_arrived']['tgl_aktual'] ?? '-' }}" date="true" />
        </div>
    </div>
</div>