@extends('layouts.frontend.app')

@section('content')

<!--================ Breadcrumb Area =================-->
<section class="breadcrumb_area">
    <div class="container">
        <div class="page-cover text-center">
            <h2 class="page-cover-tittle">Sign In</h2>
            <ol class="breadcrumb">
                <li><a href="{{ url('/') }}">Home</a></li>
                <li class="active">Admin Login</li>
            </ol>
        </div>
    </div>
</section>
<!--================ Breadcrumb Area =================-->

<!--================ Login Area =================-->
<section class="contact_area section_gap">
    <div class="container">
        <div class="row justify-content-center align-items-center">

            <div class="col-md-6 col-lg-5">
                <div class="card shadow"
                     style="border:1px solid #eee; border-radius:16px;">
                    
                    <div class="card-body" style="padding:40px 35px;">
                        
                        {{-- GLOBAL ERROR --}}
                        @if(session('error'))
                            <div class="alert alert-danger text-center">{{ session('error') }}</div>
                        @endif

                        {{-- GLOBAL SUCCESS --}}
                        @if(session('success'))
                            <div class="alert alert-success text-center">{{ session('success') }}</div>
                        @endif

                        <!-- Login Form -->
                        <form action="{{ route('user.signinPost') }}" method="POST">
                            @csrf

                            <!-- Username -->
                            <div class="form-group mb-3">
                                <input type="text"
                                       name="email"
                                       value="{{ old('email') }}"
                                       class="form-control rounded-pill py-2 px-3 @error('email') is-invalid @enderror"
                                       placeholder="Email Address"
                                       required>
                                @error('email')
                                    <small class="text-danger">{{ $message }}</small>
                                @enderror
                            </div>

                            <!-- Password -->
                            <div class="form-group mb-3 position-relative">
                                <input type="password"
                                       name="password"
                                       id="password"
                                       class="form-control rounded-pill py-2 px-3 pe-5 @error('password') is-invalid @enderror"
                                       placeholder="Password"
                                       required>
                                @error('password')
                                    <small class="text-danger">{{ $message }}</small>
                                @enderror
                            </div>

                            <!-- Remember / Forgot -->
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <div class="form-check">
                                    <input class="form-check-input"
                                           type="checkbox"
                                           name="remember"
                                           id="remember"
                                           {{ old('remember') ? 'checked' : '' }}>
                                    <label class="form-check-label" for="remember">
                                        Remember Me
                                    </label>
                                </div>

                                <a href="#" class="small text-muted">Forgot Password?</a>
                            </div>

                            <!-- Submit -->
                            <div class="text-center">
                                <button type="submit"
                                        class="btn theme_btn button_hover w-100 py-2 rounded-pill">
                                    Sign In
                                </button>
                            </div>

                            <!-- Signup link -->
                            <p class="text-center mt-3 mb-0">
                                Don’t have an account?
                                <a href="{{ route('auth.signupPage') }}">Sign Up</a>
                            </p>

                        </form>
                        <!-- Login Form End -->

                    </div>
                </div>
            </div>

        </div>
    </div>
</section>
<!--================ Login Area =================-->

@endsection
