     <section class="banner_area">
            <div class="booking_table d_flex align-items-center">
            	<div class="overlay bg-parallax" data-stellar-ratio="0.9" data-stellar-vertical-offset="0" data-background=""></div>
				<div class="container">
					<div class="banner_content text-center">
						<h6>Away from monotonous life</h6>
						<h2>GOLDEN RATIO BEACH RESORT</h2>
						{{-- <p>If you are looking at blank cassettes on the web, you may be very confused at the<br> difference in price. You may see some for as low as $.17 each.</p> --}}
						<a href="{{ route('booking.index') }}" class="btn theme_btn button_hover">BOOKING AVAILABLE</a>
					</div>
				</div>
            </div>
            <div class="hotel_booking_area position">
                <div class="container">
                    <div class="hotel_booking_table">
                        <div class="col-md-3">
                            <h2>Book<br> Your Room</h2>
                        </div>
                        <div class="col-md-9">
                              <form action="{{ route('booking.search') }}" method="GET">
                            <div class="boking_table">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="book_tabel_item">
                                            <div class="form-group">
                                                <div class="input-group date" id="datetimepicker11">
                                                    <input type="text" class="form-control" placeholder="CheckIn Date">
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="input-group date" id="datetimepicker1">
                                                    <input type="text" class="form-control" placeholder="CheckOut Date">
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="book_tabel_item">
                                            <div class="input-group">
                                                <select class="wide">
                                                    <option data-display="Duration">Duration</option>
                                                   <option value="day">Day</option>
                                                    <option value="night">Night</option>
                                                    <option value="week">Week</option>
                                                    <option value="month">Month</option>
                                                    <option value="year">Year</option>
                                                    <option value="custom">Custom</option>
                                                </select>
                                            </div>
                                             <div class="input-group">
                                                <select class="wide" name="available">
                                                    <option data-display="Guests/Seats">Guests/Seats</option>
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
                                                 <select name="category_id" class="wide">
                                                <option value="">Seat Type</option>
                                                @foreach($categories as $category)
                                                    <option value="{{ $category->id }}"
                                                        {{ request('category_id') == $category->id ? 'selected' : '' }}>
                                                        {{ $category->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                            </div>
                                            <button type="submit" class="book_now_btn button_hover">Search Now</button>
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