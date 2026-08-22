<header class="header_area">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light align-items-center">

            <!-- LEFT: LOGO -->
            <a class="navbar-brand d-flex align-items-center" href="{{ url('/') }}">
                <img src="{{ asset($settings->logo? $settings->logo : './backend/images/logo/logo.png') }}" 
                     alt="Logo" class="header-logo">
            </a>

            <!-- MOBILE TOGGLER -->
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarSupportedContent">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- MIDDLE: MENU -->
            <div class="collapse navbar-collapse justify-content-center"
                 id="navbarSupportedContent">
                <ul class="navbar-nav menu_nav">

                    <li class="nav-item {{ Request::routeIs('home') ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('home') }}">Home</a>
                    </li>

                    <li class="nav-item {{ Request::routeIs('aboutPage') ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('aboutPage') }}">About</a>
                    </li>

                    

                    <!-- Rooms -->
                  <li class="nav-item {{ Request::routeIs('roomsPage') ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('roomsPage') }}">Rooms</a>
                    </li>
                    <!-- Services -->
                    <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"
                            role="button" aria-haspopup="true" aria-expanded="false">
                                Services <span class="ms-1">▼</span>
                            </a>
                            <ul class="dropdown-menu">
                                @foreach ($global_services['menu'] as $service)
                                <li class="nav-item"><a class="nav-link" href="{{ route('serviceDetails', $service->id) }}">{{ $service->name }}</a></li>
                                @endforeach
                            </ul>
                        </li>

                    <li class="nav-item {{ Request::routeIs('galleryPage') ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('galleryPage') }}">Gallery</a>
                    </li>
                     <li class="nav-item {{ Request::routeIs('booking.index') ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('booking.index') }}">Booking</a>
                    </li>
                    <li class="nav-item {{ Request::routeIs('contactPage') ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('contactPage') }}">Contact</a>
                    </li>

                </ul>
            </div>

            <!-- RIGHT: CONTACT INFO -->
            <div class="header-contact d-none d-lg-flex">
                <div class="contact-item">
                    <i class="fa fa-phone"></i>
                    <span>{{ $settings->primary_phone }}</span>
                </div>
                <div class="contact-item">
                    <i class="fa fa-envelope"></i>
                    <span>{{ $settings->primary_email }}</span>
                </div>
                 <!-- LOGIN BUTTON -->
                <a href="{{ auth()->check() ? route('frontend.user.dashboard') : route('auth.signinPage') }}" class="header-login-btn">
                    <i class="fa fa-user"></i> {{ auth()->check() ? auth()->user()->email : 'Login' }}
                </a>

            </div>

        </nav>
    </div>
</header>
