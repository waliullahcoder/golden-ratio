 <style>
/* =========================
   FAST & SMOOTH HERO ANIMATION
========================= */

.banner_area {
    overflow: hidden;
}


/* =========================
   BACKGROUND
========================= */

.banner_area .overlay {
    transform: scale(1.02);
    animation: heroZoom 6s ease-in-out infinite alternate;
}

.banner_area .bg-parallax {
    background: url("./frontend/images/banner_bg.jpg") no-repeat scroll center 0/cover;
}


/* =========================
   BANNER CONTENT
========================= */

.banner_content {
    opacity: 0;
    transform: translateY(20px);
    animation: heroContent 0.35s ease-out 0s forwards;
}


/* Small Heading */

.banner_content h6 {
    opacity: 0;
    transform: translateY(12px);
    animation: fadeUp 0.25s ease-out 0.05s forwards;
}


/* Main Heading */

.banner_content h2 {
    opacity: 0;
    transform: translateY(15px);
    animation: fadeUp 0.3s ease-out 0.1s forwards;
}


/* Button */

.banner_content .theme_btn {
    opacity: 0;
    transform: translateY(12px) scale(0.98);
    animation: buttonIn 0.25s ease-out 0.15s forwards;
}


/* Button Hover */

.banner_content .theme_btn {
    transition: all 0.2s ease;
}

.banner_content .theme_btn:hover {
    transform: translateY(-3px) scale(1.04);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.25);
}


/* =========================
   BOOKING BOX
========================= */

.hotel_booking_area {
    opacity: 0;
    transform: translateY(20px);
    animation: bookingBox 0.35s ease-out 0.2s forwards;
}


/* =========================
   KEYFRAMES
========================= */

@keyframes heroZoom {

    0% {
        transform: scale(1.02);
    }

    100% {
        transform: scale(1.07);
    }

}


@keyframes heroContent {

    from {
        opacity: 0;
        transform: translateY(20px);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }

}


@keyframes fadeUp {

    from {
        opacity: 0;
        transform: translateY(12px);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }

}


@keyframes buttonIn {

    from {
        opacity: 0;
        transform: translateY(12px) scale(0.98);
    }

    to {
        opacity: 1;
        transform: translateY(0) scale(1);
    }

}


@keyframes bookingBox {

    from {
        opacity: 0;
        transform: translateY(20px);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }

}


/* =========================
   REDUCED MOTION
========================= */

@media (prefers-reduced-motion: reduce) {

    .banner_area .overlay,
    .banner_content,
    .banner_content h6,
    .banner_content h2,
    .banner_content .theme_btn,
    .hotel_booking_area {

        animation: none !important;
        opacity: 1 !important;
        transform: none !important;

    }

}
</style>
     
    <section class="banner_area">

    <div class="booking_table d_flex align-items-center">

        <div class="overlay bg-parallax"
             data-stellar-ratio="0.9"
             data-stellar-vertical-offset="0"
             data-background="">
        </div>

        <div class="container">

            <div class="banner_content text-center">

                <h6>Away from monotonous life</h6>

                <h2>GOLDEN RATIO BEACH RESORT</h2>

                <a href="{{ route('booking.index') }}"
                   class="btn theme_btn button_hover">
                    BOOKING AVAILABLE
                </a>

            </div>

        </div>

    </div>


    <div class="hotel_booking_area position">

        <div class="container">

            <div class="hotel_booking_table">

                <div class="col-md-3">
                    <h2>Book Now</h2>
                </div>

                <div class="col-md-9">

                    <form action="{{ route('booking.search') }}" method="GET">

                        <div class="boking_table">

                            <div class="row">

                                <div class="col-md-4">

                                    <div class="book_tabel_item">

                                        <div class="form-group">

                                            <div class="input-group date"
                                                 id="datetimepicker11">

                                                <input type="text"
                                                       class="form-control"
                                                       placeholder="CheckIn Date">

                                                <span class="input-group-addon">
                                                    <i class="fa fa-calendar"
                                                       aria-hidden="true"></i>
                                                </span>

                                            </div>

                                        </div>


                                        <div class="form-group">

                                            <div class="input-group date"
                                                 id="datetimepicker1">

                                                <input type="text"
                                                       class="form-control"
                                                       placeholder="CheckOut Date">

                                                <span class="input-group-addon">
                                                    <i class="fa fa-calendar"
                                                       aria-hidden="true"></i>
                                                </span>

                                            </div>

                                        </div>

                                    </div>

                                </div>


                                <div class="col-md-4">

                                    <div class="book_tabel_item">

                                        <div class="input-group">

                                            <select class="wide">

                                                <option data-display="Duration">
                                                    Duration
                                                </option>

                                                <option value="day">Day</option>
                                                <option value="night">Night</option>
                                                <option value="week">Week</option>
                                                <option value="month">Month</option>
                                                <option value="year">Year</option>
                                                <option value="custom">Custom</option>

                                            </select>

                                        </div>


                                        <div class="input-group">

                                            <select class="wide"
                                                    name="available">

                                                <option data-display="Guests">
                                                    Guests
                                                </option>

                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9+</option>

                                            </select>

                                        </div>

                                    </div>

                                </div>


                                <div class="col-md-4">

                                    <div class="book_tabel_item">

                                        <div class="input-group">

                                            <select name="category_id"
                                                    class="wide">

                                                <option value="">
                                                    Seat Type
                                                </option>

                                                @foreach($categories as $category)

                                                    <option value="{{ $category->id }}"
                                                        {{ request('category_id') == $category->id ? 'selected' : '' }}>

                                                        {{ $category->name }}

                                                    </option>

                                                @endforeach

                                            </select>

                                        </div>


                                        <button type="submit"
                                                class="book_now_btn button_hover">

                                            Search Now

                                        </button>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </form>

                </div>

            </div>

        </div>

    </div>

</section>