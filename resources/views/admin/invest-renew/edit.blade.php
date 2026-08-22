@extends('layouts.admin.edit_app')

@section('content')
    <div class="row g-3">
        <div class="col-md-3 col-sm-6">
            <label for="date" class="form-label"><b>Date <span class="text-danger">*</span></b></label>
            <input type="text" class="form-control date_picker" id="date" name="date"
                value="{{ date('d-m-Y', strtotime($data->date)) }}" placeholder="Renew Date" required>
        </div>
        <div class="col-md-3 col-sm-6">
            <label for="serial_no" class="form-label"><b>Serial No. <span class="text-danger">*</span></b></label>
            <input type="text" class="form-control" id="serial_no" name="serial_no" value="{{ $data->serial_no }}"
                placeholder="Serial No." readonly required>
        </div>
        <div class="col-md-3 col-sm-6">
            <label for="month" class="form-label"><b>Month <span class="text-danger">*</span></b></label>
            <input type="text" class="form-control" id="month" name="month" placeholder="Month"
                value="{{ $data->month }}" readonly>
        </div>
        <div class="col-md-3 col-sm-6">
            <label for="year" class="form-label"><b>Year <span class="text-danger">*</span></b></label>
            <input type="text" class="form-control" id="year" name="year" placeholder="Year"
                value="{{ $data->year }}" readonly>
        </div>
        <div class="col-12">
            <div class="table-responsive">
                <table class="table">
                    <thead class="bg-primary text-white">
                        <tr>
                            <th class="text-center" width="30">SL#</th>
                            <th>Investor</th>
                            <th>Phone</th>
                            <th class="text-center" width="150">Qty</th>
                            <th class="text-center" width="150">Amount</th>
                            <th class="text-center px-3" width="50">
                                <div class="custom-control custom-checkbox mx-auto">
                                    <input type="checkbox" class="custom-control-input" id="checkAll"
                                        {{ count($additionalData['invests']) == 0 ? 'checked' : '' }}>
                                    <label for="checkAll" class="custom-control-label"></label>
                                </div>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        {{-- 
                        @foreach ($data->list as $row)
                            <tr>
                                <td class="text-center" width="30">{{ $loop->iteration }}</td>
                                <td>{{ $row->investor->name }}</td>
                                <td class="text-center">
                                    <input type="number" class="form-control py-1 mx-auto text-center"
                                        style="min-height: auto; width: 150px;" id="qty_{{ $row->invest_id }}"
                                        name="qty[{{ $row->invest_id }}]" placeholder="Quantity"
                                        value="{{ $row->qty }}" readonly>
                                </td>
                                <td class="text-center">
                                    <input type="text" class="form-control py-1 mx-auto text-center"
                                        style="min-height: auto; width: 150px;" id="amount_{{ $row->invest_id }}"
                                        name="amount[{{ $row->invest_id }}]" placeholder="Amount"
                                        value="{{ $row->amount }}" readonly>
                                </td>
                                <td class="text-center">
                                    <div class="custom-control custom-checkbox mx-auto">
                                        <input type="checkbox" class="custom-control-input checkbox invest_id"
                                            id="check_{{ $row->invest_id }}" name="invest_id[]"
                                            value="{{ $row->invest_id }}" checked>
                                        <label for="check_{{ $row->invest_id }}" class="custom-control-label"></label>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                        --}}
                        @foreach ($additionalData['invests'] as $row)
                            <tr>
                                <td class="text-center" width="30">{{ $loop->iteration }}</td>
                                <td>{{ $row->investor->name }}</td>
                                <td>{{ $row->investor->Phone }}</td>
                                <td class="text-center">
                                    <input type="number" class="form-control py-1 mx-auto text-center"
                                        style="min-height: auto; width: 150px;" id="qty_{{ $row->id }}"
                                        name="qty[{{ $row->id }}]" placeholder="Quantity"
                                        value="{{ $row->qty }}" readonly>
                                </td>
                                <td class="text-center">
                                    <input type="text" class="form-control py-1 mx-auto text-center"
                                        style="min-height: auto; width: 150px;" id="amount_{{ $row->id }}"
                                        name="amount[{{ $row->id }}]" placeholder="Amount"
                                        value="{{ $row->amount }}" readonly>
                                </td>
                                <td class="text-center">
                                    <div class="custom-control custom-checkbox mx-auto">
                                        <input type="checkbox" class="custom-control-input checkbox invest_id"
                                            id="check_{{ $row->id }}" name="invest_id[]"
                                            value="{{ $row->id }}" {{ in_array($row->id, $data->list->pluck('invest_id')->toArray()) ? 'checked' : '' }}>
                                        <label for="check_{{ $row->id }}" class="custom-control-label"></label>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                    <tfoot class="bg-primary text-white">
                        <tr>
                            <th class="text-end" colspan="3">Total</th>
                            <th class="text-center">
                                <input type="text" class="form-control py-1 mx-auto text-center"
                                    style="min-height: auto; width: 150px;" id="total_qty"
                                    value="{{ $data->list->sum('qty') }}" placeholder="Total Qty" readonly>
                            </th>
                            <th class="text-center">
                                <input type="text" class="form-control py-1 mx-auto text-center"
                                    style="min-height: auto; width: 150px;" id="total_amount"
                                    value="{{ $data->list->sum('amount') }}" placeholder="Total Amount" readonly>
                            </th>
                            <th></th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $(document).on('change', '.checkbox', function(e) {
                if ($('.checkbox:checked').length == $('.checkbox').length) {
                    $('#checkAll').prop('checked', true);
                } else {
                    $('#checkAll').prop('checked', false);
                }
                calc();
            });

            $(document).on('change', '#checkAll', function(e) {
                if ($(this).is(':checked')) {
                    $('.checkbox').prop('checked', true);
                } else {
                    $('.checkbox').prop('checked', false);
                }
                calc();
            });

            function calc() {
                var total_qty = 0;
                var total_amount = 0;
                $('.invest_id:checked').each(function(index, value) {
                    var invest_id = $(this).val();
                    var qty = +$('#qty_' + invest_id).val();
                    var amount = +$('#amount_' + invest_id).val();
                    total_qty += qty;
                    total_amount += amount;
                });
                $('#total_qty').val(total_qty);
                $('#total_amount').val(total_amount);
            }
        });
    </script>
@endpush
