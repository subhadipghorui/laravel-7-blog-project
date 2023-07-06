<?php

namespace App\Http\Controllers;

use App\Comment;
use App\Notifications\NewCommentNotify;
use App\User;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Notification;

class CommentController extends Controller
{
    public function store(Request $request, $post)
    {
        $this->validate($request, ['message' => 'required|max:1000']); //change comment field to message
        $comment = new Comment();
        $comment->post_id = $post;
        $comment->user_id = Auth::id();
        $comment->message = $request->message; //change comment field to message
        $comment->save();

        // Notify
        $admins = User::where('role_id', 1)->get();
        foreach($admins as $admin){
            Notification::route('mail', $admin->email)
            ->notify(new NewCommentNotify($comment));

        }

        // Success message
        Toastr::success('success', 'The comment created successfully ;)');
        return redirect()->back();
    }
}
