@extends('layouts.admin.print_app')
@section('content')
    <table class="table mb-3 info-table" style="border-bottom: 1px solid #ddd;">
        <tr>
            <th width="60">Invoice No</th>
            <td><b> : </b> {{ $data->invoice }}</td>
            <th class="text-right" width="70">Date : </th>
            <td class="text-left text-nowrap" width="60">{{ date('d-m-Y', strtotime($data->date)) }}</td>
        </tr>
        <tr>
            <th width="60">Sales Type</th>
            <td><b> : </b> {{ $data->sale_type }}</td>
            <th class="text-right" width="70">Store : </th>
            <td class="text-left text-nowrap" width="60">{{ $data->store->name ?? '' }}</td>
        </tr>
        <tr>
            <th width="60">Client Name</th>
            <td><b> : </b> {{ $data->client->name ?? '' }}</td>
            <th class="text-right" width="70">Remarks : </th>
            <td class="text-left text-nowrap" width="60">{{ $data->remarks }}</td>
        </tr>
    </table>
    <table class="table table-bordered table-condensed table-striped align-middle mb-3">
        <thead>
            <tr>
                <th class="text-center" width="20">SL#</th>
                <th>Book</th>
                <th>Edition</th>
                <th class="text-right">Price</th>
                <th class="text-right">Commission %</th>
                <th class="text-right">Net Price</th>
                <th class="text-right">Quantity</th>
                <th class="text-right">Amount</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($data->list as $row)
                <tr>
                    <td class="text-center">{{ $loop->iteration }}</td>
                    <td class="text-nowrap">{{ $row->product->name ?? '' }}</td>
                    <td class="text-nowrap">{{ $row->edition->name ?? '' }}</td>
                    <td class="text-right">{{ $row->price }}</td>
                    <td class="text-right">{{ $row->commission }}</td>
                    <td class="text-right">{{ $row->rate }}</td>
                    <td class="text-right">{{ $row->qty }}</td>
                    <td class="text-right">{{ $row->amount }}</td>
                </tr>
            @endforeach
        </tbody>
        <tfoot>
            <tr>
                <td class="text-right" colspan="7"><b>Total</b></td>
                <td class="text-right" colspan="1"><b>{{ number_format($data->amount, 2) }}</b></td>
            </tr>
            <tr>
                <td class="text-right" colspan="7"><b>Discount</b></td>
                <td class="text-right" colspan="1"><b>{{ number_format($data->discount, 2) }}</b></td>
            </tr>
            <tr>
                <td class="text-right" colspan="7"><b>Net Amount</b></td>
                <td class="text-right" colspan="1"><b>{{ number_format($data->net_amount, 2) }}</b></td>
            </tr>
        </tfoot>
    </table>
    <div class="mb-3 font">
        <b>In words : </b> {{ \App\HelperClass::convertNumber($data->net_amount) }} taka.
    </div>
    <div>
        <div class="signature-area">
            <div class="signature-item">
                <span>Receive By</span>
            </div>
            <div class="signature-item">
                <i class="staff">{{ @$data->user->name }}</i>
                <span>Prepare By</span>
            </div>
        </div>
    </div>
    <div style="padding-top: 50px;">Print Date & Time : {{ date('d-m-Y h:i:s A') }}</div>
@endsection
