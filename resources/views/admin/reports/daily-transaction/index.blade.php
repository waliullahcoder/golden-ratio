@extends('layouts.admin.report_app')

@section('content')
    <table class="dataTable table table-bordered w-100">
        <thead>
            <tr>
                <th class="text-center" width="40px">Sl#</th>
                <th>Date</th>
                <th>Narration</th>
                <th class="text-end">Invoice Amount</th>
                <th class="text-end">Spare Part Expense</th>
                <th class="text-end">Service Income</th>
                <th class="text-end">Service Expense</th>
                <th class="text-end">Service Profit</th>
                <th class="text-end">Operational Expense</th>
            </tr>
        </thead>
        <tbody>
            @php
                $invoice_amount = 0;
                $spare_part_expense = 0;
                $service_income = 0;
                $service_expense = 0;
                $service_profit = 0;
                $operational_expense = 0;
            @endphp
            @foreach ($statements as $row)
                <tr class="text-nowrap">
                    <td class="text-center px-3">{{ $loop->iteration }}</td>
                    <td>{{ date('d-m-Y', strtotime($row['date'])) }}</td>
                    <td>{{ $row['narration'] }}</td>
                    <td class="text-end">{{ number_format($row['invoice_amount'], 2) }}</td>
                    <td class="text-end">{{ number_format($row['spare_part_expense'], 2) }}</td>
                    <td class="text-end">{{ number_format($row['service_income'], 2) }}</td>
                    <td class="text-end">{{ number_format($row['service_expense'], 2) }}</td>
                    <td class="text-end">{{ number_format($row['service_profit'], 2) }}</td>
                    <td class="text-end">{{ number_format($row['operational_expense'], 2) }}</td>
                </tr>

                @php
                    $invoice_amount += $row['invoice_amount'];
                    $spare_part_expense += $row['spare_part_expense'];
                    $service_income += $row['service_income'];
                    $service_expense += $row['service_expense'];
                    $service_profit += $row['service_profit'];
                    $operational_expense += $row['operational_expense'];
                @endphp
            @endforeach
        </tbody>
        <tfoot>
            <tr class="bg-primary">
                <th class="text-end text-white" colspan="3">Total</th>
                <th class="text-end text-white">{{ number_format($invoice_amount, 2) }}</th>
                <th class="text-end text-white">{{ number_format($spare_part_expense, 2) }}</th>
                <th class="text-end text-white">{{ number_format($service_income, 2) }}</th>
                <th class="text-end text-white">{{ number_format($service_expense, 2) }}</th>
                <th class="text-end text-white">{{ number_format($service_profit, 2) }}</th>
                <th class="text-end text-white">{{ number_format($operational_expense, 2) }}</th>
            </tr>
        </tfoot>
    </table>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $('.dataTable').DataTable({
                order: false,
                responsive: true,
                dom: "<'row g-2'<'col-sm-4'l><'col-sm-8 text-end'<'d-lg-flex justify-content-end'<'mb-2 mb-lg-0 me-1'f>B>>>t<'d-lg-flex align-items-center mt-2'<'me-auto mb-lg-0 mb-2'i><'mb-0'p>>",
                lengthMenu: [10, 20, 30, 40, 50],
                buttons: []
                //buttons: [{
                //        extend: 'excel',
                //        text: '<i class="fal fa-file-spreadsheet"></i> Excel'
                //    },
                //    {
                //        text: '<i class="fal fa-file-pdf"></i> Print',
                //        className: 'getPdf',
                //    }
                //]
            });

            $(document).on('click', '#filter_btn', function(e) {
                $('input[name="print"]').val('');
                $('.filter_form')[0].setAttribute("target", "_self");
            });
        });
    </script>
@endpush
