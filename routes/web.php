<?php

use App\Category;
use App\Http\Controllers\CommentController;
use App\Mail\NewPost;
use App\Post;
use App\Tag;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\View;
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

Auth::routes(['verify' => true]);

// Social Login
Route::get('login/google', 'Auth\LoginController@redirectToProvider');
Route::get('login/google/callback', 'Auth\LoginController@handleProviderCallback');



Route::get('/', 'HomeController@index')->name('home');
Route::get('/posts', 'HomeController@posts')->name('posts');
Route::get('/post/{slug}', 'HomeController@post')->name('post');
Route::get('/categories', 'HomeController@categories')->name('categories');
Route::get('/category/{slug}', 'HomeController@categoryPost')->name('category.post');
Route::get('/search', 'HomeController@search')->name('search');
Route::get('/tag/{name}', 'HomeController@tagPosts')->name('tag.posts');
Route::post('/comment/{post}', 'CommentController@store')->name('comment.store')->middleware(['auth', 'verified']);
Route::post('/comment-reply/{comment}', 'CommentReplyController@store')->name('reply.store')->middleware(['auth', 'verified']);
Route::post('/like-post/{post}', 'HomeController@likePost')->name('post.like')->middleware(['auth', 'verified']);


// Admin ////////////////////////////////////////////////////////////////////////
Route::group(['prefix' => 'admin', 'as' => 'admin.', 'namespace' => 'Admin', 'middleware' => ['auth', 'admin','verified']], function () {
    Route::get('dashboard', 'DashboardController@index')->name('dashboard');
    Route::get('profile', 'DashboardController@showProfile')->name('profile');
    Route::put('profile', 'DashboardController@updateProfile')->name('profile.update');
    Route::put('profile/password', 'DashboardController@changePassword')->name('profile.password');
    Route::resource('user', 'UserController')->except(['create', 'show', 'edit', 'store']);
    Route::resource('category', 'CategoryController')->except(['create', 'show', 'edit']);
    Route::resource('post', 'PostController');
    Route::get('/comments', 'CommentController@index')->name('comment.index');
    Route::delete('/comment/{id}', 'CommentController@destroy')->name('comment.destroy');
    Route::get('/reply-comments', 'CommentReplyController@index')->name('reply-comment.index');
    Route::delete('/reply-comment/{id}', 'CommentReplyController@destroy')->name('reply-comment.destroy');
    Route::get('/post-liked-users/{post}', 'PostController@likedUsers')->name('post.like.users');

});

// User ////////////////////////////////////////////////////////////////////////
Route::group(['prefix' => 'user', 'as' => 'user.', 'namespace' => 'User', 'middleware' => ['auth', 'user', 'verified']], function () {
    Route::get('dashboard', 'DashboardController@likedPosts')->name('dashboard');
    Route::get('profile', 'DashboardController@showProfile')->name('profile');
    Route::put('profile', 'DashboardController@updateProfile')->name('profile.update');
    Route::put('profile/password', 'DashboardController@changePassword')->name('profile.password');
    Route::get('comments', 'CommentController@index')->name('comment.index');
    Route::delete('/comment/{id}', 'CommentController@destroy')->name('comment.destroy');
    Route::get('/reply-comments', 'CommentReplyController@index')->name('reply-comment.index');
    Route::delete('/reply-comment/{id}', 'CommentReplyController@destroy')->name('reply-comment.destroy');
    Route::get('/user-liked-posts', 'DashboardController@likedPosts')->name('like.posts');
});


// View Composer
View::composer('layouts.frontend.partials.sidebar', function ($view) {
    $categories = Category::all()->take(10);
    $recentTags = Tag::all();
    $recentPosts = Post::latest()->take(3)->get();
    return $view->with('categories', $categories)->with('recentPosts', $recentPosts)->with('recentTags', $recentTags);
});


// Send Mail
Route::get('/send', function(){
    $post = Post::findOrFail(7);
    // Send Mail
    Mail::to('user@user.com')
        ->queue(new NewPost($post));

    return (new App\Mail\NewPost($post))->render();
});