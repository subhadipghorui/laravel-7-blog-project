@extends('layouts.frontend.app')
@section('content')

<!-- Start top-section Area -->
<section class="top-section-area section-gap">
  <div class="container">
    <div class="row justify-content-between align-items-center d-flex">
      <div class="col-lg-8 top-left">
        <h1 class="text-white mb-20">All Post</h1>
        <ul>
          <li>
            <a href="index.html">Home</a
            ><span class="lnr lnr-arrow-right"></span>
          </li>
          <li>
            <a href="category.html">Category</a
            ><span class="lnr lnr-arrow-right"></span>
          </li>
          <li><a href="single.html">Posts</a></li>
        </ul>
      </div>
    </div>
  </div>
</section>
<!-- End top-section Area -->
<div class="post-wrapper pt-100">
    <!-- Start post Area -->
    <section class="post-area">
      <div class="container">
        <div class="row justify-content-center d-flex">
          <div class="col-lg-8">
            <div class="top-posts pt-50">
              <div class="container">
                <div class="row justify-content-center">
                 @if($posts->count() >0)
                 @foreach ($posts as $post)
                 <div class="single-posts col-lg-6 col-sm-6">
                   <img class="img-fluid" src="{{asset('storage/post/'.$post->image)}}" alt="{{$post->image}}" />
                   <div class="date mt-20 mb-20">{{$post->created_at->diffForHumans()}}</div>
                   <div class="detail">
                     <a href="{{route('post', $post->slug)}}"
                       ><h4 class="pb-20">
                        {{$post->title}}
                       </h4></a
                     >
                     <p>
                       {!! Str::limit($post->body, 400) !!}
                     </p>
                     <p class="footer pt-20">
                       <i class="fa fa-heart-o" aria-hidden="true"></i>
                       <a href="#">{{$post->likedUsers->count()}} Likes</a>
                       <i
                         class="ml-20 fa fa-comment-o"
                         aria-hidden="true"
                       ></i>
                       <a href="#">{{$post->comments->count()}} Comments</a>
                     </p>
                   </div>
                 </div>
                 @endforeach
                 @else
                 <h3>No post availabe</h3>
                 @endif
                  <div class="justify-content-center d-flex mt-5">
                    {{ $posts->links()}}
                </div>
                </div>
              </div>
            </div>
          </div>
          @include('layouts.frontend.partials.sidebar')
        </div>
      </div>
    </section>
    <!-- End post Area -->
  </div>
@endsection
