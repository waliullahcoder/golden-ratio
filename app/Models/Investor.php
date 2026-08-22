<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Investor extends Model
{
    use HasFactory, SoftDeletes;
    protected $fillable = ['user_id', 'name', 'image', 'email', 'phone', 'address', 'nid', 'document', 'bkash', 'rocket', 'nagad', 'bank', 'branch', 'account_name', 'account_no', 'coa_id', 'profit_head', 'status', 'created_by', 'updated_by', 'deleted_by'];

    protected static function booted()
    {
       // static::addGlobalScope(new CompanyScope);
    }

    public function coa()
    {
        return $this->belongsTo(CoaSetup::class, 'coa_id');
    }

    public function profit_account()
    {
        return $this->belongsTo(CoaSetup::class, 'profit_head');
    }

    public function invests()
    {
        return $this->hasMany(Invest::class, 'investor_id');
    }
}
