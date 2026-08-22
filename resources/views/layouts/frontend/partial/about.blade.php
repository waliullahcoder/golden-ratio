<section class="about_history_area section_gap">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 d_flex align-items-center">
                        <div class="about_content ">
                            <h2 class="title title_color">{{ $services['about']->name }}</h2>
                            <p>{{ $services['about']->description }}</p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <img class="img-fluid" src="{{ asset('storage/'.$services['about']->image) }}" alt="img" loading="lazy" decoding="async">
                    </div>
                </div>
            </div>
        </section>