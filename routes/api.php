<?php

use App\Http\Controllers\Api\ChatController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\AuthController;
Route::middleware('auth:api')->group(function () {
    Route::get('/users', [ChatController::class, 'users']);
    Route::get('/messages/{to_id}', [ChatController::class, 'messages']);
    Route::post('/messages', [ChatController::class, 'sendMessage']);
    Route::get('/groups', [ChatController::class, 'groups']);
    Route::post('/groups', [ChatController::class, 'createGroup']);
});


Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::middleware('auth:api')->get('/user', [AuthController::class, 'user']);

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:api');


