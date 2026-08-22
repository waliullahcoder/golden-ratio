<div class="col-lg-3">
    <div class="card shadow-sm rounded-4">
        <div class="card-body p-0">

            <ul class="list-group list-group-flush profile-menu">

                <li class="list-group-item px-3 py-2 rounded-top">
                    <a href="{{ route('frontend.user.dashboard') }}" class="d-flex align-items-center gap-2 text-dark text-decoration-none">
                        <i class="fa fa-tachometer-alt"></i>
                        <span> Dashboard</span>
                    </a>
                </li>

                <li class="list-group-item px-3 py-2">
                    <a href="{{ route('user.profile.edit') }}" class="d-flex align-items-center gap-2 text-dark text-decoration-none">
                        <i class="fa fa-user-edit"></i> 
                        <span> Profile Update</span>
                    </a>
                </li>

                <li class="list-group-item px-3 py-2">
                    <a href="{{ route('frontend.user.booking') }}" class="d-flex align-items-center gap-2 text-dark text-decoration-none">
                        <i class="fa fa-box"></i>
                        <span> My Booking</span>
                    </a>
                </li>


               <li class="list-group-item px-3 py-2">
                    <a href="{{ route('frontend.user.wallet') }}" class="d-flex align-items-center gap-2 text-dark text-decoration-none">
                        <i class="fa fa-credit-card"></i>
                        <span>Wallet History</span>
                    </a>
                </li>
                 <li class="list-group-item px-3 py-2">
                    <form action="{{ route('logout') }}" method="POST">
                        @csrf
                         <button type="submit" value="submit" class="btn theme_btn button_hover"><i class="fa fa-sign-out-alt btn-danger"></i> Logout</button>
                    </form>
                </li>


            </ul>

        </div>
    </div>
</div>

@push('styles')
<style>
/* Sidebar Styling */
.profile-menu .list-group-item {
    transition: all 0.2s ease-in-out;
    cursor: pointer;
}

.profile-menu .list-group-item:hover {
    background-color: #f8f9fa;
}

.profile-menu .list-group-item a {
    font-weight: 500;
}

.profile-menu .list-group-item i {
    min-width: 20px;
    text-align: center;
}

.profile-menu .list-group-item button {
    font-weight: 500;
    padding: 0.5rem 0;
    text-align: left;
}

</style>
@endpush
