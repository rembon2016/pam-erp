{{-- Kilogram --}}
<div class="tableChargeDetailContent" style="display: none;">
    {{-- <div class="row" style="margin-left: auto; flex-basis: 100% !important; width: 100%; !important;">
        <div class="col-12">
            <div class="mb-2">
                <div
                    class="d-flex align-items-center justify-content-start mb-1 ps-3">
                    <div class="ms-5">
                        <button type="button"
                            id="add_charge_detail|1_1"
                            class="addDetailCharges btn btn-icon btn-success rounded" style="height: 30px; width: 30px;">
                            <i class="fa fa-plus pe-0"></i>
                        </button>
                        <button type="button"
                            id="remove_charge_detail|1_1"
                            class="removeDetailCharges btn btn-icon btn-warning rounded" style="height: 30px; width: 30px;"
                            disabled>
                            <i class="fa fa-minus pe-0"></i>
                        </button>
                    </div>
                </div>

                <div class="table tableChargeDetailForm">
                    <div class="tableChargeDetailForm-heading">
                        <div class="tableChargeDetailForm-box text-center" style="min-width: 70px;">
                            <span class="tableChargeForm-heading-text">
                                #
                            </span>
                        </div>
                        <div class="tableChargeDetailForm-box text-center" style="min-width: 100px;">
                            <span class="tableChargeForm-heading-text">
                                From
                            </span>
                        </div>
                        <div class="tableChargeDetailForm-box text-center" style="min-width: 100px;">
                            <span class="tableChargeForm-heading-text">
                                To
                            </span>
                        </div>
                        <div class="tableChargeDetailForm-box text-center" style="min-width: 100px;">
                            <span class="tableChargeForm-heading-text">
                                Value
                            </span>
                        </div>
                    </div>
                    <div class="tableChargeDetailForm-body">
                        <div class="chargeDetailTableItemRow_1 tableChargeDetailForm-body-row">
                            <div class="tableChargeDetailForm-box" style="min-width: 70px;">
                                <input
                                    type="text"
                                    class="form-control"
                                    value="1"
                                    style=""
                                    readonly>
                            </div>
                            <div class="tableChargeDetailForm-box" style="min-width: 100px;">
                                <input
                                    type="text"
                                    name="service_data[0][charge_data][0][charge_detail_data][0][from]"
                                    class="form-control"
                                    value=""
                                    id="from_1_1_1"
                                    style="width: 100%;" required>
                            </div>
                            <div class="tableChargeDetailForm-box" style="min-width: 100px;">
                                <input
                                    type="text"
                                    name="service_data[0][charge_data][0][charge_detail_data][0][to]"
                                    class="form-control"
                                    value=""
                                    id="to_1_1_1"
                                    style="width: 100%;" required>
                            </div>
                            <div class="tableChargeDetailForm-box" style="min-width: 100px;">
                                <input
                                    type="text"
                                    name="service_data[0][charge_data][0][charge_detail_data][0][value]"
                                    class="form-control"
                                    value=""
                                    id="value_1_1_1"
                                    style="width: 100%;" required>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> --}}
</div>


{{-- Shipment --}}
{{-- <div class="tableChargeDetailContent" style="display: none;">
    <div class="row" style="margin-left: auto; flex-basis: 100% !important; width: 100%; !important;">
        <div class="col-12">
            <div class="mb-2">

                <div class="table tableChargeDetailForm">
                    <div class="tableChargeDetailForm-heading">
                        <div class="tableChargeDetailForm-box text-center" style="min-width: 70px;">
                            <span class="tableChargeForm-heading-text">
                                #
                            </span>
                        </div>
                        <div class="tableChargeDetailForm-box text-center" style="min-width: 100px;">
                            <span class="tableChargeForm-heading-text">
                                Rate
                            </span>
                        </div>
                    </div>
                    <div class="tableChargeDetailForm-body">
                        <div class="chargeDetailTableItemRow_1 tableChargeDetailForm-body-row">
                            <div class="tableChargeDetailForm-box" style="min-width: 70px;">
                                <input
                                    type="text"
                                    class="form-control"
                                    value="1"
                                    style=""
                                    readonly>
                            </div>
                            <div class="tableChargeDetailForm-box" style="min-width: 100px;">
                                <input
                                    type="text"
                                    name="service_data[0][charge_data][0][charge_detail_data][0][value]"
                                    class="form-control"
                                    value=""
                                    id="value_1_1_1"
                                    style="width: 100%;" required>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> --}}


{{-- Container --}}
{{-- <div class="tableChargeDetailContent" style="display: none;">
    <div class="row" style="margin-left: auto; flex-basis: 100% !important; width: 100%; !important;">
        <div class="col-12">
            <div class="mb-2">
                <div class="table tableChargeDetailForm">
                    <div class="tableChargeDetailForm-heading">
                        <div class="tableChargeDetailForm-box text-center" style="min-width: 70px;">
                            <span class="tableChargeForm-heading-text">
                                #
                            </span>
                        </div>
                        <div class="tableChargeDetailForm-box text-center" style="min-width: 100px;">
                            <span class="tableChargeForm-heading-text">
                                Container Type
                            </span>
                        </div>
                        <div class="tableChargeDetailForm-box text-center" style="min-width: 100px;">
                            <span class="tableChargeForm-heading-text">
                                Rate
                            </span>
                        </div>
                    </div>
                    <div class="tableChargeDetailForm-body">
                        @foreach ($container_types as $container_index => $type)
                            <div class="chargeDetailTableItemRow_{{ $loop->iteration }} tableChargeDetailForm-body-row">
                                <div class="tableChargeDetailForm-box" style="min-width: 70px;">
                                    <input
                                        type="text"
                                        class="form-control"
                                        value="{{ $loop->iteration }}"
                                        style=""
                                        readonly>
                                </div>
                                <div class="tableChargeDetailForm-box" style="min-width: 100px;">
                                    <input
                                        type="text"
                                        name="service_data[0][charge_data][0][charge_detail_data][{{ $container_index }}][container_type]"
                                        class="form-control"
                                        value="{{ $type }}"
                                        id="container_type_1_1_{{ $loop->iteration }}"
                                        style="width: 100%;" readonly>
                                </div>
                                <div class="tableChargeDetailForm-box" style="min-width: 100px;">
                                    <input
                                        type="text"
                                        name="service_data[0][charge_data][0][charge_detail_data][{{ $container_index }}][value]"
                                        class="form-control"
                                        value=""
                                        id="value_1_1_{{ $loop->iteration }}"
                                        style="width: 100%;" required>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> --}}
