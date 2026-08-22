<?php

namespace App\Http\Controllers\Frontend;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Services\FrontEndService;
use App\Models\Review;
use Illuminate\Support\Facades\Auth;
class ViewController extends Controller
{
    protected $frontEndService;
    public function __construct(FrontEndService $frontEndService)
    {
        $this->frontEndService = $frontEndService;
    }

    public function index()
    {
        $rooms = $this->frontEndService->allRooms();
        $services = $this->frontEndService->allServices();
        $testimonials = $this->frontEndService->allTestimonials();

        return view('frontend.home', compact('rooms','services','testimonials'));
    }
    public function roomsPage()
    {
        $rooms = $this->frontEndService->allRooms();
        return view('frontend.rooms.rooms', compact('rooms'));
    }

    public function roomDetails($id)
    {
        $room = $this->frontEndService->getRoom($id);
        return view('frontend.room-details', compact('room'));
    }

    public function services()
    {
        $services = $this->frontEndService->allServices();
        return view('frontend.services', compact('services'));
    }

    public function serviceDetails($service)
    {
        $service = $this->frontEndService->serviceDetails($service);
        $services = $this->frontEndService->allServices();
        return view('frontend.services.serviceDetails', compact('service','services'));
    }

    public function contactPage()
    {
        return view('frontend.contact.contact');
    }
    public function aboutPage()
    {
         $services = $this->frontEndService->allServices();
        return view('frontend.about.about', compact('services'));
    }
    public function galleryPage()
    {
         $services = $this->frontEndService->allServices();
        return view('frontend.gallery.gallery', compact('services'));
    }

    // public function bookingPage()
    // {
    //     return view('frontend.booking.booking');
    // }

    public function signinPage()
    {
        if (Auth::check()) {
            return redirect()->route('home');
        }
        return view('frontend.auth.signin');
    }
    

    public function signupPage()
    {
        if (Auth::check()) {
                return redirect()->route('home');
            }
        return view('frontend.auth.signup');
    }


    public function singleDetails($id)
    {
       $room = $this->frontEndService->getRoom($id);
       $review_count=Review::where('room_id', $room->id)->where('user_id',Auth::id())->count();
        return view('frontend.rooms.singleDetails', compact('room','review_count'));
    }
    
}
