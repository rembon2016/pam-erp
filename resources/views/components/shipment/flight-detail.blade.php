@props(['shipment'])

<div class="row" id="sailing-schedule-detail">
    <div class="row mb-4">
        <div class="col-md-6">
            <x:list.box-list icon="plane" title="Carrier Name"
                value="{{ $shipment['mother_vessel_name'] ?? '-' }}" />
        </div>
       
        <div class="col-md-6">
            <x:list.box-list icon="clock" title="Estimated Time Departure"
                value="{{ $shipment['estimated_time_departure'] ?? '-' }}" date="true" />
        </div>
    </div>
    <div class="row mb-4">
        <div class="col-md-6">
            <x:list.box-list icon="file-alt" title="Flight Number"
                value="{{ $shipment['voyage_number_mother'] ?? '-' }}" />
        </div>
        <div class="col-md-6">
            <x:list.box-list icon="clock" title="Estimated Time Arrival" date="true"
                value="{{ $shipment['eta_dubai'] ?? '-' }}" />
        </div>
    </div>
    <div class="row mb-4">
        <div class="col-md-6">
            <x:list.box-list icon="calendar-check" title="Onboard Date"
                value="{{ $shipment['onBoardDate'] ?? '-' }}" date="true" />
        </div>
        <div class="col-md-6">
            <x:list.box-list icon="calendar" title="Closing Time"
                value="{{ $shipment['time_closing_mother'] ?? '-' }}" date="true" />
        </div>
    </div>
    <div class="row mb-4">
        <div class="col-md-6">
            <x:list.box-list icon="file-alt" title="Loading Plan Number"
                value="{{ $shipment['loading_plan']['loading_plan_number'] ?? '-' }}" />
        </div>
        <div class="col-md-6">
            <x:list.box-list icon="file-alt" title="MAWB Number"
                value="{{ $shipment['loading_plan']['mawb_number'] ?? '-' }}" />
        </div>
    </div>
    <div class="row mb-4">
        <div class="col-md-6">
            <x:list.box-list icon="calendar-check" title="Actual Arrival Date"
                value="{{ $shipment['actualArrivalDate'] ?? '-' }}" date="true" />
        </div>
        <div class="col-md-6">
            <x:list.box-list icon="shipping-fast" title="Total Transit Time"
                value="{{ $shipment['days_closed']['days'] ?? '-' }}" />
        </div>
    </div>
    <div class="row mb-4">
        <div class="col-md-6">
            <x:list.box-list icon="hand-point-right" title="Closed Shipment By"
                value="{{ $shipment['days_closed']['user'] ?? '-' }}" />
        </div>
        <div class="col-md-6">
            <x:list.box-list icon="calendar" title="Date Arrived At Transit Hub"
                value="{{ $shipment['arrived']['tgl_aktual'] ?? '-' }}" date="true" />
        </div>
    </div>
    <div class="row mb-4">
        <div class="col-md-6">
            <x:list.box-list icon="calendar" title="Date Arrived At Destination"
                value="{{ $shipment['destination_arrived']['tgl_aktual'] ?? '-' }}" date="true" />
        </div>
    </div>
</div>