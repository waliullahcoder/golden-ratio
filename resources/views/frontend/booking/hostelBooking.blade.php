@extends('layouts.frontend.app')

@section('content')

<!--================ Breadcrumb Area =================-->
<section class="breadcrumb_area">
    <div class="container">
        <div class="page-cover text-center">
            <h2 class="page-cover-tittle">Resort Room Booking</h2>
            <ol class="breadcrumb">
                <li><a href="{{ url('/') }}">Home</a></li>
                <li class="active">Booking</li>
            </ol>
        </div>
    </div>
</section>
<!--================ Breadcrumb Area =================-->

<!--================ Booking Area =================-->
<section class="accomodation_area section_gap">
    <div class="container">
         {{-- GLOBAL SUCCESS --}}
                        @if(session('success'))
                            <div class="alert alert-success text-center">
                                <h2 class="title_color" style="color:#01ea01">Your 
                                    {{ session('success') }}
                                    <br> Thank You!
                                </h2></div>
                            @else
                            <!-- SECTION TITLE -->
                        <div class="section_title text-center mb-5">
                            <h2 class="title_color">Available Room</h2>
                            <p>Select your preferred room category and book easily</p>
                        </div>
                        @endif
        
        <div class="row">

            <!-- FILTER SIDEBAR -->
            <div class="col-lg-3 mb-4">
                <div class="card shadow-sm border-0 rounded-4">
                    <div class="card-body p-4">
                        <h5 class="mb-3 fw-bold">Filter Room</h5>

                        <form action="{{ route('booking.search') }}" method="GET">

                            <!-- CATEGORY -->
                            <div class="mb-3">
                                <label class="fw-semibold mb-1">Room Category</label>
                                <select name="category_id" class="form-select">
                                    <option value="">All Categories</option>
                                    @foreach($categories as $category)
                                        <option value="{{ $category->id }}"
                                            {{ request('category_id') == $category->id ? 'selected' : '' }}>
                                            {{ $category->name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>

                            <!-- GUESTS -->
                            <div class="mb-3">
                                <label class="fw-semibold mb-1">Guests</label>
                                <input type="number"
                                       name="available"
                                       class="form-control"
                                       min="1"
                                       value="{{ request('available') }}"
                                       placeholder="Number of Available Seats">
                            </div>
                            <div class="mb-3">
                            <button type="submit"
                                    class="btn theme_btn button_hover w-100 rounded-pill">
                                Search Rooms
                            </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- ROOMS -->
            <div class="col-lg-9">
                <div class="row mb_30">

                    @forelse($rooms as $room)
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <div class="accomodation_item text-center shadow-sm rounded-4 overflow-hidden">

                            <div class="hotel_img position-relative">
                                <a href="{{ route('singleDetails', $room->id) }}"><img src="{{ $room->image
                                        ? asset('storage/'.$room->image)
                                        : asset('frontend/images/room1.jpg') }}"
                                     alt="{{ $room->name }}"
                                     class="img-fluid w-100"></a>

                                <a href="{{ route('booking.bookRoom', $room->id) }}"
                                   class="btn theme_btn button_hover position-absolute bottom-0 start-50 translate-middle-x mb-3">
                                    Book Now
                                </a>
                            </div>

                            <div class="p-3">
                                <a href="{{ route('singleDetails', $room->id) }}">
                                    <h4 class="sec_h4 mb-1">{{ $room->name }}({{'ROOMID'.$room->id}})</h4>
                                </a>

                                <p class="text-muted mb-2 small">
                                    {{ Str::limit($room->description, 70) }}
                                </p>

                                <h5 class="fw-bold">
                                    ৳ {{ number_format($room->price) }}
                                    <small class="text-muted">/night</small>
                                </h5>

                                <span class="badge bg-light text-dark mt-2">
                                    Available Seat: {{ $room->available }}
                                </span>
                            </div>

                        </div>
                    </div>
                    @empty
                    <div class="col-12">
                        <div class="alert alert-warning text-center">
                            No rooms found for your search.
                        </div>
                    </div>
                    @endforelse

                </div>
            </div>

        </div>
    </div>
</section>
<!--================ Booking Area =================-->

@endsection
