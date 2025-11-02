<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Message;
use App\Models\User;

class MessageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $users = User::all();
        for ($i = 0; $i < 50; $i++) {
            Message::factory()->create([
                'from_id' => $users->random()->id,
                'to_id' => $users->random()->id,
            ]);
        }
    }
}
