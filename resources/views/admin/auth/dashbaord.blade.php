@extends('layouts.admin.app')

@section('content')
<style>

.dashboard-card{
    border:0;
    border-radius:16px;
    overflow:hidden;
    color:#fff;
    box-shadow:0 8px 25px rgba(0,0,0,.08);
    transition:.3s ease;
    min-height:135px;
}

.dashboard-card:hover{
    transform:translateY(-5px);
    box-shadow:0 15px 35px rgba(0,0,0,.15);
}

.dashboard-card .card-body{
    padding:22px;
}

.dashboard-card .card-text{
    color:rgba(255,255,255,.8);
    font-size:14px;
    margin-bottom:8px;
}

.dashboard-card .card-count{
    color:#fff;
    font-size:24px;
    font-weight:700;
    margin:0;
}

.dashboard-card small{
    color:rgba(255,255,255,.7);
}

.dashboard-card .card-icon{
    width:55px;
    height:55px;
    border-radius:15px;
    display:flex;
    align-items:center;
    justify-content:center;
    background:rgba(255,255,255,.18);
}

.dashboard-card .card-icon span{
    font-size:30px;
}

/* Dashboard Colors */

.primary-card{
    background:linear-gradient(135deg,#2563eb,#1e40af);
}

.info-bg{
    background:linear-gradient(135deg,#0891b2,#0e7490);
}

.success-bg{
    background:linear-gradient(135deg,#16a34a,#15803d);
}

.warning-bg{
    background:linear-gradient(135deg,#f59e0b,#d97706);
}

.danger-bg{
    background:linear-gradient(135deg,#ef4444,#b91c1c);
}

.purple-bg{
    background:linear-gradient(135deg,#8b5cf6,#6d28d9);
}

.revenue-bg{
    background:linear-gradient(135deg,#10b981,#047857);
}

.expense-bg{
    background:linear-gradient(135deg,#f97316,#c2410c);
}

.dark-bg{
    background:linear-gradient(135deg,#334155,#0f172a);
}

.available-bg{
    background:linear-gradient(135deg,#06b6d4,#0e7490);
}

.occupied-bg{
    background:linear-gradient(135deg,#ec4899,#be185d);
}

.checkin-bg{
    background:linear-gradient(135deg,#22c55e,#15803d);
}

.checkout-bg{
    background:linear-gradient(135deg,#6366f1,#4338ca);
}

.guest-bg{
    background:linear-gradient(135deg,#14b8a6,#0f766e);
}

</style>
    <div class="row g-3 info-cards">
        @php
            $totalInvestor = \App\Models\Investor::where('status', true)->count();
            $totalInvest = \App\Models\Invest::where('sattled', false)->sum('amount');
            $totalWithdraw = \App\Models\Payment::whereIn('payment_type', ['Payment', 'Advance'])->sum('amount');
            $totalDue = \App\Models\ProfitDistributionList::whereHas('profitDistribution')->sum(
                DB::raw('amount - paid_amount'),
            );


              /*
        |--------------------------------------------------------------------------
        | RESORT DASHBOARD SUMMARY
        |--------------------------------------------------------------------------
        | নিচের Model/Table নাম আপনার project অনুযায়ী পরিবর্তন করবেন
        */

        // Room
        $totalRooms = \App\Models\Room::count();

        // Booking
        $totalBooking = \App\Models\Booking::count();

        // Confirmed Reservation
        $totalConfirmed = \App\Models\Booking::where('status', 'confirmed')->count();

        // Pending Reservation
        $totalPending = \App\Models\Booking::where('status', 'pending')->count();

        // Cancelled Booking
        $totalCancelled = \App\Models\Booking::where('status', 'cancelled')->count();

        // Booking Amount
        $totalBookingAmount = \App\Models\Booking::sum('total_price');

        // Paid Amount
        $totalPaidAmount = \App\Models\Payment::sum('amount');

        // Due Amount
        $totalDueAmount = $totalBookingAmount - $totalPaidAmount;

        // Expense
        $totalExpense = \App\Models\Expense::sum('amount');

        // Revenue
        $totalRevenue = $totalPaidAmount;

        // Net Profit
        $netProfit = $totalRevenue - $totalExpense;


        /*
        |--------------------------------------------------------------------------
        | TODAY'S ROOM STATUS
        |--------------------------------------------------------------------------
        */

        $today = now()->toDateString();

        // Today Booking
        $todayBooking = \App\Models\Booking::whereDate('created_at', $today)->count();

        // Today's Check In
        $todayCheckIn = \App\Models\Booking::whereDate('check_in', $today)
                            ->whereIn('status', ['confirmed', 'checked_in'])
                            ->count();

        // Today's Check Out
        $todayCheckOut = \App\Models\Booking::whereDate('check_out', $today)
                            ->count();

        // Occupied Room
        $occupiedRooms = \App\Models\Booking::where('check_in', '<=', $today)
                            ->where('check_out', '>', $today)
                            ->whereIn('status', ['confirmed', 'checked_in'])
                            ->count();

        // Available Room
        $availableRooms = max($totalRooms - $occupiedRooms, 0);

        // Total Guest
        $totalGuests = \App\Models\Client::count();
        @endphp
         {{-- Total Rooms --}}
    <div class="col-xl-3 col-lg-4 col-md-6">
        <div class="card info-card dashboard-card primary-card">
            <div class="card-body">
                <div class="card-content">
                    <p class="card-text">Total Rooms</p>
                    <h3 class="card-count">{{ number_format($totalRooms) }}</h3>
                    <small>All resort rooms</small>
                </div>
                <div class="card-icon">
                    <span class="material-symbols-outlined">bed</span>
                </div>
            </div>
        </div>
    </div>


    {{-- Total Booking --}}
    <div class="col-xl-3 col-lg-4 col-md-6">
        <div class="card info-card dashboard-card info-bg">
            <div class="card-body">
                <div class="card-content">
                    <p class="card-text">Total Room Booking</p>
                    <h3 class="card-count">{{ number_format($totalBooking) }}</h3>
                    <small>All bookings</small>
                </div>
                <div class="card-icon">
                    <span class="material-symbols-outlined">calendar_month</span>
                </div>
            </div>
        </div>
    </div>


    {{-- Confirmed --}}
    <div class="col-xl-3 col-lg-4 col-md-6">
        <div class="card info-card dashboard-card success-bg">
            <div class="card-body">
                <div class="card-content">
                    <p class="card-text">Reservation Confirmed</p>
                    <h3 class="card-count">{{ number_format($totalConfirmed) }}</h3>
                    <small>Confirmed guests</small>
                </div>
                <div class="card-icon">
                    <span class="material-symbols-outlined">verified</span>
                </div>
            </div>
        </div>
    </div>


    {{-- Pending --}}
    <div class="col-xl-3 col-lg-4 col-md-6">
        <div class="card info-card dashboard-card warning-bg">
            <div class="card-body">
                <div class="card-content">
                    <p class="card-text">Pending Reservation</p>
                    <h3 class="card-count">{{ number_format($totalPending) }}</h3>
                    <small>Waiting for confirmation</small>
                </div>
                <div class="card-icon">
                    <span class="material-symbols-outlined">pending_actions</span>
                </div>
            </div>
        </div>
    </div>


    {{-- Cancelled --}}
    <div class="col-xl-3 col-lg-4 col-md-6">
        <div class="card info-card dashboard-card danger-bg">
            <div class="card-body">
                <div class="card-content">
                    <p class="card-text">Cancelled Booking</p>
                    <h3 class="card-count">{{ number_format($totalCancelled) }}</h3>
                    <small>Cancelled reservations</small>
                </div>
                <div class="card-icon">
                    <span class="material-symbols-outlined">cancel</span>
                </div>
            </div>
        </div>
    </div>


    {{-- Booking Amount --}}
    <div class="col-xl-3 col-lg-4 col-md-6">
        <div class="card info-card dashboard-card purple-bg">
            <div class="card-body">
                <div class="card-content">
                    <p class="card-text">Total Booking Amount</p>
                    <h3 class="card-count">৳ {{ number_format($totalBookingAmount, 2) }}</h3>
                    <small>Total reservation value</small>
                </div>
                <div class="card-icon">
                    <span class="material-symbols-outlined">payments</span>
                </div>
            </div>
        </div>
    </div>


    {{-- Paid --}}
    <div class="col-xl-3 col-lg-4 col-md-6">
        <div class="card info-card dashboard-card success-bg">
            <div class="card-body">
                <div class="card-content">
                    <p class="card-text">Total Paid Amount</p>
                    <h3 class="card-count">৳ {{ number_format($totalPaidAmount, 2) }}</h3>
                    <small>Received payments</small>
                </div>
                <div class="card-icon">
                    <span class="material-symbols-outlined">account_balance_wallet</span>
                </div>
            </div>
        </div>
    </div>


    {{-- Due --}}
    <div class="col-xl-3 col-lg-4 col-md-6">
        <div class="card info-card dashboard-card danger-bg">
            <div class="card-body">
                <div class="card-content">
                    <p class="card-text">Total Due Amount</p>
                    <h3 class="card-count">৳ {{ number_format($totalDueAmount, 2) }}</h3>
                    <small>Pending collection</small>
                </div>
                <div class="card-icon">
                    <span class="material-symbols-outlined">money_off</span>
                </div>
            </div>
        </div>
    </div>


    {{-- Revenue --}}
    <div class="col-xl-3 col-lg-4 col-md-6">
        <div class="card info-card dashboard-card revenue-bg">
            <div class="card-body">
                <div class="card-content">
                    <p class="card-text">Total Revenue</p>
                    <h3 class="card-count">৳ {{ number_format($totalRevenue, 2) }}</h3>
                    <small>Total income</small>
                </div>
                <div class="card-icon">
                    <span class="material-symbols-outlined">trending_up</span>
                </div>
            </div>
        </div>
    </div>


    {{-- Expense --}}
    <div class="col-xl-3 col-lg-4 col-md-6">
        <div class="card info-card dashboard-card expense-bg">
            <div class="card-body">
                <div class="card-content">
                    <p class="card-text">Total Expense</p>
                    <h3 class="card-count">৳ {{ number_format($totalExpense, 2) }}</h3>
                    <small>All operating expenses</small>
                </div>
                <div class="card-icon">
                    <span class="material-symbols-outlined">receipt_long</span>
                </div>
            </div>
        </div>
    </div>


    {{-- Net Profit --}}
    <div class="col-xl-3 col-lg-4 col-md-6">
        <div class="card info-card dashboard-card dark-bg">
            <div class="card-body">
                <div class="card-content">
                    <p class="card-text">Net Profit</p>
                    <h3 class="card-count">৳ {{ number_format($netProfit, 2) }}</h3>
                    <small>Revenue - Expense</small>
                </div>
                <div class="card-icon">
                    <span class="material-symbols-outlined">analytics</span>
                </div>
            </div>
        </div>
    </div>


    {{-- Available Today --}}
    <div class="col-xl-3 col-lg-4 col-md-6">
        <div class="card info-card dashboard-card available-bg">
            <div class="card-body">
                <div class="card-content">
                    <p class="card-text">Available Rooms Today</p>
                    <h3 class="card-count">{{ number_format($availableRooms) }}</h3>
                    <small>Ready for booking</small>
                </div>
                <div class="card-icon">
                    <span class="material-symbols-outlined">hotel</span>
                </div>
            </div>
        </div>
    </div>


    {{-- Occupied Today --}}
    <div class="col-xl-3 col-lg-4 col-md-6">
        <div class="card info-card dashboard-card occupied-bg">
            <div class="card-body">
                <div class="card-content">
                    <p class="card-text">Occupied Rooms Today</p>
                    <h3 class="card-count">{{ number_format($occupiedRooms) }}</h3>
                    <small>Currently occupied</small>
                </div>
                <div class="card-icon">
                    <span class="material-symbols-outlined">meeting_room</span>
                </div>
            </div>
        </div>
    </div>


    {{-- Today Booking --}}
    <div class="col-xl-3 col-lg-4 col-md-6">
        <div class="card info-card dashboard-card info-bg">
            <div class="card-body">
                <div class="card-content">
                    <p class="card-text">Today's Booking</p>
                    <h3 class="card-count">{{ number_format($todayBooking) }}</h3>
                    <small>New bookings today</small>
                </div>
                <div class="card-icon">
                    <span class="material-symbols-outlined">today</span>
                </div>
            </div>
        </div>
    </div>


    {{-- Today Check In --}}
    <div class="col-xl-3 col-lg-4 col-md-6">
        <div class="card info-card dashboard-card checkin-bg">
            <div class="card-body">
                <div class="card-content">
                    <p class="card-text">Today's Check In</p>
                    <h3 class="card-count">{{ number_format($todayCheckIn) }}</h3>
                    <small>Expected arrivals</small>
                </div>
                <div class="card-icon">
                    <span class="material-symbols-outlined">login</span>
                </div>
            </div>
        </div>
    </div>


    {{-- Today Check Out --}}
    <div class="col-xl-3 col-lg-4 col-md-6">
        <div class="card info-card dashboard-card checkout-bg">
            <div class="card-body">
                <div class="card-content">
                    <p class="card-text">Today's Check Out</p>
                    <h3 class="card-count">{{ number_format($todayCheckOut) }}</h3>
                    <small>Expected departures</small>
                </div>
                <div class="card-icon">
                    <span class="material-symbols-outlined">logout</span>
                </div>
            </div>
        </div>
    </div>


    {{-- Total Guests --}}
    <div class="col-xl-3 col-lg-4 col-md-6">
        <div class="card info-card dashboard-card guest-bg">
            <div class="card-body">
                <div class="card-content">
                    <p class="card-text">Total Guests</p>
                    <h3 class="card-count">{{ number_format($totalGuests) }}</h3>
                    <small>Registered customers</small>
                </div>
                <div class="card-icon">
                    <span class="material-symbols-outlined">groups</span>
                </div>
            </div>
        </div>
    </div>

        <div class="col-lg-3 col-sm-6">
            <div class="card info-card dashboard-card info-bg">
                <div class="card-body">
                    <div class="card-content">
                        <p class="card-text">Total Investor</p>
                        <h3 class="card-count">{{ number_format($totalInvestor) }}</h3>
                    </div>
                    <div class="card-icon">
                        <span class="icon"><span class="material-symbols-outlined"> group </span></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6">
            <div class="card info-card dashboard-card info-bg">
                <div class="card-body">
                    <div class="card-content">
                        <p class="card-text">Total Invest</p>
                        <h3 class="card-count">{{ number_format($totalInvest) }}</h3>
                    </div>
                    <div class="card-icon">
                        <span class="material-symbols-outlined"> credit_score </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6">
            <div class="card info-card dashboard-card info-bg">
                <div class="card-body">
                    <div class="card-content">
                        <p class="card-text">Total Withdraw</p>
                        <h3 class="card-count">{{ number_format($totalWithdraw) }}</h3>
                    </div>
                    <div class="card-icon">
                        <span class="material-symbols-outlined"> checkbook </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6">
            <div class="card info-card dashboard-card info-bg">
                <div class="card-body">
                    <div class="card-content">
                        <p class="card-text">Total Due</p>
                        <h3 class="card-count">{{ number_format($totalDue) }}</h3>
                    </div>
                    <div class="card-icon">
                        <span class="material-symbols-outlined"> calendar_clock </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12" style="display:none;">
            <div class="row g-3">
                @foreach($data as $item)
                    <div class="col-md-4 col-sm-6">
                        <ul class="list-group">
                            @php
                                $bg = 'active';
                                if($item['sattled_qty'] == $item['share_qty']){
                                    $bg = 'bg-success';
                                } elseif($item['sattled_qty'] > 0){
                                    $bg = 'bg-dark text-white';
                                } elseif(($item['product']->required_share ?? 0) - ($item['share_qty'] ?? 0) <= 0) {
                                    $bg = 'bg-danger text-white';
                                }
                            @endphp
                            <li class="list-group-item {{ $bg }} text-center">
                                <i class="fas fa-bed"></i>
                                <b>{{ $item['product']->name ?? '' }} </b>
                            </li>
                            <li class="list-group-item d-flex bg-light" title="Room Capacity Qty">
                                <span class="d-inline-block" style="min-width: 135px;">Room Price</span> =&gt;
                                &nbsp;&nbsp;&nbsp;
                                <div class="flex-grow-1 text-end">
                                    {{ $item['price_per_seat'] ?? 0 }}
                                </div>
                            </li>
                            <li class="list-group-item d-flex bg-light" title="Room Capacity Qty">
                                <span class="d-inline-block" style="min-width: 135px;">Room Capacity Qty</span> =&gt;
                                &nbsp;&nbsp;&nbsp;
                                <div class="flex-grow-1 text-end">
                                    {{ $item['production_qty'] ?? 0 }}
                                </div>
                            </li>
                            <li class="list-group-item d-flex bg-light" title="Rooms Sales Qty">
                                <span class="d-inline-block" style="min-width: 135px;">Rooms Sales Qty</span> =&gt;
                                &nbsp;&nbsp;&nbsp;
                                <div class="flex-grow-1 text-end">
                                    {{ $item['sales_qty'] ?? 0 }}
                                </div>
                            </li>
                            <li class="list-group-item d-flex" title="Sales Amount">
                                <span class="d-inline-block" style="min-width: 135px;">Sales Amount</span> =&gt;
                                &nbsp;&nbsp;&nbsp;
                                <div class="flex-grow-1 text-end">
                                    {{ $item['sales_amount'] ?? 0 }}
                                </div>
                            </li>
                            <li class="list-group-item d-flex bg-light" title="Investment Required">                            
                                <span class="d-inline-block" style="min-width: 135px;">Investment Amount</span> =&gt;
                                &nbsp;&nbsp;&nbsp;
                                <div class="flex-grow-1 text-end">
                                    {{ ($item['product']->required_share ?? 0) * ($admin_setting->invest_value ?? 0)  }}
                                </div>
                            </li>
                            <li class="list-group-item d-flex" title="Share Qty">                            
                                <span class="d-inline-block" style="min-width: 135px;">Share Qty</span> =&gt;
                                &nbsp;&nbsp;&nbsp;
                                <div class="flex-grow-1 text-end">
                                    {{ $item['product']->required_share ?? 0 }}
                                </div>
                            </li>
                            <li class="list-group-item bg-light" title="Invested Share">  
                                <a href="{{ request()->fullUrl() }}?product_id={{ $item['product']->id }}&get_investors=true"
                                    class="d-flex investorBtn">                          
                                    <span class="d-inline-block" style="min-width: 135px;">Invested Share</span> =&gt;
                                    &nbsp;&nbsp;&nbsp;
                                    <div class="flex-grow-1 text-end">
                                        {{ $item['share_qty'] ?? 0 }}
                                    </div>
                                </a>
                            </li>
                            <li class="list-group-item d-flex {{ ($item['product']->required_share ?? 0) - ($item['share_qty'] ?? 0) > 0 ? 'text-success' : 'text-danger' }}" title="Available Share">                            
                                <span class="d-inline-block" style="min-width: 135px;">Available Share</span> =&gt;
                                &nbsp;&nbsp;&nbsp;
                                <div class="flex-grow-1 text-end">
                                    {{ ($item['product']->required_share ?? 0) - ($item['share_qty'] ?? 0) }}
                                </div>
                            </li>
                            <li class="list-group-item d-flex bg-light" title="Investor Profit">                            
                                <span class="d-inline-block" style="min-width: 135px;">Investor Profit</span> =&gt;
                                &nbsp;&nbsp;&nbsp;
                                <div class="flex-grow-1 text-end">
                                    {{ $item['investor_profit'] ?? 0 }}
                                </div>
                            </li>
                            <li class="list-group-item d-flex" title="Per Share Profit">
                                <span class="d-inline-block" style="min-width: 135px;">Per Share Profit</span> =&gt;
                                &nbsp;&nbsp;&nbsp;
                                <div class="flex-grow-1 text-end">
                                    {{ $item['per_share_profit'] ?? 0 }}
                                </div>
                            </li>
                        </ul>
                    </div>
                @endforeach
            </div>
        </div>
    </div>

    <div class="modal fade" id="detailsModal" tabindex="-1" aria-labelledby="detailsModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content" id="response">
            </div>
        </div>
    </div>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $(document).on('click', '.investorBtn', function(e) {
                e.preventDefault();
                var url = $(this).attr('href');
                $('#response').html('');

                $.ajax({
                    url: url,
                    type: 'POST',
                    data: {
                        _method: 'GET'
                    },
                    success: function(response) {
                        if (response.status == 'success') {
                            $('#response').html(response.data);
                            $('#detailsModal').modal('show');
                        }
                    }
                });
            });
        });
    </script>
@endpush
