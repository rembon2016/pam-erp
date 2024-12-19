<div class="row mb-7">
    <div class="col-md-6">
        <x-list.box-list icon="truck" title="Shipper" :value="$shipment['shipper_name'] ?? '-'" />
    </div>
    <div class="col-md-6">
        <x-list.box-list icon="dolly-flatbed" title="Consignee" :value="$shipment['consigne_name'] ?? '-'" />
    </div>
</div>

<div class="row mb-7">
    <div class="col-md-6">
        <x-list.box-list icon="anchor" title="Port of Loading" :value="$shipment['port_loading_code'] ?? '-'" />
    </div>
    <div class="col-md-6">
        <x-list.box-list icon="ship" title="Port of Destination" :value="$shipment['port_destination_code'] ?? '-'" />
    </div>
</div>

<div class="row mb-7">
    <div class="col-md-6">
        <x-list.box-list date="true" icon="calendar" title="Cargo Readiness Date" :value="$shipment['cargo_redines_date'] ?? '-'" />
    </div>
    <div class="col-md-6">
        <x-list.box-list icon="box" title="Loading Type" :value="$shipment['loading_type'] ?? '-'" />
    </div>
</div>

<div class="row mb-7">
    <div class="col-md-6">
        <x-list.box-list icon="money-bill" title="Freight Term" :value="$shipment['freight_term'] ?? '-'" />
    </div>
    <div class="col-md-6">
        <x-list.box-list icon="file-contract" title="Incoterm" :value="$shipment['incoterm'] ?? '-'" />
    </div>
</div>
<div class="row mb-7">
    <div class="col-md-6">
        <x-list.box-list icon="user" title="Notify Party" :value="$shipment['notify_of_party'] ?? '-'" />
    </div>
    <div class="col-md-6">
        <x-list.box-list icon="boxes" title="Commodity" :value="$shipment['komoditi_name'] ?? '-'" />
    </div>
</div>

<div class="row mb-7">
    <div class="col-md-6">
        <x-list.box-list icon="file-alt" title="In Order To" :value="$shipment['in_order_to'] ?? '-'" />
    </div>
    <div class="col-md-6">
        <x-list.box-list icon="file" title="Permit Approval No" :value="$shipment['permit_approval_no'] ?? '-'" />
    </div>
</div>

<div class="row mb-7">
    <div class="col-md-4">
        <x-list.box-list date="true" icon="calendar-alt" title="Permit Date" :value="$shipment['permit_date'] ?? '-'" />
    </div>
    <div class="col-md-4">
        <x-list.box-list icon="file-contract" title="Permit No." :value="$shipment['permit_no'] ?? '-'" />
    </div>
    <div class="col-md-4">
        <x-list.box-list icon="users" title="Customer Group" :value="$shipment['customer_group_name'] ?? '-'" />
    </div>
</div>

<div class="row mb-7">
    <div class="col-md-4">
        <x-list.box-list icon="sign" title="Declared Value for Carriage" :value="$shipment['declare_value_forcariage'] ?? '-'" />
    </div>
    <div class="col-md-4">
        <x-list.box-list icon="binoculars" title="Declared Value for Customs" :value="$shipment['declare_value_forcustom'] ?? '-'" />
    </div>
    <div class="col-md-4">
        <x-list.box-list icon="briefcase-medical" title="Amount of Insurance" :value="$shipment['amount_of_insurance'] ?? '-'" />
    </div>
</div>

<div class="row mb-7">
    <div class="col-md-12">
        <x-list.box-list icon="map-marker-alt" title="Delivery Name & Address" :value="$shipment['delivery_name'] ?? '-'" />
    </div>
</div>

<div class="row mb-7">
    <div class="col-md-12">
        <x-list.box-list icon="hand-point-right" title="Handling Information" :value="$shipment['handling_information'] ?? '-'" />
    </div>
</div>

<div class="row mb-7">
    <div class="col-md-12">
        <x-list.box-list icon="project-diagram" title="Project Name" :value="$shipment['project_name'] ?? '-'" />
    </div>
</div>