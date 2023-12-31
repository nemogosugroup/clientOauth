<?php

use App\Http\Controllers\SSO\SSOController;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Http;

use App\Models\Vote;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get("/sso/login", [SSOController::class, 'getLogin'])->name("sso.login");
Route::get("/callback", [SSOController::class, 'getCallback'])->name("sso.callback");
Route::get("/sso/connect", [SSOController::class, 'connectUser'])->name("sso.connect");

Route::get('/login', [SSOController::class, 'getLogin'])->name('login');
// Route::get('/login', [App\Http\Controllers\Auth\LoginController::class, 'login'])->name('login');
Route::get('/logout', [App\Http\Controllers\Auth\LoginController::class, 'logout'])->name('logout');
// Auth::routes(['register' => false, 'reset' => false ]);

Route::get('/voting/{id}', [App\Http\Controllers\HomeController::class, 'home'])->name('voting');

Route::get('/home', [App\Http\Controllers\HomeController::class, 'home'])->name('home');
Route::get('/', [App\Http\Controllers\HomeController::class, 'index'])->name('index');

Route::get('/error', [App\Http\Controllers\HomeController::class, 'home'])->name('error');
Route::get('/admin', [App\Http\Controllers\HomeController::class, 'home'])->name('admin');
Route::get('home/{any}',[App\Http\Controllers\HomeController::class, 'home'])->where('any', '.*');
Route::get('admin/{any}',[App\Http\Controllers\HomeController::class, 'home'])->where('any', '.*');

Route::get('/getaccesstoken', [App\Http\Controllers\HomeController::class, 'getAccessToken'])->name('getaccesstoken');

Route::get('/{short_code}', function (Request $request) {
    $vote = Vote::where("short_link", $request->short_code)->first();
    if ($vote) {
        return Redirect::to("/voting/{$vote->id}");
    } else {
        // return Redirect::to("/voting/42");
        abort(404); // Trả về lỗi 404 nếu không tìm thấy $vote tương ứng
    }
});
