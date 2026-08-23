<?php

namespace App\Http\Controllers\Frontend;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Services\FrontEndService;
use App\Models\Review;
use App\Models\Room;
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


    //General Chatbot Like Chatgpt

    // public function geminiChat(Request $request)
    // {
    //     $request->validate([
    //         'message' => 'required|string|max:2000',
    //     ]);

    //     $apiKey = config('services.gemini.api_key');

    //     if (!$apiKey) {
    //         return response()->json([
    //             'success' => false,
    //             'message' => 'GEMINI_API_KEY is missing'
    //         ], 500);
    //     }

    //     $url = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-3.6-flash:generateContent';

    //     $data = [
    //         'contents' => [
    //             [
    //                 'parts' => [
    //                     [
    //                         'text' => $request->input('message')
    //                     ]
    //                 ]
    //             ]
    //         ]
    //     ];

    //     $ch = curl_init($url);

    //     curl_setopt_array($ch, [
    //         CURLOPT_RETURNTRANSFER => true,
    //         CURLOPT_POST => true,
    //         CURLOPT_HTTPHEADER => [
    //             'Content-Type: application/json',
    //             'x-goog-api-key: ' . trim($apiKey),
    //         ],
    //         CURLOPT_POSTFIELDS => json_encode($data),
    //         CURLOPT_TIMEOUT => 60,
    //     ]);

    //     $response = curl_exec($ch);

    //     $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    //     $curlError = curl_error($ch);

    //     curl_close($ch);

    //     if ($response === false) {
    //         return response()->json([
    //             'success' => false,
    //             'message' => $curlError
    //         ], 500);
    //     }

    //     $result = json_decode($response, true);

    //     if ($httpCode !== 200) {
    //         return response()->json([
    //             'success' => false,
    //             'message' => $result['error']['message'] ?? 'Gemini API Error',
    //             'debug' => $result
    //         ], $httpCode);
    //     }

    //     /*
    //     |--------------------------------------------------------------------------
    //     | Extract Gemini Text
    //     |--------------------------------------------------------------------------
    //     */

    //     $message = '';

    //     $candidates = $result['candidates'] ?? [];

    //     foreach ($candidates as $candidate) {

    //         $parts = $candidate['content']['parts'] ?? [];

    //         foreach ($parts as $part) {

    //             if (isset($part['text']) && !empty($part['text'])) {
    //                 $message .= $part['text'];
    //             }
    //         }
    //     }

    //     $message = trim($message);

    //     if ($message === '') {
    //         return response()->json([
    //             'success' => false,
    //             'message' => 'Text not found in Gemini response.',
    //             'candidates' => $candidates
    //         ], 500);
    //     }

    //     return response()->json([
    //         'success' => true,
    //         'message' => $message
    //     ]);
    // }


  public function geminiChat(Request $request)
    {
        $request->validate([
            'message' => 'required|string|max:2000',
        ]);

       // $apiKey = config('services.gemini.api_key');
      
        // Website information from database
        $rooms = Room::with('category')
            ->where('status', 1)
            ->get();

        $websiteInfo = "Golden Ratio Beach Resort\n\n";

        foreach ($rooms as $room) {
            $websiteInfo .= "Room: " . $room->name . "\n";
            $websiteInfo .= "Category: " . ($room->category->name ?? '') . "\n";
            $websiteInfo .= "Price: " . $room->price . " Tk\n";
            $websiteInfo .= "Capacity: " . $room->capacity . " persons\n";
            $websiteInfo .= "Available: " . ($room->available ? 'Yes' : 'No') . "\n\n";
        }

        // User question + website information
        $prompt = "
    You are the official chatbot of Golden Ratio Beach Resort.

    Answer the customer using the website information provided below.

    IMPORTANT RULES:
    - Use only the provided website information for hotel-specific questions.
    - Do not invent room prices, availability, facilities or policies.
    - If the information is not available, politely say that you don't have that information.
    - Answer naturally and briefly.
    - You can answer in Bengali or English depending on the user's question.

    WEBSITE INFORMATION:
    $websiteInfo

    CUSTOMER QUESTION:
    {$request->message}
    ";

        $url = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-3.6-flash:generateContent';

        $data = [
            'contents' => [
                [
                    'parts' => [
                        [
                            'text' => $prompt
                        ]
                    ]
                ]
            ]
        ];

        $ch = curl_init($url);

        curl_setopt_array($ch, [
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_POST => true,
            CURLOPT_HTTPHEADER => [
                'Content-Type: application/json',
                'x-goog-api-key: ' . trim($apiKey),
            ],
            CURLOPT_POSTFIELDS => json_encode($data),
            CURLOPT_TIMEOUT => 60,
        ]);

        $response = curl_exec($ch);

        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

        curl_close($ch);

        $result = json_decode($response, true);

        if ($httpCode !== 200) {
            return response()->json([
                'success' => false,
                'message' => $result['error']['message'] ?? 'Gemini API Error'
            ], $httpCode);
        }

        $message = '';

        foreach ($result['candidates'][0]['content']['parts'] ?? [] as $part) {
            if (isset($part['text'])) {
                $message .= $part['text'];
            }
        }

        return response()->json([
            'success' => true,
            'message' => trim($message)
        ]);
    }



    
}
