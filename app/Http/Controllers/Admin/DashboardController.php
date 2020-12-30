<?php

namespace App\Http\Controllers\Admin;

use App\Category;
use App\Comment;
use App\Http\Controllers\Controller;
use App\Post;
use App\User;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Intervention\Image\Facades\Image;

class DashboardController extends Controller
{
    public function index()
    {
        $posts = Post::all();
        $comments = Comment::latest()->get();
        $categories = Category::all();
        $users = User::all();
        return view('admin.index', compact('posts', 'comments', 'users', 'categories'));
    }
    public function showProfile()
    {
        $user = User::find(Auth::user()->id);
        return view('admin.profile', compact('user'));
    }
    public function updateProfile(Request $request)
    {
        // Fix the update issue
        if ($request->name == User::findOrFail(Auth::id())->name) {
            $this->validate($request, [
                'name' => 'required',
                'userid' => 'required',
                'about' => 'sometimes|max:255',
                'image' => 'sometimes|image|mimes:jpg,png,bmp,jpeg|max:2000'

            ]);
        } else {
            $this->validate($request, [
                'name' => 'required',
                'userid' => 'required|unique:users',
                'about' => 'sometimes|max:255',
                'image' => 'sometimes|image|mimes:jpg,png,bmp,jpeg|max:2000'

            ]);
        }
        $user = User::findOrFail(Auth::user()->id);
        if ($request->image != null) {
            // Image
            $image = $request->image;
            $imageName = Str::slug($request->name, '-') . uniqid() . '.' . $image->getClientOriginalExtension();

            if (!Storage::disk('public')->exists('user')) {
                Storage::disk('public')->makeDirectory('user');
            }
            // Delete old Image
            if ($user->image !== 'default.jpg' && Storage::disk('public')->exists('user/' . $user->image)) {
                Storage::disk('public')->delete('user/' . $user->image);
            }
            // Store
            // $image->storeAs('user', $imageName, 'public');
            $userImg = Image::make($image)->fit(200, 200)->stream();
            Storage::disk('public')->put('user/' . $imageName, $userImg); //The put method may be used to store raw file contents on a disk
        } else {
            $imageName = $user->image;
        }

        $user->name = $request->name;
        $user->userid = $request->userid;
        $user->image = $imageName;
        $user->about = $request->about;
        $user->save();
        Toastr::success('Details Successfully Saved', 'Success');

        return redirect()->back();
    }

    public function changePassword(Request $request)
    {
        $this->validate($request, [
            'old_password' => 'required',
            'password' => 'required|max:255|confirmed'
        ]);

        // Cross check the old password
        $oldPass = Auth::user()->password; // hashed
        if (Hash::check($request->old_password, $oldPass)) {
            // old pass shoud not be same as new pass
            if (!Hash::check($request->password, $oldPass)) {
                $user = User::find(Auth::id());
                $user->password = Hash::make($request->password);
                $user->save();

                // Logout
                Auth::logout();
                return redirect()->back();
            } else {
                Toastr::error('New password should not be same as old password :(');
                return redirect()->back();
            }
        } else {
            Toastr::error('Enter the correct old password :(');
            return redirect()->back();
        }
    }
}
