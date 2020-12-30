<?php

namespace App\Http\Controllers\Admin;

use App\Comment;
use App\CommentReply;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    public function index()
    {
        $comments = Comment::all();
        return view('admin.comments.index', compact('comments'));
    }
    public function destroy($id)
    {
        $comment = Comment::findOrFail($id);
        // Delete all replies
        $comment->delete();
        Toastr::success('Comment successfully deleted :)');
        return redirect()->back();
    }
}
