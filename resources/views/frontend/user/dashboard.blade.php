@extends('layouts.frontend.app')

@section('content')

<!--================ Breadcrumb Area =================-->
@include('frontend.user.headerDash')
<!--================ Breadcrumb Area =================-->

<!--================ Dashboard Content =================-->
<div class="container">
    <div class="row section_gap">

        <!-- SIDEBAR -->
        @include('frontend.user.userSideBar')

        <!-- MAIN CONTENT -->
        <div class="col-lg-9">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body">

                    <!-- Welcome Message -->
                    <div class="mb-4 text-center text-lg-start">
                        <h4 class="fw-bold">👋 Welcome, {{ auth()->user()->name }}</h4>
                        <p class="text-muted mb-0">
                            This is your user dashboard. From here you can manage orders, wishlist, profile and settings.
                        </p>
                    </div>

                    <!-- Dashboard Stats -->
                   <div class="row g-4 mt-4">
                    <!-- Bookings -->
                    <div class="col-md-4">
                        <a href="" class="text-decoration-none">
                            <div class="card border-0 shadow-sm rounded-4 text-center h-100" 
                                style="padding: 30px 20px; margin: 20px;">
                                <div class="card-body">
                                    <h5 class="mb-3 fw-semibold text-primary">Self Booked Seats</h5>
                                    <h3 class="fw-bold">{{ number_format($orders_count) ?? 0 }}</h3>
                                </div>
                            </div>
                        </a>
                    </div>

                    <!-- Rooms -->
                    <div class="col-md-4">
                        <a href="" class="text-decoration-none">
                            <div class="card border-0 shadow-sm rounded-4 text-center h-100" 
                                style="padding: 30px 20px; margin: 20px;">
                                <div class="card-body">
                                    <h5 class="mb-3 fw-semibold text-success">Booked Seats</h5>
                                    <h3 class="fw-bold">{{ number_format($sales_count) ?? 0 }}</h3>
                                </div>
                            </div>
                        </a>
                    </div>

                    <!-- Wallet -->
                    <div class="col-md-4">
                        <div class="card border-0 shadow-sm rounded-4 text-center h-100" 
                            style="padding: 30px 20px; margin: 20px;">
                            <div class="card-body">
                                <h5 class="mb-3 fw-semibold text-warning">Purchase</h5>
                                <h3 class="fw-bold">৳{{ $sales_amount ?? 0 }}</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card border-0 shadow-sm rounded-4 text-center h-100" 
                            style="padding: 30px 20px; margin: 20px;">
                            <div class="card-body">
                                <h5 class="mb-3 fw-semibold text-warning">Expense</h5>
                                <h3 class="fw-bold">৳{{ $expense_amount ?? 0 }}</h3>
                            </div>
                        </div>
                    </div>

                     <div class="col-md-4">
                        <div class="card border-0 shadow-sm rounded-4 text-center h-100" 
                            style="padding: 30px 20px; margin: 20px;">
                            <div class="card-body">
                                <h5 class="mb-3 fw-semibold text-warning">Paid</h5>
                                <h3 class="fw-bold">৳{{ $collection_amount ?? 0 }}</h3>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card border-0 shadow-sm rounded-4 text-center h-100" 
                            style="padding: 30px 20px; margin: 20px;">
                            <div class="card-body">
                                <h5 class="mb-3 fw-semibold text-warning">Due</h5>
                                <h3 class="fw-bold">৳{{ $sales_amount+$expense_amount-$collection_amount ?? 0 }}</h3>
                            </div>
                        </div>
                    </div>

                </div>


                </div>
            </div>
        </div>

    </div>
</div>
<!--================ Dashboard Content =================-->

@endsection

@push('styles')
<style>
.hover-shadow:hover {
    transform: translateY(-4px);
    transition: all 0.3s ease;
    box-shadow: 0 12px 25px rgba(0,0,0,0.15) !important;
}
</style>
@endpush
