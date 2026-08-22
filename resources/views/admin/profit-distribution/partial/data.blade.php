<div class="row g-3">

    {{-- Hidden Inputs for Store --}}
    <input type="hidden" name="sales_qty" value="{{ $detailData['sales_qty'] }}">
    <input type="hidden" name="sales_amount" value="{{ $detailData['sales_amount'] }}">
    <input type="hidden" name="invest_qty" value="{{ $detailData['invest_qty'] }}">
    <input type="hidden" name="invest_amount" value="{{ $detailData['invest_amount'] }}">
    <input type="hidden" name="profit_amount" value="{{ $detailData['profit_amount'] }}">
    <input type="hidden" name="production_qty" value="{{ $detailData['production_qty'] }}">

    <div class="col-md-3">
        <label class="form-label"><b>Total Sales</b></label>
        <input type="text" class="form-control"
            value="{{ $detailData['sales_qty'] }}" readonly>
    </div>

    <div class="col-md-3">
        <label class="form-label"><b>Total Profit</b></label>
        <input type="text" class="form-control"
            value="{{ $detailData['profit_amount'] }}" readonly>
    </div>

    <div class="col-md-3">
        <label class="form-label"><b>Total Invest Qty</b></label>
        <input type="text" class="form-control"
            value="{{ $detailData['invest_qty'] }}" readonly>
    </div>

    <div class="col-md-3">
        <label class="form-label"><b>Total Invest Amount</b></label>
        <input type="text" class="form-control"
            value="{{ $detailData['invest_amount'] }}" readonly>
    </div>

    <div class="col-12">
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead class="bg-primary text-white">
                    <tr>
                        <th>SL</th>
                        <th>Investor</th>
                        <th>Room</th>
                        <th class="text-end">Invest Amount</th>
                        <th class="text-end">Share Qty</th>
                        <th class="text-end">Individual Profit</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($detailData['invests'] as $item)
                        <tr>

                            {{-- VERY IMPORTANT --}}
                            <input type="hidden" name="invest_id[]" value="{{ $item->id }}">

                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $item->investor->name }}</td>
                            <td>{{ $item->product->name }}</td>
                            <td class="text-end">{{ $item->amount }}</td>
                            <td class="text-end">{{ $item->qty }}</td>
                            <td class="text-end">
                                {{ $detailData['per_share_profit'] * $item->qty }}
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>

</div>
