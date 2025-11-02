<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    use HasFactory;

    protected $fillable = [
        'from_id',
        'to_id',
        'message',
        'is_group',
        'attachment',
    ];

    public function from()
    {
        return $this->belongsTo(User::class, 'from_id');
    }

    public function to()
    {
        return $this->belongsTo(User::class, 'to_id');
    }
    // Group.php
public function users()
{
    return $this->belongsToMany(User::class, 'group_user');
}

public function messages()
{
    return $this->hasMany(Message::class, 'group_id');
}
// Message.php
public function sender()
{
    return $this->belongsTo(User::class, 'from_id');
}

public function group()
{
    return $this->belongsTo(Group::class, 'group_id');
}


}
