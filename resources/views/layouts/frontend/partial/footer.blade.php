<footer class="footer-area section_gap">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3  col-md-6 col-sm-6">
                        <div class="single-footer-widget">
                            <h6 class="footer_title">{{ $global_services['about']->name }}</h6>
                            <p>{{ $global_services['about']->description }}</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="single-footer-widget">
                            <h6 class="footer_title">Navigation Links</h6>
                            <div class="row">
                                <div class="col-4">
                                    <ul class="list_style">
                                        @foreach ($global_services['footer_col1'] as $item)
                                        <li><a href="{{ route('serviceDetails', $item->id) }}">{{ $item->name }}</a></li>
                                        @endforeach
                                    </ul>
                                </div>
                                <div class="col-4">
                                    <ul class="list_style">
                                       @foreach ($global_services['footer_col2'] as $item)
                                        <li><a href="{{ route('serviceDetails', $item->id) }}">{{ $item->name }}</a></li>
                                        @endforeach
                                    </ul>
                                </div>										
                            </div>							
                        </div>
                    </div>							
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="single-footer-widget">
                            <h6 class="footer_title">Social Links</h6>
                            
                    <a href="{{ $settings->facebook_page }}" target="_blank"><i class="fab fa-facebook-f"></i></a>
                <a href="{{ $settings->twitter }}" target="_blank"><i class="fab fa-twitter"></i></a>
                <a href="{{ $settings->instagram }}" target="_blank"><i class="fab fa-dribbble"></i></a>
                <a href="{{ $settings->linkedin }}" target="_blank"><i class="fab fa-behance"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="single-footer-widget instafeed">
                            <h6 class="footer_title">InstaFeed</h6>
                            <ul class="list_style instafeed d-flex flex-wrap">
                                 @foreach ($global_services['gallery'] as $item)
                                <li><img src="{{ asset('storage/'.$item->image) }}" alt="" loading="lazy" decoding="async" style="width: 50px; height: 50px; object-fit: cover;"></li>
                                @endforeach
                            </ul>
                        </div>
                    </div>						
                </div>
                <div class="border_line"></div>
                <div class="row footer-bottom d-flex justify-content-between align-items-center" style="text-align: center">
                    <p style="width:100%">
Copyright ©<script>document.write(new Date().getFullYear());</script> All rights reserved | Developed by <a href="https://technoparkbd.com" target="_blank">Techno Park Bangladesh</a></p> 
                </div>
            </div>
        </footer>