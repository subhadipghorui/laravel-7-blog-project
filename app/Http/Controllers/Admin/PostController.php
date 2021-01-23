<?php

namespace App\Http\Controllers\Admin;

use App\Category;
use App\Http\Controllers\Controller;
use App\Mail\NewPost;
use App\Notifications\NewPostNotify;
use App\Post;
use App\User;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Intervention\Image\Facades\Image;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $posts = Post::latest()->get();
        return view('admin.post.index', compact('posts'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::all();
        return view('admin.post.create', compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // dd(explode(',', $request->tags));
        $this->validate($request, [
            'title' => 'required|max:255|unique:posts',
            'image' => 'required|mimes:jpg,png,bmp,jpeg',
            'category' => 'required',
            'tags' => 'required',
            'body' => 'required',
        ]);
        $slug = Str::slug($request->title, '-');
        $image = $request->image;
        $imageName = $slug . '-' . uniqid() . Carbon::now()->timestamp . '.' . $image->getClientOriginalExtension();

        if (!Storage::disk('public')->exists('post')) {
            Storage::disk('public')->makeDirectory('post');
        }
        // Image Croped
        $img = Image::make($image)->resize(752, null, function ($constraint) {
            $constraint->aspectRatio();
            $constraint->upsize();
        })->stream();
        Storage::disk('public')->put('post/' . $imageName, $img);

        $post = new Post();
        $post->title = $request->title;
        $post->user_id = Auth::id();
        $post->category_id = $request->category;
        $post->slug = $slug;
        $post->image = $imageName;
        $post->body = $request->body;
        $post->body = $request->body;
        if (isset($request->status)) {
            $post->status = 1;
        }
        $post->save();

        // Notification by mail
        if($post->status){
            $users = User::all();
            foreach($users as $user){
                // Mail::to($user->email)->queue(new NewPost($post));
                // Use notification to notify
                Notification::route('mail', $user->email)
                       ->notify(new NewPostNotify($post));
            }
        }
        $tags = [];
        $stingTags = array_map('trim', explode(',', $request->tags));
        foreach ($stingTags as $tag) {
            array_push($tags, ['name' => $tag]);
        }
        $post->tags()->createMany($tags);

        Toastr::success('Post Successfully Saved', 'success');
        return redirect()->route('admin.post.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $post = Post::findOrFail($id);
        return view('admin.post.show', compact('post'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $post = Post::findOrFail($id);
        $categories = Category::all();
        return view('admin.post.edit', compact('post', 'categories'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // validate
        if ($request->title == Post::findOrFail($id)->title) {
            $this->validate($request, [
                'title' => 'required|max:255', //added unique Post later by me
                'image' => 'sometimes|mimes:jpeg,bmp,png,jpg|max:5000',
                'category' => 'required',
                'tags' => 'required',
                'body' => 'required',
            ]);
        } else {
            $this->validate($request, [
                'title' => 'required|max:255|unique:posts', //added unique Post later by me
                'image' => 'sometimes|mimes:jpeg,bmp,png,jpg|max:5000',
                'category' => 'required',
                'tags' => 'required',
                'body' => 'required',
            ]);
        }

        $post = Post::findOrFail($id);
        $slug = Str::slug($request->title, '-');
        if (isset($request->image)) {
            $image = $request->image;
            $imageName = $slug . '-' . uniqid() . Carbon::now()->timestamp . '.' . $image->getClientOriginalExtension();
            // #1 check if category image directory is exists
            if (!Storage::disk('public')->exists('post')) {
                Storage::disk('public')->makeDirectory('post');
            }
            // DELETE old image
            if (Storage::disk('public')->exists('post/' . $post->image)) {
                Storage::disk('public')->delete('post/' . $post->image);
            }
            $postImage = Image::make($image)->resize(752, null, function ($constraint) {
                $constraint->aspectRatio();
                $constraint->upsize();
            })->stream();
            // Store in storage public/category
            Storage::disk('public')->put('post/' . $imageName, $postImage); //The put method may be used to store raw file contents on a disk
        } else {
            $imageName = $post->image;
        }
        $post->user_id = Auth::id();
        $post->category_id = $request->category;
        $post->title = $request->title;
        $post->slug = $slug;
        $post->image = $imageName;
        $post->body = $request->body;
        if (isset($request->status)) {
            $post->status = true;
        } else {
            $post->status = false;
        }
        $post->save();
         // Notification by mail
         if($post->status){
            $users = User::all();
            foreach($users as $user){
                // Mail::to($user->email)->queue(new NewPost($post));
                // Use Notification
                Notification::route('mail', $user->email)
                ->notify(new NewPostNotify($post));
            }
        }
        // delete old tags
        $post->tags()->delete();
        $tags = [];
        $stingTags = array_map('trim', explode(',', $request->tags));
        foreach ($stingTags as $tag) {
            array_push($tags, ['name' => $tag]);
        }
        $post->tags()->createMany($tags);
        Toastr::success('Post Successfully Saved', 'success');

        return redirect()->route('admin.post.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $post = Post::findOrfail($id);
        // delete img if exists
        // delete 1st condition on Production
        if ($post->image !== 'laravel-wiki-5f92a8e71c7bc1603447015.jpg' && Storage::disk('public')->exists('post/' . $post->image)) {
            Storage::disk('public')->delete('post/' . $post->image);
        }
        // Delete Tags
        // $post->tags()->delete();
        $post->delete();
        Toastr::success('Post Successfully Deleted :)', 'success');

        return redirect()->route('admin.post.index');
    }
    public function likedUsers($post){
        $post = Post::findOrFail($post);
        return view('admin.post.likedUsers',compact('post'));
    }
}
