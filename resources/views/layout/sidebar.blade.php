<x:layout.sidebar.app-logo />

<x:layout.sidebar.wrapper>

    <x:layout.sidebar.menu-item
        name="Dashboard"
        iconClass="bx bxs-dashboard"
        link="/"
        :activeCondition="Route::is('dashboard')"
    />

    {{-- Master Data --}}
    <x:layout.sidebar.parent-menu name="Master Data" iconClass="bx bxs-data" :showCondition="Route::is('finance.master-data.*')">
        <x:layout.sidebar.child-menu name="Customer" link="/" />
        <x:layout.sidebar.child-menu name="Customer Contract" link="/" />
        <x:layout.sidebar.child-menu name="Agent Contract" link="/" />
        <x:layout.sidebar.child-menu name="Country" link="/" />
        <x:layout.sidebar.child-menu name="Port" link="{{ route('finance.master-data.port.index') }}" :activeCondition="Route::is('finance.master-data.port.*')" />
        {{-- <x:layout.sidebar.child-menu name="Billing Customer" link="{{ route('finance.master-data.customerforbilling.index') }}" :activeCondition="Route::is('finance.master-data.customerforbilling.*')" /> --}}
        <x:layout.sidebar.child-menu name="Service Type" link="{{ route('finance.master-data.service-type.index') }}" :activeCondition="Route::is('finance.master-data.service-type.*')" />
        <x:layout.sidebar.child-menu name="GL Charge Master" link="{{ route('finance.master-data.charge.index') }}" :activeCondition="Route::is('finance.master-data.charge.*')" />
        <x:layout.sidebar.child-menu name="Unit" link="{{ route('finance.master-data.unit.index') }}" :activeCondition="Route::is('finance.master-data.unit.*')" />
        <x:layout.sidebar.child-menu name="Payment Method" link="{{ route('finance.master-data.payment-method.index') }}" :activeCondition="Route::is('finance.master-data.payment-method.*')" />
        <x:layout.sidebar.child-menu name="Currency" link="{{ route('finance.master-data.currency.index') }}" :activeCondition="Route::is('finance.master-data.currency.*')" />
        <x:layout.sidebar.child-menu name="Chart of Account" link="{{ route('finance.master-data.chart-of-account.index') }}" :activeCondition="Route::is('finance.master-data.chart-of-account.*')" />
        <x:layout.sidebar.child-menu name="Daybook" link="{{ route('finance.master-data.daybook.index') }}" :activeCondition="Route::is('finance.master-data.daybook.*')" />
        {{-- <x:layout.sidebar.child-menu name="Fixed Asset" link="{{ route('finance.master-data.fixed-asset.index') }}" :activeCondition="Route::is('finance.master-data.fixed-asset.*')" />
        <x:layout.sidebar.child-menu name="Tonnage" link="/" />
        <x:layout.sidebar.child-menu name="Container" link="/" /> --}}
    </x:layout.sidebar.parent-menu>

    {{-- General Wise --}}
    <x:layout.sidebar.parent-menu name="General Wise" iconClass="bx bxs-file">
        <x:layout.sidebar.parent-menu name="Shipments" iconClass="bx bxs-file">
            <x:layout.sidebar.child-menu name="Sea Air" link="/" />
            <x:layout.sidebar.child-menu name="Cross Air" link="/" />
            <x:layout.sidebar.child-menu name="Sea Import" link="/" />
            <x:layout.sidebar.child-menu name="Sea Export" link="/" />
            <x:layout.sidebar.child-menu name="Air Import" link="/" />
            <x:layout.sidebar.child-menu name="Air Export" link="/" />
            <x:layout.sidebar.child-menu name="Warehouse" link="/" />
            <x:layout.sidebar.child-menu name="Trucking" link="/" />
            <x:layout.sidebar.child-menu name="Courier" link="/" />
        </x:layout.sidebar.parent-menu>
        <x:layout.sidebar.child-menu name="Job Order" link="/" />
        <x:layout.sidebar.child-menu name="CTD" link="/" />
        <x:layout.sidebar.child-menu name="Customer" link="/" />
        <x:layout.sidebar.child-menu name="Container" link="/" />
        <x:layout.sidebar.child-menu name="Tonnage" link="/" />
        <x:layout.sidebar.child-menu name="Vessel" link="/" />
        <x:layout.sidebar.child-menu name="Shipping Line" link="/" />
        <x:layout.sidebar.child-menu name="Carrier" link="/" />
    </x:layout.sidebar.parent-menu>

    {{-- Billing --}}
    <x:layout.sidebar.parent-menu name="Billing" iconClass="bx bxs-file">
        <x:layout.sidebar.child-menu name="Generate Invoice" link="/" />
        <x:layout.sidebar.child-menu name="Invoice List" link="/" />
    </x:layout.sidebar.parent-menu>

    {{-- Costing --}}
    <x:layout.sidebar.parent-menu name="Costing" iconClass="bx bxs-file">
        <x:layout.sidebar.child-menu name="Sea Air" link="/" />
        <x:layout.sidebar.child-menu name="Cross Air" link="/" />
        <x:layout.sidebar.parent-menu name="Dubai Business" iconClass="bx bxs-file">
            <x:layout.sidebar.child-menu name="Sea Import" link="/" />
            <x:layout.sidebar.child-menu name="Sea Export" link="/" />
            <x:layout.sidebar.child-menu name="Air Import" link="/" />
            <x:layout.sidebar.child-menu name="Air Export" link="/" />
            <x:layout.sidebar.child-menu name="Warehouse" link="/" />
            <x:layout.sidebar.child-menu name="Trucking" link="/" />
            <x:layout.sidebar.child-menu name="Courier" link="/" />
        </x:layout.sidebar.parent-menu>
    </x:layout.sidebar.parent-menu>

    {{-- General Transaction --}}
    <x:layout.sidebar.parent-menu name="General Transaction" iconClass="bx bxs-file">
        <x:layout.sidebar.child-menu name="Creditor Journal Voucher" link="/" />
        <x:layout.sidebar.parent-menu name="Credit Note" iconClass="bx bxs-file">
            <x:layout.sidebar.child-menu name="Credit Note for Cost" link="/" />
            <x:layout.sidebar.child-menu name="Credit Note for Revenue" link="/" />
            <x:layout.sidebar.child-menu name="Credit Note for Non Trade" link="/" />
        </x:layout.sidebar.parent-menu>
        <x:layout.sidebar.parent-menu name="Debit Note" iconClass="bx bxs-file">
            <x:layout.sidebar.child-menu name="Credit Note for Revenue" link="/" />
            <x:layout.sidebar.child-menu name="Credit Note for Non Trade" link="/" />
        </x:layout.sidebar.parent-menu>
        <x:layout.sidebar.child-menu name="Journal Voucher" link="/" />
        <x:layout.sidebar.parent-menu name="Receipt Voucher" iconClass="bx bxs-file">
            <x:layout.sidebar.child-menu name="Receipt Voucher" link="/" />
            <x:layout.sidebar.child-menu name="Receipt Voucher Overseas" link="/" />
            <x:layout.sidebar.child-menu name="Receipt Voucher Cancellation" link="/" />
        </x:layout.sidebar.parent-menu>
        <x:layout.sidebar.child-menu name="Payment Request" link="/" />
        <x:layout.sidebar.parent-menu name="Payment Voucher" iconClass="bx bxs-file">
            <x:layout.sidebar.child-menu name="Payment Voucher" link="/" />
            <x:layout.sidebar.child-menu name="Payment Voucher Overseas" link="/" />
            <x:layout.sidebar.child-menu name="Payment Voucher Cancellation" link="/" />
        </x:layout.sidebar.parent-menu>
        <x:layout.sidebar.parent-menu name="Accrual" iconClass="bx bxs-file">
            <x:layout.sidebar.child-menu name="Accrual Reversal" link="/" />
            <x:layout.sidebar.child-menu name="Accrual Write Off" link="/" />
        </x:layout.sidebar.parent-menu>
        <x:layout.sidebar.child-menu name="Asset" link="/" />
        <x:layout.sidebar.parent-menu name="Bank" iconClass="bx bxs-file">
            <x:layout.sidebar.child-menu name="Bank Deposit" link="/" />
            <x:layout.sidebar.child-menu name="Bank Reconcilliation" link="/" />
        </x:layout.sidebar.parent-menu>
        <x:layout.sidebar.parent-menu name="Cheque" iconClass="bx bxs-file">
            <x:layout.sidebar.child-menu name="Cheque Clearance" link="/" />
            <x:layout.sidebar.child-menu name="Cheque Date Override" link="/" />
            <x:layout.sidebar.child-menu name="Credit Limit Override" link="/" />
        </x:layout.sidebar.parent-menu>
        <x:layout.sidebar.parent-menu name="Local Purchase" iconClass="bx bxs-file">
            <x:layout.sidebar.child-menu name="Local Purchase Order (Non-Job Order Related)" link="/" />
            <x:layout.sidebar.child-menu name="Local Purchase Order Enquiry (Non-Job Order Related)" link="/" />
        </x:layout.sidebar.parent-menu>
        <x:layout.sidebar.parent-menu name="Write Off/Setoff" iconClass="bx bxs-file">
            <x:layout.sidebar.child-menu name="Excess Write Off/Write Back" link="/" />
            <x:layout.sidebar.child-menu name="Local/Overseas Setoff" link="/" />
            <x:layout.sidebar.child-menu name="Local/Overseas Setoff Cancellation" link="/" />
            <x:layout.sidebar.child-menu name="Setoff Detail" link="/" />
            <x:layout.sidebar.child-menu name="Year End Exchange Transfer" link="/" />
        </x:layout.sidebar.parent-menu>
        <x:layout.sidebar.parent-menu name="IOU" iconClass="bx bxs-file">
            <x:layout.sidebar.child-menu name="IOU Entry (Request Like Payment Request)" link="/" />
            <x:layout.sidebar.child-menu name="IOU Request Enquiry" link="/" />
        </x:layout.sidebar.parent-menu>
    </x:layout.sidebar.parent-menu>

    {{-- Finance Report --}}
    <x:layout.sidebar.parent-menu name="Finance Reports" iconClass="bx bxs-file">
        <x:layout.sidebar.child-menu name="Debtors Book" link="/" />
        <x:layout.sidebar.child-menu name="Creditors Book" link="/" />
        <x:layout.sidebar.child-menu name="Sales Book" link="/" />
        <x:layout.sidebar.child-menu name="Cost of Sales Book" link="/" />
        <x:layout.sidebar.child-menu name="Debtors Aging Statement" link="/" />
        <x:layout.sidebar.child-menu name="Outstanding Invoice & Aging Statement" link="/" />
        <x:layout.sidebar.child-menu name="Creditors Aging Statement" link="/" />
        <x:layout.sidebar.child-menu name="Outstanding Credit Note & Aging Statement" link="/" />
        <x:layout.sidebar.child-menu name="Job Order Profit (Loss) Statement" link="/" />
        <x:layout.sidebar.child-menu name="Fixed Asset List Report" link="/" />
        <x:layout.sidebar.child-menu name="Loan Report" link="/" />
    </x:layout.sidebar.parent-menu>

    {{-- Accounting --}}
    <x:layout.sidebar.parent-menu name="Accounting" iconClass="bx bxs-file">
        <x:layout.sidebar.child-menu name="General Ledger Report" link="/" />
        <x:layout.sidebar.child-menu name="Trial Balance Report" link="/" />
        <x:layout.sidebar.child-menu name="Balance Sheet Statement" link="/" />
        <x:layout.sidebar.child-menu name="Profit (Loss) Statement" link="/" />
        <x:layout.sidebar.child-menu name="Cashflow Statement" link="/" />
    </x:layout.sidebar.parent-menu>

    {{-- Accounting --}}
    <x:layout.sidebar.parent-menu name="Settings" iconClass="bx bx-cog">
        <x:layout.sidebar.child-menu name="User" link="/" />
        <x:layout.sidebar.child-menu name="Role & Permission" link="{{ route('settings.role-permission.index') }}" />
    </x:layout.sidebar.parent-menu>

</x:layout.sidebar.wrapper>
