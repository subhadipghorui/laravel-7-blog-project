<header id="header" class="header">
    <div class="header-menu">
        <div class="col-sm-7">
            <a id="menuToggle" class="menutoggle pull-left"
                ><i class="fa fa fa-tasks"></i
            ></a>
            <div class="header-left">
                <a href="/">Home</a>
            </div>
        </div>

        <div class="col-sm-5">
            <div class="user-area dropdown float-right">
                <a
                    href="#"
                    class="dropdown-toggle"
                    data-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false"
                >
                    <img
                        class="user-avatar rounded-circle"
                        src="{{asset('storage/user/'.Auth::user()->image)}}"
                        alt="User Avatar"
                    />
                </a>

                <div class="user-menu dropdown-menu">
                    @if (Auth::user()->role->id == 1)
                    <a class="nav-link" href="{{route('admin.profile')}}"
                        ><i class="fa fa-user"></i> My Profile</a
                    >
                    @elseif(Auth::user()->role->id == 2)
                    <a class="nav-link" href="{{route('user.profile')}}"
                        ><i class="fa fa-user"></i> My Profile</a
                    >
                    @else
                    null
                    @endif
                
                    <a class="nav-link" href="{{ route('logout') }}"
                        onclick="event.preventDefault();
                        document.getElementById('logout-form').submit();">
                        <i class="fa fa-power-off"></i> Logout
                    </a>

                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                        @csrf
                    </form>
                </div>
            </div>
        </div>
    </div>
</header>
