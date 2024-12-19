
<div class="row mb-7">
    <div class="col-md-6">
        <x-list.box-list icon="anchor" title="Pick-up Address" :value="$shipment['port_loading_name'] ?? '-'" />
    </div>
    <div class="col-md-6">
        <x-list.box-list icon="ship" title="Delivery Address" :value="$shipment['port_destination_name'] ?? '-'" />
    </div>
</div>

<div class="row mb-7">
    <div class="col-md-6">
        <x-list.box-list icon="boxes" title="Commodity" :value="$shipment['komoditi_name'] ?? '-'" />
    </div>
 
    <div class="col-md-6">
        <x-list.box-list icon="box" title="Loading Type" :value="$shipment['loading_type'] ?? '-'" />
    </div>
</div>

<div class="row mb-7">
    <div class="col-md-6">
        <x-list.box-list icon="money-bill" title="Courier Tracking Number" :value="$shipment['courir_tracking_resi'] ?? '-'" />
    </div>
    <div class="col-md-6">
        <x-list.box-list icon="user" title="Created By" :value="$shipment['created_by'] ?? '-'" />
    </div>
</div>
