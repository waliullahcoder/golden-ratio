<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InvestRenewList extends Model
{
    use HasFactory;
    protected $fillable = ['invest_renew_id', 'investor_id', 'invest_id', 'invest_month_id', 'date', 'invest_month', 'month', 'year', 'qty', 'amount', 'calculate'];

    public function investor()
    {
        return $this->belongsTo(Investor::class, 'investor_id');
    }

    public function invest()
    {
        return $this->belongsTo(Invest::class, 'invest_id');
    }

    public function investMonth()
    {
        return $this->belongsTo(InvestMonth::class, 'invest_month_id');
    }
}
