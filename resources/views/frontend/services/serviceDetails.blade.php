@extends('layouts.frontend.app')

@section('content')
  <section class="breadcrumb_area">
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Service Details</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">Services</li>
                    </ol>
                </div>
            </div>
        </section>
  <section class="about_history_area section_gap">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 d_flex align-items-center">
                        <div class="about_content ">
                            <h2 class="title title_color">{{ $service->name }}</h2>
                            <p>{{ $service->description }}</p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <img class="img-fluid" src="{{ asset('storage/'.$service->image) }}" alt="img" loading="lazy" decoding="async">
                    </div>
                </div>
            </div>
        </section>
@endsection
