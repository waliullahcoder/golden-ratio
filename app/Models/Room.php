<?php
// app/Models/Room.php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Room extends Model
{
    use HasFactory;

    protected $fillable = [
    'name',
    'category_id',
    'duration',
    'show_dashboard', 
    'serial', 
    'required_share',
    'status',
    'slug',
    'description',
    'price',
    'capacity',
    'profit',
    'available',
    'image',
    'image2',
    'image3',
    'image4',
    'available',
    'meta_title',
    'meta_description',
    'meta_keywords',
    'meta_image',
  ];

   // Correct relation: singular 'category'
    public function category()
    {
        return $this->belongsTo(Category::class);
    }
     public function invests()
    {
        return $this->hasMany(Invest::class, 'product_id');
    }
    public function reviews()
    {
        return $this->hasMany(Review::class)->where('status', 1);
    }

    public function averageRating()
    {
        return $this->reviews()->avg('rating');
    }
}
