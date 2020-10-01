<div class="col-lg-4 sidebar-area">
    <div class="single_widget search_widget">
      <div id="imaginary_container">
          <form action="{{route('search')}}" method="GET">
        <div class="input-group stylish-input-group">
                <input
                type="text"
                class="form-control"
                placeholder="Search"
                name="search"
              />
              <span class="input-group-addon">
                <button type="submit">
                  <span class="lnr lnr-magnifier"></span>
                </button>
            </span>
        </div>
    </form>
      </div>
    </div>
    <div class="single_widget cat_widget">
      <h4 class="text-uppercase pb-20">post categories</h4>
      <ul>
        @foreach ($categories as $category)
        <li>
            <a href="{{route('category.post', $category->slug)}}">{{$category->name}} <span>{{$category->posts->count()}}</span></a>
          </li>
        @endforeach
      </ul>
    </div>

    <div class="single_widget recent_widget">
      <h4 class="text-uppercase pb-20">Recent Posts</h4>
      <div class="active-recent-carusel">
        @foreach ($recentPosts as $recentPost)
        <div class="item">
        <img src="{{asset('storage/post/'.$recentPost->image)}}" alt="{{$recentPost->image}}" width="200px" />
        <a href="{{route('post', $recentPost->slug)}}">
        <p class="mt-20 title text-uppercase">
            {{$recentPost->title}}
        </p>
        </a>
        <p>
        {{$recentPost->created_at->diffForHumans()}}
          <span>
            <i class="fa fa-heart-o" aria-hidden="true"></i> 06
            <i class="fa fa-comment-o" aria-hidden="true"></i
            >02</span
          >
        </p>
      </div>
    @endforeach
      </div>
    </div>
    <div class="single_widget tag_widget">
      <h4 class="text-uppercase pb-20">Tag Clouds</h4>
      <ul>
       @foreach ($recentTags->unique('name')->take(10) as $recentTag)
       <li><a href="{{route('tag.posts', $recentTag->name)}}">{{$recentTag->name}}</a></li>
       @endforeach
      </ul>
    </div>
  </div>
