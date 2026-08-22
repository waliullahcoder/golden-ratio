@extends('layouts.frontend.app')

@section('content')

<!--================ Breadcrumb Area =================-->
<section class="breadcrumb_area">
    <div class="container">
        <div class="page-cover text-center">
            <h2 class="page-cover-tittle">Sign Up</h2>
            <ol class="breadcrumb">
                <li><a href="{{ url('/') }}">Home</a></li>
                <li class="active">Create Account</li>
            </ol>
        </div>
    </div>
</section>
<!--================ Breadcrumb Area =================-->

<!--================ Signup Area =================-->
<section class="contact_area section_gap">
    <div class="container">
        <div class="row justify-content-center">

            <div class="col-md-6 col-lg-5">
                <div class="card shadow"
                     style="border:1px solid #eee; border-radius:16px;">
                    
                    <div class="card-body" style="padding:40px 35px;">

                        {{-- GLOBAL ERROR --}}
                        @if(session('error'))
                            <div class="alert alert-danger text-center">
                                {{ session('error') }}
                            </div>
                        @endif

                        {{-- GLOBAL SUCCESS --}}
                        @if(session('success'))
                            <div class="alert alert-success text-center">
                                {{ session('success') }}
                            </div>
                        @endif

                        <!-- Signup Form -->
                        <form method="POST" action="{{ route('user.signupPost') }}">
                            @csrf

                            <!-- Name -->
                            <div class="form-group mb-3">
                                <label class="form-label">Full Name</label>
                                <input type="text"
                                       name="name"
                                       value="{{ old('name') }}"
                                       class="form-control rounded-pill py-2 px-3 @error('name') is-invalid @enderror"
                                       required>
                                @error('name')
                                    <small class="text-danger">{{ $message }}</small>
                                @enderror
                            </div>

                            <!-- Email -->
                            <div class="form-group mb-3">
                                <label class="form-label">Email Address</label>
                                <input type="email"
                                       name="email"
                                       value="{{ old('email') }}"
                                       class="form-control rounded-pill py-2 px-3 @error('email') is-invalid @enderror"
                                       required>
                                @error('email')
                                    <small class="text-danger">{{ $message }}</small>
                                @enderror
                            </div>

                             <!-- Phone -->
                            <div class="form-group mb-3">
                                <label class="form-label">Phone</label>
                                <input type="phone"
                                       name="phone"
                                       value="{{ old('phone') }}"
                                       class="form-control rounded-pill py-2 px-3 @error('phone') is-invalid @enderror"
                                       required>
                                @error('phone')
                                    <small class="text-danger">{{ $message }}</small>
                                @enderror
                            </div>

                            <!-- Password -->
                            <div class="form-group mb-3">
                                <label class="form-label">Password</label>
                                <input type="password"
                                       name="password"
                                       class="form-control rounded-pill py-2 px-3 @error('password') is-invalid @enderror"
                                       required>
                                @error('password')
                                    <small class="text-danger">{{ $message }}</small>
                                @enderror
                            </div>

                            <!-- Confirm Password -->
                            <div class="form-group mb-3">
                                <label class="form-label">Confirm Password</label>
                                <input type="password"
                                       name="password_confirmation"
                                       class="form-control rounded-pill py-2 px-3"
                                       required>
                            </div>

                            <!-- Terms -->
                            <div class="form-check mb-4">
                                <input class="form-check-input"
                                       type="checkbox"
                                       id="terms"
                                       required>
                                <label class="form-check-label" for="terms">
                                    I agree to the
                                    <a href="#">Terms & Conditions</a>
                                </label>
                            </div>

                            <!-- Submit -->
                            <button type="submit"
                                    class="btn theme_btn button_hover w-100 py-2 rounded-pill">
                                Create Account
                            </button>
                        </form>

                        <!-- Login Link -->
                        <p class="text-center mt-4 mb-0">
                            Already have an account?
                            <a href="{{ route('auth.signinPage') }}">
                                Login
                            </a>
                        </p>

                    </div>
                </div>
            </div>

        </div>
    </div>
</section>
<!--================ Signup Area =================-->

@endsection


