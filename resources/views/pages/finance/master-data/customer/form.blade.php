@extends('layout.app')

@push('css')

<style>
    .btn-success {
        background-color: #2FD075!important;
        border-color: #2FD075!important;
    }
    .btn-warning {
        background-color: #FFE600!important;
        border-color: #FFE600!important;
    }
</style>

@endpush

@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="{!! $data['page'] !!}">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
        <x:layout.breadcrumb.item pageName="Customer" href="{{ route('finance.master-data.customer.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:form.wrapper action="{{ $data['action'] }}" method="{{ $data['method'] }}">
        <div class="row">
            <div class='col-md-6'>
                <x:form.input label="Customer Code" name="customer_code" placeholder="Type Customer Code" required="true" />
            </div>
            <div class='col-md-6'>
                <x:form.input label="Customer Name" name="customer_name" placeholder="Type Customer Name" required="true" />
            </div>
            <div class='col-md-6'>
                <x:form.input label="EORI Number" name="eori_number" placeholder="Type EORI Number" required="true" />
            </div>
            <div class='col-md-6'>
                <x:form.input label="Credit Terms" name="credit_terms" placeholder="Type Credit Terms" required="true" />
            </div>
            <div class='col-md-4'>
                <x:form.input label="Local/Overseas" name="overseas" placeholder="Type Local/Overseas" required="true" />
            </div>
            <div class='col-md-4'>
                <x:form.input label="Currency" name="currency_id" placeholder="Type Currency" required="true" />
            </div>
            <div class='col-md-4'>
                <x:form.input label="Credit Limit" name="credit_limit" placeholder="Type Credit Limit" required="true" />
            </div>
        </div>
        <div class="row mb-5">
            <div class="col-md-12">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="address-tab" data-bs-toggle="tab" data-bs-target="#address"
                            type="button" role="tab">Address</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="gst-tab" data-bs-toggle="tab" data-bs-target="#gst" type="button"
                            role="tab">GST</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="vat-tab" data-bs-toggle="tab" data-bs-target="#vat" type="button"
                            role="tab">VAT</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="email-tab" data-bs-toggle="tab" data-bs-target="#email" type="button"
                            role="tab">Email</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="sales-tab" data-bs-toggle="tab" data-bs-target="#sales" type="button"
                            role="tab">Sales</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="bank-tab" data-bs-toggle="tab" data-bs-target="#bank" type="button"
                            role="tab">Bank</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="account-tab" data-bs-toggle="tab" data-bs-target="#account"
                            type="button" role="tab">Account</button>
                    </li>
                </ul>
                <div class="tab-content p-5 bg-white border border-top-0">
                    <div class="tab-pane fade show active" id="address" role="tabpanel">
                        <div class="row mb-4">
                            <div class="col-md-4">
                                <x:form.select label="Address Type" name="address_type"
                                    defaultOption="Select Address Type"></x:form.select>
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Bank DLR Code" name="bank_dlr_code"
                                    placeholder="Type Bank DLR Code" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Address" name="address" placeholder="Type Address" />
                            </div>
                            <div class="col-md-6">
                                <x:form.input label="City" name="city" placeholder="Type City" />
                            </div>
                            <div class="col-md-6">
                                <x:form.input label="State" name="state" placeholder="Type State" />
                            </div>
                            <div class="col-md-4">
                                <x:form.select label="Country" name="country" defaultOption="Select Country">
                                </x:form.select>
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Zip Code" name="zip_code" placeholder="Type Zip Code" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="PO Box" name="po_box" placeholder="Type PO Box" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input type="tel" label="Phone Number" name="phone_number"
                                    placeholder="Type Phone Number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input type="tel" label="Fax Number" name="fax_number"
                                    placeholder="Type Fax Number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Warehouse Provider" name="warehouse_provider"
                                    placeholder="Type Warehouse Provider" />
                            </div>
                        </div>
                        <div class="row">
                            <h2 class="mb-5">Contact Information</h2>
                            <div id="contact-form">
                                <div class="contact-row form-row row align-items-center">
                                    <div class="col">
                                        <x:form.input label="Contact Person Name" name="contact_informations[contact_person_name][]" placeholder="Type Contact Person Name" />
                                    </div>
                                    <div class="col">
                                        <x:form.input label="Contact Person Number" name="contact_informations[contact_person_number][]" placeholder="Type Contact Person Number" />
                                    </div>
                                    <div class="col">
                                        <x:form.input label="Contact Person Email" name="contact_informations[contact_person_email][]" placeholder="Type Contact Person Email" />
                                    </div>
                                    <div class="col">
                                        <x:form.input label="Contact Person Address" name="contact_informations[contact_person_address][]" placeholder="Type Contact Person Address" />
                                    </div>
                                    <div class="col-auto d-flex">
                                        <button type="button" class="btn btn-success me-2" onclick="addRow('.contact-row', '#contact-form')">+</button>
                                        <button type="button" class="btn btn-warning" onclick="removeRow('.contact-row')"
                                            disabled>-</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="gst" role="tabpanel">
                        <div class="row mb-4">
                            <div class="col-md-4">
                                <x:form.select label="Address Type" name="address_type"
                                    defaultOption="Select Address Type"></x:form.select>
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="ARN Number" name="arn_number" placeholder="Type ARN Number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.select label="MSME" name="msme"
                                    defaultOption="Select MSME"></x:form.select>
                            </div>
                            <div class="col-md-6">
                                <x:form.input label="City" name="city" placeholder="Type City" />
                            </div>
                            <div class="col-md-6">
                                <x:form.input label="HSN Codes" name="hsn_codes" placeholder="Type HSN Codes" />
                            </div>
                            <div class="col-md-6">
                                <x:form.input label="State" name="state" placeholder="Type State" />
                            </div>
                            <div class="col-md-6">
                                <x:form.input label="SAC Codes" name="sac_codes" placeholder="Type SAC Codes" />
                            </div>
                            <div class="col-md-4">
                                <x:form.select label="Type of Enterprise" name="type_of_enterprise"
                                    defaultOption="Select Type of Enterprise"></x:form.select>
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Address" name="address" placeholder="Type Address" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="UIN Number" name="address" placeholder="Type UIN Number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="PAN Mandatory" name="address" placeholder="Type PAN Mandatory" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Composit Regular" name="composit_regular" placeholder="Type Composit Regular" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input type="date" label="SEZ Valid From Date" name="sez_valid_from_date" placeholder="Type SEZ Valid From Date" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input type="date" label="SEZ Valid To Date" name="sez_valid_from_date" placeholder="Type SEZ Valid From Date" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="PAN Number" name="pan_number" placeholder="Type PAN Number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.select label="SEZ" name="sez"
                                    defaultOption="Select SEZ"></x:form.select>
                            </div>
                            <div class="col-md-4">
                                <x:form.select label="GST Registration Status" name="gst_registration_status"
                                    defaultOption="Select GST Registration Status"></x:form.select>
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Passport Number" name="passport_number" placeholder="Type Passport Number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="TAN Number" name="tan_number" placeholder="Type TAN Number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="GSG ID" name="gsg_id" placeholder="Type GSG ID" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="GSG Provisional ID" name="gsg_provisional_id" placeholder="Type GSG Provisional ID" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="GSD ID" name="gsd_id" placeholder="Type GSD ID" />
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="vat" role="tabpanel">
                        <div class="row">
                            <div class="col-md-6">
                                <x:form.input label="VAT Number" name="vat_number" placeholder="Type VAT Number" />
                            </div>
                            <div class="col-md-6">
                                <x:form.input label="VAT Number (Arabic)" name="local_vat_number" placeholder="Type VAT Number (Arabic)" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="VAT Excemted" name="vat_excemted" placeholder="Type VAT Excemted" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Excemted Reason" name="excemted_reason" placeholder="Type Excemted Reason" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="AIT Number" name="ait_number" placeholder="Type AIT Number" />
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="email" role="tabpanel">
                        <div class="row">
                            <div id="email-form">
                                <div class="email-row form-row row align-items-center">
                                    <div class="col">
                                        <x:form.input type="email" label="Email" name="email[]" placeholder="Type Email" />
                                    </div>
                                    <div class="col-auto d-flex">
                                        <button type="button" class="btn btn-success me-2" onclick="addRow('.email-row', '#email-form')">+</button>
                                        <button type="button" class="btn btn-warning" onclick="removeRow('.email-row')"
                                            disabled>-</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="sales" role="tabpanel">
                        <div class="row">
                            <div class="col-md-6">
                                <x:form.input label="Location" name="location" placeholder="Type Location" />
                            </div>
                            <div class="col-md-6">
                                <x:form.input label="Segment" name="segment" placeholder="Type Segment" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Salesman" name="salesman" placeholder="Type Salesman" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Customer Services" name="customer_services" placeholder="Type Customer Services" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Credit Days" name="credit_days" placeholder="Type Credit Days" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Limit Amount" name="limit_amount" placeholder="Type Limit Amount" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Publish Credit Days" name="publish_credit_days" placeholder="Type Publish Credit Days" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Publish Amount" name="publish_amount" placeholder="Type Publish Amount" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input type="date" label="Review Date" name="review_date" placeholder="Type Review Date" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Override Amount" name="override_amount" placeholder="Type Override Amount" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Allowed Days" name="allowed_days" placeholder="Type Allowed Days" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="TOS" name="tos" placeholder="Type TOS" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Contact Person" name="contact_person" placeholder="Type Contact Person" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Customer Email" name="customer_email" placeholder="Type Customer Email" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Auto > %" name="auto_more_than_percentage" placeholder="Type Auto > %" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Email Days" name="email_days" placeholder="Type Email Days" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Auto O/S Email To" name="automatic_email_to" placeholder="Type Auto O/S Email To" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Sales Coordinator" name="sales_coordinator" placeholder="Type Sales Coordinator" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Acc Handling Person" name="acc_handling_person" placeholder="Type Acc Handling Person" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Note" name="note" placeholder="Type Note" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Invoices to Email" name="invoices_to_email" placeholder="Type Invoices to Email" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Clearance Email" name="clearance_email" placeholder="Type Clearance Email" />
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="bank" role="tabpanel">
                        <div class="row">
                            <div class="col-md-6">
                                <x:form.input label="Account Number" name="account_number" placeholder="Type Account Number" />
                            </div>
                            <div class="col-md-6">
                                <x:form.input label="Account Name" name="account_name" placeholder="Type Account Name" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Bank Name" name="bank_name" placeholder="Type Bank Name" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="IBAN Number" name="iban_number" placeholder="Type IBAN Number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Bank Swift Number" name="swift_code" placeholder="Type Bank Swift Number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Bank Address" name="bank_address" placeholder="Type Bank Address" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Bank Guarantee A/C Number" name="bank_guarantee_ac_number" placeholder="Type Bank Guarantee A/C Number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="BLZ Number / Sort Code" name="blz_number_sort_code" placeholder="Type BLZ Number / Sort Code" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Paye Beneficiary ID" name="paye_beneficiary_id" placeholder="Type Paye Beneficiary ID" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Payment Type" name="payment_type" placeholder="Type Payment Type" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Code" name="beneficiary_code" placeholder="Type Beneficiary Code" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary A/C Number" name="beneficiary_ac_number" placeholder="Type Beneficiary A/C Number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary A/C Type" name="beneficiary_ac_type" placeholder="Type Beneficiary A/C Type" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Name" name="beneficiary_name" placeholder="Type Beneficiary Name" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Address Line 1" name="beneficiary_first_address" placeholder="Type Beneficiary Address Line 1" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Address Line 2" name="beneficiary_second_address" placeholder="Type Beneficiary Address Line 2" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Address Line 3" name="beneficiary_third_address" placeholder="Type Beneficiary Address Line 3" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary City" name="beneficiary_city" placeholder="Type Beneficiary City" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary State" name="beneficiary_state" placeholder="Type Beneficiary State" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Pincode" name="beneficiary_pincode" placeholder="Type Beneficiary Pincode" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="IFSC Code" name="ifsc_code" placeholder="Type IFSC Code" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Mobile Number" name="beneficiary_mobile_number" placeholder="Type Beneficiary Mobile Number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Bank Number" name="beneficiary_bank_number" placeholder="Type Beneficiary Bank Number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Bank Name" name="beneficiary_bank_name" placeholder="Type Beneficiary Bank Name" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Bank Branch Name" name="beneficiary_bank_branch_name" placeholder="Type Beneficiary Bank Branch Name" />
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="account" role="tabpanel">
                        <div class="row">
                            <div id="account-form">
                                <div class="account-row form-row row align-items-center">
                                    <div class="col">
                                        <x:form.input label="Account Code" name="account_code[]" placeholder="Type Account Code" />
                                    </div>
                                    <div class="col">
                                        <x:form.input label="Account Name" name="account_name[]" placeholder="Type Account Name" />
                                    </div>
                                    <div class="col">
                                        <x:form.input label="Currency" name="currency_id[]" placeholder="Type Currency" />
                                    </div>
                                    <div class="col">
                                        <x:form.input label="LOV Status" name="lov_status[]" placeholder="Type LOV Status" />
                                    </div>
                                    <div class="col">
                                        <x:form.input label="Notes" name="notes[]" placeholder="Type Notes" />
                                    </div>
                                    <div class="col-auto d-flex">
                                        <button type="button" class="btn btn-success me-2" onclick="addRow('.account-row', '#account-form')">+</button>
                                        <button type="button" class="btn btn-warning" onclick="removeRow('.account-row')"
                                            disabled>-</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
            <x:form.cancel-button href="{{ route('finance.master-data.charge.index') }}" label="Cancel" />
            <x:form.submit-button label="Submit" />
        </div>
    </x:form.wrapper>
@endsection

@push('js')
    <script>
        function addRow(rowClass, formId) {
            const newRow = $(rowClass).first().clone();
            newRow.find('input').val(''); // Clear input values
            $(formId).append(newRow);
            updateMinusButton();
        }

        function removeRow(rowClass) {
            if ($(rowClass).length > 1) {
                $(rowClass).last().remove();
            }
            updateMinusButton(rowClass);
        }

        function updateMinusButton(rowClass) {
            const rowCount = $(rowClass).length;
            $('.btn-warning').prop('disabled', rowCount === 1);
        }
    </script>
@endpush
