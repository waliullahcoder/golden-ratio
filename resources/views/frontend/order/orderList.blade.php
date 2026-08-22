@extends('layouts.frontend.app')

@section('content')
@include('frontend.user.headerDash')
<div class="container py-5 userdash">
    <div class="row">

        <!-- SIDEBAR -->
        @include('frontend.user.userSideBar')

        <!-- MAIN CONTENT -->
        <div class="col-lg-9">
            {{-- ORDER LIST --}}
            <div class="card shadow-sm">
                <div class="card-body">

                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h5 class="mb-0">🧾 My Orders</h5>

                        {{-- SEARCH --}}
                        <form method="GET" class="d-flex">
                            <input type="text"
                                   name="search"
                                   value="{{ request('search') }}"
                                   class="form-control form-control-sm me-2"
                                   placeholder="Search order...">
                            <button class="btn btn-sm btn-outline-secondary">
                                Search
                            </button>
                        </form>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-bordered align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>#</th>
                                    <th>Order No</th>
                                    <th>Total</th>
                                    <th>Payment</th>
                                    <th>Status</th>
                                    <th>Date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($bookings as $order)
                                    <tr>
                                        <td>{{ $loop->iteration }}</td>
                                        <td>
                                            <strong>ORDNO{{ $order->id }}</strong>
                                        </td>
                                        <td>৳ {{ number_format($order->total,2) }}</td>
                                        <td class="text-capitalize">
                                            {{ $order->payment_method }}
                                        </td>
                                        <td>
                                              <span class="badge
                                                @switch($order->status)
                                                    @case('pending') badge-pending @break
                                                    @case('processing') badge-processing @break
                                                    @case('confirmed') badge-confirmed @break
                                                    @case('shipped') badge-shipped @break
                                                    @case('delivered') badge-delivered @break
                                                    @case('cancelled') badge-cancelled @break
                                                    @default badge-default
                                                @endswitch
                                            ">
                                                {{ ucfirst($order->status) }}
                                            </span>
                                                                                    </td>
                                        <td>
                                            {{ $order->created_at->format('d M Y') }}
                                        </td>
                                         <td class="text-center">
                                        <div class="btn-group btn-group-sm">
                                            <a href="{{ route('orders.show',$order->id) }}" target="_blank" class="btn btn-outline-primary">👁</a>
                                            <a href="{{ route('orders.invoice',$order->id) }}" class="btn btn-outline-success" target="_blank">📄</a>
                                            
                                        </div>
                                    </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="6" class="text-center text-muted">
                                            No orders found
                                        </td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>


                </div>
            </div>

        </div>
    </div>
</div>
@endsection
