@extends('layouts.admin.index_app')

@section('content')
    <table class="dataTable table align-middle" style="width:100%">
        <thead>
            <tr class="text-nowrap">
                <th>SL#</th>
                <th>Voucher No</th>
                <th>Date</th>
                <th>Voucher Type</th>
                <th>Debit Head</th>
                <th>Credit Head</th>
                <th>Amount</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            var table = $('.dataTable').dataTable({
                processing: true,
                serverSide: true,
                responsive: true,
                ajax: {
                    url: "{{ request()->fullUrl() }}",
                    type: "GET"
                },
                columns: [{
                        data: "DT_RowIndex",
                        name: "DT_RowIndex",
                        className: "text-center",
                        orderable: false,
                        searchable: false,
                        width: '20'
                    },
                    {
                        data: 'voucher_no',
                        name: 'voucher_no',
                    },
                    {
                        data: 'formattedDate',
                        name: 'formattedDate',
                        orderable: false,
                        searchable: false,
                    },
                    {
                        data: 'voucher_type',
                        name: 'voucher_type',
                    },
                    {
                        data: 'debit_head',
                        name: 'debit_head',
                        orderable: false,
                        searchable: false,
                    },
                    {
                        data: 'credit_head',
                        name: 'credit_head',
                        orderable: false,
                        searchable: false,
                    },
                    {
                        data: 'amount',
                        name: 'amount',
                        orderable: false,
                        searchable: false,
                    },
                    {
                        data: 'actions',
                        name: 'actions',
                        orderable: false,
                        searchable: false,
                        className: "text-end",
                        width: '100'
                    },
                ],
                "fnDrawCallback": function(oSettings) {
                    const tooltips = document.querySelectorAll('.tt');
                    tooltips.forEach(t => {
                        new bootstrap.Tooltip(t);
                    });
                }
            });

            $(document).on('click', '.refuse-btn', function(e) {
                e.preventDefault();
                Swal.fire({
                    width: "25rem",
                    title: "Are you sure?",
                    text: "You won't be able to revert this!",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#3085d6",
                    cancelButtonColor: "#d33",
                    confirmButtonText: "Yes, Refuse it!",
                }).then((result) => {
                    if (result.value) {
                        let url = $(this).attr('href');
                        $.ajax({
                            url: url,
                            type: 'POST',
                            data: {
                                _method: 'GET'
                            },
                            success: function(response) {
                                if (response.status == 'success') {
                                    Swal.fire({
                                        width: "22rem",
                                        toast: true,
                                        position: 'top-right',
                                        text: 'Refused Successfully',
                                        icon: "success",
                                        showConfirmButton: false,
                                        timer: 1500,
                                        showClass: {
                                            popup: `animate__animated  animate__bounceInRight  animate__faster`
                                        },
                                        hideClass: {
                                            popup: `animate__animated animate__bounceOutRight animate__faster`
                                        }
                                    });
                                    $('.dataTable').DataTable().ajax.reload();
                                }
                                if (response.status == 'error') {
                                    Swal.fire({
                                        width: "22rem",
                                        toast: true,
                                        position: 'top-right',
                                        text: response.message ??
                                            "You don't have any Authority to do this action",
                                        icon: "error",
                                        showConfirmButton: false,
                                        timer: 1500,
                                        showClass: {
                                            popup: `animate__animated  animate__bounceInRight  animate__faster`
                                        },
                                        hideClass: {
                                            popup: `animate__animated animate__bounceOutRight animate__faster`
                                        }
                                    });
                                }
                            }
                        });
                    }
                });
            })
        });
    </script>
@endpush
