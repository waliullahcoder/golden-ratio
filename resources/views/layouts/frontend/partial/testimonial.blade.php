   <section class="testimonial_area section_gap">
            <div class="container">
                <div class="section_title text-center">
                    <h2 class="title_color">Testimonial from our Clients</h2>
                </div>
                <div class="testimonial_slider owl-carousel">
                    @foreach ($services['testimonial'] as $item)    
                    <div class="media testimonial_item">
                        <img class="rounded-circle" src="{{ asset('storage/'.$item->image) }}" alt="" loading="lazy" decoding="async">
                        <div class="media-body">
                            <p>{{ $item->description }}</p>
                            <a href="{{ route('serviceDetails', $item->id) }}"><h4 class="sec_h4">{{ $item->name }}</h4></a>
                        </div>
                    </div>    
                    @endforeach
                    
                </div>
            </div>
        </section>