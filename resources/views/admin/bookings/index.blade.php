@extends('layouts.admin.index_app')

@section('content')
{{-- ALERT --}}
@if(session('success'))
<div class="alert alert-success alert-dismissible fade show">
    {{ session('success') }}
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
</div>
@endif
<div class="card shadow-sm">
    <div class="card-body table-responsive">
        <table class="dataTable table table-bordered align-middle" style="width:100%">
            <thead>
                <tr class="text-nowrap">
                    <th>SL#</th>
                    <th>BookID</th>
                    <th>Room</th>
                    <th>User</th>
                    <th>Booked</th>
                    <th>Available</th>
                    <th>Capacity</th>
                    <th>Check In</th>
                    {{-- <th>Check Out</th> --}}
                    <th>Total</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
</div>

{{-- Status Modal --}}
<div class="modal fade" id="statusModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="POST" id="statusForm">
                @csrf
                @method('PUT')
                <div class="modal-header">
                    <h5 class="modal-title">Change Reservation</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label fw-bold">Status</label>
                        <select name="status" id="booking_status" class="form-select" required>
                            <option value="pending">Pending</option>
                            <option value="confirmed">Confirmed</option>
                            <option value="checked_in">Checked In</option>
                            <option value="checked_out">Checked Out</option>
                            <option value="cancelled">Cancelled</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-success">Update</button>
                </div>
            </form>
        </div>
    </div>
</div>

{{-- View Modal --}}
<div class="modal fade" id="viewBookingModal">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title">Booking Details</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <table class="table table-bordered">
                    <tr><th>Room</th><td id="v_room"></td></tr>
                    <tr><th>User</th><td id="v_user"></td></tr>
                    <tr><th>Booked</th><td id="v_guests"></td></tr>
                    <tr><th>Available</th><td id="v_available"></td></tr>
                    <tr><th>Capacity</th><td id="v_capacity"></td></tr>
                    <tr><th>Check In</th><td id="v_checkin"></td></tr>
                    <tr><th>Check Out</th><td id="v_checkout"></td></tr>
                    <tr><th>Total Price</th><td id="v_price"></td></tr>
                    <tr><th>Status</th><td id="v_status"></td></tr>
                </table>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
@endsection

@push('js')
<script type="text/javascript">
$(document).ready(function() {
    var table = $('.dataTable').DataTable({
        processing: true,
        serverSide: true,
        responsive: true,
        ajax: "{{ route('admin.bookings.index') }}",
        columns: [
            { data: 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false, className: "text-center" },
            { data: 'room_id', name: 'room.id' },
            { data: 'room_name', name: 'room.name' },
            { data: 'user_name', name: 'user.name' },
            { data: 'guests', name: 'guests', className: "text-center" },
            { data: 'available', name: 'room.available', className: "text-center" },
            { data: 'capacity', name: 'room.capacity', className: "text-center" },
            { data: 'check_in', name: 'check_in' },
            // { data: 'check_out', name: 'check_out' },
            { data: 'total_price', name: 'total_price', render: $.fn.dataTable.render.number(',', '.', 0, '৳ ') },
            { data: 'status_badge', name: 'status', orderable: false, searchable: false },
            { data: 'action', name: 'action', orderable: false, searchable: false, className: "text-end" },
        ]
    });

    // ===== EDIT STATUS =====
    $(document).on('click', '.editBookingBtn', function(){
        let id = $(this).data('id');
        let status = $(this).data('status');
        $('#booking_status').val(status);
        $('#statusForm').attr('action','/admin/bookings/'+id);
        $('#statusModal').modal('show');
    });

    // ===== VIEW BOOKING =====
    $(document).on('click', '.viewBookingBtn', function(){
        $('#v_room').text($(this).data('room'));
        $('#v_user').text($(this).data('user'));
        $('#v_guests').text($(this).data('guests'));
        $('#v_available').text($(this).data('available'));
        $('#v_capacity').text($(this).data('capacity'));
        $('#v_checkin').text($(this).data('checkin'));
        $('#v_checkout').text($(this).data('checkout'));
        $('#v_price').text('৳ '+$(this).data('total'));
        $('#v_status').text($(this).data('status'));
        $('#viewBookingModal').modal('show');
    });
});
</script>
@endpush
