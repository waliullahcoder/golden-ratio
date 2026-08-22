<aside class="bg-dark aside aside-fixed d-flex flex-column">
    <div class="brand p-2">
        <a href="{{ route('admin.dashboard') }}" class="brand-logo w-100">
            <img src="{{ asset('backend/images/logo/favicon.png') }}" height="46" width="100%" alt="Logo" style="object-fit: contain;">
        </a>
    </div>

    <div class="aside-menu-wrapper pt-4">
        <div class="aside-menu overflow-auto c-scrollbar-light" style="height: calc(100vh - 119px);">
            <ul class="menu-nav">

                {{-- Dashboard --}}
                <li class="menu-item root-menu {{ request()->routeIs('admin.dashboard') ? 'menu-item-active' : '' }}">
                    <a href="{{ route('admin.dashboard') }}" class="menu-link">
                        <span class="svg-icon menu-icon">
                            <!-- Dashboard Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24">
                                <rect x="4" y="4" width="7" height="7" rx="1.5"></rect>
                                <path d="M5.5,13 L9.5,13 C10.328,13 11,13.671 11,14.5 L11,18.5 C11,19.328 10.328,20 9.5,20 L5.5,20 C4.671,20 4,19.328 4,18.5 L4,14.5 C4,13.671 4.671,13 5.5,13 Z M14.5,4 L18.5,4 C19.328,4 20,4.671 20,5.5 L20,9.5 C20,10.328 19.328,11 18.5,11 L14.5,11 C13.671,11 13,10.328 13,9.5 L13,5.5 C13,4.671 13.671,4 14.5,4 Z M14.5,13 L18.5,13 C19.328,13 20,13.671 20,14.5 L20,18.5 C20,19.328 19.328,20 18.5,20 L14.5,20 C13.671,20 13,19.328 13,18.5 L14.5,13 Z" fill="#000000" opacity="0.3"></path>
                            </svg>
                        </span>
                        <span class="menu-text">Dashboard</span>
                    </a>
                </li>
                {{-- Categories --}}
                <li class="menu-item root-menu has-submenu {{ request()->routeIs('admin.categories*') ? 'menu-item-active' : '' }}">
                    <a href="#" class="menu-link">
                        <span class="svg-icon menu-icon">
                            <!-- Rooms Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24">
                                <path d="M4 4h16v16H4z" fill="#000" opacity="0.3"/>
                                <path d="M6 6h4v4H6zm8 0h4v4h-4zm0 8h4v4h-4zm-8 0h4v4H6z"/>
                            </svg>
                        </span>
                        <span class="menu-text">Categories</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="menu-submenu">
                        <ul class="menu-subnav">
                            <li class="menu-item">
                                <a href="{{ route('admin.categories.index') }}" class="menu-link">
                                    <span class="menu-text">Manage Categories</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>

                {{-- Rooms --}}
                <li class="menu-item root-menu has-submenu {{ request()->routeIs('admin.rooms*') ? 'menu-item-active' : '' }}">
                    <a href="#" class="menu-link">
                        <span class="svg-icon menu-icon">
                            <!-- Rooms Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24">
                                <path d="M4 4h16v16H4z" fill="#000" opacity="0.3"/>
                                <path d="M6 6h4v4H6zm8 0h4v4h-4zm0 8h4v4h-4zm-8 0h4v4H6z"/>
                            </svg>
                        </span>
                        <span class="menu-text">Rooms</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="menu-submenu">
                        <ul class="menu-subnav">
                            <li class="menu-item">
                                <a href="{{ route('admin.rooms') }}" class="menu-link">
                                    <span class="menu-text">Manage Rooms</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>

                {{-- Services --}}
                <li class="menu-item root-menu has-submenu {{ request()->routeIs('admin.services*') ? 'menu-item-active' : '' }}">
                    <a href="#" class="menu-link">
                        <span class="svg-icon menu-icon">
                            <!-- Services Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24">
                                <circle cx="12" cy="12" r="10" fill="#000" opacity="0.3"/>
                                <path d="M12 6v6l4 2"/>
                            </svg>
                        </span>
                        <span class="menu-text">Services</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="menu-submenu">
                        <ul class="menu-subnav">
                            <li class="menu-item">
                                <a href="{{ route('admin.services') }}" class="menu-link">
                                    <span class="menu-text">List Services</span>
                                </a>
                            </li>
                            <li class="menu-item">
                                <a href="{{ route('admin.services.create') }}" class="menu-link">
                                    <span class="menu-text">Add Service</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>

                {{-- Bookings --}}
                <li class="menu-item root-menu has-submenu {{ request()->routeIs('admin.bookings*') ? 'menu-item-active' : '' }}">
                    <a href="#" class="menu-link">
                        <span class="svg-icon menu-icon">
                            <!-- Bookings Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24">
                                <path d="M3 6h18v12H3z" fill="#000" opacity="0.3"/>
                                <path d="M6 6h12v12H6z"/>
                            </svg>
                        </span>
                        <span class="menu-text">Bookings</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="menu-submenu">
                        <ul class="menu-subnav">
                            <li class="menu-item">
                                <a href="{{ route('admin.bookings') }}" class="menu-link">
                                    <span class="menu-text">List Bookings</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>

                {{-- Testimonials --}}
                <li class="menu-item root-menu has-submenu {{ request()->routeIs('admin.testimonials*') ? 'menu-item-active' : '' }}">
                    <a href="#" class="menu-link">
                        <span class="svg-icon menu-icon">
                            <!-- Testimonials Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24">
                                <path d="M2 12h20v8H2z" fill="#000" opacity="0.3"/>
                                <path d="M4 14h16v4H4z"/>
                            </svg>
                        </span>
                        <span class="menu-text">Testimonials</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="menu-submenu">
                        <ul class="menu-subnav">
                            <li class="menu-item">
                                <a href="{{ route('admin.testimonials') }}" class="menu-link">
                                    <span class="menu-text">List Testimonials</span>
                                </a>
                            </li>
                            <li class="menu-item">
                                <a href="{{ route('admin.testimonials.create') }}" class="menu-link">
                                    <span class="menu-text">Add Testimonial</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>

            </ul>
        </div>

        {{-- Footer/Social --}}
        <div class="d-flex align-items-center social-wrapper" style="height: 55px; border-top: 1px solid #cbd0dd;">
            <ul class="w-100 p-2 d-flex align-items-center justify-content-center social">
                <li>
                    <a class="p-2 d-block social-link" href="" target="_blank">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" fill="currentColor" width="24" height="24">
                            <path d="M224 122.8c-72.7 0-131.8 59.1-131.9 131.8 0 24.9 7 49.2 20.2 70.1l3.1 5-13.3 48.6 49.9-13.1 4.8 2.9c20.2 12 43.4 18.4 67.1 18.4h.1c72.6 0 133.3-59.1 133.3-131.8 0-35.2-15.2-68.3-40.1-93.2-25-25-58-38.7-93.2-38.7zm77.5 188.4c-3.3 9.3-19.1 17.7-26.7 18.8-12.6 1.9-22.4.9-47.5-9.9-39.7-17.2-65.7-57.2-67.7-59.8-2-2.6-16.2-21.5-16.2-41s10.2-29.1 13.9-33.1c3.6-4 7.9-5 10.6-5 2.6 0 5.3 0 7.6.1 2.4.1 5.7-.9 8.9 6.8 3.3 7.9 11.2 27.4 12.2 29.4s1.7 4.3.3 6.9c-7.6 15.2-15.7 14.6-11.6 21.6 15.3 26.3 30.6 35.4 53.9 47.1 4 2 6.3 1.7 8.6-1 2.3-2.6 9.9-11.6 12.5-15.5 2.6-4 5.3-3.3 8.9-2 3.6 1.3 23.1 10.9 27.1 12.9s6.6 3 7.6 4.6c.9 1.9.9 9.9-2.4 19.1zM400 32H48C21.5 32 0 53.5 0 80v352c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V80c0-26.5-21.5-48-48-48zM223.9 413.2c-26.6 0-52.7-6.7-75.8-19.3L64 416l22.5-82.2c-13.9-24-21.2-51.3-21.2-79.3C65.4 167.1 136.5 96 223.9 96c42.4 0 82.2 16.5 112.2 46.5 29.9 30 47.9 69.8 47.9 112.2 0 87.4-72.7 158.5-160.1 158.5z"/>
                        </svg>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</aside>
