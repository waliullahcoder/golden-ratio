<?php

namespace App\Services;

use App\Models\Room;
use App\Models\Service;
use App\Models\Testimonial;

class FrontEndService
{
    public function allRooms()
    {
        return Room::where('status', true)->get();
    }

    public function getRoom($id)
    {
        return Room::findOrFail($id);
    }

    public function allServices()
    {
        $services['room'] = Service::where('type', 'room')->orderBy('id', 'desc')->get();
        $services['menu'] = Service::where('type', 'menu')->orderBy('id', 'desc')->get();
        $services['home'] = Service::where('type', 'home')->orderBy('id', 'desc')->get();
        $services['gallery'] = Service::where('type', 'gallery')->orderBy('id', 'desc')->get();
        $services['testimonial'] = Service::where('type', 'testimonial')->orderBy('id', 'desc')->get();
        $services['footer_col1'] = Service::where('type', 'footer_col1')->orderBy('id', 'desc')->get();
        $services['footer_col2'] = Service::where('type', 'footer_col2')->orderBy('id', 'desc')->get();
        $services['about'] = Service::where('type', 'about')->first();
        return  $services;
    }
    public function serviceDetails($id)
    {
        return Service::findOrFail($id);
    }
    public function allTestimonials()
    {
        return Testimonial::all();
    }
}
