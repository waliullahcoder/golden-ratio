@extends('layouts.frontend.app')

@section('content')

<!--================ Breadcrumb =================-->
<section class="breadcrumb_area">
    <div class="container">
        <div class="page-cover text-center animate__animated animate__fadeInUp">
            <h2 class="page-cover-tittle">Book Room</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="{{ route('booking.index') }}">Booking</a>
                </li>
                <li class="active">{{ $room->name }}</li>
            </ol>
        </div>
    </div>
</section>


<!--================ Booking Checkout =================-->
<section class="booking_checkout_area section_gap">
    <div class="container">

        <div class="checkout-wrapper">

            <!-- LEFT SIDE -->
            <div class="room-preview animate__animated animate__fadeInUp">

                <div class="room-image-box">

                    @if(!empty($room->image))
                        <img src="{{ asset('storage/'.$room->image) }}"
                             alt="{{ $room->name }}">
                    @else
                        <img src="{{ asset('frontend/img/room-placeholder.jpg') }}"
                             alt="{{ $room->name }}">
                    @endif
                    @if($room->available>0)
                    <div class="image-badge">
                        <i class="fa fa-check-circle"></i>
                       Available 
                    </div>
                    @else 
                    <div class="image-badge-not">
                        <i class="fa fa-check-circle"></i>
                        Not Available
                    </div>
                    @endif

                </div>

                <div class="room-content">

                    <div class="room-title-row">
                        <div>
                            <span class="small-label">ROOM</span>
                            <h2>{{ $room->name }}</h2>
                        </div>

                        <div class="room-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                    </div>

                    <p class="room-description">
                        Enjoy a comfortable and relaxing stay with our
                        premium room facilities and excellent hospitality.
                    </p>

                    <div class="room-features">

                        <div class="feature-item">
                            <i class="fa fa-bed"></i>
                            <span>Comfortable Bed</span>
                        </div>

                        <div class="feature-item">
                            <i class="fa fa-wifi"></i>
                            <span>Free WiFi</span>
                        </div>

                        <div class="feature-item">
                            <i class="fa fa-bath"></i>
                            <span>Private Bathroom</span>
                        </div>

                        <div class="feature-item">
                            <i class="fa fa-coffee"></i>
                            <span>Room Service</span>
                        </div>

                    </div>

                    <div class="availability-box">
                        <div>
                            <span>Available Rooms</span>
                            <strong>{{ $room->available }}</strong>
                        </div>

                        <div class="price-box">
                            <span>Price per room</span>
                            <strong>
                                ৳ {{ number_format($room->price) }}
                            </strong>
                        </div>
                    </div>

                </div>

            </div>


            <!-- RIGHT SIDE -->
            <div class="booking-summary animate__animated animate__fadeInDown">

                <div class="summary-header">
                    <span class="summary-label">BOOKING</span>
                    <h3>Complete Your Booking</h3>
                    <p>Select your dates and room quantity</p>
                </div>


                @if($errors->any())
                    <div class="booking-errors">
                        @foreach($errors->all() as $error)
                            <div>
                                <i class="fa fa-exclamation-circle"></i>
                                {{ $error }}
                            </div>
                        @endforeach
                    </div>
                @endif


                <form action="{{ route('booking.confirmBooking', $room->id) }}"
                      method="POST">

                    @csrf

                    <!-- DATES -->
                    <div class="form-section">

                        <div class="section-title">
                            <span class="step-number">1</span>
                            <div>
                                <strong>Stay Dates</strong>
                                <small>Choose your check-in and check-out</small>
                            </div>
                        </div>


                        <div class="date-grid">

                            <div class="input-group-custom">

                                <label>Check In</label>

                                <div class="input-icon">
                                    <i class="fa fa-calendar"></i>

                                    <input type="date"
                                           name="check_in"
                                           id="check_in"
                                           value="{{ old('check_in', now()->format('Y-m-d')) }}"
                                           min="{{ now()->format('Y-m-d') }}"
                                           required>
                                </div>

                            </div>


                            <div class="input-group-custom">

                                <label>Check Out</label>

                                <div class="input-icon">
                                    <i class="fa fa-calendar"></i>

                                    <input type="date"
                                           name="check_out"
                                           id="check_out"
                                           value="{{ old('check_out', now()->addDay()->format('Y-m-d')) }}"
                                           min="{{ now()->addDay()->format('Y-m-d') }}"
                                           required>
                                </div>

                            </div>

                        </div>

                    </div>


                    <!-- ROOM -->
                    <div class="form-section">

                        <div class="section-title">
                            <span class="step-number">2</span>

                            <div>
                                <strong>Room Details</strong>
                                <small>Select room quantity and duration</small>
                            </div>
                        </div>


                        <div class="date-grid">

                            <!-- ROOMS -->
                            <div class="input-group-custom">

                                <label>Number of Rooms</label>

                                <div class="quantity-wrapper">

                                    <button type="button"
                                            class="quantity-btn"
                                            id="minusRoom">
                                        −
                                    </button>

                                    <input type="number"
                                           id="guests"
                                           name="guests"
                                           min="1"
                                           max="{{ $room->available }}"
                                           value="{{ old('guests', 1) }}"
                                           required>

                                    <button type="button"
                                            class="quantity-btn"
                                            id="plusRoom">
                                        +
                                    </button>

                                </div>

                            </div>


                            <!-- DURATION -->
                            <div class="input-group-custom">

                                <label>Duration</label>

                                <div class="input-icon">
                                    <i class="fa fa-clock-o"></i>

                                    <select name="duration"
                                            id="duration"
                                            required>

                                        <option value="day">
                                            Day
                                        </option>

                                        <option value="night"
                                            selected>
                                            Night
                                        </option>

                                        <option value="week">
                                            Week
                                        </option>

                                        <option value="month">
                                            Month
                                        </option>

                                        <option value="custom">
                                            Custom
                                        </option>

                                    </select>

                                </div>

                            </div>

                        </div>

                    </div>


                    <!-- PRICE SUMMARY -->
                    <div class="price-summary">

                        <div class="summary-row">

                            <span>
                                Room Price
                            </span>

                            <strong>
                                ৳ {{ number_format($room->price) }}
                            </strong>

                        </div>


                        <div class="summary-row">

                            <span>
                                Rooms
                            </span>

                            <strong id="summary_rooms">
                                1
                            </strong>

                        </div>


                        <div class="summary-row">

                            <span>
                                Nights
                            </span>

                            <strong id="summary_days">
                                1
                            </strong>

                        </div>


                        <div class="summary-divider"></div>


                        <div class="total-row">

                            <div>
                                <span>Total Amount</span>
                                <small>Including room charges</small>
                            </div>

                            <strong id="display_total">
                                ৳ {{ number_format($room->price) }}
                            </strong>

                        </div>

                    </div>


                    <!-- Hidden Total -->
                    <input type="hidden"
                           name="total_price"
                           id="total_price">


                    <!-- CONFIRM -->
                    <button type="submit"
                            class="confirm-booking-btn">

                        <span>
                            Confirm Booking
                        </span>

                        <i class="fa fa-arrow-right"></i>

                    </button>


                    <div class="secure-booking">

                        <i class="fa fa-lock"></i>

                        <span>
                            Your booking information is secure
                        </span>

                    </div>

                </form>

            </div>

        </div>

    </div>
</section>


<style>

/* =========================================
   BOOKING CHECKOUT
========================================= */

.booking_checkout_area {
    background: #f6f8fb;
    padding: 60px 0 80px;
}

.checkout-wrapper {
    display: grid;
    grid-template-columns: 1.15fr .85fr;
    gap: 30px;
    max-width: 1150px;
    margin: auto;
}


/* =========================================
   LEFT ROOM CARD
========================================= */

.room-preview {
    background: #fff;
    border-radius: 18px;
    overflow: hidden;
    box-shadow: 0 10px 35px rgba(0,0,0,.07);
}

.room-image-box {
    height: 360px;
    position: relative;
    overflow: hidden;
}

.room-image-box img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: .5s ease;
}

.room-image-box:hover img {
    transform: scale(1.04);
}

.image-badge {
    position: absolute;
    top: 20px;
    left: 20px;
    background: #18b875;
    color: #fff;
    padding: 8px 15px;
    border-radius: 30px;
    font-size: 13px;
    font-weight: 600;
    box-shadow: 0 5px 15px rgba(0,0,0,.15);
}

.image-badge i {
    margin-right: 5px;
}
.image-badge-not {
    position: absolute;
    top: 20px;
    left: 20px;
    background: #ca2b0f;
    color: #fff;
    padding: 8px 15px;
    border-radius: 30px;
    font-size: 13px;
    font-weight: 600;
    box-shadow: 0 5px 15px rgba(0,0,0,.15);
}

.image-badge-not i {
    margin-right: 5px;
}


/* =========================================
   ROOM CONTENT
========================================= */

.room-content {
    padding: 28px;
}

.room-title-row {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.small-label {
    font-size: 11px;
    letter-spacing: 2px;
    color: #999;
    font-weight: 700;
}

.room-title-row h2 {
    margin: 4px 0 0;
    font-size: 28px;
    font-weight: 700;
    color: #222;
}

.room-rating {
    color: #f5b301;
    font-size: 13px;
}

.room-description {
    color: #777;
    font-size: 14px;
    line-height: 1.8;
    margin: 15px 0 22px;
}


/* =========================================
   FEATURES
========================================= */

.room-features {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 13px;
    padding-bottom: 25px;
    border-bottom: 1px solid #eee;
}

.feature-item {
    display: flex;
    align-items: center;
    gap: 10px;
    color: #555;
    font-size: 13px;
}

.feature-item i {
    width: 32px;
    height: 32px;
    border-radius: 8px;
    background: #f1f8f6;
    color: #18a974;
    display: flex;
    align-items: center;
    justify-content: center;
}


/* =========================================
   AVAILABILITY
========================================= */

.availability-box {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding-top: 23px;
}

.availability-box span,
.price-box span {
    display: block;
    color: #999;
    font-size: 12px;
    margin-bottom: 5px;
}

.availability-box strong {
    font-size: 18px;
    color: #18a974;
}

.price-box {
    text-align: right;
}

.price-box strong {
    font-size: 21px;
    color: #222;
}


/* =========================================
   RIGHT SUMMARY
========================================= */

.booking-summary {
    background: #fff;
    border-radius: 18px;
    padding: 30px;
    box-shadow: 0 10px 35px rgba(0,0,0,.07);
}

.summary-label {
    color: #18a974;
    font-size: 11px;
    letter-spacing: 2px;
    font-weight: 700;
}

.summary-header h3 {
    font-size: 24px;
    font-weight: 700;
    margin: 5px 0;
}

.summary-header p {
    color: #999;
    font-size: 13px;
    margin-bottom: 28px;
}


/* =========================================
   ERROR
========================================= */

.booking-errors {
    background: #fff1f1;
    color: #d9534f;
    padding: 12px 15px;
    border-radius: 10px;
    font-size: 13px;
    margin-bottom: 20px;
}

.booking-errors div {
    margin: 4px 0;
}

.booking-errors i {
    margin-right: 6px;
}


/* =========================================
   SECTION
========================================= */

.form-section {
    margin-bottom: 27px;
}

.section-title {
    display: flex;
    align-items: center;
    gap: 12px;
    margin-bottom: 18px;
}

.step-number {
    width: 30px;
    height: 30px;
    background: #18a974;
    color: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    font-size: 13px;
    font-weight: 700;
}

.section-title strong {
    display: block;
    font-size: 14px;
    color: #222;
}

.section-title small {
    display: block;
    color: #999;
    font-size: 11px;
    margin-top: 2px;
}


/* =========================================
   INPUTS
========================================= */

.date-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 14px;
}

.input-group-custom label {
    display: block;
    font-size: 12px;
    font-weight: 600;
    color: #555;
    margin-bottom: 7px;
}

.input-icon {
    position: relative;
}

.input-icon i {
    position: absolute;
    left: 14px;
    top: 50%;
    transform: translateY(-50%);
    color: #18a974;
    z-index: 2;
}

.input-icon input,
.input-icon select {
    width: 100%;
    height: 48px;
    border: 1px solid #e5e8ed;
    border-radius: 10px;
    background: #fafbfc;
    padding: 0 12px 0 40px;
    font-size: 13px;
    color: #333;
    outline: none;
    transition: .2s;
}

.input-icon input:focus,
.input-icon select:focus {
    border-color: #18a974;
    background: #fff;
    box-shadow: 0 0 0 3px rgba(24,169,116,.08);
}


/* =========================================
   QUANTITY
========================================= */

.quantity-wrapper {
    height: 48px;
    display: flex;
    align-items: center;
    border: 1px solid #e5e8ed;
    border-radius: 10px;
    background: #fafbfc;
    overflow: hidden;
}

.quantity-btn {
    width: 45px;
    height: 100%;
    border: 0;
    background: transparent;
    font-size: 21px;
    color: #18a974;
    cursor: pointer;
    transition: .2s;
}

.quantity-btn:hover {
    background: #18a974;
    color: #fff;
}

.quantity-wrapper input {
    flex: 1;
    width: 100%;
    height: 100%;
    text-align: center;
    border: 0;
    outline: 0;
    background: transparent;
    font-weight: 600;
}


/* =========================================
   PRICE SUMMARY
========================================= */

.price-summary {
    background: #f8fafb;
    border-radius: 13px;
    padding: 18px;
    margin-top: 8px;
}

.summary-row {
    display: flex;
    align-items: center;
    justify-content: space-between;
    color: #777;
    font-size: 13px;
    margin-bottom: 12px;
}

.summary-row strong {
    color: #333;
}

.summary-divider {
    border-top: 1px dashed #ddd;
    margin: 15px 0;
}

.total-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.total-row span {
    display: block;
    font-weight: 700;
    color: #222;
    font-size: 14px;
}

.total-row small {
    color: #aaa;
    font-size: 10px;
}

.total-row strong {
    color: #18a974;
    font-size: 25px;
}


/* =========================================
   BUTTON
========================================= */

.confirm-booking-btn {
    width: 100%;
    height: 54px;
    margin-top: 20px;
    border: 0;
    border-radius: 11px;
    background: #18a974;
    color: #fff;
    font-size: 14px;
    font-weight: 700;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 20px;
    cursor: pointer;
    transition: .25s;
}

.confirm-booking-btn:hover {
    background: #128b5f;
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(24,169,116,.25);
}

.confirm-booking-btn i {
    font-size: 16px;
}


/* =========================================
   SECURE
========================================= */

.secure-booking {
    text-align: center;
    color: #aaa;
    font-size: 11px;
    margin-top: 15px;
}

.secure-booking i {
    margin-right: 5px;
    color: #18a974;
}


/* =========================================
   RESPONSIVE
========================================= */

@media(max-width: 991px) {

    .checkout-wrapper {
        grid-template-columns: 1fr;
        max-width: 700px;
    }

    .room-image-box {
        height: 330px;
    }

}

@media(max-width: 575px) {

    .booking_checkout_area {
        padding: 30px 10px 50px;
    }

    .booking-summary,
    .room-content {
        padding: 20px;
    }

    .room-image-box {
        height: 240px;
    }

    .room-title-row {
        display: block;
    }

    .room-rating {
        margin-top: 8px;
    }

    .room-title-row h2 {
        font-size: 23px;
    }

    .date-grid {
        grid-template-columns: 1fr;
    }

    .room-features {
        grid-template-columns: 1fr;
    }

    .total-row strong {
        font-size: 21px;
    }

}

</style>


<script>
document.addEventListener('DOMContentLoaded', function () {

    const guestInput = document.getElementById('guests');
    const checkinInput = document.getElementById('check_in');
    const checkoutInput = document.getElementById('check_out');

    const totalPriceInput = document.getElementById('total_price');
    const displayTotal = document.getElementById('display_total');

    const summaryRooms = document.getElementById('summary_rooms');
    const summaryDays = document.getElementById('summary_days');

    const minusRoom = document.getElementById('minusRoom');
    const plusRoom = document.getElementById('plusRoom');

    const pricePerRoom = {{ $room->price }};
    const maxRooms = {{ $room->available }};


    /* =========================================
       CALCULATE TOTAL
    ========================================= */

    function calculateTotal() {

        let rooms = parseInt(guestInput.value) || 1;

        if (rooms < 1) {
            rooms = 1;
            guestInput.value = 1;
        }

        if (rooms > maxRooms) {
            rooms = maxRooms;
            guestInput.value = maxRooms;
        }


        let checkin = new Date(checkinInput.value);
        let checkout = new Date(checkoutInput.value);

        let diffDays = 1;

        if (
            checkinInput.value &&
            checkoutInput.value
        ) {

            let timeDiff = checkout - checkin;

            diffDays = Math.ceil(
                timeDiff / (1000 * 60 * 60 * 24)
            );

            if (diffDays <= 0) {
                diffDays = 1;
            }

        }


        let total = rooms * pricePerRoom * diffDays;


        summaryRooms.innerText = rooms;
        summaryDays.innerText = diffDays;


        displayTotal.innerText =
            '৳ ' + total.toLocaleString('en-IN');


        totalPriceInput.value = total;

    }


    /* =========================================
       ROOM + / -
    ========================================= */

    minusRoom.addEventListener('click', function () {

        let value = parseInt(guestInput.value) || 1;

        if (value > 1) {
            guestInput.value = value - 1;
            calculateTotal();
        }

    });


    plusRoom.addEventListener('click', function () {

        let value = parseInt(guestInput.value) || 1;

        if (value < maxRooms) {
            guestInput.value = value + 1;
            calculateTotal();
        }

    });


    /* =========================================
       EVENTS
    ========================================= */

    guestInput.addEventListener('input', calculateTotal);

    checkinInput.addEventListener('change', function () {

        /* Checkout cannot be before check-in */

        let checkinDate = new Date(this.value);

        checkinDate.setDate(
            checkinDate.getDate() + 1
        );

        let minCheckout =
            checkinDate.toISOString().split('T')[0];

        checkoutInput.min = minCheckout;

        if (checkoutInput.value < minCheckout) {
            checkoutInput.value = minCheckout;
        }

        calculateTotal();

    });


    checkoutInput.addEventListener(
        'change',
        calculateTotal
    );


    /* =========================================
       INITIAL
    ========================================= */

    calculateTotal();

});
</script>

@endsection