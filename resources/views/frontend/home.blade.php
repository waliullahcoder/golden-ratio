@extends('layouts.frontend.appHome')

@section('content')
  <section class="accomodation_area section_gap">
            <div class="container">
                <div class="section_title text-center">
                    <h2 class="title_color">Resort Accomodation</h2>
                    <p>We all live in an age that belongs to the young at heart. Life that is becoming extremely fast, </p>
                </div>
                <div class="row mb_30">
                    @foreach ($rooms as $room)
                    <div class="col-lg-3 col-sm-6">
                        <div class="accomodation_item text-center">
                            <div class="hotel_img">
                               <a href="{{ route('singleDetails', $room->id) }}"> <img src="{{$room->image ? asset('storage/'.$room->image) : asset('frontend/images/room1.jpg')}}" alt="" fetchpriority="high" decoding="sync"></a>
                                <a href="{{ route('booking.bookRoom', $room->id) }}"
                                   class="btn theme_btn button_hover position-absolute bottom-0 start-50 translate-middle-x mb-3">
                                    Book Now
                                </a>
                            </div>
                            <a href="{{ route('singleDetails', $room->id) }}"><h4 class="sec_h4">{{$room->name}}({{'ROOMID'.$room->id}})</h4></a>
                            <h5>৳ {{$room->price}}<small>/night</small></h5>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </section>
@endsection
