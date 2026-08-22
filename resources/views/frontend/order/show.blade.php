@extends('layouts.frontend.app')

@section('content')
@include('frontend.user.headerDash')
<div class="container py-5 userdash">
    <div class="row">
        @include('frontend.user.userSideBar')

        <div class="col-lg-9">
            <div class="card shadow-sm">
                <div class="card-body">

                    <div class="d-flex justify-content-between mb-3">
                        <h5>Order #ORDNO{{ $order->id }}</h5>
                        <a href="{{ route('orders.invoice', $order) }}"
                           class="btn btn-sm btn-outline-primary">
                            📄 Download Invoice
                        </a>
                    </div>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Type</th>
                                <th>Qty</th>
                                <th>Price</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                                <tr>
                                    <td>{{ $order->room->name }}</td>
                                    <td>
                                        {{ $order->room->category->name ?? '-' }}
                                    </td>
                                    <td>{{ $order->guests }}</td>
                                    <td>৳ {{ number_format($order->room->price,2) }}</td>
                                    <td>৳ {{ number_format($order->total_price,2) }}</td>
                                </tr>
                                 <tr>
                                    <td><h5>Grand Total:</h5> </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                  <td><h5>৳ {{ number_format($order->total_price,2) }}</h5></td>
                                </tr>
                        </tbody>
                    </table>

                   

                </div>
            </div>
        </div>
    </div>
</div>
@endsection
