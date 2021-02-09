@extends('layouts.frontend.app')
@section('title')
   All Posts | myiotlab
@endsection

@push('header')
<!-- Author Meta -->
<meta name="author" content="myiotlab" />
<!-- Meta Description -->
<meta name="description" content="A Blog site about web development, web designed, iot projects and laravel tutorials." />
<meta name="image" content="{{asset('/frontend/ing/sitelogo.png')}}" />
<!-- Meta Keyword -->
<meta name="keywords" content="HTML, CSS, JavaScript, PHP, DATABASE, POSTGRES, MYSQL, WEB MAPPING, GIS, RS, REMOTE SENSING, ARDUINO, IOT, MYIOTLAB, BLOG, SUBHADIP GHORUI, WEB DEVELOPMENT, WEB DESIGNED, LARAVEL" />

<meta property="og:type" content="website" />

<meta property="og:title" content="myiotlab" />

<meta property="og:description" content="A Blog site about web development, web designed, iot projects and laravel tutorials." />

<meta property="og:url" content="{{asset('/')}}" />

<meta property="og:site_name" content="myiotlab" />

{{-- tell seo this is main page --}}
<link rel="canonical" href="{{ config('app.url', 'http://myiotlab.in/') }}}" />


{{-- Tweeter --}}
<meta name="twitter:title" content="myiotlab">

<meta name="twitter:description" content="A Bloge site about web development, web designed, iot projects and laravel tutorials.">

<meta name="twitter:image" content="{{asset('/frontend/ing/sitelogo.png')}}">

<meta name="twitter:site" content="@myiotlab">

<meta name="twitter:creator" content="@subhadipghorui">

<link rel="alternate" type="application/rss+xml" href="{{asset('/frontend/ing/sitelogo.png')}}" title="myiotlab" >

@endpush
@section('content')

<!-- Start top-section Area -->
<section class="top-section-area section-gap">
  <div class="container">
    <div class="row justify-content-between align-items-center d-flex">
      <div class="col-lg-8 top-left">
        <h1 class="text-white mb-20">All Post</h1>
        <ul>
          <li>
            <a href="/">Home</a
            ><span class="lnr lnr-arrow-right"></span>
          </li>
          <li><a href="/posts">Posts</a></li>
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
                       {{-- {!! Str::limit($post->body, 400) !!} --}}
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
