@extends('layouts.frontend.app')
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
            <img class="img-fluid" src="{{asset('storage/category/'.$category->image)}}" alt="{{$category->image}}" />
            <p class="date">{{$category->created_at->format('D, d M Y H:i')}}</p>
            <a href="{{route('category.post',$category->slug)}}"><h4>{{$category->name}}</h4></a>
          </div>
           @endforeach
          </div>
        </div>
      </section>
      <!-- End fashion Area -->
    </div>
@endsection
