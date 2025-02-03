# Laravel

Laravel is a web application framework with expressive, elegant syntax. We believe development must be an enjoyable and creative experience to be truly fulfilling. Laravel takes the pain out of development by easing common tasks used in many web projects.

## About Laravel

- [Simple, fast routing engine](https://laravel.com/docs/routing).
- [Powerful dependency injection container](https://laravel.com/docs/container).
- Multiple back-ends for [session](https://laravel.com/docs/session) and [cache](https://laravel.com/docs/cache) storage.
- Expressive, intuitive [database ORM](https://laravel.com/docs/eloquent).
- Database agnostic [schema migrations](https://laravel.com/docs/migrations).
- [Robust background job processing](https://laravel.com/docs/queues).
- [Real-time event broadcasting](https://laravel.com/docs/broadcasting).

## Getting Started

To set up the Leave Request system, follow these steps:

1. Clone the repository
2. Install dependencies
3. Configure the database
4. Set up email notifications
5. Run migrations and seeders
6. Start the application

## Advanced Instructions

If you want to dump all SQL files in the directory: database/sql/, please run the following command:
```
php artisan db:seed DumpSqlFileSeeder
```
Adjust the array in the following function according to the file name contained in the directory: database/sql/:
```php
/**
 * Returns a list of SQL file names to be processed.
 *
 * @return array The list of SQL file names.
 */
private function getSqlList(): array
{
    return [
        'accounting',
        'crm',
        'dxb',
        'hrm',
        'master',
        'origin',
        'public',
        'user',
        'usr',
        'usrs'
    ];
}
```

## Specification
- Language: PHP ^8.2
- Framework: Laravel 11
- Database: PostgreSQL
- Distribution: Docker
- Web Server: Nginx
