@extends('layouts.admin.print_app')
@section('content')
    <table class="table table-bordered table-condensed table-striped align-middle">
        <thead>
            <tr>
                <th class="text-right" colspan="6">Previous Balance</th>
                <th class="text-right">{{ number_format($previous_balance, 2) }}</th>
            </tr>
            <tr>
                <th class="text-center" width="40px">Sl#</th>
                <th>Date</th>
                <th>Type</th>
                <th>Description</th>
                <th class="text-right">Amount In</th>
                <th class="text-right">Amount Out</th>
                <th class="text-right">Balance</th>
            </tr>
        </thead>
        <tbody>
            @php
                $balance = $previous_balance;
            @endphp
            @foreach ($statements as $row)
                @php
                    $balance += $row->amount;
                @endphp
                <tr class="text-nowrap">
                    <td class="text-center px-3">{{ $loop->iteration }}</td>
                    <td>{{ date('d-m-Y', strtotime($row->date)) }}</td>
                    <td>{{ $row->type }}</td>
                    <td>{{ $row->description }}</td>
                    <td class="text-right">{{ number_format($row->type == 'credit' ? $row->amount : 0, 2) }}</td>
                    <td class="text-right">{{ number_format($row->type == 'debit' ? abs($row->amount) : 0, 2) }}</td>
                    <td class="text-right">{{ number_format($balance, 2) }}</td>
                </tr>
            @endforeach
        </tbody>
        <tfoot>
            <tr>
                <th class="text-right" colspan="4">Total</th>
                <th class="text-right">{{ number_format($statements->where('type', 'credit')->sum('amount'), 2) }}
                </th>
                <th class="text-right">
                    {{ number_format(abs($statements->where('type', 'debit')->sum('amount')), 2) }}</th>
                <th class="text-right">{{ number_format($balance, 2) }}</th>
            </tr>
        </tfoot>
    </table>
    <div style="padding-top: 10px;">Print Date & Time : {{ date('d-m-Y h:i:s A') }}</div>
@endsection
