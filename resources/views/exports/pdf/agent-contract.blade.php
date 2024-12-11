<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>List Agent Contract</title>
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

    <h1 align="center" style="margin-bottom: 30px;">List Agent Contract</h1>

    <table border="1" cellpadding="5">
        <thead>
            <tr>
                <th>No</th>
                <th>Contract No</th>
                <th>Customer Code</th>
                <th>Customer Name</th>
                <th>Contract Date</th>
                <th>Contract Start Date</th>
                <th>Contract End Date</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($data as $item)
                <tr>
                    <td align="center">{{ $loop->iteration }}</td>
                    <td align="center">{{ $item->contract_no }}</td>
                    <td>{{ $item->customer?->customer_code }}</td>
                    <td>{{ $item->customer?->customer_name }}</td>
                    <td align="center">{{ $item->contract_date?->format('d/m/Y') }}</td>
                    <td align="center">{{ $item->contract_start?->format('d/m/Y') }}</td>
                    <td align="center">{{ $item->contract_end?->format('d/m/Y') }}</td>
                    <td>{{ $item->contract_description }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>
