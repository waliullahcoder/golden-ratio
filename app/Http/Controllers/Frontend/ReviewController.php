<?php

namespace App\Http\Controllers\Frontend;
use App\Http\Controllers\Controller;
use App\Models\Review;
use App\Models\Room;
use Illuminate\Http\Request;

class ReviewController extends Controller
{
    public function store(Request $request, Room $room)
    {
        $request->validate([
            'rating' => 'required|integer|min:1|max:5',
            'review' => 'nullable|string|max:1000',
        ]);
        $check = Review::where('user_id', auth()->id())->where('room_id', $room->id)->first();
        if ($check) {
            $check->update([
                'rating' => $request->rating,
                'review' => $request->review,
            ]);
            return back()->with('success', 'Review updated successfully');
        }

        Review::create(
            [
                'user_id' => auth()->id(),
                'room_id' => $room->id,
                'rating' => $request->rating,
                'review' => $request->review,
            ]
        );

        return back()->with('success', 'Thanks for your review ⭐');
    }
}
