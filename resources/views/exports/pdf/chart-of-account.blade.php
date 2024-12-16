<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>List Chart of Account</title>
    <style>
        html {
            margin: 0;
            padding: 0;
            margin-top: 10px;
        }

        .logo {
            width: 80px;
        }

        body {
            background-color: white;
            padding: 0 20px;
        }

        table {
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol';
            position: relative;
            -premailer-cellpadding: 0;
            -premailer-cellspacing: 0;
            -premailer-width: 570px;
            background-color: #ffffff;
            border-color: #000;
            border-collapse: collapse;
            border-radius: 2px;
            border-width: none;
            border-spacing: 0;
            box-shadow: 0 2px 0 rgba(0, 0, 150, 0.025), 2px 4px 0 rgba(0, 0, 150, 0.015);
            margin: 0 auto;
            padding: 0;
            width: 100%;
        }

        .page-break {
            page-break-after: always;
        }
    </style>
</head>

<body>

    <h1 align="center" style="margin-bottom: 30px;">List Chart of Account</h1>

    <table border="1" cellpadding="5">
        <thead>
            <tr>
                <th>Account Code</th>
                <th>Account Name</th>
            </tr>
        </thead>
        <tbody>
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
                    $chartOfAccounts = $subAccountGroup->chartOfAccounts()->orderBy('account_number', 'asc')->get();
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
                            <div class="btn-group">
                                <a href="{{ route('finance.master-data.chart-of-account.edit', $chartOfAccount->id) }}"
                                    class="btn btn-success btn-sm btn-icon">
                                    <i class="fa fa-edit"></i>
                                </a>
                            </div>
                        </td>
                    </tr>
                @endforeach
            @endforeach
            </tr>
            @endforeach
        </tbody>
    </table>
</body>

</html>
