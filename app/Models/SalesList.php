<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SalesList extends Model
{
    protected $fillable = ['sales_id', 'store_id', 'client_id', 'product_id', 'price', 'commission', 'commission_amount', 'rate', 'qty', 'amount', 'discount', 'net_amount', 'return_qty', 'return_amount', 'distributed'];

    public function sales()
    {
        return $this->belongsTo(Sales::class, 'sales_id');
    }

    public function client()
    {
        return $this->belongsTo(Client::class, 'client_id');
    }

    public function store()
    {
        return $this->belongsTo(Store::class, 'store_id');
    }

    public function product()
    {
        return $this->belongsTo(Room::class, 'product_id');
    }

 
}
