<?php

namespace App\Http\Controllers;

use App\Category;
use App\Post;
use Illuminate\Http\Request;

class HomeController extends Controller
{

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $posts = Post::latest()->take(6)->get();
        return view('index', compact('posts'));
    }
    public function posts()
    {
        $posts = Post::latest()->paginate(10);
        $categories = Category::take(10)->get();
        return view('posts', compact('posts', 'categories'));
    }
    public function post($slug)
    {
        $post = Post::where('slug', $slug)->first();
        $categories = Category::take(10)->get();
        $posts = Post::latest()->take(3)->get();
        return view('post', compact('post', 'categories', 'posts'));
    }
    public function categories()
    {
        $categories = Category::all();
        return view('categories', compact('categories'));
    }
}
