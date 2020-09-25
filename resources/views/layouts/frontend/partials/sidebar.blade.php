<div class="col-lg-4 sidebar-area">
    <div class="single_widget search_widget">
      <div id="imaginary_container">
        <div class="input-group stylish-input-group">
          <input
            type="text"
            class="form-control"
            placeholder="Search"
          />
          <span class="input-group-addon">
            <button type="submit">
              <span class="lnr lnr-magnifier"></span>
            </button>
          </span>
        </div>
      </div>
    </div>
    <div class="single_widget cat_widget">
      <h4 class="text-uppercase pb-20">post categories</h4>
      <ul>
        @foreach ($categories as $category)
        <li>
            <a href="#">{{$category->name}} <span>{{$category->posts->count()}}</span></a>
          </li>
        @endforeach
      </ul>
    </div>

    <div class="single_widget recent_widget">
      <h4 class="text-uppercase pb-20">Recent Posts</h4>
      <div class="active-recent-carusel">
        <div class="item">
          <img src="img/asset/slider.jpg" alt="" />
          <p class="mt-20 title text-uppercase">
            Home Audio Recording <br />
            For Everyone
          </p>
          <p>
            02 Hours ago
            <span>
              <i class="fa fa-heart-o" aria-hidden="true"></i> 06
              <i class="fa fa-comment-o" aria-hidden="true"></i
              >02</span
            >
          </p>
        </div>
        <div class="item">
          <img src="img/asset/slider.jpg" alt="" />
          <p class="mt-20 title text-uppercase">
            Home Audio Recording <br />
            For Everyone
          </p>
          <p>
            02 Hours ago
            <span>
              <i class="fa fa-heart-o" aria-hidden="true"></i> 06
              <i class="fa fa-comment-o" aria-hidden="true"></i
              >02</span
            >
          </p>
        </div>
        <div class="item">
          <img src="img/asset/slider.jpg" alt="" />
          <p class="mt-20 title text-uppercase">
            Home Audio Recording <br />
            For Everyone
          </p>
          <p>
            02 Hours ago
            <span>
              <i class="fa fa-heart-o" aria-hidden="true"></i> 06
              <i class="fa fa-comment-o" aria-hidden="true"></i
              >02</span
            >
          </p>
        </div>
      </div>
    </div>
    <div class="single_widget tag_widget">
      <h4 class="text-uppercase pb-20">Tag Clouds</h4>
      <ul>
        <li><a href="#">Lifestyle</a></li>
        <li><a href="#">Art</a></li>
        <li><a href="#">Adventure</a></li>
        <li><a href="#">Food</a></li>
        <li><a href="#">Technology</a></li>
        <li><a href="#">Fashion</a></li>
        <li><a href="#">Adventure</a></li>
        <li><a href="#">Food</a></li>
        <li><a href="#">Technology</a></li>
      </ul>
    </div>
  </div>
