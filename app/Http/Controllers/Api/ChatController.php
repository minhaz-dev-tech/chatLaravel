<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Group;
use App\Models\Message;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;
class ChatController extends Controller
{

public function users()
{
    $currentUserId = Auth::id();

    $users = User::where('id', '!=', $currentUserId)
        ->with(['messages' => function ($q) use ($currentUserId) {
            // Only messages between this user and current user
            $q->where(function ($query) use ($currentUserId) {
                $query->where('from_id', $currentUserId)
                      ->orWhere('to_id', $currentUserId);
            })->latest();
        }])
        ->get()
        ->sortByDesc(function ($user) use ($currentUserId) {
            // Get the latest message timestamp
            $latestMessage = $user->messages
                ->whereIn('from_id', [$currentUserId, $user->id])
                ->whereIn('to_id', [$currentUserId, $user->id])
                ->first();

            return $latestMessage ? $latestMessage->created_at->timestamp : 0;
        })
        ->values();

    return $users;
}

    public function messages(Request $request, $to_id)
    {
        $from_id = Auth::id();
        $messages = Message::where(function ($query) use ($from_id, $to_id) {
            $query->where('from_id', $from_id)->where('to_id', $to_id);
        })->orWhere(function ($query) use ($from_id, $to_id) {
            $query->where('from_id', $to_id)->where('to_id', $from_id);
        })->get();

        return $messages;
    }

   public function sendMessage(Request $request)
{
    $request->validate([
        'message' => 'nullable|string',
        'to_id' => 'required|integer',
        'is_group' => 'boolean',
        'attachment' => 'nullable|file|mimes:jpg,jpeg,png,gif,mp4,pdf|max:10240', // max 10MB
    ]);

    $attachmentPath = null;

    if ($request->hasFile('attachment')) {
        $attachmentPath = $request->file('attachment')->store('attachments', 'public');
    }

    $message = Message::create([
        'from_id' => Auth::id(),
        'to_id' => $request->to_id,
        'message' => $request->message,
        'is_group' => $request->is_group,
        'attachment' => $attachmentPath,
    ]);

    // Return message with full URL for frontend
    if ($attachmentPath) {
        $message->attachment_url = asset("storage/{$attachmentPath}");
    }

    return $message;
}

    public function groups()
    {
        return Auth::user()->groups;
    }

public function createGroup(Request $request)
{
    $request->validate([
        'name' => 'required|string|max:255',
        'user_ids' => 'required|array|min:1',
        'user_ids.*' => 'exists:users,id',
    ]);

    $group = Group::create([
        'name' => $request->name,
        'description' => $request->description ?? null,
        'owner_id' => Auth::id(),
    ]);

    // Attach selected users + owner
    $group->users()->attach(array_merge([$request->user()->id], $request->user_ids));

    return response()->json($group->load('users'), 201);
}

}
