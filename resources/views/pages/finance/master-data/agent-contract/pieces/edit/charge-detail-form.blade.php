@if ($chargeValue->unit?->unit_name == 'KG')
    {{-- Kilogram --}}
    <div class="tableChargeDetailContent" style="display: none;">
        <div class="row" style="margin-left: auto; flex-basis: 100% !important; width: 100%; !important;">
            <div class="col-12">
                <div class="mb-2">
                    <div
                        class="d-flex align-items-center justify-content-start mb-1 ps-3">
                        <div class="ms-5">
                            <button type="button"
                                id="add_charge_detail|{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
                                class="addDetailCharges btn btn-icon btn-success rounded" style="height: 30px; width: 30px;">
                                <i class="fa fa-plus pe-0"></i>
                            </button>
                            <button type="button"
                                id="remove_charge_detail|{{ $index + 1 }}_{{ $chargeIndex + 1 }}"
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
                            @foreach ($chargeValue->chargeDetails as $detailIndex => $detailValue)
                                <div class="chargeDetailTableItemRow_{{ $detailIndex + 1 }} tableChargeDetailForm-body-row">
                                    <input type="hidden" name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][charge_detail_data][{{ $detailIndex }}][contract_agent_charge_detail_id]" value="{{ $detailValue->id }}">
                                    <div class="tableChargeDetailForm-box" style="min-width: 70px;">
                                        <input
                                            type="text"
                                            class="form-control"
                                            value="{{ $detailIndex + 1 }}"
                                            style=""
                                            readonly>
                                    </div>
                                    <div class="tableChargeDetailForm-box" style="min-width: 100px;">
                                        <input
                                            type="text"
                                            name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][charge_detail_data][{{ $detailIndex }}][from]"
                                            class="form-control"
                                            value="{{ $detailValue->from }}"
                                            id="from_{{ $index + 1 }}_{{ $chargeIndex + 1 }}_{{ $detailIndex + 1 }}"
                                            style="width: 100%;" required>
                                    </div>
                                    <div class="tableChargeDetailForm-box" style="min-width: 100px;">
                                        <input
                                            type="text"
                                            name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][charge_detail_data][{{ $detailIndex }}][to]"
                                            class="form-control"
                                            value="{{ $detailValue->to }}"
                                            id="to_{{ $index + 1 }}_{{ $chargeIndex + 1 }}_{{ $detailIndex + 1 }}"
                                            style="width: 100%;" required>
                                    </div>
                                    <div class="tableChargeDetailForm-box" style="min-width: 100px;">
                                        <input
                                            type="text"
                                            name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][charge_detail_data][{{ $detailIndex }}][value]"
                                            class="form-control"
                                            value="{{ $detailValue->value }}"
                                            id="value_{{ $index + 1 }}_{{ $chargeIndex + 1 }}_{{ $detailIndex + 1 }}"
                                            style="width: 100%;" required>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@elseif ($chargeValue->unit?->unit_name == "SHIPMENT")
    {{-- SHIPMENT --}}
    <div class="tableChargeDetailContent" style="display: none;">
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
                            @foreach ($chargeValue->chargeDetails as $detailIndex => $detailValue)
                                <div class="chargeDetailTableItemRow_{{ $detailIndex + 1 }} tableChargeDetailForm-body-row">
                                    <input type="hidden" name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][charge_detail_data][{{ $detailIndex }}][contract_agent_charge_detail_id]" value="{{ $detailValue->id }}">
                                    <div class="tableChargeDetailForm-box" style="min-width: 70px;">
                                        <input
                                            type="text"
                                            class="form-control"
                                            value="{{ $detailIndex + 1 }}"
                                            style=""
                                            readonly >
                                    </div>
                                    <div class="tableChargeDetailForm-box" style="min-width: 100px;">
                                        <input
                                            type="text"
                                            name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][charge_detail_data][{{ $detailIndex }}][value]"
                                            class="form-control"
                                            value="{{ $detailValue->value }}"
                                            id="value_{{ $index + 1 }}_{{ $chargeIndex + 1 }}_{{ $detailIndex + 1 }}"
                                            style="width: 100%;" required>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@elseif ($chargeValue->unit?->unit_name == "CONTAINER")
    {{-- CONTAINER --}}
    <div class="tableChargeDetailContent" style="display: none;">
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
                            @foreach ($container_types as $container_type)
                                @foreach ($chargeValue->chargeDetails as $detailIndex => $detailValue)
                                    @if ($container_type == $detailValue->container_type)
                                        <div class="chargeDetailTableItemRow_{{ $detailIndex + 1 }} tableChargeDetailForm-body-row">
                                            <input type="hidden" name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][charge_detail_data][{{ $detailIndex }}][contract_agent_charge_detail_id]" value="{{ $detailValue->id }}">
                                            <div class="tableChargeDetailForm-box" style="min-width: 70px;">
                                                <input
                                                    type="text"
                                                    class="form-control"
                                                    value="{{ $detailIndex + 1 }}"
                                                    style=""
                                                    readonly>
                                            </div>
                                            <div class="tableChargeDetailForm-box" style="min-width: 100px;">
                                                <input
                                                    type="text"
                                                    name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][charge_detail_data][{{ $detailIndex }}][container_type]"
                                                    class="form-control"
                                                    value="{{ $detailValue->container_type }}"
                                                    id="value_{{ $index + 1 }}_{{ $chargeIndex + 1 }}_{{ $detailIndex + 1 }}"
                                                    style="width: 100%;" readonly>
                                            </div>
                                            <div class="tableChargeDetailForm-box" style="min-width: 100px;">
                                                <input
                                                    type="text"
                                                    name="service_data[{{ $index }}][charge_data][{{ $chargeIndex }}][charge_detail_data][{{ $detailIndex }}][value]"
                                                    class="form-control"
                                                    value="{{ $detailValue->value }}"
                                                    id="value_{{ $index + 1 }}_{{ $chargeIndex + 1 }}_{{ $detailIndex + 1 }}"
                                                    style="width: 100%;">
                                            </div>
                                        </div>
                                    @endif
                                @endforeach
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endif
