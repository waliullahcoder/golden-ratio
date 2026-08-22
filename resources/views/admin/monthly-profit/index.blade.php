@extends('layouts.admin.index_app')

@section('content')
    @php
        $currentRouteName = \Request::route()->getName();
        $ajaxUrl = route($currentRouteName);
        $deletePermission = str_replace('index', 'destroy', $currentRouteName);
        $deleteUrl = route($deletePermission, 0);
    @endphp
    <table class="dataTable table align-middle" style="width:100%">
        <thead>
            <tr class="text-nowrap">
                <th></th>
                <th>Date</th>
                <th>Serial No</th>
                <th>Year</th>
                <th>Month</th>
                <th>Invest Qty</th>
                <th>Invest Amount</th>
                <th>Profit Amount</th>
                <th>Investor Profit</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody></tbody>
    </table>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            var table = $('.dataTable').DataTable({
                processing: true,
                serverSide: true,
                responsive: true,
                ajax: {
                    url: "{{ $ajaxUrl }}",
                    type: "GET",
                    data: function(data) {
                        data.type = $('#filter').val();
                    },
                },
                columns: [{
                        data: "checkbox",
                        name: "checkbox",
                        orderable: false,
                        searchable: false,
                        className: "text-center",
                        width: '20'
                    },
                    {
                        data: 'formattedDate',
                        name: 'formattedDate',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'serial_no',
                        name: 'serial_no'
                    },
                    {
                        data: 'year',
                        name: 'year',
                    },
                    {
                        data: 'month',
                        name: 'month',
                    },
                    {
                        data: 'publicInvestQty',
                        name: 'publicInvestQty',
                        orderable: false,
                        searchable: false,
                        className: "text-end",
                    },
                    {
                        data: 'publicInvestAmount',
                        name: 'publicInvestAmount',
                        orderable: false,
                        searchable: false,
                        className: "text-end"
                    },
                    {
                        data: 'profit_amount',
                        name: 'profit_amount',
                        className: "text-end"
                    },
                    {
                        data: 'public_invest_profit',
                        name: 'public_invest_profit',
                        className: "text-end"
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
                fnDrawCallback: function() {
                    const tooltips = document.querySelectorAll('.tt');
                    tooltips.forEach(t => {
                        new bootstrap.Tooltip(t);
                    });
                }
            });
        });
    </script>
@endpush
