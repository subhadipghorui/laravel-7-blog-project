<?php

use Illuminate\Support\Facades\Route;

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

// Route::get('/', function () {
//     return view('welcome');
// });

Auth::routes();

Route::get('/', 'HomeController@index')->name('home');
Route::get('/posts', 'HomeController@posts')->name('posts');
Route::get('/categories', 'HomeController@categories')->name('categories');
Route::get('/post/{slug}', 'HomeController@post')->name('post');

// Admin ////////////////////////////////////////////////////////////////////////
Route::group(['prefix' => 'admin', 'as' => 'admin.', 'namespace' => 'Admin', 'middleware' => ['auth', 'admin']], function () {
    Route::get('dashboard', 'DashboardController@index')->name('dashboard');
    Route::get('profile', 'DashboardController@showProfile')->name('profile');
    Route::put('profile', 'DashboardController@updateProfile')->name('profile.update');
    Route::put('profile/password', 'DashboardController@changePassword')->name('profile.password');
    Route::resource('user', 'UserController')->except(['create', 'show', 'edit', 'store']);
    Route::resource('category', 'CategoryController')->except(['create', 'show', 'edit']);
    Route::resource('post', 'PostController');
});

// User ////////////////////////////////////////////////////////////////////////
Route::group(['prefix' => 'user', 'as' => 'user.', 'namespace' => 'User', 'middleware' => ['auth', 'user']], function () {
    Route::get('dashboard', 'DashboardController@index')->name('dashboard');
});
