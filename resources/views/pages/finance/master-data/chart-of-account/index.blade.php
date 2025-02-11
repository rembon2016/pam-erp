@extends('layout.main-layout')
@section('title', 'Chart of Account')

@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="Chart of Account">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
        <x:layout.breadcrumb.item pageName="Chart of Account"
            href="{{ route('finance.master-data.chart-of-account.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>
            <x:layout.card.toolbar createDataLink="{{ route('finance.master-data.chart-of-account.create') }}"
                :customLink="[
                    'link' => route('finance.master-data.chart-of-account.create.multiple'),
                    'text' => 'Add Multiple COA',
                    'icon' => 'bx bx-plus'
                ]"
                exportExcelLink="{{ route('finance.master-data.chart-of-account.export.excel') }}"
                exportCsvLink="{{ route('finance.master-data.chart-of-account.export.csv') }}"
                exportPdfLink="{{ route('finance.master-data.chart-of-account.export.pdf') }}" />
        </x:layout.card.header>
        <x:layout.card.body>
            <x:layout.table.wrapper id="charge_table">
                <thead>
                    <x:layout.table.row>
                        <x:layout.table.heading widthPixel="100" title="Account Code" />
                        <x:layout.table.heading widthPixel="100" title="Account Name" />
                        <x:layout.table.heading widthPixel="100" title="Action" />
                    </x:layout.table.row>
                </thead>
                <tbody class="fw-semibold text-gray-600">
                    @foreach ($accountGroups as $accountGroup)
                        <tr>
                            <td>
                                <div>
                                    <dt class="font-weight-bold"> {{ $accountGroup->code }} </dt>
                                </div>
                            </td>
                            <td>
                                <div>
                                    <dt class="font-weight-bold"> {{ $accountGroup->name }} </dt>
                                </div>
                            </td>
                            @foreach ($accountGroup->subAccountGroups as $subAccountGroup)
                                <tr>
                                    <td>
                                        <div style="margin-left:20px;">
                                            <dt class="font-weight-bold">{{ $subAccountGroup->code }}
                                    </td>
                                    <td>
                                        <div style="margin-left:20px;">
                                            <dt class="font-weight-bold">{{ $subAccountGroup->name }}</dt>
                                        </div>
                                    </td>
                                </tr>
                                @php
                                    $chartOfAccounts = $subAccountGroup->chartOfAccounts()
                                        ->orderBy('account_number', 'asc')
                                        ->get();
                                @endphp
                                @foreach ($chartOfAccounts as $chartOfAccount)
                                    <tr>
                                        <td>
                                            <div style="margin-left:40px;">{{ $chartOfAccount->account_number }}</div>
                                        </td>
                                        </td>

                                        <td>
                                            <div style="margin-left:40px;">{{ $chartOfAccount->account_name }}</div>
                                        </td>
                                        <td>
                                            <a href="{{ route('finance.master-data.chart-of-account.edit', $chartOfAccount->id) }}" class="btn btn-success text-white">
                                                <i class="fa fa-edit"></i>
                                            </a>
                                        </td>
                                    </tr>
                                @endforeach
                            @endforeach
                        </tr>
                    @endforeach
                </tbody>
            </x:layout.table.wrapper>
        </x:layout.card.body>
    </x:layout.card.wrapper>
@endsection

@push('js')

<script>
    $(document).ready(function () {
        $('.data-search').keyup(function (e) {
            let keyboardKey = e.key
            let coaTableUrl = "{{ route('finance.master-data.chart-of-account.index') }}"

            if (keyboardKey == 'Enter') {
                let searchInput = $(this).val()
                coaTableUrl = coaTableUrl + '?search=' + searchInput

                window.location.href = coaTableUrl
            }
        })
    })
</script>

@endpush
