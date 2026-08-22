<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class InvestRenew extends Model
{
    use HasFactory, SoftDeletes;
    protected $fillable = ['serial_no', 'date', 'month', 'year', 'remarks', 'approved', 'status', 'created_by', 'updated_by', 'deleted_by'];

    protected static function booted()
    {
        //static::addGlobalScope(new CompanyScope);
    }

    public function list()
    {
        return $this->hasMany(InvestRenewList::class, 'invest_renew_id');
    }
}
