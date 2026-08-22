<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class AccountTransaction extends Model
{
    use HasFactory, SoftDeletes;
    protected $fillable = [ 'account_transaction_auto_id', 'voucher_no', 'date','voucher_type', 'voucher_date', 'coa_id', 'coa_head_code', 'narration', 'debit_amount', 'credit_amount', 'document', 'posted', 'approve', 'approve_by', 'created_by', 'updated_by', 'deleted_by'];

    public function coa()
    {
        return $this->belongsTo(CoaSetup::class, 'coa_id')->with('parent');
    }
}
