<?php

declare(strict_types=1);

return [

    /*
    |--------------------------------------------------------------------------
    | Baris Bahasa Validasi
    |--------------------------------------------------------------------------
    |
    | Baris bahasa berikut berisi pesan kesalahan default yang digunakan oleh
    | kelas validator. Beberapa aturan ini memiliki beberapa versi seperti
    | aturan ukuran. Jangan ragu untuk menyesuaikan setiap pesan di sini.
    |
    */

    'accepted' => 'Bidang :attribute harus diterima.',
    'accepted_if' => 'Bidang :attribute harus diterima ketika :other adalah :value.',
    'active_url' => 'Bidang :attribute harus berupa URL yang valid.',
    'after' => 'Bidang :attribute harus berupa tanggal setelah :date.',
    'after_or_equal' => 'Bidang :attribute harus berupa tanggal setelah atau sama dengan :date.',
    'alpha' => 'Bidang :attribute hanya boleh berisi huruf.',
    'alpha_dash' => 'Bidang :attribute hanya boleh berisi huruf, angka, tanda hubung, dan garis bawah.',
    'alpha_num' => 'Bidang :attribute hanya boleh berisi huruf dan angka.',
    'array' => 'Bidang :attribute harus berupa array.',
    'ascii' => 'Bidang :attribute hanya boleh berisi karakter alfanumerik dan simbol byte tunggal.',
    'before' => 'Bidang :attribute harus berupa tanggal sebelum :date.',
    'before_or_equal' => 'Bidang :attribute harus berupa tanggal sebelum atau sama dengan :date.',
    'between' => [
        'array' => 'Bidang :attribute harus memiliki antara :min dan :max item.',
        'file' => 'Bidang :attribute harus berukuran antara :min dan :max kilobyte.',
        'numeric' => 'Bidang :attribute harus bernilai antara :min dan :max.',
        'string' => 'Bidang :attribute harus berisi antara :min dan :max karakter.',
    ],
    'boolean' => 'Bidang :attribute harus bernilai true atau false.',
    'can' => 'Bidang :attribute berisi nilai yang tidak diizinkan.',
    'confirmed' => 'Konfirmasi bidang :attribute tidak cocok.',
    'contains' => 'Bidang :attribute tidak memiliki nilai yang diperlukan.',
    'current_password' => 'Kata sandi salah.',
    'date' => 'Bidang :attribute harus berupa tanggal yang valid.',
    'date_equals' => 'Bidang :attribute harus berupa tanggal yang sama dengan :date.',
    'date_format' => 'Bidang :attribute harus sesuai dengan format :format.',
    'decimal' => 'Bidang :attribute harus memiliki :decimal tempat desimal.',
    'declined' => 'Bidang :attribute harus ditolak.',
    'declined_if' => 'Bidang :attribute harus ditolak ketika :other adalah :value.',
    'different' => 'Bidang :attribute dan :other harus berbeda.',
    'digits' => 'Bidang :attribute harus terdiri dari :digits digit.',
    'digits_between' => 'Bidang :attribute harus terdiri dari :min hingga :max digit.',
    'dimensions' => 'Bidang :attribute memiliki dimensi gambar yang tidak valid.',
    'distinct' => 'Bidang :attribute memiliki nilai duplikat.',
    'doesnt_end_with' => 'Bidang :attribute tidak boleh diakhiri dengan salah satu dari berikut: :values.',
    'doesnt_start_with' => 'Bidang :attribute tidak boleh dimulai dengan salah satu dari berikut: :values.',
    'email' => 'Bidang :attribute harus berupa alamat email yang valid.',
    'ends_with' => 'Bidang :attribute harus diakhiri dengan salah satu dari berikut: :values.',
    'enum' => ':attribute yang dipilih tidak valid.',
    'exists' => ':attribute yang dipilih tidak valid.',
    'extensions' => 'Bidang :attribute harus memiliki salah satu ekstensi berikut: :values.',
    'file' => 'Bidang :attribute harus berupa file.',
    'filled' => 'Bidang :attribute harus memiliki nilai.',
    'gt' => [
        'array' => 'Bidang :attribute harus memiliki lebih dari :value item.',
        'file' => 'Bidang :attribute harus lebih besar dari :value kilobyte.',
        'numeric' => 'Bidang :attribute harus lebih besar dari :value.',
        'string' => 'Bidang :attribute harus lebih besar dari :value karakter.',
    ],
    'gte' => [
        'array' => 'Bidang :attribute harus memiliki :value item atau lebih.',
        'file' => 'Bidang :attribute harus lebih besar dari atau sama dengan :value kilobyte.',
        'numeric' => 'Bidang :attribute harus lebih besar dari atau sama dengan :value.',
        'string' => 'Bidang :attribute harus lebih besar dari atau sama dengan :value karakter.',
    ],
    'hex_color' => 'Bidang :attribute harus berupa warna heksadesimal yang valid.',
    'image' => 'Bidang :attribute harus berupa gambar.',
    'in' => ':attribute yang dipilih tidak valid.',
    'in_array' => 'Bidang :attribute harus ada di :other.',
    'integer' => 'Bidang :attribute harus berupa bilangan bulat.',
    'ip' => 'Bidang :attribute harus berupa alamat IP yang valid.',
    'ipv4' => 'Bidang :attribute harus berupa alamat IPv4 yang valid.',
    'ipv6' => 'Bidang :attribute harus berupa alamat IPv6 yang valid.',
    'json' => 'Bidang :attribute harus berupa string JSON yang valid.',
    'list' => 'Bidang :attribute harus berupa daftar.',
    'lowercase' => 'Bidang :attribute harus berupa huruf kecil.',
    'lt' => [
        'array' => 'Bidang :attribute harus memiliki kurang dari :value item.',
        'file' => 'Bidang :attribute harus kurang dari :value kilobyte.',
        'numeric' => 'Bidang :attribute harus kurang dari :value.',
        'string' => 'Bidang :attribute harus kurang dari :value karakter.',
    ],
    'lte' => [
        'array' => 'Bidang :attribute tidak boleh memiliki lebih dari :value item.',
        'file' => 'Bidang :attribute harus kurang dari atau sama dengan :value kilobyte.',
        'numeric' => 'Bidang :attribute harus kurang dari atau sama dengan :value.',
        'string' => 'Bidang :attribute harus kurang dari atau sama dengan :value karakter.',
    ],
    'mac_address' => 'Bidang :attribute harus berupa alamat MAC yang valid.',
    'max' => [
        'array' => 'Bidang :attribute tidak boleh memiliki lebih dari :max item.',
        'file' => 'Bidang :attribute tidak boleh lebih besar dari :max kilobyte.',
        'numeric' => 'Bidang :attribute tidak boleh lebih besar dari :max.',
        'string' => 'Bidang :attribute tidak boleh lebih besar dari :max karakter.',
    ],
    'max_digits' => 'Bidang :attribute tidak boleh memiliki lebih dari :max digit.',
    'mimes' => 'Bidang :attribute harus berupa file dengan tipe: :values.',
    'mimetypes' => 'Bidang :attribute harus berupa file dengan tipe: :values.',
    'min' => [
        'array' => 'Bidang :attribute harus memiliki setidaknya :min item.',
        'file' => 'Bidang :attribute harus berukuran minimal :min kilobyte.',
        'numeric' => 'Bidang :attribute harus minimal :min.',
        'string' => 'Bidang :attribute harus berisi minimal :min karakter.',
    ],
    'min_digits' => 'Bidang :attribute harus memiliki setidaknya :min digit.',
    'missing' => 'Bidang :attribute harus tidak ada.',
    'missing_if' => 'Bidang :attribute harus tidak ada ketika :other adalah :value.',
    'missing_unless' => 'Bidang :attribute harus tidak ada kecuali :other adalah :value.',
    'missing_with' => 'Bidang :attribute harus tidak ada ketika :values ada.',
    'missing_with_all' => 'Bidang :attribute harus tidak ada ketika :values ada.',
    'multiple_of' => 'Bidang :attribute harus merupakan kelipatan dari :value.',
    'not_in' => ':attribute yang dipilih tidak valid.',
    'not_regex' => 'Format bidang :attribute tidak valid.',
    'numeric' => 'Bidang :attribute harus berupa angka.',
    'password' => [
        'letters' => 'Bidang :attribute harus mengandung setidaknya satu huruf.',
        'mixed' => 'Bidang :attribute harus mengandung setidaknya satu huruf besar dan satu huruf kecil.',
        'numbers' => 'Bidang :attribute harus mengandung setidaknya satu angka.',
        'symbols' => 'Bidang :attribute harus mengandung setidaknya satu simbol.',
        'uncompromised' => ':attribute yang diberikan telah muncul dalam kebocoran data. Harap pilih :attribute yang berbeda.',
    ],
    'present' => 'Bidang :attribute harus ada.',
    'present_if' => 'Bidang :attribute harus ada ketika :other adalah :value.',
    'present_unless' => 'Bidang :attribute harus ada kecuali :other adalah :value.',
    'present_with' => 'Bidang :attribute harus ada ketika :values ada.',
    'present_with_all' => 'Bidang :attribute harus ada ketika :values ada.',
    'prohibited' => 'Bidang :attribute dilarang.',
    'prohibited_if' => 'Bidang :attribute dilarang ketika :other adalah :value.',
    'prohibited_unless' => 'Bidang :attribute dilarang kecuali :other ada dalam :values.',
    'prohibits' => 'Bidang :attribute melarang :other untuk hadir.',
    'regex' => 'Format bidang :attribute tidak valid.',
    'required' => 'Bidang :attribute wajib diisi.',
    'required_array_keys' => 'Bidang :attribute harus berisi entri untuk: :values.',
    'required_if' => 'Bidang :attribute wajib diisi ketika :other adalah :value.',
    'required_if_accepted' => 'Bidang :attribute wajib diisi ketika :other diterima.',
    'required_if_declined' => 'Bidang :attribute wajib diisi ketika :other ditolak.',
    'required_unless' => 'Bidang :attribute wajib diisi kecuali :other ada dalam :values.',
    'required_with' => 'Bidang :attribute wajib diisi ketika :values ada.',
    'required_with_all' => 'Bidang :attribute wajib diisi ketika :values ada.',
    'required_without' => 'Bidang :attribute wajib diisi ketika :values tidak ada.',
    'required_without_all' => 'Bidang :attribute wajib diisi ketika tidak ada :values yang ada.',
    'same' => 'Bidang :attribute harus sama dengan :other.',
    'size' => [
        'array' => 'Bidang :attribute harus berisi :size item.',
        'file' => 'Bidang :attribute harus berukuran :size kilobyte.',
        'numeric' => 'Bidang :attribute harus berukuran :size.',
        'string' => 'Bidang :attribute harus berisi :size karakter.',
    ],
    'starts_with' => 'Bidang :attribute harus dimulai dengan salah satu dari berikut: :values.',
    'string' => 'Bidang :attribute harus berupa string.',
    'timezone' => 'Bidang :attribute harus berupa zona waktu yang valid.',
    'unique' => ':attribute sudah digunakan.',
    'uploaded' => ':attribute gagal diunggah.',
    'uppercase' => 'Bidang :attribute harus berupa huruf besar.',
    'url' => 'Bidang :attribute harus berupa URL yang valid.',
    'ulid' => 'Bidang :attribute harus berupa ULID yang valid.',
    'uuid' => 'Bidang :attribute harus berupa UUID yang valid.',

    /*
    |--------------------------------------------------------------------------
    | Baris Bahasa Validasi Kustom
    |--------------------------------------------------------------------------
    |
    | Di sini Anda dapat menentukan pesan validasi kustom untuk atribut menggunakan
    | konvensi "attribute.rule" untuk menamai baris. Ini mempercepat proses
    | untuk menentukan baris bahasa kustom tertentu untuk aturan atribut tertentu.
    |
    */

    'custom' => [
        'attribute-name' => [
            'rule-name' => 'custom-message',
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Atribut Validasi Kustom
    |--------------------------------------------------------------------------
    |
    | Baris bahasa berikut digunakan untuk menukar placeholder atribut kami
    | dengan sesuatu yang lebih mudah dibaca seperti "Alamat E-Mail" alih-alih
    | "email". Ini membantu kami membuat pesan lebih ekspresif.
    |
    */

    'attributes' => [],

];
