<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\Role;
use App\Models\User;
use Illuminate\Database\Seeder;

final class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Create an user accounts
        collect(Role::all())
            ->each(fn ($role) => $this->createUserAccount(roleName: $role->name));
    }

    /**
     * Creates a new user account with the specified role.
     *
     * @param  string  $roleName  The name of the role to assign to the new user.
     * @return void
     */
    private function createUserAccount(string $roleName)
    {
        // Create a new user with the specified first name, last name, profile image, email, and password
        $user = User::create([
            'first_name' => fake()->firstName(),
            'last_name' => fake()->lastName(),
            'profile_image' => fake()->imageUrl(),
            'email' => "{$roleName}@pamcargo.com",
            'password' => 'password',
            'email_verified_at' => now(),
        ]);

        // Assign the specified role to the new user
        $user->assignRole($roleName);
    }
}
