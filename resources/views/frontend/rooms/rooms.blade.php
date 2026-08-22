@extends('layouts.frontend.app')

@section('content')
  <section class="breadcrumb_area">
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">All Rooms</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">Rooms</li>
                    </ol>
                </div>
            </div>
        </section>
  <section class="accomodation_area section_gap">
            <div class="container">
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
                            <a href="{{ route('singleDetails', $room->id) }}"><h4 class="sec_h4">{{$room->name}} ({{'ROOMID'.$room->id}})</h4></a>
                            <h5>৳ {{$room->price}}<small>/night</small></h5>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </section>
@endsection
