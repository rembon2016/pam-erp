<?php

return [
    'api' => [
        'origin' => env('API_ORIGIN', 'http://127.0.0.1:8000'),
        'dxb' => env('API_DXB', 'http://127.0.0.1:8000'),
    ],
    'logichain' => [
        'frontend' => env('FRONTEND_URL', 'http://203.175.10.178:8082/'),
    ],
];
