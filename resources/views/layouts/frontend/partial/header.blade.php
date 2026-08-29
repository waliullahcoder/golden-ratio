

<style>

/* =========================================================
   HEADER
========================================================= */
/* 
.header_area {
    width: 100%;
    background: #000;
    position: sticky;
    top: 0;
    left: 0;
    z-index: 9999;

    box-shadow: 0 3px 15px rgba(0, 0, 0, 0.35);
} */


/* =========================================================
   MAIN WRAPPER
========================================================= */

.header-wrapper {
    display: flex;
    align-items: center;
    min-height: 115px;
}


/* =========================================================
   LOGO
========================================================= */

.header-logo-area {
    width: 230px;
    flex-shrink: 0;
}

.header-logo-area a {
    display: flex;
    align-items: center;
}

.header-logo {
    max-width: 190px;
    max-height: 75px;
    width: auto;
    height: auto;
    object-fit: contain;
}


/* =========================================================
   RIGHT SIDE
========================================================= */

.header-right {
    flex: 1;
    min-width: 0;
}


/* =========================================================
   ROW 1
   PHONE + EMAIL
========================================================= */

.header-contact-row {
    height: 40px;

    display: flex;
    align-items: center;
    justify-content: flex-end;

    gap: 25px;

    border-bottom: 1px solid rgba(255,255,255,0.15);
}


.contact-item {
    display: flex;
    align-items: center;

    gap: 7px;

    color: #ddd;

    font-size: 13px;
    font-weight: 500;
}

.contact-item i {
    color: #c49b63;
}


/* LOGIN */

.header-login-btn {
    color: #c49b63 !important;

    font-size: 13px;
    font-weight: 600;

    text-decoration: none !important;

    display: flex;
    align-items: center;

    gap: 6px;
    margin-right:14px;
}

.header-login-btn:hover {
    color: #fff !important;
}


/* =========================================================
   ROW 2 MENU
========================================================= */

.header-menu {
    display: flex;
    justify-content: flex-end;
    align-items: center;

    min-height: 55px;
}


/* MENU UL */

.menu_nav {
    display: flex !important;

    align-items: center;
    justify-content: flex-end;

    list-style: none;

    margin: 0;
    padding: 0;

    gap: 5px;
}


/* MENU ITEM */

.menu_nav .nav-item {
    position: relative;
}


/* MENU LINK */

.menu_nav .nav-link {
    display: block;

    color: #fff !important;

    font-size: 17px;
    font-weight: 600;

    text-decoration: none;

    padding: 15px 12px;

    transition: all .25s ease;
}


.menu_nav .nav-link:hover {
    color: #c49b63 !important;
}


.menu_nav .nav-item.active > .nav-link {
    color: #c49b63 !important;
}


/* =========================================================
   ARROW
========================================================= */

.menu-arrow {
    font-size: 8px;
    margin-left: 5px;
}


/* =========================================================
   DROPDOWN
========================================================= */

.custom-dropdown {
    position: absolute;

    top: 100%;
    left: 0;

    min-width: 210px;

    background: #111;

    list-style: none;

    padding: 8px 0;
    margin: 0;

    border: 1px solid #252525;

    box-shadow: 0 8px 25px rgba(0,0,0,.5);

    opacity: 0;
    visibility: hidden;

    transform: translateY(8px);

    transition: all .2s ease;

    z-index: 99999;
}


/* SHOW DROPDOWN */

.dropdown-custom:hover > .custom-dropdown {
    opacity: 1;
    visibility: visible;
    transform: translateY(0);
}


/* DROPDOWN LINK */

.custom-dropdown li a {
    display: block;

    padding: 10px 18px;

    color: #fff;

    font-size: 14px;

    text-decoration: none;

    transition: all .2s ease;
}


.custom-dropdown li a:hover {
    background: #1d1d1d;
    color: #c49b63;
}


/* =========================================================
   MOBILE BUTTON
========================================================= */

.mobile-menu-btn {
    display: none;

    background: transparent;

    border: 1px solid rgba(255,255,255,.35);

    color: #fff;

    font-size: 20px;

    padding: 5px 10px;

    border-radius: 3px;

    cursor: pointer;
}


/* =========================================================
   TABLET
========================================================= */

@media (max-width: 1100px) {

    .header-logo-area {
        width: 190px;
    }

    .header-logo {
        max-width: 155px;
    }

    .menu_nav .nav-link {
        font-size: 15px;
        padding-left: 8px;
        padding-right: 8px;
    }

    .header-contact-row {
        gap: 15px;
    }

}


/* =========================================================
   MOBILE
========================================================= */

@media (max-width: 767px) {

    .header-wrapper {
        min-height: auto;

        padding: 10px 0;

        align-items: flex-start;
    }


    /* LOGO */

    .header-logo-area {
        width: 125px;
    }

    .header-logo {
        max-width: 115px;
        max-height: 55px;
    }


    /* RIGHT */

    .header-right {
        flex: 1;
    }


    /* CONTACT */

    .header-contact-row {
        height: auto;

        min-height: 30px;

        gap: 8px;

        flex-wrap: wrap;

        border-bottom: 0;
    }

    .contact-item {
        font-size: 10px;
        gap: 4px;
    }

    .contact-item i {
        font-size: 10px;
    }

    .header-login-btn {
        font-size: 10px;
    }


    /* MENU AREA */

    .header-menu {
        display: block;

        min-height: 0;
    }


    /* HAMBURGER */

    .mobile-menu-btn {
        display: block;

        margin: 7px 0 0 auto;
    }


    /* MENU */

    .menu_nav {
        display: none !important;

        width: 100%;

        flex-direction: column;

        align-items: stretch;

        background: #111;

        margin-top: 10px;

        gap: 0;
    }


    .menu_nav.show {
        display: flex !important;
    }


    .menu_nav .nav-link {
        font-size: 15px;

        padding: 11px 14px;

        border-bottom: 1px solid rgba(255,255,255,.08);
    }


    /* MOBILE DROPDOWN */

    .custom-dropdown {
        position: static;

        display: none;

        opacity: 1;
        visibility: visible;

        transform: none;

        width: 100%;

        border: 0;

        box-shadow: none;

        background: #181818;
    }


    .dropdown-custom:hover > .custom-dropdown {
        display: none;
    }


    .dropdown-custom.open > .custom-dropdown {
        display: block;
    }

}


/* =========================================================
   SMALL MOBILE
========================================================= */

@media (max-width: 480px) {

    .header-logo-area {
        width: 105px;
    }

    .header-logo {
        max-width: 95px;
    }

    .contact-item span {
        max-width: 100px;

        white-space: nowrap;

        overflow: hidden;

        text-overflow: ellipsis;
    }

}

</style>


<header class="header_area">

    <div class="container">

        <div class="header-wrapper">

            {{-- ================= LEFT: LOGO ================= --}}
            <div class="header-logo-area">
                <a href="{{ url('/') }}">
                    <img src="{{ asset($settings->logo ? $settings->logo : './backend/images/logo/logo.png') }}"
                         alt="Logo"
                         class="header-logo">
                </a>
            </div>


            {{-- ================= RIGHT SIDE ================= --}}
            <div class="header-right">

                {{-- ROW 1: PHONE + EMAIL --}}
                <div class="header-contact-row">

                    <div class="contact-item">
                        <i class="fa fa-phone"></i>
                        <span>{{ $settings->primary_phone }}</span>
                    </div>

                    <div class="contact-item">
                        <i class="fa fa-envelope"></i>
                        <span>{{ $settings->primary_email }}</span>
                    </div>

                    <a href="{{ auth()->check() ? route('frontend.user.dashboard') : route('auth.signinPage') }}"
                       class="header-login-btn">
                        <i class="fa fa-user"></i>
                        {{ auth()->check() ? 'Dashboard' : 'Login' }}
                    </a>

                </div>


                {{-- ROW 2: MENU --}}
                <div class="header-menu">

                    {{-- MOBILE BUTTON --}}
                    <button class="mobile-menu-btn"
                            type="button"
                            onclick="toggleMobileMenu()">
                        <i class="fa fa-bars"></i>
                    </button>


                    {{-- MENU --}}
                    <ul class="menu_nav" id="mainMenu">

                        {{-- HOME --}}
                        <li class="nav-item {{ Request::routeIs('home') ? 'active' : '' }}">
                            <a class="nav-link" href="{{ route('home') }}">
                                Home
                            </a>
                        </li>


                        {{-- ABOUT --}}
                        <li class="nav-item {{ Request::routeIs('aboutPage') ? 'active' : '' }}">
                            <a class="nav-link" href="{{ route('aboutPage') }}">
                                About
                            </a>
                        </li>


                        {{-- ACCOMMODATION --}}
                        <li class="nav-item dropdown-custom">

                            <a href="{{ route('roomsPage') }}" class="nav-link">
                                Accommodation
                                <span class="menu-arrow">▼</span>
                            </a>

                            <ul class="custom-dropdown">

                                @foreach ($categories as $category)

                                    <li>
                                        <a href="{{ route('roomsPage', ['catid' => $category->id]) }}">
                                            {{ $category->name }}
                                        </a>
                                    </li>

                                @endforeach

                            </ul>

                        </li>


                        {{-- SERVICES --}}
                        <li class="nav-item dropdown-custom">

                            <a href="javascript:void(0)" class="nav-link">
                                Services
                                <span class="menu-arrow">▼</span>
                            </a>

                            <ul class="custom-dropdown">

                                @foreach ($global_services['menu'] as $service)

                                    <li>
                                        <a href="{{ route('serviceDetails', $service->id) }}">
                                            {{ $service->name }}
                                        </a>
                                    </li>

                                @endforeach

                            </ul>

                        </li>


                        {{-- GALLERY --}}
                        <li class="nav-item {{ Request::routeIs('galleryPage') ? 'active' : '' }}">
                            <a class="nav-link" href="{{ route('galleryPage') }}">
                                Gallery
                            </a>
                        </li>


                        {{-- BOOKING --}}
                        <li class="nav-item {{ Request::routeIs('booking.index') ? 'active' : '' }}">
                            <a class="nav-link" href="{{ route('booking.index') }}">
                                Booking
                            </a>
                        </li>


                        {{-- CONTACT --}}
                        <li class="nav-item {{ Request::routeIs('contactPage') ? 'active' : '' }}">
                            <a class="nav-link" href="{{ route('contactPage') }}">
                                Contact
                            </a>
                        </li>

                    </ul>

                </div>

            </div>

        </div>

    </div>

</header>



<script>

function toggleMobileMenu() {

    const menu = document.getElementById('mainMenu');

    menu.classList.toggle('show');

}


/* Mobile dropdown */

document.addEventListener('DOMContentLoaded', function () {

    const dropdowns = document.querySelectorAll('.dropdown-custom > .nav-link');

    dropdowns.forEach(function (link) {

        link.addEventListener('click', function (e) {

            if (window.innerWidth <= 767) {

                e.preventDefault();

                this.parentElement.classList.toggle('open');

            }

        });

    });

});

</script>
