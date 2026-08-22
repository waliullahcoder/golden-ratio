<div class="row g-3">
    <div class="col-md-3 col-sm-6">
        <label for="profit_amount" class="form-label"><b>Gross Profit</b></label>
        <input type="text" class="form-control" id="profit_amount" name="profit_amount"
            value="{{ $detailData['profit_amount'] ?? 0 }}" readonly>
    </div>
    <div class="col-md-3 col-sm-6">
        <label for="expense_amount" class="form-label"><b>Expense</b></label>
        <input type="text" class="form-control" id="expense_amount" name="expense_amount"
            value="{{ $detailData['expense_amount'] ?? 0 }}" readonly>
    </div>
    <div class="col-md-3 col-sm-6">
        <label for="net_profit" class="form-label"><b>Net Profit</b></label>
        <input type="text" class="form-control" id="net_profit" name="net_profit"
            value="{{ $detailData['net_profit'] ?? 0 }}" readonly>
    </div>
    <div class="col-md-3 col-sm-6">
        <label for="public_invest_qty" class="form-label"><b>Total Invest Qty</b></label>
        <input type="text" class="form-control" id="public_invest_qty" name="public_invest_qty"
            value="{{ $detailData['public_qty'] ?? 0 }}" readonly>
    </div>
    <input type="hidden" name="public_invest_profit" value="{{ $detailData['investor_profit'] }}">
    <input type="hidden" name="private_invest_profit"
        value="{{ $detailData['per_share_profit'] * $detailData['private_qty'] }}">
    <div class="col-12">
        <div class="table-responsive">
            <table class="table table-striped text-nowrap mb-0">
                <thead>
                    <tr class="bg-primary text-white">
                        <th class="text-center" width="30">SL#</th>
                        <th>Investor</th>
                        <th class="text-end" width="150">Invest Amount</th>
                        <th class="text-end" width="150">Invest Qty</th>
                        <th class="text-end" width="150">Profit Amount</th>
                    </tr>
                </thead>
                <tbody>
                    @if (!empty($detailData['public_invests']))
                        @foreach ($detailData['public_invests'] as $item)
                            <tr class="bg-light">
                                <input type="hidden" name="public_invest_id[]" value="{{ $item->invest_id }}">
                                <td class="text-center">{{ $loop->iteration }}</td>
                                <td>{{ $item->investor->name ?? '' }}</td>
                                <td class="px-1"><input type="number" class="form-control input-sm text-end" step="any"
                                        value="{{ $item->amount }}" readonly></td>
                                <td class="px-1"><input type="number" class="form-control input-sm text-end" step="any"
                                        value="{{ $item->qty }}" readonly></td>
                                <td class="px-1"><input type="number" class="form-control input-sm text-end" step="any"
                                        value="{{ round($detailData['per_share_profit'] * $item->qty, 2) }}" readonly>
                                </td>
                            </tr>
                        @endforeach
                    @endif
                    @if (!empty($detailData['private_invests']))
                        @foreach ($detailData['private_invests'] as $item)
                            <tr class="bg-warning">
                                <input type="hidden" name="private_invest_id[]" value="{{ $item->invest_id }}">
                                <td class="text-center">{{ $loop->iteration }}</td>
                                <td>{{ $item->investor->name ?? '' }}</td>
                                <td class="px-1"><input type="number" class="form-control input-sm text-end" step="any"
                                        value="{{ $item->amount }}" readonly></td>
                                <td class="px-1"><input type="number" class="form-control input-sm text-end" step="any"
                                        value="{{ $item->qty }}" readonly></td>
                                <td class="px-1"><input type="number" class="form-control input-sm text-end" step="any"
                                        value="{{ round($detailData['per_share_profit'] * $item->qty, 2) }}" readonly>
                                </td>
                            </tr>
                        @endforeach
                    @endif
                </tbody>
            </table>
        </div>
    </div>
</div>
