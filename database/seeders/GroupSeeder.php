<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Group;
use App\Models\User;

class GroupSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $users = User::all();
        for ($i = 0; $i < 5; $i++) {
            $group = Group::factory()->create([
                'owner_id' => $users->random()->id,
            ]);
            $group->users()->attach($users->random(rand(1, 5))->pluck('id')->toArray());
        }
    }
}
