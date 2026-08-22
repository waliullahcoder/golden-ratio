<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InvestMonth extends Model
{
    use HasFactory;
    protected $fillable = ['invest_id', 'investor_id', 'type', 'date', 'invest_month', 'month', 'year', 'qty', 'amount', 'distributed'];

    public function invest()
    {
        return $this->belongsTo(Invest::class, 'invest_id');
    }

    public function investor()
    {
        return $this->belongsTo(Investor::class, 'investor_id');
    }
}
