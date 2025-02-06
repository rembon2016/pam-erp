@extends('layout.app')

@push('css')
<style>
    th.required::after {
        content: "*";
        position: relative;
        font-size: inherit;
        color: var(--kt-danger);
        padding-left: .25rem;
        font-weight: 600;
    }
</style>
@endpush

@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="Generate Invoice">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Billing" />
        <x:layout.breadcrumb.item pageName="Invoice" href="{{ route('finance.billing.invoice.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:form.wrapper action="{{ route('finance.billing.invoice.generate') }}" method="POST">
        <div class="row">
            <div class='col-md-3'>
                <x:form.input type="date" label="Invoice Date" name="invoice_date" placeholder="Choose Date" :model="$invoice" required="true" />
            </div>
            <div class='col-md-3'>
                <x:form.input type="date" label="Invoice Due Date" name="invoice_due_date" placeholder="Choose Date" :model="$invoice" readonly="true" />
            </div>
            <div class='col-md-3'>
                <div class="mb-3">
                    <label for="#customer_billing_id" class="form-label">Billing Customer</label>
                    <input type="text" class="form-control @error('customer_billing_id') is-invalid @enderror" placeholder="Billing Customer" id="customer_billing_id" value="{{ $shippings->first()?->billingCustomer->customer_name }}" readonly>
                    @error('customer_billing_id')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror

                    <input type="hidden" name="customer_billing_id" value="{{ $shippings->first()?->customer_id }}">
                </div>
                <input type="hidden" name="customer_credit_limit" id="customer_credit_limit" value="{{ (int) $shippings->first()?->billingCustomer?->financeCustomer?->credit_terms }}">
            </div>
            <div class='col-md-3'>
                <label for="#chw" class="form-label">Chargeable Weight</label>
                <input type="text" class="form-control @error('chw') is-invalid @enderror" placeholder="Chargeable Weight" name="chw" id="chw" value="{{ $shippings->sum('order_sum_chw') }}" readonly>
                @error('chw')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>
            <div class="col-md-3 mt-3">
                <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" value="1" id="revenue_recognition" name="revenue_recognition" />
                    <label class="form-check-label" for="is_deferred">
                        Deferred Revenue Recognizition
                    </label>
                </div>
            </div>
            <div class="col-md-3 mt-3 revenue-recognition-box" style="display: none;">
                <x:form.input type="date" label="Date Revenue Recognizition" name="date_revenue_recognizition" placeholder="Choose Date" :model="$invoice" />
            </div>
            <div class="col-12">
                <div class="charge-wrapper">
                    @foreach ($shippings as $item)
                        <div class="charge-item border px-4 py-2 my-3">
                            <div class="d-flex align-items-center justify-content-between gap-3">
                                <span class="labeled-ctd">CTD: {{ $item->ctd_number }}</span>
                                <input type="hidden" name="data[{{ $item->ctd_number }}][ctd_number]" value="{{ $item->ctd_number }}">
                                <input type="hidden" name="data[{{ $item->ctd_number }}][job_id]" value="{{ $item->job_id }}">
                                <div class="d-flex align-items-center justify-content-end gap-2">
                                    <button type="button" class="btn btn-icon btn-success rounded" data-type="add-item" style="width: 30px; height: 30px;">
                                        <i class="fa fa-plus pe-0"></i>
                                    </button>
                                    <button type="button" class="btn btn-icon btn-primary rounded" data-type="expand-item" style="width: 30px; height: 30px;">
                                        <i class="fa fa-angle-down"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="table-responsive charge-table" data-is-expanded="true">
                                <hr>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th class="required">Agreed Rate</th>
                                            <th class="required">Currency</th>
                                            <th>Rate</th>
                                            <th class="required">Unit</th>
                                            <th>CHW</th>
                                            <th>Amount</th>
                                            <th>Local Amount</th>
                                            <th>&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {{-- Handle Generated Charges by Agreed Rate --}}
                                        @if ($item->agreedRates->count() > 0)
                                            @foreach ($item->agreedRates as $agreedRate)
                                                @php
                                                    $rate = $agreedRate->price;
                                                    $amount = $item->order_sum_chw * $rate;

                                                    $currency_code = trim($agreedRate->currency);
                                                    $local_amount = $currency_code == 'AED' ? ($amount * 3.67) : $amount;
                                                @endphp

                                                <tr class="charge-row">
                                                    <td>
                                                        <select name="data[{{ $item->ctd_number }}][charges][0][charge_id]" data-type="charge_id" class="form-select" data-control="select2" data-placeholder="Choose" required>
                                                            @foreach ($charges as $charge)
                                                                <option value="{{ $charge->id }}" @selected($agreedRate->charge_code == $charge->charge_code)>{{ $charge->charge_name }}</option>
                                                            @endforeach
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <select name="data[{{ $item->ctd_number }}][charges][0][currency_id]" data-type="currency_id" class="form-select" required>
                                                            <option value="">Choose</option>
                                                            @foreach ($currencies as $currency)
                                                                <option value="{{ $currency->id }}" @selected($agreedRate->currency == trim($currency->currency_code))>{{ $currency->currency_name }}</option>
                                                            @endforeach
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <input type="number" name="data[{{ $item->ctd_number }}][charges][0][rate]" data-type="rate" class="form-control" placeholder="0" min="0" value="{{ $rate }}" required>
                                                    </td>
                                                    <td>
                                                        <select name="data[{{ $item->ctd_number }}][charges][0][unit_id]" data-type="unit_id" class="form-select" required>
                                                            <option value="">Choose</option>
                                                            @foreach ($units as $unit)
                                                                <option value="{{ $unit->unit_id }}" @selected($agreedRate->unit == $unit->unit_name)>{{ "{$unit->description} ({$unit->unit_name})" }}</option>
                                                            @endforeach
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <input type="number" name="data[{{ $item->ctd_number }}][charges][0][chw]" data-type="chw" class="form-control" placeholder="0" min="0" value="{{ $item->order_sum_chw }}" required>
                                                    </td>
                                                    <td>
                                                        <input type="number" name="data[{{ $item->ctd_number }}][charges][0][amount]" data-type="amount" class="form-control" placeholder="0" min="0" value="{{ $amount }}" readonly>
                                                    </td>
                                                    <td>
                                                        <input type="number" name="data[{{ $item->ctd_number }}][charges][0][local_amount]" data-type="local_amount" class="form-control" placeholder="0" min="0" value="{{ $local_amount }}" readonly>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex align-items-center justify-content-end">
                                                            <button type="button" class="btn btn-icon btn-danger btn-sm" data-type="delete-item">
                                                                <i class="bx bx-trash"></i>
                                                            </button>
                                                        </div>
                                                    </td>
                                                </tr>
                                            @endforeach
                                        @else
                                            @if (!is_null($item->billingCustomer) && $item->billingCustomer?->customerContracts->count() > 0)
                                                @foreach ($item->billingCustomer?->customerContracts as $contract)
                                                    @php
                                                        // dd($item);
                                                        // $chargeRate = $contract->getChargeRate($item->order_sum_chw);
                                                        // $rate = $chargeRate?->rate;
                                                        $rate = 0;
                                                        $amount = $item->order_sum_chw * $rate;

                                                        $currency_code = trim($contract->currency?->currency_code);
                                                        $local_amount = $currency_code == 'AED' ? ($amount * 3.67) : $amount;
                                                    @endphp

                                                    {{-- Handle Generated Charges by Customer Contract --}}
                                                    <tr class="charge-row">
                                                        <td>
                                                            <select name="data[{{ $item->ctd_number }}][charges][0][charge_id]" data-type="charge_id" class="form-select" data-control="select2" data-placeholder="Choose" required>
                                                                @foreach ($charges as $charge)
                                                                    <option value="{{ $charge->id }}" @selected($contract->charge_id == $charge->id)>{{ $charge->charge_name }}</option>
                                                                @endforeach
                                                            </select>
                                                        </td>
                                                        <td>
                                                            <select name="data[{{ $item->ctd_number }}][charges][0][currency_id]" data-type="currency_id" class="form-select" required>
                                                                <option value="">Choose</option>
                                                                @foreach ($currencies as $currency)
                                                                    <option value="{{ $currency->id }}" @selected($contract->currency_id == $currency->id)>{{ $currency->currency_name }}</option>
                                                                @endforeach
                                                            </select>
                                                        </td>
                                                        <td>
                                                            <input type="number" name="data[{{ $item->ctd_number }}][charges][0][rate]" data-type="rate" class="form-control" placeholder="0" min="0" value="{{ $rate }}" required>
                                                        </td>
                                                        <td>
                                                            <select name="data[{{ $item->ctd_number }}][charges][0][unit_id]" data-type="unit_id" class="form-select" required>
                                                                <option value="">Choose</option>
                                                                @foreach ($units as $unit)
                                                                    <option value="{{ $unit->unit_id }}" @selected($contract->unit_id == $unit->unit_id)>{{ "{$unit->description} ({$unit->unit_name})" }}</option>
                                                                @endforeach
                                                            </select>
                                                        </td>
                                                        <td>
                                                            <input type="number" name="data[{{ $item->ctd_number }}][charges][0][chw]" data-type="chw" class="form-control" placeholder="0" value="{{ $item->order_sum_chw }}" min="0" required>
                                                        </td>
                                                        <td>
                                                            <input type="number" name="data[{{ $item->ctd_number }}][charges][0][amount]" data-type="amount" class="form-control" placeholder="0" min="0" value="{{ $amount }}" readonly>
                                                        </td>
                                                        <td>
                                                            <input type="number" name="data[{{ $item->ctd_number }}][charges][0][local_amount]" data-type="local_amount" class="form-control" placeholder="0" min="0" value="{{ $local_amount }}" readonly>
                                                        </td>
                                                        <td>
                                                            <div class="d-flex align-items-center justify-content-end">
                                                                <button type="button" class="btn btn-icon btn-danger btn-sm" data-type="delete-item">
                                                                    <i class="bx bx-trash"></i>
                                                                </button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                @endforeach
                                            @else
                                                {{-- Handle Manually Charges --}}
                                                <tr class="charge-row">
                                                    <td>
                                                        <select name="data[{{ $item->ctd_number }}][charges][0][charge_id]" data-type="charge_id" class="form-select" data-control="select2" data-placeholder="Choose" required>
                                                            @foreach ($charges as $charge)
                                                                <option value="{{ $charge->id }}">{{ $charge->charge_name }}</option>
                                                            @endforeach
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <select name="data[{{ $item->ctd_number }}][charges][0][currency_id]" data-type="currency_id" class="form-select" required>
                                                            <option value="">Choose</option>
                                                            @foreach ($currencies as $currency)
                                                                <option value="{{ $currency->id }}">{{ $currency->currency_name }}</option>
                                                            @endforeach
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <input type="number" name="data[{{ $item->ctd_number }}][charges][0][rate]" data-type="rate" class="form-control" placeholder="0" min="0" required>
                                                    </td>
                                                    <td>
                                                        <select name="data[{{ $item->ctd_number }}][charges][0][unit_id]" data-type="unit_id" class="form-select" required>
                                                            <option value="">Choose</option>
                                                            @foreach ($units as $unit)
                                                                <option value="{{ $unit->unit_id }}">{{ "{$unit->description} ({$unit->unit_name})" }}</option>
                                                            @endforeach
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <input type="number" name="data[{{ $item->ctd_number }}][charges][0][chw]" data-type="chw" class="form-control" placeholder="0" min="0" required>
                                                    </td>
                                                    <td>
                                                        <input type="number" name="data[{{ $item->ctd_number }}][charges][0][amount]" data-type="amount" class="form-control" placeholder="0" min="0" value="0" readonly>
                                                    </td>
                                                    <td>
                                                        <input type="number" name="data[{{ $item->ctd_number }}][charges][0][local_amount]" data-type="local_amount" class="form-control" placeholder="0" min="0" value="0" readonly>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex align-items-center justify-content-end">
                                                            <button type="button" class="btn btn-icon btn-danger btn-sm" data-type="delete-item">
                                                                <i class="bx bx-trash"></i>
                                                            </button>
                                                        </div>
                                                    </td>
                                                </tr>
                                            @endif
                                        @endif
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
            <div class="col-md-3">
                <x:form.input label="Total Invoices Amount" name="total" placeholder="0" :model="$invoice" readonly="true" />
            </div>
            <div class="col-12">
                <x:form.textarea label="Description" name="description" placeholder="Type Description of Invoice" :model="$invoice" />
            </div>
        </div>
        <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
            <x:form.cancel-button href="{{ route('finance.billing.invoice.index') }}" label="Cancel" />
            <x:form.submit-button label="Submit" />
        </div>
    </x:form.wrapper>
@endsection

@push('js')
<script>
    function calculateAmount(rowItem) {
        // Calculate Amount per Row
        const rate_per_row = ~~parseFloat($(rowItem).find('input[data-type="rate"]').val());
        const chw_per_row = ~~parseFloat($(rowItem).find('input[data-type="chw"]').val());
        const amount_per_row = rate_per_row * chw_per_row;

        $(rowItem).find('input[data-type="amount"]').val(amount_per_row);

        // Calculate Total Invoices Amount
        let totalOfAmount = 0;
        $('input[data-type="amount"]').each(function (index) {
            const amount_value = ~~parseFloat($(this).val())
            totalOfAmount += amount_value;
        });

        $("#total").val(totalOfAmount);
    }

    $(document).off('click', 'button[data-type="expand-item"]').on('click', 'button[data-type="expand-item"]', function (event) {
        const chargeItem = $(this).parents('.charge-item');
        const chargeTable = $(chargeItem).find('.charge-table');
        const isExpanded = $(chargeTable).attr('data-is-expanded');

        if (isExpanded === "true") {
            $(chargeTable).attr('data-is-expanded', false);
            $(chargeTable).slideUp();
        } else {
            $(chargeTable).attr('data-is-expanded', true);
            $(chargeTable).slideDown();
        }
    });

    $(document).off('click', 'button[data-type="add-item"]').on('click', 'button[data-type="add-item"]', function (event) {
        const chargeItem = $(this).parents('.charge-item');
        const chargeTable = $(chargeItem).find('.charge-table');

        syncSelect2Element(chargeTable, function () {
            const clonedFirstRowItem = $(chargeTable).find('.charge-row').eq(0).clone();

            clearValueInDynamicRow(clonedFirstRowItem);
            rearrangeNameAttribute(clonedFirstRowItem, chargeTable, '.charge-row');

            $(chargeTable).find('tbody').append(clonedFirstRowItem);
        });
    });

    $(document).off('click', 'button[data-type="delete-item"]').on('click', 'button[data-type="delete-item"]', function (event) {
        const chargeItem = $(this).parents('.charge-item');
        const chargeTable = $(chargeItem).find('.charge-table');
        const rowItem = $(this).parents('.charge-row');
        const remainingRowItem = $(chargeTable).find('.charge-row').length;

        if (remainingRowItem == 1) {
            clearValueInDynamicRow(
                $(chargeTable).find('.charge-row').eq(0)
            )
        } else {
            $(rowItem).remove();
        }

        $(chargeTable).find('.charge-row').each(function (index) {
            $(this).find('input, select').each(function (ind) {
                const nameAttr = $(this).attr('name');
                const indexStartOfArray = nameAttr.indexOf('[');
                const indexEndOfArray = nameAttr.indexOf(']');
                const indexElement = nameAttr.slice(indexStartOfArray, indexEndOfArray);
                const finalNameAttr = nameAttr.replace(indexElement, `[${index}`);

                $(this).attr('name', finalNameAttr);
            })
        });
    });

    $(document).on('keyup', 'input[data-type="chw"], input[data-type="rate"]', debounce(function (event) {
        const rowItem = $(this).parents('.charge-row');
        calculateAmount(rowItem);
    }, 150))

    $(document).ready(function () {
        $("#revenue_recognition").change(function () {
            $("#date_revenue_recognizition").val('');

            if ($(this).is(':checked')) {
                $(".revenue-recognition-box").show();
            } else {
                $(".revenue-recognition-box").hide();
            }
        });

        $(".charge-row").each(function () {
            calculateAmount($(this));
        })

        $("#invoice_date").change(function () {
            const invoice_date = new Date($(this).val());

            if (!isNaN(invoice_date)) {
                // Tambahkan 30 hari pada invoice date
                const dueDate = new Date(invoice_date);
                const credit_limit = parseInt($("#customer_credit_limit").val());
                dueDate.setDate(dueDate.getDate() + credit_limit);

                // Format tanggal menjadi YYYY-MM-DD
                const formattedDueDate = dueDate.toISOString().split('T')[0];

                // Update nilai pada input invoice due date
                $("#invoice_due_date").val(formattedDueDate)
            } else {
                // Kosongkan due date jika invoice date tidak valid
                $("#invoice_due_date").val('')
            }
        })
    });
</script>
@endpush
