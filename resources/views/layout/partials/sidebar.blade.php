<!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <div class="sidebar-inner slimscroll">
            <div id="sidebar-menu" class="sidebar-menu">
                <ul class="sidebar-vertical">
                    <!-- Main -->
                    <x:layout.sidebar-v2.menu-title title="Main Menu" />
                    <x:layout.sidebar-v2.menu-item name="Dashboard" iconClass="fe fe-home" link="{{ route('dashboard') }}" :activeCondition="Route::is('dashboard')" />

                    <x:layout.sidebar-v2.dropdown-menu name="Master Data" iconClass="fe fe-grid">
                        <x:layout.sidebar-v2.menu-item name="Customer" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Customer Contract" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Agent Contract" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Country" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Port" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Service Type" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Unit" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Payment Method" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Currency" link="#" />
                        <x:layout.sidebar-v2.menu-item name="GL Charge Master" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Chart of Account" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Daybook" link="{{ route('finance.master-data.daybook.index') }}" :activeCondition="Route::is('finance.master-data.daybook.*')" />
                    </x:layout.sidebar-v2.dropdown-menu>

                    <x:layout.sidebar-v2.dropdown-menu name="General Wise" iconClass="fe fe-grid">
                        <x:layout.sidebar-v2.dropdown-menu name="Shipments" level="2">
                            <x:layout.sidebar-v2.menu-item name="Sea Air" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Cross Air" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Sea Import" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Sea Export" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Air Import" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Air Export" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Warehouse" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Trucking" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Courier" link="#" />
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

                    <x:layout.sidebar-v2.dropdown-menu name="Billing" iconClass="fe fe-grid">
                        <x:layout.sidebar-v2.menu-item name="Generate Invoice" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Invoice List" link="#" />
                    </x:layout.sidebar-v2.dropdown-menu>

                    <x:layout.sidebar-v2.dropdown-menu name="Costing" iconClass="fe fe-grid">
                        <x:layout.sidebar-v2.menu-item name="Sea Air" link="#" />
                        <x:layout.sidebar-v2.menu-item name="Cross Air" link="#" />
                        <x:layout.sidebar-v2.dropdown-menu name="Dubai Business" level="2">
                            <x:layout.sidebar-v2.menu-item name="Sea Air" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Cross Air" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Sea Import" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Sea Export" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Air Import" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Air Export" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Warehouse" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Trucking" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Courier" link="#" />
                        </x:layout.sidebar-v2.dropdown-menu>
                    </x:layout.sidebar-v2.dropdown-menu>

                    <x:layout.sidebar-v2.dropdown-menu name="General Transaction" iconClass="fe fe-grid">
                        <x:layout.sidebar-v2.menu-item name="Creditor Journal Voucher" link="#" />

                        <x:layout.sidebar-v2.dropdown-menu name="Credit Note" level="2">
                            <x:layout.sidebar-v2.menu-item name="Credit Note for Cost" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Credit Note for Revenue" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Credit Note for Non-Trade" link="#" />
                        </x:layout.sidebar-v2.dropdown-menu>

                        <x:layout.sidebar-v2.dropdown-menu name="Debit Note" level="2">
                            <x:layout.sidebar-v2.menu-item name="Debit Note for Revenue" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Debit Note for Non-Trade" link="#" />
                        </x:layout.sidebar-v2.dropdown-menu>

                        <x:layout.sidebar-v2.menu-item name="Journal Voucher" link="#" />

                        <x:layout.sidebar-v2.dropdown-menu name="Receipt Voucher" level="2">
                            <x:layout.sidebar-v2.menu-item name="Receipt Voucher" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Receipt Voucher Overseas" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Receipt Voucher Cancellation" link="#" />
                        </x:layout.sidebar-v2.dropdown-menu>

                        <x:layout.sidebar-v2.menu-item name="Payment Request" link="#" />

                        <x:layout.sidebar-v2.dropdown-menu name="Payment Voucher" level="2">
                            <x:layout.sidebar-v2.menu-item name="Payment Voucher" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Payment Voucher Overseas" link="#" />
                            <x:layout.sidebar-v2.menu-item name="Payment Voucher Cancellation" link="#" />
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

                    <x:layout.sidebar-v2.dropdown-menu name="Finance Reports" iconClass="fe fe-grid">
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

                    <x:layout.sidebar-v2.dropdown-menu name="Accounting Reports" iconClass="fe fe-grid">
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
