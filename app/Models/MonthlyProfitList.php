<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MonthlyProfitList extends Model
{
    protected $fillable = ['monthly_profit_id', 'invest_id', 'investor_id', 'invest_qty', 'invest_amount', 'is_private', 'profit_amount', 'paid_amount'];

    public function monthlyProfit()
    {
        return $this->belongsTo(MonthlyProfit::class);
    }

    public function invest()
    {
        return $this->belongsTo(Invest::class);
    }

    public function investor()
    {
        return $this->belongsTo(Investor::class);
    }

    public function payments()
    {
        return $this->hasMany(InvestorPaymentList::class, 'monthly_profit_list_id');
    }
}
