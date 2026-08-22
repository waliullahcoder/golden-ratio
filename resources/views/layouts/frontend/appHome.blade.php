<!DOCTYPE html>
<html lang="en">
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">
    <title>{{$settings->app_name}}</title>
    <meta name="description" content="Golden Ration Beach Resort offers affordable, comfortable and secure accommodation with modern facilities. Book rooms easily with best price guarantee for students, travelers and professionals.">
    <meta name="keywords" content="Golden Ration Beach Resort, resort booking, budget resort, student resort, affordable resort, room booking, resort in Bangladesh, cheap accommodation, resort rooms">
    <meta name="author" content="Golden Ration Beach Resort">
    <meta name="robots" content="index, follow">
    <link rel="icon" href="{{ asset($settings->favicon) }}" type="image/png">
    <link rel="shortcut icon" href="{{ asset($settings->favicon? $settings->favicon : './backend/frontend/images/logo/favicon.png') }}"
        type="image/x-icon" />
        <!-- Bootstrap CSS -->
      @include('layouts.frontend.partial.styles')
    </head>
    <body>
        <!--================Header Area =================-->
      @include('layouts.frontend.partial.header')
        <!--================Header Area =================-->
        
        <!--================Banner Area =================-->
      @include('layouts.frontend.partial.banner')
        <!--================Banner Area =================-->
        
        <!--================ Accomodation Area  =================-->
        @yield('content')
        <!--================ Accomodation Area  =================-->
        
        <!--================ Facilities Area  =================-->
       @include('layouts.frontend.partial.services')
        <!--================ Facilities Area  =================-->
        
        <!--================ About History Area  =================-->
        @include('layouts.frontend.partial.about')
        <!--================ About History Area  =================-->
        
        <!--================ Testimonial Area  =================-->
       @include('layouts.frontend.partial.testimonial')
        <!--================ Testimonial Area  =================-->
        
        <!--================ Gallery  =================-->
        @include('layouts.frontend.partial.gallery')
        <!--================ Recent Area  =================-->
        
        <!--================ start footer Area  =================-->	
        @include('layouts.frontend.partial.footer')
		<!--================ End footer Area  =================-->
        
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
       @include('layouts.frontend.partial.scripts')

</body>
</html>