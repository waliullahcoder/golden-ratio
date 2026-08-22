<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;

class MonthlyProfit extends Model
{
    use SoftDeletes;
    protected $fillable = ['serial_no', 'year', 'month', 'date', 'invest_qty', 'invest_amount', 'income_amount', 'expense_amount', 'profit_amount', 'profit_percentage', 'public_invest_profit', 'private_invest_profit', 'total_invest_profit', 'created_by', 'updated_by', 'deleted_by'];
    protected $appends = ['formattedDate', 'publicInvestQty', 'publicInvestAmount'];

    public function list()
    {
        return $this->hasMany(MonthlyProfitList::class, 'monthly_profit_id');
    }

    public function payments()
    {
        return $this->hasMany(MonthlyProfitList::class, 'monthly_profit_id')->where('paid_amount', '>', 0);
    }

    protected static function booted()
    {
        // Automatically set created_by and updated_by
        static::creating(function ($data) {
            $data->created_by = Auth::id();
            $data->updated_by = Auth::id();
        });

        static::updating(function ($data) {
            $data->updated_by = Auth::id();
        });
    }

    public function getFormattedDateAttribute()
    {
        return date('d-m-Y', strtotime($this->date));
    }

    public function getPublicInvestQtyAttribute()
    {
        return $this->list()->where('is_private', false)->sum('invest_qty');
    }

    public function getPublicInvestAmountAttribute()
    {
        return $this->list()->where('is_private', false)->sum('invest_amount');
    }
}
