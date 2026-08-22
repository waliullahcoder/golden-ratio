<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    use HasFactory;

    protected $fillable = [
        'room_id', 
        'user_id', 
        'duration',
        'check_in', 
        'check_out', 
        'guests', 
        'total_price', 
        'status'
    ];

    // Relation to Room
    public function room()
    {
        return $this->belongsTo(Room::class);
    }

    // Relation to User
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
