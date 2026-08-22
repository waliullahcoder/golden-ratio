<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InvestSattlementList extends Model
{
    use HasFactory;
    protected $fillable = ['invest_sattlement_id', 'invest_id', 'qty', 'amount'];

    public function invest()
    {
        return $this->belongsTo(Invest::class, 'invest_id');
    }
}
