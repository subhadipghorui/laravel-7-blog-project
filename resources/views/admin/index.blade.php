@extends('layouts.backend.app')

@section('content')
<div class="breadcrumbs">
    <div class="col-sm-4">
        <div class="page-header float-left">
            <div class="page-title">
                <h1> Admin Dashboard</h1>
            </div>
        </div>
    </div>
    <div class="col-sm-8">
        <div class="page-header float-right">
            <div class="page-title">
                <ol class="breadcrumb text-right">
                    <li class="active">Dashboard</li>
                </ol>
            </div>
        </div>
    </div>
</div>

<div class="content mt-3">
    <!-- <div class="col-sm-12">
        <div
            class="alert alert-success alert-dismissible fade show"
            role="alert"
        >
            <span class="badge badge-pill badge-success"
                >Success</span
            >
            You successfully read this important alert message.
            <button
                type="button"
                class="close"
                data-dismiss="alert"
                aria-label="Close"
            >
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </div> -->

    <div class="col-xl-3 col-lg-6">
        <div class="card">
            <div class="card-body">
                <div class="stat-widget-one">
                    <div class="stat-icon dib">
                        <i
                            class="ti-file text-success border-success"
                        ></i>
                    </div>
                    <div class="stat-content dib">
                        <div class="stat-text">Posts</div>
                        <div class="stat-digit">{{$posts->count()}}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-lg-6">
        <div class="card">
            <div class="card-body">
                <div class="stat-widget-one">
                    <div class="stat-icon dib">
                        <i
                            class="ti-user text-primary border-primary"
                        ></i>
                    </div>
                    <div class="stat-content dib">
                        <div class="stat-text">Users</div>
                        <div class="stat-digit">{{$users->count()}}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-lg-6">
        <div class="card">
            <div class="card-body">
                <div class="stat-widget-one">
                    <div class="stat-icon dib">
                        <i
                            class="ti-comment-alt text-warning border-warning"
                        ></i>
                    </div>
                    <div class="stat-content dib">
                        <div class="stat-text">Comments</div>
                        <div class="stat-digit">{{$comments->count()}}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-lg-6">
        <div class="card">
            <div class="card-body">
                <div class="stat-widget-one">
                    <div class="stat-icon dib">
                        <i
                            class="ti-thumb-up text-warning border-warning"
                        ></i>
                    </div>
                    <div class="stat-content dib">
                        <div class="stat-text">Categories</div>
                        <div class="stat-digit">{{$categories->count()}}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header">
                <strong class="card-title">Recent Comments</strong>
            </div>
            <div class="card-body">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Comment</th>
                            <th scope="col">From</th>
                            <th scope="col">Post</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($comments->take(10) as $key => $comment)
                        <tr>
                            <th scope="row">{{$key+1}}</th>
                            <td>{{Str::limit($comment->message, 30)}}</td>
                            <td>{{$comment->user->name}}</td>
                            <td><a href="{{route('post', $comment->post->slug)}}">{{Str::limit($comment->post->title, 30)}}</a></td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- .content -->
@endsection
