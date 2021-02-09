@extends('layouts.frontend.app')
@section('title')
    Post Categories | myiotlab
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
<!-- Start banner Area -->
<section class="generic-banner relative">
  <div class="container">
    <div class="row height align-items-center justify-content-center">
      <div class="col-lg-10">
        <div class="generic-banner-content">
          <h2 class="text-white text-center">The Category Page</h2>
          <p class="text-white">
            This page shows all the categories that available by the site
          </p>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- End banner Area -->
<!-- About Generic Start -->
    <div class="main-wrapper">
      <!-- Start fashion Area -->
      <section class="fashion-area section-gap" id="fashion">
        <div class="container">
          <div class="row">
           @foreach ($categories as $category)
           <div class="col-lg-3 col-md-6 single-fashion">
            <a href="{{route('category.post',$category->slug)}}"><img class="img-fluid" src="{{asset('storage/category/'.$category->image)}}" alt="{{$category->image}}" /></a>
            <!--<p class="date">{{$category->created_at->format('D, d M Y H:i')}}</p>-->
            <a href="{{route('category.post',$category->slug)}}"><h4>{{$category->name}}</h4></a>
            <p>{{$category->description}}</p>
          </div>
           @endforeach
          </div>
        </div>
      </section>
      <!-- End fashion Area -->
    </div>
@endsection
