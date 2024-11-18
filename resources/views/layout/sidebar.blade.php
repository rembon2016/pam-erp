<x:layout.sidebar.app-logo />

<x:layout.sidebar.wrapper>

    <x:layout.sidebar.menu-item name="Dashboard" iconClass="bx bxs-dashboard" link="/" />

    {{-- Master Data --}}
    <x:layout.sidebar.parent-menu name="Master Data" iconClass="bx bxs-data">
        <x:layout.sidebar.child-menu name="Job Order" link="/" />
        <x:layout.sidebar.child-menu name="CTD Wise" link="/" />
        <x:layout.sidebar.child-menu name="Customer" link="/" />
        <x:layout.sidebar.child-menu name="Billing Customer" link="{{ route('finance.master-data.customerforbilling.index') }}" />
        <x:layout.sidebar.child-menu name="Contract" link="/" />
        <x:layout.sidebar.child-menu name="Charge Master" link="/" />
        <x:layout.sidebar.child-menu name="Service Type" link="{{ route('finance.master-data.service-type.index') }}" />
        <x:layout.sidebar.child-menu name="Carrierwise" link="/" />
        <x:layout.sidebar.child-menu name="Unit Code" link="/" />
        <x:layout.sidebar.child-menu name="Tonnage" link="/" />
        <x:layout.sidebar.child-menu name="Container" link="/" />
        <x:layout.sidebar.child-menu name="Payment Method" link="/" />
        <x:layout.sidebar.child-menu name="Currency" link="{{ route('finance.master-data.currency.index') }}" />
        <x:layout.sidebar.child-menu name="Chart of Account" link="{{ route('finance.master-data.chart-of-account.index') }}" />
        <x:layout.sidebar.child-menu name="Fixed Asset" link="{{ route('finance.master-data.fixed-asset.index') }}" />
    </x:layout.sidebar.parent-menu>

    {{-- Job Order --}}
    <x:layout.sidebar.parent-menu name="Job Order" iconClass="bx bxs-file">
        <x:layout.sidebar.parent-menu name="Billing" iconClass="bx bxs-file">
            <x:layout.sidebar.child-menu name="Job Order & Shipment List" link="/" />
            <x:layout.sidebar.child-menu name="Journal Voucher" link="/" />
            <x:layout.sidebar.child-menu name="Invoice" link="/" />
            <x:layout.sidebar.child-menu name="Receipt Voucher" link="/" />
            <x:layout.sidebar.child-menu name="Debtors Book" link="/" />
            <x:layout.sidebar.child-menu name="Sales Book" link="/" />
        </x:layout.sidebar.parent-menu>
        <x:layout.sidebar.parent-menu name="Costing" iconClass="bx bx-dollar">
            <x:layout.sidebar.child-menu name="Job Order & Shipment List" link="/" />
            <x:layout.sidebar.child-menu name="Cost Calculation" link="/" />
            <x:layout.sidebar.child-menu name="Journal Voucher" link="/" />
            <x:layout.sidebar.child-menu name="Credit Note" link="/" />
            <x:layout.sidebar.child-menu name="Payment Request" link="/" />
            <x:layout.sidebar.child-menu name="Payment Voucher" link="/" />
            <x:layout.sidebar.child-menu name="Creditors Book" link="/" />
            <x:layout.sidebar.child-menu name="Cost of Sales Book" link="/" />
        </x:layout.sidebar.parent-menu>
    </x:layout.sidebar.parent-menu>

    {{-- Non Job Order --}}
    <x:layout.sidebar.parent-menu name="Non Job Order" iconClass="bx bxs-file">
        <x:layout.sidebar.parent-menu name="Asset Accounts" iconClass="bx bx-line-chart">
            <x:layout.sidebar.child-menu name="Journal Voucher" link="/" />
            <x:layout.sidebar.child-menu name="Debit Note" link="/" />
            <x:layout.sidebar.child-menu name="Credit Note" link="/" />
            <x:layout.sidebar.child-menu name="Receipt Voucher" link="/" />
            <x:layout.sidebar.child-menu name="Payment Request" link="/" />
            <x:layout.sidebar.child-menu name="Payment Voucher" link="/" />
        </x:layout.sidebar.parent-menu>
        <x:layout.sidebar.parent-menu name="Liabilities Accounts" iconClass="bx bxs-coin-stack">
            <x:layout.sidebar.child-menu name="Journal Voucher" link="/" />
            <x:layout.sidebar.child-menu name="Receipt Voucher" link="/" />
            <x:layout.sidebar.child-menu name="Payment Request" link="/" />
            <x:layout.sidebar.child-menu name="Payment Voucher" link="/" />
        </x:layout.sidebar.parent-menu>
        <x:layout.sidebar.parent-menu name="Other Income" iconClass="bx bx-dollar">
            <x:layout.sidebar.child-menu name="Journal Voucher" link="/" />
            <x:layout.sidebar.child-menu name="Receipt Voucher" link="/" />
            <x:layout.sidebar.child-menu name="Payment Request" link="/" />
            <x:layout.sidebar.child-menu name="Payment Voucher" link="/" />
        </x:layout.sidebar.parent-menu>
    </x:layout.sidebar.parent-menu>

    {{-- Finance Report --}}
    <x:layout.sidebar.parent-menu name="Finance Reports" iconClass="bx bxs-file">
        <x:layout.sidebar.child-menu name="Vendor Invoice Comparison" link="/" />
        <x:layout.sidebar.child-menu name="Job Order Profit (Loss) Statement" link="/" />
        <x:layout.sidebar.child-menu name="Billed Customer (Debtors)-Aging Statement" link="/" />
        <x:layout.sidebar.child-menu name="Outstanding Invoice & Aging Statement" link="/" />
        <x:layout.sidebar.child-menu name="Paid Customer (Creditors)-Aging Statement" link="/" />
        <x:layout.sidebar.child-menu name="Outstanding Credit Note & Aging Statement" link="/" />
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
        <x:layout.sidebar.child-menu name="Role & Permission" link="{{ route('settings.role-permission.index') }}" />
    </x:layout.sidebar.parent-menu>

</x:layout.sidebar.wrapper>
