<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
// Route::middleware('auth:api')->get('/logout', function (Request $request) {
//     return $request->user();
// });
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware('auth:api')->get('/logout', [App\Http\Controllers\Auth\LoginController::class, 'logoutClient'])->name('logout-api');
Route::middleware('auth:api','roles:ROLE_ADMIN')->post('/vote/add', [App\Http\Controllers\VoteController::class, 'add'])->name('vote-add');
Route::middleware('auth:api','roles:ROLE_ADMIN')->post('/vote/export-excel', [App\Http\Controllers\VoteController::class, 'exportExcel'])->name('export-excel');
Route::middleware('auth:api','roles:ROLE_ADMIN')->post('/vote/update', [App\Http\Controllers\VoteController::class, 'update'])->name('vote-update');
Route::middleware('auth:api')->get('/vote/get-info', [App\Http\Controllers\VoteController::class, 'getInfo'])->name('get-vote-info');
Route::middleware('auth:api')->get('/vote/search', [App\Http\Controllers\VoteController::class, 'search'])->name('search');
Route::middleware('auth:api')->get('/vote/count-vote', [App\Http\Controllers\VoteController::class, 'getCountVote'])->name('get-count-vote');
Route::middleware('auth:api','roles:ROLE_ADMIN')->post('/vote/set-status', [App\Http\Controllers\VoteController::class, 'setStatus'])->name('set-status');
Route::middleware('auth:api','roles:ROLE_ADMIN')->post('/vote/vote-public', [App\Http\Controllers\VoteController::class, 'votePublic'])->name('vote-public');
Route::middleware('auth:api','roles:ROLE_ADMIN')->post('/vote/create-short-link', [App\Http\Controllers\VoteController::class, 'createShortLink'])->name('create-short-link');

Route::middleware('auth:api','roles:ROLE_ADMIN')->get('/vote/get-all', [App\Http\Controllers\VoteController::class, 'getAll'])->name('get-vote-all');
Route::middleware('auth:api')->post('/vote/vote', [App\Http\Controllers\VoteController::class, 'vote'])->name('vote');

// Route::post('/permissions',  [App\Http\Controllers\PermissionController::class, 'store']);