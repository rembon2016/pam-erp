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

    select.select2-hidden-accessible:disabled + .select2-container .select2-selection {
        background-color: #eaeaea!important;
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
            {{-- <div class='col-md-6'>
                <x:form.input label="Customer Code" name="customer_code" placeholder="Type Customer Code" required="true" :model="@$customer" />
            </div> --}}
            <div class='col-md-6'>
                <x:form.input label="Customer Name" name="customer_name" placeholder="Type Customer Name" required="true" :model="@$customer" disabled="{{ @$customer->data_from == 'operation' }}" />
            </div>
            <div class='col-md-6'>
                <x:form.input label="EORI Number" name="eori_number" placeholder="Type EORI Number" :model="@$customer" />
            </div>
            <div class='col-md-6'>
                <x:form.input type="number" label="Credit Terms (Days)" name="credit_terms" placeholder="Type Credit Terms (Days)" :model="@$customer" required="true" />
            </div>
            <div class='col-md-6'>
                <x:form.select label="Local/Overseas" name="overseas" defaultOption="Select Local/Overseas" required="true">
                    <option value="local" @selected(old('overseas', @$customer->overseas) == 'local')>Local</option>
                    <option value="overseas" @selected(old('overseas', @$customer->overseas) == 'overseas')>Overseas</option>
                </x:form.select>
            </div>
            <div class='col-md-6'>
                <x:form.select label="Currency" name="currency_id" defaultOption="Select Currency">
                    @foreach ($currencies as $currency)
                        <option value="{{ $currency->id }}" @selected(old('currency_id', @$customer->currency_id) == $currency->id)>
                            {{ $currency->currency_code . " - " . $currency->currency_name }}
                        </option>
                    @endforeach
                </x:form.select>
            </div>
            <div class='col-md-6'>
                <x:form.input type="number" label="Credit Limit (Amount)" name="credit_limit" placeholder="Type Credit Limit" required="true" :model="@$customer" />
            </div>
            <div class="col-md-12">
                <div class='mb-10'>
                    <label class="form-label required" for="customer_type">Customer Type</label>
                    <div class="row">
                        @foreach ($customerTypes as $type)
                            <div class="col-md-2">
                                <div class="d-flex mt-3">
                                    <label class="form-check form-check-sm form-check-custom form-check-solid me-5">
                                        @if (@$customer)
                                            @php
                                                $types = @$customer->customerTypes->pluck('name')->toArray();
                                            @endphp
                                            <input class="form-check-input" name="customer_type[]" type="checkbox"
                                                value="{{ $type }}" {{ in_array($type, $types) ? 'checked' : '' }}>
                                            <span class="form-check-label" style="font-size: 10px;">
                                                {{ $type }}
                                            </span>
                                        @else
                                            <input class="form-check-input" name="customer_type[]" type="checkbox"
                                                value="{{ $type }}">
                                            <span class="form-check-label" style="font-size: 10px;">
                                                {{ $type }}
                                            </span>
                                        @endif
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
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="email-tab" data-bs-toggle="tab" data-bs-target="#email" type="button"
                        role="tab">Email</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="bank-tab" data-bs-toggle="tab" data-bs-target="#bank" type="button"
                            role="tab">Bank</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="account-tab" data-bs-toggle="tab" data-bs-target="#account"
                            type="button" role="tab">Account</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="vat-tab" data-bs-toggle="tab" data-bs-target="#vat" type="button"
                            role="tab">VAT</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="sales-tab" data-bs-toggle="tab" data-bs-target="#sales" type="button"
                            role="tab">Sales</button>
                    </li>
                </ul>
                <div class="tab-content p-5 bg-white border border-top-0">
                    <div class="tab-pane fade show active" id="address" role="tabpanel">
                        <div class="row mb-4">
                            <div class="col-md-4">
                                <x:form.select label="Address Type" name="customer_address[address_type]" defaultOption="Select Address Type" disabled="{{ @$customer->data_from == 'operation' }}">
                                    @foreach ($customerAddressTypes as $addressType)
                                        <option value="{{ $addressType }}" @selected(@$customer->customerAddress->address_type == $addressType)>
                                            {{ $addressType }}
                                        </option>
                                    @endforeach
                                </x:form.select>
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Bank DLR Code" name="customer_address[bank_dlr_code]"
                                    placeholder="Type Bank DLR Code" :customModelling="@$customer->customerAddress->bank_dlr_code"
                                    disabled="{{ @$customer->data_from == 'operation' }}" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Address" name="customer_address[address]" placeholder="Type Address" :customModelling="@$customer->customerAddress->address" disabled="{{ @$customer->data_from == 'operation' }}" />
                            </div>
                            <div class="col-md-4">
                                <x:form.select2 label="Country" name="customer_address[country]" placeholder="Select Country" disabled="{{ @$customer->data_from == 'operation' }}">
                                    @foreach ($countries as $country)
                                        <option value="{{ $country->country_id }}" @selected(@$customer->customerAddress->country == $country->country_id)>
                                            {{ $country->country_name }}
                                        </option>
                                    @endforeach
                                </x:form.select2>
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="State" name="customer_address[state]" placeholder="Type State" :customModelling="@$customer->customerAddress->state" disabled="{{ @$customer->data_from == 'operation' }}" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="City" name="customer_address[city]" placeholder="Type City" :customModelling="@$customer->customerAddress->city" disabled="{{ @$customer->data_from == 'operation' }}" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Zip Code" name="customer_address[zip_code]" placeholder="Type Zip Code" :customModelling="@$customer->customerAddress->zip_code" disabled="{{ @$customer->data_from == 'operation' }}" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="PO Box" name="customer_address[po_box]" placeholder="Type PO Box" :customModelling="@$customer->customerAddress->po_box" disabled="{{ @$customer->data_from == 'operation' }}" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input type="tel" label="Phone Number" name="customer_address[phone_number]"
                                    placeholder="Type Phone Number" :customModelling="@$customer->customerAddress->phone_number" disabled="{{ @$customer->data_from == 'operation' }}" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input type="tel" label="Fax Number" name="customer_address[fax_number]"
                                    placeholder="Type Fax Number" :customModelling="@$customer->customerAddress->fax_number" disabled="{{ @$customer->data_from == 'operation' }}" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Warehouse Provider" name="customer_address[warehouse_provider]"
                                    placeholder="Type Warehouse Provider" :customModelling="@$customer->customerAddress->warehouse_provider" disabled="{{ @$customer->data_from == 'operation' }}" />
                            </div>
                        </div>
                        <div class="row">
                            <h2 class="mb-5">Contact Information</h2>
                            <div id="contact-form">
                                @if (@$customer && !empty(@$customer->customerAddress->contact_informations))
                                    @foreach (@$customer->customerAddress->contact_informations as $key => $baseContract)
                                        @php
                                            $contactInformation = json_decode($baseContract, true)
                                        @endphp
                                        @foreach ($contactInformation as $contact)
                                            <div class="contact-row form-row row align-items-center">
                                                <div class="col">
                                                    <x:form.input label="Contact Person Name" name="customer_address[contact_informations][contact_person_name][]" placeholder="Type Contact Person Name" :customModelling="@$contact['contact_person_name']" disabled="{{ @$customer->data_from == 'operation' }}" />
                                                </div>
                                                <div class="col">
                                                    <x:form.input label="Contact Person Number" name="customer_address[contact_informations][contact_person_number][]" placeholder="Type Contact Person Number" :customModelling="@$contact['contact_person_number']" disabled="{{ @$customer->data_from == 'operation' }}" />
                                                </div>
                                                <div class="col">
                                                    <x:form.input label="Contact Person Email" name="customer_address[contact_informations][contact_person_email][]" placeholder="Type Contact Person Email" :customModelling="@$contact['contact_person_email']" disabled="{{ @$customer->data_from == 'operation' }}" />
                                                </div>
                                                <div class="col">
                                                    <x:form.input label="Contact Person Address" name="customer_address[contact_informations][contact_person_address][]" placeholder="Type Contact Person Address" :customModelling="@$contact['contact_person_address']" disabled="{{ @$customer->data_from == 'operation' }}" />
                                                </div>
                                                @if (@$customer->data_from == 'erp')
                                                    <div class="col-auto d-flex">
                                                        <button type="button" class="btn btn-success me-2" onclick="addRow('.contact-row', '#contact-form')">+</button>
                                                        <button type="button" class="btn btn-warning" onclick="removeRow('.contact-row')"
                                                            disabled>-</button>
                                                    </div>
                                                @endif
                                            </div>
                                        @endforeach
                                    @endforeach
                                @else
                                    <div class="contact-row form-row row align-items-center">
                                        <div class="col">
                                            <x:form.input label="Contact Person Name" name="customer_address[contact_informations][contact_person_name][]" placeholder="Type Contact Person Name" disabled="{{ @$customer->data_from == 'operation' }}" />
                                        </div>
                                        <div class="col">
                                            <x:form.input label="Contact Person Number" name="customer_address[contact_informations][contact_person_number][]" placeholder="Type Contact Person Number" disabled="{{ @$customer->data_from == 'operation' }}" />
                                        </div>
                                        <div class="col">
                                            <x:form.input label="Contact Person Email" name="customer_address[contact_informations][contact_person_email][]" placeholder="Type Contact Person Email" disabled="{{ @$customer->data_from == 'operation' }}" />
                                        </div>
                                        <div class="col">
                                            <x:form.input label="Contact Person Address" name="customer_address[contact_informations][contact_person_address][]" placeholder="Type Contact Person Address" disabled="{{ @$customer->data_from == 'operation' }}" />
                                        </div>
                                        @if (@$customer->data_from == 'erp')
                                            <div class="col-auto d-flex">
                                                <button type="button" class="btn btn-success me-2" onclick="addRow('.contact-row', '#contact-form')">+</button>
                                                <button type="button" class="btn btn-warning" onclick="removeRow('.contact-row')"
                                                    disabled>-</button>
                                            </div>
                                        @endif
                                    </div>
                                @endif
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="email" role="tabpanel">
                        <div class="row">
                            <div id="email-form">

                                @if (@$customer && @$customer->customerEmails->count() > 0)
                                    @foreach (@$customer->customerEmails as $email)
                                        <div class="email-row form-row row align-items-center">
                                            <div class="col">
                                                <input type="hidden" name="customer_email[email_id][]" value="{{ $email->id }}" />
                                                <x:form.input type="email" label="Email" name="customer_email[email][]" placeholder="Type Email" :customModelling="@$email->email" />
                                            </div>
                                            <div class="col-auto d-flex">
                                                <button type="button" class="btn btn-success me-2" onclick="addRow('.email-row', '#email-form')">+</button>
                                                <button type="button" class="btn btn-warning" onclick="removeRow('.email-row')"
                                                    disabled>-</button>
                                            </div>
                                        </div>
                                    @endforeach
                                @else
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
                                @endif
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="bank" role="tabpanel">
                        <div class="row">
                            <div class="col-md-6">
                                <x:form.input label="Account Number" name="customer_bank[account_number]" placeholder="Type Account Number" :customModelling="@$customer->customerBank->account_number" />
                            </div>
                            <div class="col-md-6">
                                <x:form.input label="Account Name" name="customer_bank[account_name]" placeholder="Type Account Name" :customModelling="@$customer->customerBank->account_name" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Bank Name" name="customer_bank[bank_name]" placeholder="Type Bank Name" :customModelling="@$customer->customerBank->bank_name" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="IBAN Number" name="customer_bank[iban_number]" placeholder="Type IBAN Number" :customModelling="@$customer->customerBank->iban_number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Bank Swift Number" name="customer_bank[swift_code]" placeholder="Type Bank Swift Number" :customModelling="@$customer->customerBank->swift_code" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Bank Address" name="customer_bank[bank_address]" placeholder="Type Bank Address" :customModelling="@$customer->customerBank->bank_address" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Bank Guarantee A/C Number" name="customer_bank[bank_guarantee_ac_number]" placeholder="Type Bank Guarantee A/C Number" :customModelling="@$customer->customerBank->bank_guarantee_ac_number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="BLZ Number / Sort Code" name="customer_bank[blz_number_sort_code]" placeholder="Type BLZ Number / Sort Code" :customModelling="@$customer->customerBank->blz_number_sort_code" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Paye Beneficiary ID" name="customer_bank[paye_beneficiary_id]" placeholder="Type Paye Beneficiary ID" :customModelling="@$customer->customerBank->paye_beneficiary_id" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Payment Type" name="customer_bank[payment_type]" placeholder="Type Payment Type" :customModelling="@$customer->customerBank->payment_type" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Code" name="customer_bank[beneficiary_code]" placeholder="Type Beneficiary Code" :customModelling="@$customer->customerBank->beneficiary_code" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary A/C Number" name="customer_bank[beneficiary_ac_number]" placeholder="Type Beneficiary A/C Number" :customModelling="@$customer->customerBank->beneficiary_ac_number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary A/C Type" name="customer_bank[beneficiary_ac_type]" placeholder="Type Beneficiary A/C Type" :customModelling="@$customer->customerBank->beneficiary_ac_type" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Name" name="customer_bank[beneficiary_name]" placeholder="Type Beneficiary Name" :customModelling="@$customer->customerBank->beneficiary_name" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Address Line 1" name="customer_bank[beneficiary_first_address]" placeholder="Type Beneficiary Address Line 1" :customModelling="@$customer->customerBank->beneficiary_first_address" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Address Line 2" name="customer_bank[beneficiary_second_address]" placeholder="Type Beneficiary Address Line 2" :customModelling="@$customer->customerBank->beneficiary_second_address" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Address Line 3" name="customer_bank[beneficiary_third_address]" placeholder="Type Beneficiary Address Line 3" :customModelling="@$customer->customerBank->beneficiary_third_address" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary City" name="customer_bank[beneficiary_city]" placeholder="Type Beneficiary City" :customModelling="@$customer->customerBank->beneficiary_city" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary State" name="customer_bank[beneficiary_state]" placeholder="Type Beneficiary State" :customModelling="@$customer->customerBank->beneficiary_state" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Pincode" name="customer_bank[beneficiary_pincode]" placeholder="Type Beneficiary Pincode" :customModelling="@$customer->customerBank->beneficiary_pincode" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="IFSC Code" name="customer_bank[ifsc_code]" placeholder="Type IFSC Code" :customModelling="@$customer->customerBank->ifsc_code" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Mobile Number" name="customer_bank[beneficiary_mobile_number]" placeholder="Type Beneficiary Mobile Number" :customModelling="@$customer->customerBank->beneficiary_mobile_number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Bank Number" name="customer_bank[beneficiary_bank_number]" placeholder="Type Beneficiary Bank Number" :customModelling="@$customer->customerBank->beneficiary_bank_number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Bank Name" name="customer_bank[beneficiary_bank_name]" placeholder="Type Beneficiary Bank Name" :customModelling="@$customer->customerBank->beneficiary_bank_name" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Beneficiary Bank Branch Name" name="customer_bank[beneficiary_bank_branch_name]" placeholder="Type Beneficiary Bank Branch Name" :customModelling="@$customer->customerBank->beneficiary_bank_branch_name" />
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="account" role="tabpanel">
                        <div class="row">
                            <div id="account-form">
                                @if (@$customer && @$customer->customerAccounts->count() > 0)
                                    @foreach (@$customer->customerAccounts as $customerAccount)
                                        <div class="account-row form-row row align-items-center">
                                            <div class="col">
                                                <input type="hidden" name="customer_account[customer_account_id][]" value="{{ $customerAccount->id }}">
                                                <div class="mb-3">
                                                    <select name="customer_account[chart_of_account_id][]" style="width: 228px;" class="form-select account-select2" data-control="select2" data-placeholder="Select Account" id="customer_account[chart_of_account_id][]">
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
                                                                            <option value="{{ $account->id }}" @selected($customerAccount->chart_of_account_id == $account->id)>
                                                                                {{ '--' . $account->account_number . ' --- ' . str($account->account_name)->upper() }}
                                                                            </option>
                                                                        @endforeach
                                                                    </optgroup>
                                                                @endforeach
                                                            </optgroup>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-auto d-flex">
                                                <button type="button" class="btn btn-success me-2" onclick="addRow('.account-row', '#account-form')">+</button>
                                                <button type="button" class="btn btn-warning" onclick="removeRow('.account-row')"
                                                    disabled>-</button>
                                            </div>
                                        </div>
                                    @endforeach
                                @else
                                    <div class="account-row form-row row align-items-center">
                                        <div class="col">
                                            <input type="hidden" name="customer_account[customer_account_id][]" value="">
                                            <div class="mb-3">
                                                <label for="#customer_account[chart_of_account_id][]" class='form-label'>Account</label>
                                                <select name="customer_account[chart_of_account_id][]" style="width: 228px;" class="form-select account-select2" data-control="select2" data-placeholder="Select Account Number">
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
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-auto d-flex">
                                            <button type="button" class="btn btn-success me-2" onclick="addRow('.account-row', '#account-form')">+</button>
                                            <button type="button" class="btn btn-warning" onclick="removeRow('.account-row')"
                                                disabled>-</button>
                                        </div>
                                    </div>
                                @endif
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="vat" role="tabpanel">
                        <div class="row">
                            <div class="col-md-6">
                                <x:form.input label="VAT Number" name="customer_vat[vat_number]" placeholder="Type VAT Number" :customModelling="@$customer->customerVat->vat_number" />
                            </div>
                            <div class="col-md-6">
                                <x:form.input label="VAT Number (Arabic)" name="customer_vat[local_vat_number]" placeholder="Type VAT Number (Arabic)" :customModelling="@$customer->customerVat->local_vat_number" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="VAT Excemted" name="customer_vat[vat_excemted]" placeholder="Type VAT Excemted" :customModelling="@$customer->customerVat->vat_excemted" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="Excemted Reason" name="customer_vat[excemted_reason]" placeholder="Type Excemted Reason" :customModelling="@$customer->customerVat->excemted_reason" />
                            </div>
                            <div class="col-md-4">
                                <x:form.input label="AIT Number" name="customer_vat[ait_number]" placeholder="Type AIT Number" :customModelling="@$customer->customerVat->ait_number" />
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="sales" role="tabpanel">
                        <div class="row">
                            <div class="col-md-6">
                                <x:form.input label="Location" name="customer_sales[location]" placeholder="Type Location" :customModelling="@$customer->customerSales->location" />
                            </div>
                            <div class="col-md-6">
                                <x:form.input label="Segment" name="customer_sales[segment]" placeholder="Type Segment" :customModelling="@$customer->customerSales->segment" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Salesman" name="customer_sales[salesman]" placeholder="Type Salesman" :customModelling="@$customer->customerSales->salesman" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Customer Services" name="customer_sales[customer_services]" placeholder="Type Customer Services" :customModelling="@$customer->customerSales->customer_services" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Credit Days" name="customer_sales[credit_days]" placeholder="Type Credit Days" :customModelling="@$customer->customerSales->credit_days" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Limit Amount" name="customer_sales[limit_amount]" placeholder="Type Limit Amount" :customModelling="@$customer->customerSales->limit_amount" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Publish Credit Days" name="customer_sales[publish_credit_days]" placeholder="Type Publish Credit Days" :customModelling="@$customer->customerSales->publish_credit_days" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Publish Amount" name="customer_sales[publish_amount]" placeholder="Type Publish Amount" :customModelling="@$customer->customerSales->publish_amount" />
                            </div>
                            <div class="col-md-3">
                                <label for="review_date" class="form-label">Review Date</label>
                                <input id="review_date" type="date" class="@if($errors->has('review_date')) is-invalid @endif form-control" name="customer_sales[review_date]" value="{{ old('review_date', @$customer->customerSales->review_date) }}" />
                                <div class="invalid-feedback">
                                    {{ $errors->first('review_date') }}
                                </div>
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Override Amount" name="customer_sales[override_amount]" placeholder="Type Override Amount" :customModelling="@$customer->customerSales->override_amount" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Allowed Days" name="customer_sales[allowed_days]" placeholder="Type Allowed Days" :customModelling="@$customer->customerSales->allowed_days" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="TOS" name="customer_sales[tos]" placeholder="Type TOS" :customModelling="@$customer->customerSales->tos" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Contact Person" name="customer_sales[contact_person]" placeholder="Type Contact Person" :customModelling="@$customer->customerSales->contact_person" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Customer Email" name="customer_sales[customer_email]" placeholder="Type Customer Email" :customModelling="@$customer->customerSales->customer_email" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Auto > %" name="customer_sales[auto_more_than_percentage]" placeholder="Type Auto > %" :customModelling="@$customer->customerSales->auto_more_than_percentage" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Email Days" name="customer_sales[email_days]" placeholder="Type Email Days" :customModelling="@$customer->customerSales->email_days" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Auto O/S Email To" name="customer_sales[automatic_email_to]" placeholder="Type Auto O/S Email To" :customModelling="@$customer->customerSales->automatic_email_to" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Sales Coordinator" name="customer_sales[sales_coordinator]" placeholder="Type Sales Coordinator" :customModelling="@$customer->customerSales->sales_coordinator" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Acc Handling Person" name="customer_sales[acc_handling_person]" placeholder="Type Acc Handling Person" :customModelling="@$customer->customerSales->acc_handling_person" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Note" name="customer_sales[note]" placeholder="Type Note" :customModelling="@$customer->customerSales->note" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Invoices to Email" name="customer_sales[invoices_to_email]" placeholder="Type Invoices to Email" :customModelling="@$customer->customerSales->invoices_to_email" />
                            </div>
                            <div class="col-md-3">
                                <x:form.input label="Clearance Email" name="customer_sales[clearance_email]" placeholder="Type Clearance Email" :customModelling="@$customer->customerSales->clearance_email" />
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
            const initialRowCount = $(rowClass).length;

            const newRow = $(rowClass).first().clone();
            newRow.find('input').val('');
            newRow.find('select').val(null);

            newRow.find('.select2-container').remove();

            const uniqueId = `account-select2-${Date.now()}-${initialRowCount}`;
            newRow.find('select[data-control="select2"]').attr('id', uniqueId);

            $(formId).append(newRow);

            const initializeSelect2 = (select, index) => {
                try {
                    if (!select || !select.length) return false;

                    select.next('.select2-container').remove();

                    select.select2({
                        placeholder: select.data('placeholder'),
                        width: '100%'
                    });

                    return true;
                } catch (error) {
                    return false;
                }
            };

            const allRows = $(`${formId} ${rowClass}`);

            allRows.each(function(index) {
                const select = $(this).find('select[data-control="select2"]');

                if (!select.attr('id') || select.attr('id').includes('undefined')) {
                    const rowUniqueId = `account-select2-${Date.now()}-${index}`;
                    select.attr('id', rowUniqueId);
                }

                initializeSelect2(select, index);
            });

            allRows.each(function(index) {
                const select = $(this).find('select[data-control="select2"]');
                if (!select.hasClass('select2-hidden-accessible') || !select.next('.select2-container').length) {
                    initializeSelect2(select, index);
                }
            });

            updateMinusButton();
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
