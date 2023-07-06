<?php

namespace App\Http\Controllers;

use App\CommentReply;
use App\Notifications\ReplyCommentNotify;
use App\User;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Notification;

class CommentReplyController extends Controller
{
    public function store(Request $request, $comment)
    {
        $this->validate($request, ['message' => 'required|max:1000']);
        $commentReply = new CommentReply();
        $commentReply->comment_id = $comment;
        $commentReply->user_id = Auth::id();
        $commentReply->message = $request->message;
        $commentReply->save();

        // Notify User
        $admins = User::where('role_id', 1)->get();
        foreach($admins as $admin){
            Notification::route('mail', $admin->email)
            ->notify(new ReplyCommentNotify($commentReply));

        }
        Notification::route('mail', $commentReply->comment->user->email)
            ->notify(new ReplyCommentNotify($commentReply));
        // Success message
        Toastr::success('success', 'The comment replied successfully ;)');
        return redirect()->back();
    }
}
