@extends('layout.app')
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
                <x:form.input label="Billing Customer" name="customer" placeholder="Billing Customer" :model="$invoice" readonly="true" />
            </div>
            <div class='col-md-3'>
                <x:form.input label="Chargeable Weight" name="chw" placeholder="Chargeable Weight" :model="$invoice" readonly="true" />
            </div>
            <div class="col-md-3 mt-3">
                <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" value="1" id="is_deferred" />
                    <label class="form-check-label" for="is_deferred">
                        Deferred Revenue Recognizition
                    </label>
                </div>
            </div>
            <div class="col-md-3 mt-3">
                <x:form.input type="date" label="Date Revenue Recognizition" name="date_revenue_recognizition" placeholder="Choose Date" :model="$invoice" />
            </div>
            <div class="col-12 px-0">
                <div class="charge-wrapper">
                    <div class="charge-item my-3">
                        <div class="d-flex align-items-center justify-content-between gap-3">
                            <button type="button" class="btn btn-sm custom-btn custom-btn-primary">CTD: SZAXXXX</button>
                            <div class="d-flex align-items-center justify-content-end gap-2">
                                <button type="button" class="btn btn-icon btn-success rounded" style="width: 30px; height: 30px;">
                                    <i class="fa fa-plus pe-0"></i>
                                </button>
                                <button type="button" class="btn btn-icon btn-primary rounded" style="width: 30px; height: 30px;">
                                    <i class="fa fa-angle-down"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <x:form.input label="Total Invoices Amount" name="total" placeholder="Chargeable Weight" :model="$invoice" readonly="true" />
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
