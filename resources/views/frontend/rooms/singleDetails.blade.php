@extends('layouts.frontend.app')

@section('content')

<style>
    :root {
        --primary: #0b3c5d;
        --primary-dark: #062b44;
        --secondary: #1f7a8c;
        --accent: #f4b942;
        --light: #f5f8fa;
        --text: #263238;
        --muted: #7b8794;
        --border: #e8edf1;
    }

    /* =========================
       ROOM DETAILS AREA
    ========================== */
    .room_details_area {
        padding: 10px 0;
        background: linear-gradient(180deg, #f6f9fc 0%, #ffffff 100%);
    }

    /* =========================
       GALLERY
    ========================== */
    .gallery-box {
        background: #fff;
        border-radius: 20px;
        padding: 12px;
        box-shadow: 0 15px 45px rgba(11, 60, 93, .10);
        border: 1px solid rgba(0,0,0,.04);
    }

    .gallery-main {
        overflow: hidden;
        border-radius: 15px;
        background: #eef2f5;
    }

    .gallery-main img {
        width: 100%;
        height: 440px;
        object-fit: cover;
        display: block;
        transition: .4s ease;
    }

    .gallery-main:hover img {
        transform: scale(1.03);
    }

    .gallery-thumbs {
        display: flex;
        gap: 10px;
        margin-top: 12px;
        padding: 2px;
        overflow-x: auto;
    }

    .thumb {
        width: 85px;
        height: 65px;
        object-fit: cover;
        border-radius: 9px;
        cursor: pointer;
        opacity: .65;
        border: 3px solid transparent;
        transition: .25s;
        flex-shrink: 0;
    }

    .thumb:hover {
        opacity: 1;
        transform: translateY(-2px);
    }

    .thumb.active {
        opacity: 1;
        border-color: var(--accent);
    }

    /* =========================
       DETAILS CARD
    ========================== */
    .room-info-card {
        background: #fff;
        border-radius: 20px;
        padding: 32px;
        height: 100%;
        box-shadow: 0 15px 45px rgba(11, 60, 93, .10);
        border: 1px solid rgba(0,0,0,.04);
    }

    .room-category {
        display: inline-flex;
        align-items: center;
        background: rgba(31, 122, 140, .10);
        color: var(--secondary);
        font-size: 13px;
        font-weight: 700;
        padding: 7px 13px;
        border-radius: 30px;
        margin-bottom: 12px;
    }

    .room-title {
        color: var(--primary-dark);
        font-size: 30px;
        font-weight: 700;
        margin-bottom: 5px;
        line-height: 1.3;
    }

    .room-id {
        display: inline-block;
        color: var(--muted);
        font-size: 13px;
        font-weight: 600;
        margin-bottom: 20px;
    }

    .price-box {
        display: flex;
        align-items: center;
        justify-content: space-between;
        background: linear-gradient(135deg, var(--primary), var(--secondary));
        padding: 18px 20px;
        border-radius: 14px;
        margin-bottom: 22px;
        color: #fff;
    }

    .price-label {
        font-size: 13px;
        opacity: .8;
        display: block;
        margin-bottom: 2px;
    }

    .price {
        font-size: 28px;
        font-weight: 700;
        color: #fff;
        margin: 0;
    }

    .price span {
        font-size: 13px;
        font-weight: 400;
        opacity: .8;
    }

    .room-description {
        color: #667085;
        line-height: 1.8;
        font-size: 14px;
        margin-bottom: 18px;
    }

    /* =========================
       RATING
    ========================== */
    .rating-box {
        display: flex;
        align-items: center;
        gap: 8px;
        margin-bottom: 22px;
        font-size: 16px;
    }

    .rating-stars {
        color: #f4b942;
        letter-spacing: 2px;
    }

    .rating-text {
        font-size: 13px;
        color: var(--muted);
    }

    /* =========================
       AVAILABILITY
    ========================== */
    .availability-box {
        display: flex;
        align-items: center;
        justify-content: space-between;
        background: #f7fafc;
        border: 1px solid var(--border);
        border-radius: 12px;
        padding: 14px 16px;
        margin-bottom: 22px;
    }

    .availability-label {
        color: var(--text);
        font-size: 14px;
        font-weight: 600;
    }

    .availability-count {
        background: #e8f5e9;
        color: #198754;
        padding: 6px 12px;
        border-radius: 20px;
        font-size: 13px;
        font-weight: 700;
    }

    /* =========================
       BOOK BUTTON
    ========================== */
    .book-now-btn {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 100%;
        min-height: 54px;
        border-radius: 10px;
        background: linear-gradient(135deg, var(--accent), #e8a72e);
        color: #fff !important;
        font-size: 16px;
        font-weight: 700;
        text-decoration: none;
        transition: .3s ease;
        box-shadow: 0 8px 20px rgba(244, 185, 66, .25);
        margin-bottom: 28px;
    }

    .book-now-btn:hover {
        transform: translateY(-2px);
        color: #fff;
        box-shadow: 0 12px 25px rgba(244, 185, 66, .35);
    }

    /* =========================
       ROOM AVAILABILITY
    ========================== */
    .availability-title {
        color: var(--primary-dark);
        font-size: 20px;
        font-weight: 700;
        margin-bottom: 5px;
    }

    .availability-subtitle {
        font-size: 13px;
        color: var(--muted);
        margin-bottom: 18px;
    }

    .seat-grid {
        display: grid;
        grid-template-columns: repeat(5, 1fr);
        gap: 10px;
    }

    .seat {
        height: 48px;
        border-radius: 10px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: 700;
        font-size: 14px;
        transition: .2s;
    }

    .seat.available {
        background: #edf9f0;
        color: #198754;
        border: 1px solid #b9e3c3;
    }

    .seat.booked {
        background: #fff0f0;
        color: #dc3545;
        border: 1px solid #f2b8bd;
    }

    .seat:hover {
        transform: translateY(-2px);
    }

    .seat-legend {
        display: flex;
        gap: 20px;
        font-size: 13px;
        margin-top: 18px;
        color: var(--muted);
    }

    .seat-legend span {
        display: flex;
        align-items: center;
        gap: 7px;
    }

    .seat-legend i {
        width: 13px;
        height: 13px;
        display: inline-block;
        border-radius: 4px;
    }

    .seat-legend .available {
        background: #198754;
    }

    .seat-legend .booked {
        background: #dc3545;
    }

    /* =========================
       TABS SECTION
    ========================== */
    .room-tabs-section {
        padding: 0 0 80px;
        background: #fff;
    }

    .room-tabs-wrapper {
        background: #fff;
        border-radius: 20px;
        box-shadow: 0 10px 40px rgba(11, 60, 93, .08);
        border: 1px solid var(--border);
        overflow: hidden;
    }

    .tabs-header {
        display: flex;
        gap: 0;
        border-bottom: 1px solid var(--border);
        background: #f8fafc;
        overflow-x: auto;
    }

    .tab-btn {
        border: none;
        background: transparent;
        font-weight: 600;
        color: var(--muted);
        padding: 18px 25px;
        white-space: nowrap;
        transition: .25s;
        position: relative;
    }

    .tab-btn:hover {
        color: var(--primary);
    }

    .tab-btn.active {
        color: var(--primary);
        background: #fff;
    }

    .tab-btn.active:after {
        content: "";
        position: absolute;
        height: 3px;
        left: 20px;
        right: 20px;
        bottom: 0;
        background: var(--accent);
        border-radius: 5px;
    }

    .tabs-content {
        padding: 30px;
    }

    .tab-content {
        display: none;
        color: #667085;
        line-height: 1.8;
    }

    .tab-content.active {
        display: block;
    }

    /* =========================
       REVIEW
    ========================== */
    .review-item {
        padding: 18px 0;
        border-bottom: 1px solid var(--border);
    }

    .review-item:last-child {
        border-bottom: none;
    }

    .review-user {
        color: var(--primary-dark);
        font-weight: 700;
    }

    .review-form-box {
        margin-top: 25px;
        padding: 25px;
        background: #f8fafc;
        border-radius: 14px;
    }

    /* =========================
       FACILITY
    ========================== */
    .facility-list {
        list-style: none;
        padding: 0;
        margin: 0;
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 12px;
    }

    .facility-list li {
        background: #f7fafc;
        border: 1px solid var(--border);
        padding: 14px;
        border-radius: 10px;
        color: var(--primary-dark);
        font-weight: 600;
        font-size: 14px;
    }

    .facility-list li:before {
        content: "✓";
        color: #198754;
        margin-right: 8px;
        font-weight: 700;
    }

    /* =========================
       RESPONSIVE
    ========================== */
    @media(max-width: 991px) {

        .room_details_area {
            padding: 40px 0;
        }

        .gallery-main img {
            height: 400px;
        }

        .room-info-card {
            padding: 25px;
        }
    }

    @media(max-width: 767px) {

        .room-title {
            font-size: 24px;
        }

        .gallery-main img {
            height: 280px;
        }

        .seat-grid {
            grid-template-columns: repeat(4, 1fr);
        }

        .facility-list {
            grid-template-columns: 1fr;
        }

        .tabs-content {
            padding: 20px;
        }

        .tab-btn {
            padding: 15px 18px;
            font-size: 14px;
        }

        .price-box {
            padding: 15px;
        }

        .room-info-card {
            padding: 20px;
        }
    }

    @media(max-width: 480px) {

        .gallery-main img {
            height: 230px;
        }

        .seat-grid {
            grid-template-columns: repeat(3, 1fr);
        }

        .thumb {
            width: 65px;
            height: 52px;
        }
    }
</style>


<!-- =========================
     ROOM DETAILS
========================= -->

<section class="room_details_area">

    <div class="container">

        <div class="row g-4 align-items-stretch">

            <!-- GALLERY -->
            <div class="col-lg-6">

                <div class="gallery-box animate__animated animate__fadeInUp">

                    <div class="gallery-main">

                        <img id="mainImage"
                             src="{{ asset('storage/'.$room->image) }}"
                             alt="{{ $room->name }}">

                    </div>


                    <div class="gallery-thumbs">

                        @foreach([$room->image,$room->image2,$room->image3,$room->image4] as $k=>$img)

                            @if($img)

                                <img src="{{ asset('storage/'.$img) }}"
                                     class="thumb {{ $k==0 ? 'active' : '' }}"
                                     data-img="{{ asset('storage/'.$img) }}"
                                     alt="{{ $room->name }}">

                            @endif

                        @endforeach

                    </div>

                    <!-- SEAT AVAILABILITY -->

                    <h4 class="availability-title">
                        Room Availability
                    </h4>

                    <p class="availability-subtitle">
                        Select from the available capacity
                    </p>


                    @php

                        $totalSeats = $room->capacity;

                        $booked = max(
                            0,
                            $room->capacity - $room->available
                        );

                        $seats = range(1, $totalSeats);

                        shuffle($seats);

                        $bookedSeats = array_slice(
                            $seats,
                            0,
                            $booked
                        );

                    @endphp


                    <div class="seat-grid">

                        @for($i = 1; $i <= $totalSeats; $i++)

                            <div class="seat {{ in_array($i,$bookedSeats) ? 'booked' : 'available' }}">

                                {{ $i }}

                            </div>

                        @endfor

                    </div>


                </div>

            </div>


            <!-- ROOM DETAILS -->
            <div class="col-lg-6 animate__animated animate__fadeInDown">

                <div class="room-info-card">

                    @if($room->category)
                        <span class="room-category">
                            {{ $room->category->name }}
                        </span>
                    @endif


                    <h1 class="room-title">
                        {{ $room->name }}
                    </h1>

                    <span class="room-id">
                        ROOM ID #{{ $room->id }}
                    </span>


                    <!-- PRICE -->

                    <div class="price-box">

                        <div>

                            <span class="price-label">
                                Starting from
                            </span>

                            <div class="price">

                                ৳ {{ number_format($room->price) }}

                                <span>/ night</span>

                            </div>

                        </div>

                    </div>


                    <!-- DESCRIPTION -->

                    <p class="room-description">

                        {{ $room->description }}

                    </p>


                    <!-- RATING -->

                    @php
                        $avgRating = round($room->averageRating(), 1);
                        $reviewCount = $room->reviews->count();
                    @endphp


                    <div class="rating-box">

                        <div class="rating-stars">

                            @for($i = 1; $i <= 5; $i++)
                                {{ $i <= floor($avgRating) ? '★' : '☆' }}
                            @endfor

                        </div>

                        <span class="rating-text">

                            {{ $avgRating > 0 ? $avgRating : '0.0' }}/5

                            ·

                            {{ $reviewCount }}

                            {{ $reviewCount == 1 ? 'Review' : 'Reviews' }}

                        </span>

                    </div>


                    <!-- AVAILABILITY -->

                    <div class="availability-box">

                        <span class="availability-label">
                            Room Availability
                        </span>

                        <span class="availability-count">

                            {{ $room->available }} Available

                        </span>

                    </div>


                    <!-- BOOK NOW -->

                    <a href="{{ route('booking.bookRoom', $room->id) }}"
                       class="book-now-btn">

                        Book This Room

                    </a>


                    

                    <div class="seat-legend">

                        <span>
                            <i class="available"></i>
                            Available
                        </span>

                        <span>
                            <i class="booked"></i>
                            Booked
                        </span><br>
                     <p><strong style="color:#ff9b00;">Just follow the room availability status:</strong> green means the room is available, and red means the room is not available.</p>
                    </div>

                </div>

            </div>

        </div>

    </div>

</section>



<!-- =========================
     TABS
========================= -->

<section class="room-tabs-section">

    <div class="container">

        <div class="room-tabs-wrapper">


            <div class="tabs-header">

                <button class="tab-btn active" data-tab="info">
                    Information
                </button>


                <button class="tab-btn" data-tab="review">

                    Reviews ({{ $room->reviews->count() }})

                </button>


                <button class="tab-btn" data-tab="facility">
                    Facilities
                </button>

            </div>



            <div class="tabs-content">


                <!-- INFORMATION -->

                <div class="tab-content active" id="info">

                    <h4 class="mb-3">
                        About This Room
                    </h4>

                    <p>
                        {{ $room->description }}
                    </p>

                </div>



                <!-- REVIEWS -->

                <div class="tab-content" id="review">

                    <h4 class="mb-4">
                        Customer Reviews
                    </h4>


                    @forelse($room->reviews as $review)

                        <div class="review-item">

                            <div class="d-flex justify-content-between align-items-center mb-2">

                                <span class="review-user">

                                    {{ $review->user->name ?? 'Guest' }}

                                </span>


                                <div class="rating-stars">

                                    @for($i=1;$i<=5;$i++)

                                        {{ $i <= $review->rating ? '★' : '☆' }}

                                    @endfor

                                </div>

                            </div>


                            <p class="mb-0 text-muted">

                                {{ $review->review }}

                            </p>

                        </div>

                    @empty

                        <p class="text-muted">
                            No reviews yet. Be the first to review this room.
                        </p>

                    @endforelse



                    @auth

                        @if($review_count == 0)

                            <div class="review-form-box">

                                <h5 class="mb-3">
                                    Write a Review
                                </h5>


                                <form method="POST"
                                      action="{{ route('review.store', $room->id) }}">

                                    @csrf


                                    <div class="mb-3">

                                        <label class="form-label">
                                            Rating
                                        </label>

                                        <select name="rating"
                                                class="form-select"
                                                required>

                                            <option value="">
                                                Select Rating
                                            </option>

                                            @for($i=5;$i>=1;$i--)

                                                <option value="{{ $i }}">

                                                    {{ $i }} Star

                                                </option>

                                            @endfor

                                        </select>

                                    </div>



                                    <div class="mb-3">

                                        <label class="form-label">
                                            Review
                                        </label>

                                        <textarea name="review"
                                                  rows="4"
                                                  class="form-control"
                                                  placeholder="Share your experience..."></textarea>

                                    </div>


                                    <button type="submit"
                                            class="btn book-now-btn"
                                            style="border:none;">

                                        Submit Review

                                    </button>

                                </form>

                            </div>

                        @endif

                    @else

                        <div class="alert alert-light border mt-4">

                            Please

                            <a href="{{ route('login') }}">

                                login

                            </a>

                            to write a review.

                        </div>

                    @endauth


                </div>



                <!-- FACILITIES -->

                <div class="tab-content" id="facility">

                    <h4 class="mb-4">
                        Room Facilities
                    </h4>

                    <ul class="facility-list">

                        <li>Free WiFi</li>
                        <li>Air Conditioning</li>
                        <li>Attached Bathroom</li>

                    </ul>

                </div>


            </div>

        </div>

    </div>

</section>



<script>

    /* =========================
       IMAGE GALLERY
    ========================== */

    document.querySelectorAll('.thumb').forEach(function (thumb) {

        thumb.addEventListener('click', function () {

            document.getElementById('mainImage').src =
                this.dataset.img;

            document.querySelectorAll('.thumb').forEach(function (item) {

                item.classList.remove('active');

            });

            this.classList.add('active');

        });

    });



    /* =========================
       TABS
    ========================== */

    document.querySelectorAll('.tab-btn').forEach(function (button) {

        button.addEventListener('click', function () {

            document
                .querySelectorAll('.tab-btn')
                .forEach(function (item) {

                    item.classList.remove('active');

                });


            document
                .querySelectorAll('.tab-content')
                .forEach(function (item) {

                    item.classList.remove('active');

                });


            this.classList.add('active');


            document
                .getElementById(this.dataset.tab)
                .classList.add('active');

        });

    });

</script>

@endsection