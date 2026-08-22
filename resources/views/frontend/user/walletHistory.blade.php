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
                        <h5 class="mb-0">🧾 Wallest History</h5>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-bordered align-middle">
                                <tr>
                                    <th colspan=6 style="text-align: center;">Sales</th>
                                </tr>
                                <tr>
                                    <th>#</th>
                                    <th>Sales ID</th>
                                    <th>Room Name</th>
                                    <th>Seats</th>
                                    <th>Price</th>
                                    <th>Date</th>
                                </tr>
                                @forelse($sales as $sale)
                                    <tr>
                                        <td>{{ $loop->iteration }}</td>
                                        <td>
                                            <strong>{{ $sale->id }}</strong>
                                        </td>
                                        <td> <strong>{{ $sale->product->name }}</strong></td>
                                       
                                        <td>{{ $sale->qty }}</td>
                                        <td>{{ $sale->price }}</td>
                                        <td>
                                            {{ $sale->created_at->format('d M Y') }}
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="6" class="text-center text-muted">
                                            No orders found
                                        </td>
                                    </tr>
                                @endforelse

                                 <tr>
                                    <th colspan=6 style="text-align: center;">Expense</th>
                                </tr>
                                <tr>
                                    <th>#</th>
                                    <th>Expense ID</th>
                                    <th>Transaction</th>
                                    <th>Remark</th>
                                    <th>Price</th>
                                    <th>Date</th>
                                </tr>
                                @forelse($expenses as $expense)
                                    <tr>
                                        <td>{{ $loop->iteration }}</td>
                                        <td>
                                            <strong>{{ $expense->id }}</strong>
                                        </td>
                                        <td> <strong>{{ $expense->expense->transaction_no }}({{ $expense->coa->head_name }})</strong></td>
                                        <td> <strong>{{ $expense->expense->remarks }}</strong></td>
                                        <td>{{ $expense->amount }}</td>
                                        <td>
                                            {{ $expense->created_at->format('d M Y') }}
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="6" class="text-center text-muted">
                                            No orders found
                                        </td>
                                    </tr>
                                @endforelse
                        </table>
                    </div>


                </div>
            </div>

        </div>
    </div>
</div>
@endsection
