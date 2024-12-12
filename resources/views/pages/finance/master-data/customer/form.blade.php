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
                <x:form.select label="Credit Terms" name="credit_terms" defaultOption="Select Credit Terms" required="true">
                    <option value="prepaid">Prepaid</option>
                    <option value="collect">Collect</option>
                    <option value="exwork">Ex Work</option>
                </x:form.select>
            </div>
            <div class='col-md-4'>
                <x:form.input label="Local/Overseas" name="overseas" placeholder="Type Local/Overseas" required="true" />
            </div>
            <div class='col-md-4'>
                <x:form.select label="Currency" name="currency_id" defaultOption="Select Currency">
                    @foreach ($currencies as $currency)
                        <option value="{{ $currency->id }}">
                            {{ $currency->currency_name }}
                        </option>
                    @endforeach
                </x:form.select>
            </div>
            <div class='col-md-4'>
                <x:form.input type="number" label="Credit Limit" name="credit_limit" placeholder="Type Credit Limit" required="true" />
            </div>
            <div class="col-md-12">
                <div class='mb-10'>
                    <label class="form-label required" for="customer_type">Customer Type</label>
                    <div class="row">
                        @foreach ($customerTypes as $type)
                            <div class="col-md-2">
                                <div class="d-flex mt-3">
                                    <label class="form-check form-check-sm form-check-custom form-check-solid me-5">
                                        <input class="form-check-input" name="customer_type[]" type="checkbox"
                                            value="{{ $type }}">
                                        <span class="form-check-label">
                                            {{ $type }}
                                        </span>
                                    </label>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
        <div class="row mb-5">
            <div class="col-md-12">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="address-tab" data-bs-toggle="tab" data-bs-target="#address"
                            type="button" role="tab">Address</button>
                    </li>
                    {{-- <li class="nav-item" role="presentation">
                        <button class="nav-link" id="gst-tab" data-bs-toggle="tab" data-bs-target="#gst" type="button"
                            role="tab">GST</button>
                    </li> --}}
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
                                <x:form.select label="Address Type" name="customer_address[address_type]" defaultOption="Select Address Type">
                                    @foreach ($customerAddressTypes as $addressType)
                                        <option value="{{ $addressType }}">
                                            {{ $addressType }}
                                        </option>
                                    @endforeach
                                </x:form.select>
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Bank DLR Code" name="customer_address[bank_dlr_code]"
                                    placeholder="Type Bank DLR Code" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Address" name="customer_address[address]" placeholder="Type Address" />
                            </div>
                            <div class="col-md-6">
                                <x:form.input label="City" name="customer_address[city]" placeholder="Type City" />
                            </div>
                            <div class="col-md-6">
                                <x:form.input label="State" name="customer_address[state]" placeholder="Type State" />
                            </div>
                            <div class="col-md-4">
                                <x:form.select2 label="Country" name="customer_address[country]" placeholder="Select Country">
                                    @foreach ($countries as $country)
                                        <option value="{{ $country->country_id }}">
                                            {{ $country->country_name }}
                                        </option>
                                    @endforeach
                                </x:form.select2>
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Zip Code" name="customer_address[zip_code]" placeholder="Type Zip Code" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="PO Box" name="customer_address[po_box]" placeholder="Type PO Box" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input type="tel" label="Phone Number" name="customer_address[phone_number]"
                                    placeholder="Type Phone Number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input type="tel" label="Fax Number" name="customer_address[fax_number]"
                                    placeholder="Type Fax Number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Warehouse Provider" name="customer_address[warehouse_provider]"
                                    placeholder="Type Warehouse Provider" />
                            </div>
                        </div>
                        <div class="row">
                            <h2 class="mb-5">Contact Information</h2>
                            <div id="contact-form">
                                <div class="contact-row form-row row align-items-center">
                                    <div class="col">
                                        <x:form.input label="Contact Person Name" name="customer_address[contact_informations][contact_person_name][]" placeholder="Type Contact Person Name" />
                                    </div>
                                    <div class="col">
                                        <x:form.input label="Contact Person Number" name="customer_address[contact_informations][contact_person_number][]" placeholder="Type Contact Person Number" />
                                    </div>
                                    <div class="col">
                                        <x:form.input label="Contact Person Email" name="customer_address[contact_informations][contact_person_email][]" placeholder="Type Contact Person Email" />
                                    </div>
                                    <div class="col">
                                        <x:form.input label="Contact Person Address" name="customer_address[contact_informations][contact_person_address][]" placeholder="Type Contact Person Address" />
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
                    {{-- <div class="tab-pane fade" id="gst" role="tabpanel">
                        <div class="row mb-4">
                            <div class="col-md-4">
                                <x:form.select label="Address Type" name="customer_gst[address_type]"
                                    defaultOption="Select Address Type">
                                    @foreach ($customerAddressTypes as $addressType)
                                        <option value="{{ $addressType }}">
                                            {{ $addressType }}
                                        </option>
                                    @endforeach
                                </x:form.select>
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="ARN Number" name="customer_gst[arn_number]" placeholder="Type ARN Number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.select label="MSME" name="customer_gst[msme]"
                                    defaultOption="Select MSME"></x:form.select>
                            </div>
                            <div class="col-md-6">
                                <x:form.input label="City" name="customer_gst[city]" placeholder="Type City" />
                            </div>
                            <div class="col-md-6">
                                <x:form.input label="HSN Codes" name="customer_gst[hsn_codes]" placeholder="Type HSN Codes" />
                            </div>
                            <div class="col-md-6">
                                <x:form.input label="State" name="customer_gst[state]" placeholder="Type State" />
                            </div>
                            <div class="col-md-6">
                                <x:form.input label="SAC Codes" name="customer_gst[sac_codes]" placeholder="Type SAC Codes" />
                            </div>
                            <div class="col-md-4">
                                <x:form.select label="Type of Enterprise" name="customer_gst[type_of_enterprise]"
                                    defaultOption="Select Type of Enterprise"></x:form.select>
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Address" name="customer_gst[address]" placeholder="Type Address" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="UIN Number" name="customer_gst[uin_number]" placeholder="Type UIN Number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="PAN Mandatory" name="customer_gst[pan_mandatory]" placeholder="Type PAN Mandatory" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Composit Regular" name="customer_gst[composit_regular]" placeholder="Type Composit Regular" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input type="date" label="SEZ Valid From Date" name="customer_gst[sez_valid_from_date]" placeholder="Type SEZ Valid From Date" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input type="date" label="SEZ Valid To Date" name="customer_gst[sez_valid_from_date]" placeholder="Type SEZ Valid From Date" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="PAN Number" name="customer_gst[pan_number]" placeholder="Type PAN Number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.select label="SEZ" name="customer_gst[sez]"
                                    defaultOption="Select SEZ"></x:form.select>
                            </div>
                            <div class="col-md-4">
                                <x:form.select label="GST Registration Status" name="customer_gst[gst_registration_status]"
                                    defaultOption="Select GST Registration Status"></x:form.select>
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Passport Number" name="customer_gst[passport_number]" placeholder="Type Passport Number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="TAN Number" name="customer_gst[tan_number]" placeholder="Type TAN Number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="GSG ID" name="customer_gst[gsg_id]" placeholder="Type GSG ID" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="GSG Provisional ID" name="customer_gst[gsg_provisional_id]" placeholder="Type GSG Provisional ID" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="GSD ID" name="customer_gst[gsd_id]" placeholder="Type GSD ID" />
                            </div>
                        </div>
                    </div> --}}
                    <div class="tab-pane fade" id="vat" role="tabpanel">
                        <div class="row">
                            <div class="col-md-6">
                                <x:form.input label="VAT Number" name="customer_vat[vat_number]" placeholder="Type VAT Number" />
                            </div>
                            <div class="col-md-6">
                                <x:form.input label="VAT Number (Arabic)" name="customer_vat[local_vat_number]" placeholder="Type VAT Number (Arabic)" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="VAT Excemted" name="customer_vat[vat_excemted]" placeholder="Type VAT Excemted" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Excemted Reason" name="customer_vat[excemted_reason]" placeholder="Type Excemted Reason" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="AIT Number" name="customer_vat[ait_number]" placeholder="Type AIT Number" />
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="email" role="tabpanel">
                        <div class="row">
                            <div id="email-form">
                                <div class="email-row form-row row align-items-center">
                                    <div class="col">
                                        <input type="hidden" name="customer_email[email_id][]" value="" />
                                        <x:form.input type="email" label="Email" name="customer_email[email][]" placeholder="Type Email" />
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
                                <x:form.input label="Location" name="customer_sales[location]" placeholder="Type Location" />
                            </div>
                            <div class="col-md-6">
                                <x:form.input label="Segment" name="customer_sales[segment]" placeholder="Type Segment" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Salesman" name="customer_sales[salesman]" placeholder="Type Salesman" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Customer Services" name="customer_sales[customer_services]" placeholder="Type Customer Services" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Credit Days" name="customer_sales[credit_days]" placeholder="Type Credit Days" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Limit Amount" name="customer_sales[limit_amount]" placeholder="Type Limit Amount" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Publish Credit Days" name="customer_sales[publish_credit_days]" placeholder="Type Publish Credit Days" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Publish Amount" name="customer_sales[publish_amount]" placeholder="Type Publish Amount" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input type="date" label="Review Date" name="customer_sales[review_date]" placeholder="Type Review Date" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Override Amount" name="customer_sales[override_amount]" placeholder="Type Override Amount" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Allowed Days" name="customer_sales[allowed_days]" placeholder="Type Allowed Days" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="TOS" name="customer_sales[tos]" placeholder="Type TOS" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Contact Person" name="customer_sales[contact_person]" placeholder="Type Contact Person" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Customer Email" name="customer_sales[customer_email]" placeholder="Type Customer Email" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Auto > %" name="customer_sales[auto_more_than_percentage]" placeholder="Type Auto > %" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Email Days" name="customer_sales[email_days]" placeholder="Type Email Days" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Auto O/S Email To" name="customer_sales[automatic_email_to]" placeholder="Type Auto O/S Email To" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Sales Coordinator" name="customer_sales[sales_coordinator]" placeholder="Type Sales Coordinator" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Acc Handling Person" name="customer_sales[acc_handling_person]" placeholder="Type Acc Handling Person" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Note" name="customer_sales[note]" placeholder="Type Note" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Invoices to Email" name="customer_sales[invoices_to_email]" placeholder="Type Invoices to Email" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Clearance Email" name="customer_sales[clearance_email]" placeholder="Type Clearance Email" />
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="bank" role="tabpanel">
                        <div class="row">
                            <div class="col-md-6">
                                <x:form.input label="Account Number" name="customer_bank[account_number]" placeholder="Type Account Number" />
                            </div>
                            <div class="col-md-6">
                                <x:form.input label="Account Name" name="customer_bank[account_name]" placeholder="Type Account Name" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Bank Name" name="customer_bank[bank_name]" placeholder="Type Bank Name" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="IBAN Number" name="customer_bank[iban_number]" placeholder="Type IBAN Number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Bank Swift Number" name="customer_bank[swift_code]" placeholder="Type Bank Swift Number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Bank Address" name="customer_bank[bank_address]" placeholder="Type Bank Address" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Bank Guarantee A/C Number" name="customer_bank[bank_guarantee_ac_number]" placeholder="Type Bank Guarantee A/C Number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="BLZ Number / Sort Code" name="customer_bank[blz_number_sort_code]" placeholder="Type BLZ Number / Sort Code" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Paye Beneficiary ID" name="customer_bank[paye_beneficiary_id]" placeholder="Type Paye Beneficiary ID" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Payment Type" name="customer_bank[payment_type]" placeholder="Type Payment Type" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Code" name="customer_bank[beneficiary_code]" placeholder="Type Beneficiary Code" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary A/C Number" name="customer_bank[beneficiary_ac_number]" placeholder="Type Beneficiary A/C Number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary A/C Type" name="customer_bank[beneficiary_ac_type]" placeholder="Type Beneficiary A/C Type" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Name" name="customer_bank[beneficiary_name]" placeholder="Type Beneficiary Name" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Address Line 1" name="customer_bank[beneficiary_first_address]" placeholder="Type Beneficiary Address Line 1" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Address Line 2" name="customer_bank[beneficiary_second_address]" placeholder="Type Beneficiary Address Line 2" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Address Line 3" name="customer_bank[beneficiary_third_address]" placeholder="Type Beneficiary Address Line 3" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary City" name="customer_bank[beneficiary_city]" placeholder="Type Beneficiary City" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary State" name="customer_bank[beneficiary_state]" placeholder="Type Beneficiary State" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Pincode" name="customer_bank[beneficiary_pincode]" placeholder="Type Beneficiary Pincode" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="IFSC Code" name="customer_bank[ifsc_code]" placeholder="Type IFSC Code" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Mobile Number" name="customer_bank[beneficiary_mobile_number]" placeholder="Type Beneficiary Mobile Number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Bank Number" name="customer_bank[beneficiary_bank_number]" placeholder="Type Beneficiary Bank Number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Bank Name" name="customer_bank[beneficiary_bank_name]" placeholder="Type Beneficiary Bank Name" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Bank Branch Name" name="customer_bank[beneficiary_bank_branch_name]" placeholder="Type Beneficiary Bank Branch Name" />
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="account" role="tabpanel">
                        <div class="row">
                            <div id="account-form">
                                <div class="account-row form-row row align-items-center">
                                    <div class="col">
                                        <input type="hidden" name="customer_account[customer_account_id][]" value="">
                                        <x:form.select label="Account Number" name="customer_account[chart_of_account_id][]" defaultOption="Select Account Number" style="width: 228px;">
                                        @foreach ($accountGroups as $group)
                                            <optgroup label="{{ str($group->name)->upper() }}">
                                                @foreach ($group->subAccountGroups as $subGroup)
                                                    <optgroup label="{{ '-' . $subGroup->code . ' -- ' . str($subGroup->name)->upper() }}">
                                                        @php
                                                            $chartOfAccounts = $subGroup->chartOfAccounts()
                                                                ->orderBy('account_number', 'asc')
                                                                ->get();
                                                        @endphp
                                                        @foreach ($chartOfAccounts as $account)
                                                            <option value="{{ $account->id }}">
                                                                {{ '--' . $account->account_number . ' --- ' . str($account->account_name)->upper() }}
                                                            </option>
                                                        @endforeach
                                                    </optgroup>
                                                @endforeach
                                            </optgroup>
                                        @endforeach
                                    </x:form.select>
                                    </div>
                                    <div class="col">
                                        <x:form.select label="Currency" name="customer_account[currency_id][]" defaultOption="Select Currency">
                                            @foreach ($currencies as $currency)
                                                <option value="{{ $currency->id }}">
                                                    {{ $currency->currency_name }}
                                                </option>
                                            @endforeach
                                        </x:form.select>
                                    </div>
                                    <div class="col">
                                        <x:form.input label="LOV Status" name="customer_account[lov_status][]" placeholder="Type LOV Status" />
                                    </div>
                                    <div class="col">
                                        <x:form.input label="Notes" name="customer_account[notes][]" placeholder="Type Notes" />
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
            <x:form.cancel-button href="{{ route('finance.master-data.customer.index') }}" label="Cancel" />
            <x:form.submit-button label="Submit" />
        </div>
    </x:form.wrapper>
@endsection

@push('js')
    <script>
        function addRow(rowClass, formId) {
            const newRow = $(rowClass).first().clone()

            newRow.find('input').val('')
            newRow.find('select').val(null)

            $(formId).append(newRow)

            updateMinusButton()
        }

        function removeRow(rowClass) {
            if ($(rowClass).length > 1) {
                $(rowClass).last().remove()
            }
            updateMinusButton(rowClass)
        }

        function updateMinusButton(rowClass) {
            const rowCount = $(rowClass).length
            $('.btn-warning').prop('disabled', rowCount === 1)
        }
    </script>
@endpush
