<aside id="left-panel" class="left-panel">
    <nav class="navbar navbar-expand-sm navbar-default">
        <div class="navbar-header">
            <button
                class="navbar-toggler"
                type="button"
                data-toggle="collapse"
                data-target="#main-menu"
                aria-controls="main-menu"
                aria-expanded="false"
                aria-label="Toggle navigation"
            >
                <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand" href="./"
                ><img src="{{asset('backend/images/logo.png')}}" alt="Logo"
            /></a>
            <a class="navbar-brand hidden" href="./"
                ><img src="{{asset('backend/images/logo2.png')}}" alt="Logo"
            /></a>
        </div>

        <div id="main-menu" class="main-menu collapse navbar-collapse">
            @if (Auth::user()->role_id==1)
            <ul class="nav navbar-nav">
                <li class="active">
                    <a href="{{route('admin.dashboard')}}">
                        <i class="menu-icon fa fa-dashboard"></i
                        >Dashboard
                    </a>
                </li>
                <h3 class="menu-title">CMS</h3>
                <!-- /.menu-title -->
                <li class="active">
                    <a href="{{route('admin.user.index')}}">
                        <i class="menu-icon fa fa-user"></i>Users
                    </a>
                </li>
                <li class="active">
                    <a href="{{route('admin.category.index')}}">
                        <i class="menu-icon fa fa-file"></i>Categories
                    </a>
                </li>
                <li class="active">
                    <a href="{{route('admin.post.index')}}">
                        <i class="menu-icon fa fa-file"></i>Posts
                    </a>
                </li>
                <li class="active">
                    <a href="{{route('admin.comment.index')}}">
                        <i class="menu-icon fa fa-file"></i>Comments
                    </a>
                </li>
                <li class="active">
                    <a href="{{route('admin.reply-comment.index')}}">
                        <i class="menu-icon fa fa-file"></i>Replied Comments
                    </a>
                </li>
            </ul>
            @else
            <ul class="nav navbar-nav">
                <li class="active">
                    <a href="{{route('user.dashboard')}}">
                        <i class="menu-icon fa fa-dashboard"></i
                        >Dashboard
                    </a>
                </li>
                <h3 class="menu-title">CMS</h3>
                <!-- /.menu-title -->
                <li class="active">
                    <a href="{{route('user.comment.index')}}">
                        <i class="menu-icon fa fa-file"></i>Comments
                    </a>
                </li>
                <li class="active">
                    <a href="{{route('user.reply-comment.index')}}">
                        <i class="menu-icon fa fa-file"></i>Replied Comments
                    </a>
                </li>
            </ul>
            @endif
        </div>
        <!-- /.navbar-collapse -->
    </nav>
</aside>
