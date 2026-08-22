<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AdminSetting extends Model
{
    protected $fillable = ['logo', 'small_logo', 'favicon', 'title', 'footer_text', 'primary_color', 'secondary_color', 'invest_value', 'facebook', 'twitter', 'linkedin', 'whatsapp', 'google'];
}
