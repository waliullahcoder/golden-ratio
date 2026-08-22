<?php

// app/Models/Service.php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 
        'description', 
        'icon',
        'image',
        'room_id',
        'type'
        ];

    public function room()
    {
        return $this->belongsTo(Room::class, 'room_id');
    }
}
