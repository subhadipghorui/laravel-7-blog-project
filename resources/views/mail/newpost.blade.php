<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>New Post Available</title>
    <link
    href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
    rel="stylesheet"/>
  <!--
          CSS
          ============================================= -->
  <link rel="stylesheet" href="{{asset('frontend/css/linearicons.css')}}" />
  <link rel="stylesheet" href="{{asset('frontend/css/font-awesome.min.css')}}" />
  <link rel="stylesheet" href="{{asset('frontend/css/bootstrap.css')}}" />
  <link rel="stylesheet" href="{{asset('frontend/css/owl.carousel.css')}}" />
  <link rel="stylesheet" href="{{asset('frontend/css/main.css')}}" />
  <style>
      .heading{
          width: 100%;
          /* background: rgb(245, 245, 245); */
          display: flex;
          justify-content: center;
          padding: 20px 0;
          margin-bottom: 1rem;
      }

      .mail-footer{
          width: 100%;
          background: rgb(6, 101, 156);
          color: #fff;
          padding: 20px 10px;
      }
      .mail-footer a{
          color: #fff;
      }
      .mail-footer a:hover{
          color: rgb(5, 247, 255);
      }
  </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-6 heading">
                <img src="http://localhost:8000/frontend/img/sitelogo.png" alt="logo" width="100px">
                {{-- <h1>myiotlab</h1> --}}
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="single-posts col-lg-6 col-sm-6">
            <img class="img-fluid" src="{{asset('storage/post/'.$post->image)}}" alt="">
                <div class="date mt-20 mb-20">{{$post->created_at->diffForHumans()}}</div>
                <div class="detail">
                    <a href="{{route('post', $post->slug)}}"><h3 class="pb-20">{{$post->title}}</h3></a>
                   <div class="row d-flex">
                    <h4 class="ml-3">{{$post->category->name}}</h4>
                    <div class="col-lg-4 col-md-12 right-side d-flex justify-content-end ml-auto">
                        <div class="desc">
                        <h4>{{$post->user->name}}</h4>
                        <p>{{$post->created_at->diffForHumans()}}</p>
                        </div>
                        <div class="user-img">
                        <img src="{{asset('storage/user/'.$post->user->image)}}" alt=""  width="50px"/>
                        </div>
                  </div>
                   </div>
                    <p>
                        {!!Str::limit($post->body, 300)!!}
                    </p>
                    <p class="footer pt-20">
                    <i class="fa fa-heart-o" aria-hidden="true"></i>
                    <a href="#">{{$post->likedUsers->count()}} Likes</a> <i class="ml-20 fa fa-comment-o" aria-hidden="true"></i> <a href="#">{{$post->comments->count()}} Comments</a>
                    </p>
                </div>
                <div class="justify-content-center d-flex">
                    <a class="text-uppercase primary-btn loadmore-btn mt-70 mb-60" href="{{route('post', $post->slug)}}">Read more</a>
                </div>                                                                       
            </div>
           
        </div>
        <div class="row justify-content-center">
            <div class="col-6 mail-footer">
                <p>This email is from <a href="https://myiotlab.in">myiotlab.in</a></p>
                <p>© 2020 myiotlab. All Rights Reserved</p>
            </div>
        </div>
    </div>

    {{-- JS --}}
    <script src="{{asset('frontend/js/vendor/jquery-2.2.4.min.js')}}"></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
      integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
      crossorigin="anonymous"
    ></script>
    <script src="{{asset('frontend/js/vendor/bootstrap.min.js')}}"></script>
    <script src="{{asset('frontend/js/jquery.ajaxchimp.min.js')}}"></script>
    <script src="{{asset('frontend/js/parallax.min.js')}}"></script>
    <script src="{{asset('frontend/js/owl.carousel.min.js')}}"></script>
    <script src="{{asset('frontend/js/jquery.magnific-popup.min.js')}}"></script>
    <script src="{{asset('frontend/js/jquery.sticky.js')}}"></script>
    <script src="{{asset('frontend/js/main.js')}}"></script>
</body>
</html>