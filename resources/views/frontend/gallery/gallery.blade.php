@extends('layouts.frontend.app')

@section('content')
  <section class="breadcrumb_area">
            <div class="container">
                <div class="page-cover text-center">
                    <h2 class="page-cover-tittle">Gallery</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active">Gallery</li>
                    </ol>
                </div>
            </div>
        </section>
     <!--================Gallery Area =================-->
        <section class="latest_blog_area section_gap">
    <div class="container">
        <div class="row mb_30">
            @foreach ($services['gallery'] as $item)
            <div class="col-lg-4 col-md-6">
                <div class="single-recent-blog-post">
                    <div class="thumb">
                        <img class="img-fluid gallery-img" src="{{ asset('storage/'.$item->image) }}" alt="Creative Outdoor Ads" style="cursor:pointer;" data-title="Creative Outdoor Ads">
                    </div> 
                </div>
            </div>
            @endforeach
        </div>
    </div>
</section>




        <!--================Gallery Area =================-->
@endsection