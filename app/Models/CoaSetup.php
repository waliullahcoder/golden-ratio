<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CoaSetup extends Model
{
    use HasFactory, SoftDeletes;
    protected $fillable = ['parent_id', 'head_code', 'head_name', 'transaction', 'general', 'head_type', 'status', 'created_by', 'updated_by', 'deleted_by'];

    public function scopeRoot($query)
    {
        $query->whereNull('parent_id')->with(['children']);
    }

    public function children()
    {
        return $this->hasMany($this, 'parent_id')->with(['children']);
    }

    public function parent()
    {
        return $this->belongsTo($this, 'parent_id');
    }
}
