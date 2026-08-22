@extends('layouts.frontend.app')

@section('content')

<style>
.room_details_area{padding:15px;background:#f8f9fa}

/* Gallery */
.gallery-box{background:#fff;border-radius:14px;padding:15px;box-shadow:0 12px 30px rgba(0,0,0,.08)}
.gallery-main img{width:100%;height:320px;object-fit:cover;border-radius:10px}
.gallery-thumbs{display:flex;justify-content:center;gap:10px;margin-top:12px}
.thumb{width:70px;height:55px;object-fit:cover;border-radius:6px;cursor:pointer;opacity:.6;border:2px solid transparent}
.thumb.active{opacity:1;border-color:#0d6efd}

/* Price */
.price{font-size:28px;font-weight:700;color:#dc3545}
.price span{font-size:14px;color:#6c757d}

/* Seat box */
.seat-box{background:#fff;padding:20px;border-radius:14px;box-shadow:0 10px 25px rgba(0,0,0,.08)}
.seat-grid{display:grid;grid-template-columns:repeat(4,1fr);gap:12px}
.seat{height:45px;border-radius:8px;display:flex;align-items:center;justify-content:center;font-weight:600}
.seat.available{background:#e8f5e9;color:#2e7d32;border:2px solid #2e7d32}
.seat.booked{background:#fdecea;color:#c62828;border:2px solid #c62828}
.seat-legend{display:flex;gap:15px;font-size:14px;margin-top:10px}
.seat-legend i{width:18px;height:18px;display:inline-block;border-radius:4px}

/* Tabs */
.room-tabs-section{padding:60px 0}
.tabs-header{display:flex;gap:15px;border-bottom:2px solid #eee;margin-bottom:25px}
.tab-btn{border:none;background:none;font-weight:600;color:#6c757d;padding:10px 20px}
.tab-btn.active{color:#0d6efd;border-bottom:3px solid #0d6efd}
.tab-content{display:none}
.tab-content.active{display:block}
.text-warning{
    color:#f78100;
}
</style>

<!-- BREADCRUMB -->
<section class="breadcrumb_area">
    <div class="container text-center">
        <h2>{{ $room->name }}</h2>
    </div>
</section>

<!-- ROOM DETAILS -->
<section class="room_details_area">
<div class="container">
<div class="row g-4">

    <!-- LEFT : GALLERY -->
    <div class="col-lg-6">
        <div class="gallery-box">
            <div class="gallery-main">
                <img id="mainImage" src="{{ asset('storage/'.$room->image) }}">
            </div>

            <div class="gallery-thumbs">
                @foreach([$room->image,$room->image2,$room->image3,$room->image4] as $k=>$img)
                    @if($img)
                    <img src="{{ asset('storage/'.$img) }}"
                         class="thumb {{ $k==0?'active':'' }}"
                         data-img="{{ asset('storage/'.$img) }}">
                    @endif
                @endforeach
            </div>
        </div>
    </div>

    <!-- RIGHT : DETAILS + SEATS -->
    <div class="col-lg-6">
         <!-- SEAT AVAILABILITY -->
        <div class="seat-box">
             <h3>{{ $room->name }}</h3>
            <h4>{{ 'ROOMID'.$room->id }}</h4>
        <div class="price">
            ৳ {{ number_format($room->price) }} <span>/ night</span>
        </div>

            <h5>Availability Seat: {{ $room->available }} / {{ $room->capacity }}</h5>
        <p>{{ $room->description }}</p>
                                @php
                                    $avgRating   = round($room->averageRating(), 1); // e.g. 4.5
                                    $reviewCount = $room->reviews->count();          // total users
                                @endphp

                                <div class="mb-2 text-warning">
                                    @for($i = 1; $i <= 5; $i++)
                                        @if($i <= floor($avgRating))
                                            ★
                                        @elseif($i - $avgRating < 1)
                                            ☆
                                        @else
                                            ☆
                                        @endif
                                    @endfor

                                    <span class="text-muted">
                                        ({{ $avgRating > 0 ? $avgRating : '0.0' }} / 5
                                        · {{ $reviewCount }} {{ $reviewCount == 1 ? 'review' : 'reviews' }})
                                    </span>
                                </div>

       <a href="{{ route('booking.bookRoom', $room->id) }}"
                                   class="btn theme_btn button_hover position-absolute bottom-0 start-50 translate-middle-x mb-3">
                                    Book Now
                                </a>
            <h5>Guest / Seat Availability</h5>

            @php
            $totalSeats = $room->capacity;
            $booked = $room->capacity - $room->available;

            // total seats range
            $seats = range(1, $totalSeats);

            // shuffle seats randomly
            shuffle($seats);

            // take booked amount
            $bookedSeats = array_slice($seats, 0, $booked);
            @endphp


            <div class="seat-grid mt-3">
                @for($i=1;$i<=$totalSeats;$i++)
                    <div class="seat {{ in_array($i,$bookedSeats)?'booked':'available' }}">
                        {{ $i }}
                    </div>
                @endfor
            </div>

            <div class="seat-legend">
                <span><i class="seat available"></i> Available</span>
                <span><i class="seat booked"></i> Booked</span>
            </div>
        </div>
       

       

    </div>
</div>
</div>
</section>

<!-- TABS -->
<section class="room-tabs-section">
<div class="container">

<div class="tabs-header">
    <button class="tab-btn active" data-tab="info">Information</button>
    <button class="tab-btn" data-tab="review">Review ({{ $room->reviews->count() }})</button>
    <button class="tab-btn" data-tab="facility">Facilities</button>
</div>

<div class="tabs-content">
    <div class="tab-content active" id="info">
        <p>{{ $room->description }}</p>
    </div>

    <div class="tab-content" id="review">
        <h6>Customer Reviews ({{ $room->reviews->count() }})</h6>
                            @forelse($room->reviews as $review)
                                <div class="border-bottom pb-2 mb-3">
                                    <strong>{{ $review->user->name }}</strong>

                                    <div class="text-warning">
                                        @for($i=1;$i<=5;$i++)
                                            {{ $i <= $review->rating ? '★' : '☆' }}
                                        @endfor
                                    </div>

                                    <p class="mb-0 text-muted">
                                        {{ $review->review }}
                                    </p>
                                </div>
                            @empty
                                <p class="text-muted">No reviews yet.</p>
                            @endforelse

                            {{-- REVIEW FORM --}}
                            @auth
                                @if($review_count==0)
                                <hr>
                                <h6>Write a Review</h6>
                                    
                                <form method="POST" action="{{ route('review.store', $room->id) }}">
                                    @csrf

                                    <div class="mb-2">
                                        <label class="form-label">Rating</label>
                                        <select name="rating" class="form-select" required>
                                            <option value="">Select Rating</option>
                                            @for($i=5;$i>=1;$i--)
                                                <option value="{{ $i }}">{{ $i }} Star</option>
                                            @endfor
                                        </select>
                                    </div>

                                    <div class="">
                                        <label class="form-label">Review</label>
                                        <textarea name="review" rows="3"
                                                class="form-control"
                                                placeholder="Write your experience..."></textarea>
                                    </div>

                                    <button class="btn theme_btn button_hover" style="margin-top:10px;">
                                        Submit Review
                                    </button>
                                </form>
                                @endif
                            @else
                                <p class="text-muted mt-3">
                                    Please <a href="{{ route('login') }}">login</a> to write a review.
                                </p>
                            @endauth
    </div>

    <div class="tab-content" id="facility">
        <ul>
            <li>Free WiFi</li>
            <li>AC</li>
            <li>Attached Bathroom</li>
        </ul>
    </div>
</div>

</div>
</section>

<!-- JS -->
<script>
document.querySelectorAll('.thumb').forEach(t=>{
    t.onclick=()=>{
        document.getElementById('mainImage').src=t.dataset.img;
        document.querySelectorAll('.thumb').forEach(x=>x.classList.remove('active'));
        t.classList.add('active');
    }
});

document.querySelectorAll('.tab-btn').forEach(b=>{
    b.onclick=()=>{
        document.querySelectorAll('.tab-btn,.tab-content').forEach(x=>x.classList.remove('active'));
        b.classList.add('active');
        document.getElementById(b.dataset.tab).classList.add('active');
    }
});
</script>

@endsection
