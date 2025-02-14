<!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <div class="sidebar-inner slimscroll">
            <div id="sidebar-menu" class="sidebar-menu">
                <ul class="sidebar-vertical">
                    <!-- Main -->
                    <x:layout.sidebar-v2.menu-title title="Main Menu" />
                    <x:layout.sidebar-v2.menu-item name="Dashboard" iconClass="fe fe-home" link="{{ route('dashboard') }}" :activeCondition="Route::is('dashboard')" />

                    <x:layout.sidebar-v2.dropdown-menu name="Master Data" iconClass="fe fe-database">
                        @can('finance.show_master_customer')
                            <x:layout.sidebar-v2.menu-item name="Customer" link="{{ route('finance.master-data.customer.index') }}" :activeCondition="Route::is('finance.master-data.customer.*')" />
                        @endcan

                        <x:layout.sidebar-v2.menu-item name="Customer Contract" link="{{ route('finance.master-data.customer-contract.index') }}" :activeCondition="Route::is('finance.master-data.customer-contract.*')" />
                        <x:layout.sidebar-v2.menu-item name="Agent Contract" link="{{ route('finance.master-data.agent-contract.index') }}" :activeCondition="Route::is('finance.master-data.agent-contract.*')" />
                        <x:layout.sidebar-v2.menu-item name="Country" link="{{ route('finance.master-data.country.index') }}" :activeCondition="Route::is('finance.master-data.country.*')" />
                        <x:layout.sidebar-v2.menu-item name="Port" link="{{ route('finance.master-data.port.index') }}" :activeCondition="Route::is('finance.master-data.port.*')" />
                        <x:layout.sidebar-v2.menu-item name="Service Type" link="{{ route('finance.master-data.service-type.index') }}" :activeCondition="Route::is('finance.master-data.service-type.*')" />
                        <x:layout.sidebar-v2.menu-item name="Unit" link="{{ route('finance.master-data.unit.index') }}" :activeCondition="Route::is('finance.master-data.unit.*')" />
                        <x:layout.sidebar-v2.menu-item name="Payment Method" link="{{ route('finance.master-data.payment-method.index') }}" :activeCondition="Route::is('finance.master-data.payment-method.*')" />
                        <x:layout.sidebar-v2.menu-item name="Currency" link="{{ route('finance.master-data.currency.index') }}" :activeCondition="Route::is('finance.master-data.currency.*')" />
                        <x:layout.sidebar-v2.menu-item name="GL Charge Master" link="{{ route('finance.master-data.charge.index') }}" :activeCondition="Route::is('finance.master-data.charge.*')" />
                        <x:layout.sidebar-v2.menu-item name="Chart of Account" link="{{ route('finance.master-data.chart-of-account.index') }}" :activeCondition="Route::is('finance.master-data.chart-of-account.*')" />
                        <x:layout.sidebar-v2.menu-item name="Daybook" link="{{ route('finance.master-data.daybook.index') }}" :activeCondition="Route::is('finance.master-data.daybook.*')" />
                    </x:layout.sidebar-v2.dropdown-menu>

                    <x:layout.sidebar-v2.dropdown-menu name="General Wise" iconClass="fe fe-layers">
                        <x:layout.sidebar-v2.dropdown-menu name="Shipments" level="2">
                            <x:layout.sidebar-v2.menu-item name="Sea Air" link="{{ route('finance.general-wise.shipment.index', 'seaair') }}" :activeCondition="last(request()->segments()) == 'seaair'" />
                            <x:layout.sidebar-v2.menu-item name="Cross Air" link="{{ route('finance.general-wise.shipment.index', 'crossair') }}" :activeCondition="last(request()->segments()) == 'crossair'" />
                            <x:layout.sidebar-v2.menu-item name="Sea Import" link="{{ route('finance.general-wise.shipment.index', 'seaimport') }}" :activeCondition="last(request()->segments()) == 'seaimport'" />
                            <x:layout.sidebar-v2.menu-item name="Sea Export" link="{{ route('finance.general-wise.shipment.index', 'seaexport') }}" :activeCondition="last(request()->segments()) == 'seaexport'" />
                            <x:layout.sidebar-v2.menu-item name="Air Import" link="{{ route('finance.general-wise.shipment.index', 'airimport') }}" :activeCondition="last(request()->segments()) == 'airimport'" />
                            <x:layout.sidebar-v2.menu-item name="Air Export" link="{{ route('finance.general-wise.shipment.index', 'airexport') }}" :activeCondition="last(request()->segments()) == 'airexport'" />
                            <x:layout.sidebar-v2.menu-item name="Warehouse" link="{{ route('finance.general-wise.shipment.index', 'warehouse') }}" :activeCondition="last(request()->segments()) == 'warehouse'" />
                            <x:layout.sidebar-v2.menu-item name="Trucking" link="{{ route('finance.general-wise.shipment.index', 'trucking') }}" :activeCondition="last(request()->segments()) == 'trucking'" />
                            <x:layout.sidebar-v2.menu-item name="Courier" link="{{ route('finance.general-wise.shipment.index', 'courier') }}" :activeCondition="last(request()->segments()) == 'courier'" />
                        </x:layout.sidebar-v2.dropdown-menu>
                        <x:layout.sidebar-v2.menu-item name="CTD" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Customer" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Container" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Tonnage" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Vessel" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Shipping Line" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Carrier" link="#" />
                    </x:layout.sidebar-v2.dropdown-menu>

                    <x:layout.sidebar-v2.menu-title title="Transactions" />

                    <x:layout.sidebar-v2.dropdown-menu name="Billing" iconClass="fe fe-file-text">
                        <x:layout.sidebar-v2.menu-item name="Generate Invoice" link="{{ route('finance.billing.invoice.create.not-linked-billing-customer', ['billing-customer' => 'not-linked']) }}" :activeCondition="Route::is('finance.billing.invoice.*') && !Route::is('finance.billing.invoice.index')"  />
                        <x:layout.sidebar-v2.menu-item name="Invoice List" link="{{ route('finance.billing.invoice.index') }}" :activeCondition="Route::is('finance.billing.invoice.index')" />
                    </x:layout.sidebar-v2.dropdown-menu>

                    <x:layout.sidebar-v2.dropdown-menu name="Costing" iconClass="fe fe-dollar-sign">
                        <x:layout.sidebar-v2.menu-item name="Sea Air" link="{{ route('finance.costing.sea-air.index') }}" :activeCondition="Route::is('finance.costing.sea-air.*')" />
                        <x:layout.sidebar-v2.menu-item name="Cross Air" link="{{ route('finance.costing.cross-air.index') }}" :activeCondition="Route::is('finance.costing.cross-air.*')" />
                        <x:layout.sidebar-v2.dropdown-menu name="Dubai Business" level="2" :showCondition="Route::is('finance.costing.dubai-business.*')">
                            <x:layout.sidebar-v2.menu-item name="Sea Import" link="{{ route('finance.costing.dubai-business.sea-import.index') }}" :activeCondition="Route::is('finance.costing.dubai-business.sea-import.*')" />
                            <x:layout.sidebar-v2.menu-item name="Sea Export" link="{{ route('finance.costing.dubai-business.sea-export.index') }}" :activeCondition="Route::is('finance.costing.dubai-business.sea-export.*')" />
                            <x:layout.sidebar-v2.menu-item name="Air Import" link="{{ route('finance.costing.dubai-business.air-import.index') }}" :activeCondition="Route::is('finance.costing.dubai-business.air-import.*')" />
                            <x:layout.sidebar-v2.menu-item name="Air Export" link="{{ route('finance.costing.dubai-business.air-export.index') }}" :activeCondition="Route::is('finance.costing.dubai-business.air-export.*')" />
                            <x:layout.sidebar-v2.menu-item name="Warehouse" link="{{ route('finance.costing.dubai-business.warehouse.index') }}" :activeCondition="Route::is('finance.costing.dubai-business.warehouse.*')" />
                            <x:layout.sidebar-v2.menu-item name="Trucking" link="{{ route('finance.costing.dubai-business.trucking.index') }}" :activeCondition="Route::is('finance.costing.dubai-business.trucking.*')" />
                            <x:layout.sidebar-v2.menu-item name="Courier" link="{{ route('finance.costing.dubai-business.courier.index') }}" :activeCondition="Route::is('finance.costing.dubai-business.courier.*')" />
                        </x:layout.sidebar-v2.dropdown-menu>
                    </x:layout.sidebar-v2.dropdown-menu>

                    <x:layout.sidebar-v2.dropdown-menu name="General Transaction" iconClass="fe fe-shuffle">
                        <x:layout.sidebar-v2.menu-item name="Creditor Journal Voucher" link="{{ route('finance.general-transaction.creditor-journal-voucher.index') }}" :activeCondition="Route::is('finance.general-transaction.creditor-journal-voucher.*')" />

                        <x:layout.sidebar-v2.dropdown-menu name="Credit Note" level="2">
                            <x:layout.sidebar-v2.menu-item name="Credit Note for Cost" link="{{ route('finance.general-transaction.credit-note.index', ['type' => 'cost']) }}" :activeCondition="Route::is('finance.general-transaction.credit-note.*') && request()->route('type') == 'cost'" />
                            <x:layout.sidebar-v2.menu-item name="Credit Note for Revenue" link="{{ route('finance.general-transaction.credit-note.index', ['type' => 'revenue']) }}" :activeCondition="Route::is('finance.general-transaction.credit-note.*') && request()->route('type') == 'revenue'" />
                            <x:layout.sidebar-v2.menu-item name="Credit Note for Non-Trade" link="{{ route('finance.general-transaction.credit-note.index', ['type' => 'non-trade']) }}" :activeCondition="Route::is('finance.general-transaction.credit-note.*') && request()->route('type') == 'non-trade'" />
                        </x:layout.sidebar-v2.dropdown-menu>

                        <x:layout.sidebar-v2.dropdown-menu name="Debit Note" level="2">
                            <x:layout.sidebar-v2.menu-item name="Debit Note for Revenue" link="{{ route('finance.general-transaction.debit-note.index', ['type' => 'cost']) }}" :activeCondition="Route::is('finance.general-transaction.debit-note.*') && request()->route('type') == 'cost'"  />
                            <x:layout.sidebar-v2.menu-item name="Debit Note for Non-Trade" link="#" />
                        </x:layout.sidebar-v2.dropdown-menu>

                        <x:layout.sidebar-v2.menu-item name="Journal Voucher" link="{{ route('finance.general-transaction.journal-voucher.index') }}" :activeCondition="Route::is('finance.general-transaction.journal-voucher.*')" />

                        <x:layout.sidebar-v2.dropdown-menu name="Receipt Voucher" level="2">
                            <x:layout.sidebar-v2.menu-item name="Receipt Voucher" link="{{ route('finance.general-transaction.receipt-voucher.index', ['type' => 'index']) }}" :activeCondition="Route::is('finance.general-transaction.receipt-voucher.*') && request()->route('type') == 'index'"  />
                            <x:layout.sidebar-v2.menu-item name="Receipt Voucher Overseas" link="{{ route('finance.general-transaction.receipt-voucher.index', ['type' => 'overseas']) }}" :activeCondition="Route::is('finance.general-transaction.receipt-voucher.*') && request()->route('type') == 'overseas'"  />
                            <x:layout.sidebar-v2.menu-item name="Receipt Voucher Cancellation" link="{{ route('finance.general-transaction.receipt-voucher.index', ['type' => 'cancellation']) }}" :activeCondition="Route::is('finance.general-transaction.receipt-voucher.*') && request()->route('type') == 'cancellation'"  />
                        </x:layout.sidebar-v2.dropdown-menu>

                        <x:layout.sidebar-v2.menu-item name="Payment Request" link="{{ route('finance.general-transaction.payment-request.index') }}" :activeCondition="Route::is('finance.general-transaction.payment-request.*')"  />

                        <x:layout.sidebar-v2.dropdown-menu name="Payment Voucher" level="2">
                            <x:layout.sidebar-v2.menu-item name="Payment Voucher" link="{{ route('finance.general-transaction.payment-voucher.index', ['type' => 'index']) }}" :activeCondition="Route::is('finance.general-transaction.payment-voucher.*') && request()->route('type') == 'index'"   />
                            <x:layout.sidebar-v2.menu-item name="Payment Voucher Overseas" link="{{ route('finance.general-transaction.payment-voucher.index', ['type' => 'overseas']) }}" :activeCondition="Route::is('finance.general-transaction.payment-voucher.*') && request()->route('type') == 'overseas'"   />
                            <x:layout.sidebar-v2.menu-item name="Payment Voucher Cancellation" link="{{ route('finance.general-transaction.payment-voucher.index', ['type' => 'cancellation']) }}" :activeCondition="Route::is('finance.general-transaction.payment-voucher.*') && request()->route('type') == 'cancellation'"   />
                        </x:layout.sidebar-v2.dropdown-menu>

                        <x:layout.sidebar-v2.dropdown-menu name="Accrual" level="2">
                            <x:layout.sidebar-v2.menu-item name="Accrual Reverseal" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Accrual Write Off" link="#" />
                        </x:layout.sidebar-v2.dropdown-menu>

                        <x:layout.sidebar-v2.menu-item name="Asset" link="#" />

                        <x:layout.sidebar-v2.dropdown-menu name="Bank" level="2">
                            <x:layout.sidebar-v2.menu-item name="Bank Deposit" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Bank Reconcilliation" link="#" />
                        </x:layout.sidebar-v2.dropdown-menu>

                        <x:layout.sidebar-v2.dropdown-menu name="Cheque" level="2">
                            <x:layout.sidebar-v2.menu-item name="Cheque Clearance" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Cheque Date Override" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Credit Limit Override" link="#" />
                        </x:layout.sidebar-v2.dropdown-menu>

                        <x:layout.sidebar-v2.dropdown-menu name="Local Purchase" level="2">
                            <x:layout.sidebar-v2.menu-item name="Local Purchase Order (Non-Job Order Related)" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Local Purchase Order Enquiry (Non-Job Order Related)" link="#" />
                        </x:layout.sidebar-v2.dropdown-menu>

                        <x:layout.sidebar-v2.dropdown-menu name="Write Off/Setoff" level="2">
                            <x:layout.sidebar-v2.menu-item name="Excess Write Off/Write Back" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Local/Overseas Setoff" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Local/Overseas Setoff Cancellation" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Setoff Detail" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Year End Exchange Transfer" link="#" />
                        </x:layout.sidebar-v2.dropdown-menu>

                        <x:layout.sidebar-v2.dropdown-menu name="IOU" level="2">
                            <x:layout.sidebar-v2.menu-item name="IOU Entry (Request Like Payment Request)" link="#" />
                            <x:layout.sidebar-v2.menu-item name="IOU Request Enquiry" link="#" />
                        </x:layout.sidebar-v2.dropdown-menu>
                    </x:layout.sidebar-v2.dropdown-menu>

                    <x:layout.sidebar-v2.menu-title title="Reports" />

                    <x:layout.sidebar-v2.dropdown-menu name="Finance Reports" iconClass="fe fe-bar-chart">
                        <x:layout.sidebar-v2.menu-item name="Debtors Book" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Creditors Book" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Sales Book" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Cost of Sales Book" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Debtors Aging Statement" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Outstanding Invoice & Aging Statement" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Creditors Aging Statement" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Outstanding Credit Note & Aging Statement" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Job Order Profit (Loss) Statement" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Fixed Asset List Report" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Loan Report" link="#" />
                    </x:layout.sidebar-v2.dropdown-menu>

                    <x:layout.sidebar-v2.dropdown-menu name="Accounting Reports" iconClass="fe fe-book">
                        <x:layout.sidebar-v2.menu-item name="General Ledger Report" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Trial Balance Report" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Balance Sheet Statement" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Profit (Loss) Statement" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Cashflow Statement" link="#" />
                    </x:layout.sidebar-v2.dropdown-menu>


                    <x:layout.sidebar-v2.menu-title title="Others" />

                    <x:layout.sidebar-v2.dropdown-menu name="Settings" iconClass="fe fe-settings">
                        <x:layout.sidebar-v2.menu-item name="User" link="{{ route('settings.user.index') }}" :activeCondition="Route::is('settings.user.*')" />
                        <x:layout.sidebar-v2.menu-item name="Role & Permission" link="{{ route('settings.role-permission.index') }}" :activeCondition="Route::is('settings.role-permission.*')" />
                    </x:layout.sidebar-v2.dropdown-menu>

                    <x:layout.sidebar-v2.menu-item name="Logout" iconClass="fe fe-power" link="{{ route('auth.logout') }}" />
                </ul>
            </div>
        </div>
    </div>
    <!-- /Sidebar -->
