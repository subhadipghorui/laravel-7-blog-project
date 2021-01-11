@extends('layouts.frontend.app')

@section('content')
<!-- Start top-section Area -->
<section class="top-section-area section-gap">
  <div class="container">
    <div class="row justify-content-between align-items-center d-flex">
      <div class="col-lg-8 top-left">
        <h1 class="text-white mb-20">Post Details</h1>
        <ul>
          <li>
            <a href="index.html">Home</a
            ><span class="lnr lnr-arrow-right"></span>
          </li>
          <li>
            <a href="category.html">Category</a
            ><span class="lnr lnr-arrow-right"></span>
          </li>
          <li><a href="single.html">Fashion</a></li>
        </ul>
      </div>
    </div>
  </div>
</section>
<!-- End top-section Area -->

<!-- Start post Area -->
<div class="post-wrapper pt-100">
  <!-- Start post Area -->
  <section class="post-area">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8">
          <div class="single-page-post">
            <img class="img-fluid" src="{{asset('storage/post/'.$post->image)}}" alt="{{$post->image}}" />
            <div class="top-wrapper">
              <div class="row d-flex justify-content-between">
                <h2 class="col-lg-8 col-md-12 text-uppercase">
               {{$post->title}}
                </h2>
                <div
                  class="col-lg-4 col-md-12 right-side d-flex justify-content-end"
                >
                  <div class="desc">
                    <h2>{{$post->user->name}}</h2>
                    <h3>{{$post->created_at->diffForHumans()}}</h3>
                  </div>
                  <div class="user-img">
                    <img src="{{asset('storage/user/'.$post->user->image)}}" alt="{{$post->user->name}}"  width="50px"/>
                  </div>
                </div>
              </div>
              <h4 class="text-muted">{{$post->category->name}}</h4>
            </div>
            <div class="tags">
              <ul>
                @foreach ($post->tags as $tag)
                <li><a href="#">{{$tag->name}}</a></li>
                @endforeach
              </ul>
            </div>
            <div class="single-post-content">
             {!! $post->body !!}
            </div>
            <div class="bottom-wrapper">
              <div class="row">
                <div class="col-lg-4 single-b-wrap col-md-12">
                 @guest
                      <i class="fa fa-heart-o" aria-hidden="true"></i>{{$post->likedUsers->count()}} people like this
                  @else
                  <a href="#" onclick="document.getElementById('like-form-{{$post->id}}').submit();"> <i class="fa fa-heart" aria-hidden="true" style="color: {{Auth::user()->likedPosts()->where('post_id', $post->id)->count() > 0 ? 'red' : ''}}"></i></a>
                      {{$post->likedUsers->count()}} people like this
                  
                      <form action="{{route('post.like',$post->id)}}" method="POST" style="display: none" id="like-form-{{$post->id}}">
                      @csrf
                      </form>
                  @endguest
                </div>
                <div class="col-lg-4 single-b-wrap col-md-12">
                  <i class="fa fa-eye" aria-hidden="true"></i> {{$post->view_count}}
                  views
                </div>
                <div class="col-lg-4 single-b-wrap col-md-12">
                  <i class="fa fa-comment-o" aria-hidden="true"></i> {{$post->comments->count()}}
                  comments
                </div>
                <div class="row mx-1">
                  <div class="col-lg-6 single-b-wrap col-md-12 pt-4">
                    <h5>Share it on your social media account.</h5>
                   </div>
                  <div class="col-lg-6 single-b-wrap col-md-12 mt-3" id="social-links">
                    <ul class="social-icons">
                      <li> 
                        <a href="#" id="gmail-btn"
                          ><i class="fa fa-envelope-o" aria-hidden="true" style="color: #cf3e39; font-size: 2rem"></i></a>
                      </li>
                      <li> 
                        <a href="#" id="facebook-btn"
                          ><i class="fa fa-facebook-square" aria-hidden="true" style="color: #3b5998; font-size: 2rem"></i></a>
                      </li>
                      <li>
                        <a href="#" id="gplus-btn"
                          ><i class="fa fa-google-plus-square" aria-hidden="true" style="color: #dd4b39; font-size: 2rem"></i>
                      </a>
                      </li>
                      <li>
                        <a href="#" id="twitter-btn"
                          ><i class="fa fa-twitter-square" aria-hidden="true" style="color: #1da1f2; font-size: 2rem"></i>
                        </a>
                      </li>
                      <li>
                        <a href="#" id="linkedin-btn"
                          ><i class="fa fa-linkedin-square" aria-hidden="true" style="color: #0077b5; font-size: 2rem"></i>
                        </a>
                      </li>
                      <li>
                        <a href="#" id="whatsapp-btn"
                          ><i class="fa fa-whatsapp" aria-hidden="true" style="color: #25d366; font-size: 2rem"></i>
                        </a>
                      </li>
                    </ul>
                  </div>
                  <div class="col-lg-6 single-b-wrap col-md-12 mt-3">
                    <button class="btn btn-primary" id="shareBtn" style="display: none"><i class="fa fa fa-share text-white" aria-hidden="true"></i> Share</button>
                  </div>
                </div>
              </div>
            </div>

            <!-- Start comment-sec Area -->
            <section class="comment-sec-area pt-80 pb-80">
              <div class="container">
                <div class="row flex-column">
                  <h5 class="text-uppercase pb-80">{{$post->comments->count()}} Comments</h5>
                  <br />
                @foreach ($post->comments as $comment)
                <div class="comment">
                      <div class="comment-list">
                        <div class="single-comment justify-content-between d-flex">
                          <div class="user justify-content-between d-flex">
                            <div class="thumb">
                              <img src="{{asset('storage/user/'.$comment->user->image)}}" alt="{{$comment->user->image}}" width="50px">
                            </div>
                            <div class="desc">
                              <h5><a href="#">{{$comment->user->name}}</a></h5>
                              <p class="date">{{$comment->created_at->format('D, d M Y H:i')}}</p>
                              <p class="comment">
                                {{$comment->message}}
                              </p>
                            </div>
                          </div>
                          <div class="">
                            <button class="btn-reply text-uppercase" id="reply-btn"
                              onclick="showReplyForm('{{$comment->id}}','{{$comment->user->name}}')">reply</button
                            >
                          </div>
                        </div>
                      </div>
                    @if($comment->replies->count() > 0)
                      @foreach ($comment->replies as $reply)
                      <div class="comment-list left-padding">
                        <div
                          class="single-comment justify-content-between d-flex"
                        >
                          <div class="user justify-content-between d-flex">
                            <div class="thumb">
                              <img src="{{asset('storage/user/'.$reply->user->image)}}" alt="{{$reply->user->image}}" width="50px"/>
                            </div>
                            <div class="desc">
                              <h5><a href="#">{{$reply->user->name}}</a></h5>
                              <p class="date">{{$reply->created_at->format('D, d M Y H:i')}}</p>
                              <p class="comment">
                                {{$reply->message}}
                              </p>
                            </div>
                          </div>
                          <div class="">
                            <button class="btn-reply text-uppercase" id="reply-btn"
                              onclick="showReplyForm('{{$comment->id}}','{{$reply->user->name}}')">reply</button
                            >
                          </div>
                        </div>
                      </div>

                      @endforeach
                    @else
                    @endif
                      {{-- When user login show reply fourm --}}
                      @guest
                      {{-- Show none --}}
                      @else
                      <div class="comment-list left-padding" id="reply-form-{{$comment->id}}" style="display: none">
                        <div
                          class="single-comment justify-content-between d-flex"
                        >
                          <div class="user justify-content-between d-flex">
                            <div class="thumb">
                              <img src="{{asset('storage/user/'.Auth::user()->image)}}" alt="{{Auth::user()->image}}" width="50px"/>
                            </div>
                            <div class="desc">
                              <h5><a href="#">{{Auth::user()->name}}</a></h5>
                              <p class="date">{{date('D, d M Y H:i')}}</p>
                              <div class="row flex-row d-flex">
                              <form action="{{route('reply.store',$comment->id)}}" method="POST">
                              @csrf
                                <div class="col-lg-12">
                                  <textarea
                                    id="reply-form-{{$comment->id}}-text"
                                    cols="60"
                                    rows="2"
                                    class="form-control mb-10"
                                    name="message"
                                    placeholder="Messege"
                                    onfocus="this.placeholder = ''"
                                    onblur="this.placeholder = 'Messege'"
                                    required=""
                                  ></textarea>
                                </div>
                                <button type="submit" class="btn-reply text-uppercase ml-3">Reply</button>
                              </form>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      @endguest
                  </div>
                 @endforeach
                </div>
              </div>
            </section>
            <!-- End comment-sec Area -->

            <!-- Start commentform Area -->
            <section class="commentform-area pb-120 pt-80 mb-100">
            @guest
                <div class="container">
                    <h4>Please Sign in to post comments - <a href="{{route('login')}}">Sing in</a> or <a href="{{route('register')}}">Register</a></h4>
                </div>
            @else
                <div class="container">
                  <h5 class="text-uppercas pb-50">Leave a Reply</h5>
                  <div class="row flex-row d-flex">
                      <div class="col-lg-12">
                          <form action="{{route('comment.store', $post->id)}}" method="POST">
                              @csrf
                          <textarea
                            class="form-control mb-10"
                            name="message"
                            placeholder="Messege"
                            onfocus="this.placeholder = ''"
                            onblur="this.placeholder = 'Messege'"
                            required=""
                          ></textarea>
                          <button type="submit" class="primary-btn mt-20" href="#">Comment</button>
                      </form>
                      </div>
                  </div>
                </div>
                @endguest
            </section>
            <!-- End commentform Area -->
          </div>
        </div>
        @include('layouts.frontend.partials.sidebar')
      </div>
    </div>
  </section>
  <!-- End post Area -->
</div>
<!-- End post Area -->
@endsection
@push('footer')
    <script type="text/javascript">
    function showReplyForm(commentId,user) {
      var x = document.getElementById(`reply-form-${commentId}`);
      var input = document.getElementById(`reply-form-${commentId}-text`);

      if (x.style.display === "none") {
        x.style.display = "block";
        input.innerText=`@${user} `;

      } else {
        x.style.display = "none";
      }
    }
    // Social Share links.
    const gmailBtn = document.getElementById('gmail-btn');
    const facebookBtn = document.getElementById('facebook-btn');
    const gplusBtn = document.getElementById('gplus-btn');
    const linkedinBtn = document.getElementById('linkedin-btn');
    const twitterBtn = document.getElementById('twitter-btn');
    const whatsappBtn = document.getElementById('whatsapp-btn');
    const socialLinks = document.getElementById('social-links');

    // posturl posttitle
    let postUrl = encodeURI(document.location.href);
    let postTitle = encodeURI('{{$post->title}}');

    facebookBtn.setAttribute("href",`https://www.facebook.com/sharer.php?u=${postUrl}`);
    twitterBtn.setAttribute("href", `https://twitter.com/share?url=${postUrl}&text=${postTitle}`);
    linkedinBtn.setAttribute("href", `https://www.linkedin.com/shareArticle?url=${postUrl}&title=${postTitle}`);
    whatsappBtn.setAttribute("href",`https://wa.me/?text=${postTitle} ${postUrl}`);
    gmailBtn.setAttribute("href",`https://mail.google.com/mail/?view=cm&su=${postTitle}&body=${postUrl}`);
    gplusBtn.setAttribute("href",`https://plus.google.com/share?url=${postUrl}`);
    
    // Button
    const shareBtn = document.getElementById('shareBtn');
    if(navigator.share){
      shareBtn.style.display = 'block';
      socialLinks.style.display = 'none';
      shareBtn.addEventListener('click', ()=>{
        navigator.share({
          title: postTitle,
          url:postUrl
        }).then((result) => {
          alert('Thank You for Sharing.')
        }).catch((err) => {
          console.log(err);
        });;
      });
    }else{

    }
    </script>
@endpush
