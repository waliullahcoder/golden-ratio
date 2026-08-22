<section class="latest_blog_area section_gap">
    <div class="container">
        <div class="section_title text-center">
            <h2 class="title_color">Gallery</h2>
        </div>
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



