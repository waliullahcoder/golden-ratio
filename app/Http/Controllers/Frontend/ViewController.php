<?php

namespace App\Http\Controllers\Frontend;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Services\FrontEndService;
use App\Models\Review;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;
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
   public function roomsPage($catid = null)
    {
        $rooms = $this->frontEndService->allRooms();

        if ($catid) {
            $rooms = $rooms->where('category_id', $catid);
        }

        return view('frontend.rooms.rooms', compact('rooms','catid'));
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

    public function geminiChat(Request $request)
    {
        $request->validate([
            'message' => 'required|string|max:2000',
        ]);

        $apiKey = trim(env('GEMINI_API_KEY'));

        if (!$apiKey) {
            return response()->json([
                'success' => false,
                'message' => 'GEMINI_API_KEY is missing from .env'
            ], 500);
        }

        $url = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent';

        $postData = [
            'contents' => [
                [
                    'role' => 'user',
                    'parts' => [
                        [
                            'text' => $request->message
                        ]
                    ]
                ]
            ]
        ];

        $ch = curl_init();

        curl_setopt_array($ch, [
            CURLOPT_URL => $url,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_POST => true,

            CURLOPT_HTTPHEADER => [
                'Content-Type: application/json',
                'x-goog-api-key: ' . $apiKey,
            ],

            CURLOPT_POSTFIELDS => json_encode($postData),

            CURLOPT_TIMEOUT => 60,
            CURLOPT_CONNECTTIMEOUT => 15,

            CURLOPT_SSL_VERIFYPEER => true,
            CURLOPT_SSL_VERIFYHOST => 2,
        ]);

        $result = curl_exec($ch);

        $curlError = curl_error($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

        curl_close($ch);


        // ==========================
        // CURL ERROR
        // ==========================

        if ($curlError) {

            return response()->json([
                'success' => false,
                'message' => 'cURL Error',
                'error' => $curlError,
            ], 500);
        }


        $response = json_decode($result, true);


        // ==========================
        // GEMINI API ERROR
        // ==========================

        if ($httpCode < 200 || $httpCode >= 300) {

            return response()->json([
                'success' => false,
                'message' => 'Gemini API Error',
                'http_code' => $httpCode,
                'error' => $response,
                'raw_response' => $result,
            ], 500);
        }


        // ==========================
        // GET RESPONSE
        // ==========================

        $reply = '';

        if (isset($response['candidates'][0]['content']['parts'])) {

            foreach ($response['candidates'][0]['content']['parts'] as $part) {

                if (isset($part['text'])) {
                    $reply .= $part['text'];
                }
            }
        }


        if (!$reply) {

            return response()->json([
                'success' => false,
                'message' => 'Gemini returned empty response.',
                'response' => $response,
            ], 500);
        }


        return response()->json([
            'success' => true,
            'reply' => $reply,
        ]);
    }




    
}
