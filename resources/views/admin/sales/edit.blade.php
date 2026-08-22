@extends('layouts.admin.edit_app')

@section('content')
<div class="row g-3">

    {{-- Sale Type --}}
    <div class="{{ old('sale_type', $data->sale_type) == 'Cash' ? 'col-md-2' : 'col-md-3' }} col-sm-6" id="sale_type_area">
        <label class="form-label"><b>Sale Type *</b></label>
        <select name="sale_type" id="sale_type" class="form-select select" required>
            <option value="Credit" {{ old('sale_type', $data->sale_type)=='Credit'?'selected':'' }}>Credit</option>
            <option value="Cash" {{ old('sale_type', $data->sale_type)=='Cash'?'selected':'' }}>Cash</option>
        </select>
    </div>

    {{-- Cash Account --}}
    <div class="col-md-2 col-sm-6" id="accounts_area" style="display: {{ old('sale_type', $data->sale_type)=='Cash'?'block':'none' }}">
        <label class="form-label"><b>Cash Account *</b></label>
        <select name="coa_id" id="coa_id" class="form-select select" {{ old('sale_type', $data->sale_type)=='Cash'?'required':'' }}>
            <option value="">Select Cash Account</option>
            @foreach ($additionalData['cash_heads'] as $item)
                <option value="{{ $item->id }}" {{ old('coa_id', $data->coa_id)==$item->id?'selected':'' }}>
                    {{ $item->head_name }} - {{ $item->head_code }}
                </option>
            @endforeach
        </select>
    </div>

    {{-- Invoice --}}
    <div class="col-md-3 col-sm-6">
        <label class="form-label"><b>Invoice No *</b></label>
        <input type="text" class="form-control" name="invoice" value="{{ $data->invoice }}" readonly required>
    </div>

    {{-- Date --}}
    <div class="col-md-3 col-sm-6">
        <label class="form-label"><b>Date *</b></label>
        <input type="text" class="form-control date_picker" name="date" value="{{ date('d-m-Y', strtotime($data->date)) }}" required>
    </div>

    {{-- Store --}}
    <div class="col-md-3 col-sm-6">
        <label class="form-label"><b>Store *</b></label>
        <select name="store_id" id="store_id" class="form-select select" required>
            @foreach ($additionalData['stores'] as $item)
                <option value="{{ $item->id }}" {{ $data->store_id==$item->id?'selected':'' }}>{{ $item->name }}</option>
            @endforeach
        </select>
    </div>

    {{-- Client --}}
   <select name="client_id" id="client_id" class="form-select" required disabled>
    <option value=""></option>
    @foreach ($additionalData['clients'] as $item)
        <option value="{{ $item->id }}" {{ $data->client_id==$item->id?'selected':'' }}>
            {{ $item->name }}
        </option>
    @endforeach
</select>
<input type="hidden" name="client_id" value="{{ $data->client_id }}">

   

    {{-- Table --}}
    <div class="col-12">
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead class="bg-primary text-white">
                    <tr>
                        <th>SL</th>
                        <th>Room</th>
                        <th>Price</th>
                        <th>Commission %</th>
                        <th>Net Price</th>
                        <th>Qty</th>
                        <th>Amount</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody id="tbody">
                    @foreach ($data->list as $item)
                        <tr id="product_{{ $item->product_id }}">
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $item->product->name }}</td>
                            <td><input type="number" name="price[{{ $item->product_id }}]" class="form-control text-end" value="{{ $item->price }}" readonly></td>
                            <td><input type="number" name="commission[{{ $item->product_id }}]" class="form-control text-end" value="{{ $item->commission }}"></td>
                            <td><input type="number" name="rate[{{ $item->product_id }}]" class="form-control text-end" value="{{ $item->rate }}" readonly></td>
                            <td><input type="number" name="qty[{{ $item->product_id }}]" class="form-control text-end" value="{{ $item->qty }}"></td>
                            <td><input type="number" name="amount[{{ $item->product_id }}]" class="form-control text-end" value="{{ $item->amount }}" readonly></td>
                            <td>
                                <input type="hidden" class="product_id" name="product_id[]" value="{{ $item->product_id }}">
                                <button type="button" class="btn btn-sm btn-danger remove">X</button>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="5"></td>
                        <td><b>Total</b></td>
                        <td><input type="number" id="total_amount" name="total_amount" class="form-control text-end" readonly value="{{ $data->amount }}"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="5"></td>
                        <td><b>Discount</b></td>
                        <td><input type="number" id="discount" name="discount" class="form-control text-end" value="{{ $data->discount }}"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="5"></td>
                        <td><b>Net</b></td>
                        <td><input type="number" id="net_amount" name="net_amount" class="form-control text-end" readonly value="{{ $data->net_amount }}"></td>
                        <td></td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>

</div>
@endsection

@push('js')
<script>
$(function(){

    $('.select').select2({ theme:'bootstrap-5', width:'100%' });

    // Sale type toggle
    $('#sale_type').change(function(){
        if($(this).val()=='Cash'){
            $('#accounts_area').show();
            $('#coa_id').prop('required',true);
        } else {
            $('#accounts_area').hide();
            $('#coa_id').prop('required',false);
        }
    });

    // Update stock on product select via AJAX
    $('#product_id, #store_id').change(function(){
        var product_id = $('#product_id').val();
        var store_id = $('#store_id').val();
        if(!product_id || !store_id) return;

        $.ajax({
            url: '{{ request()->fullUrl() }}',
            type: 'POST',
            data: {
                _method:'GET',
                product_id: product_id,
                store_id: store_id,
                _token: '{{ csrf_token() }}'
            },
            success: function(res){
                if(res.status=='success'){
                    $('#stock').val(res.stock);
                    $('#quantity').val(res.stock>0?1:0);
                }
            }
        });
    });

    // Add product
    $('#add_item').click(function(){
        var product_id = $('#product_id').val();
        var product_name = $('#product_id option:selected').text();
        var price = +$('#product_id option:selected').data('price');
        var commission = +$('#product_id option:selected').data('commission');
        var qty = +$('#quantity').val();
        var stock = +$('#stock').val();
        var sl = $('#tbody tr').length + 1;

        if(!product_id){ alert('Select a room'); return; }
        if(qty<=0 || qty>stock){ alert('Stock not available'); return; }
        if($('#product_'+product_id).length){ alert('Room already added'); return; }

        let rate = Math.round(price - (price*(commission/100)));
        let amount = rate*qty;

        let tr = `<tr id="product_${product_id}">
            <td>${sl}</td>
            <td>${product_name}</td>
            <td><input type="number" name="price[${product_id}]" class="form-control text-end" value="${price}" readonly></td>
            <td><input type="number" name="commission[${product_id}]" class="form-control text-end" value="${commission}"></td>
            <td><input type="number" name="rate[${product_id}]" class="form-control text-end" value="${rate}" readonly></td>
            <td><input type="number" name="qty[${product_id}]" class="form-control text-end" value="${qty}"></td>
            <td><input type="number" name="amount[${product_id}]" class="form-control text-end" value="${amount}" readonly></td>
            <td>
                <input type="hidden" class="product_id" name="product_id[]" value="${product_id}">
                <button type="button" class="btn btn-sm btn-danger remove">X</button>
            </td>
        </tr>`;

        $('#tbody').append(tr);
        calculate();
    });

    // Remove product
    $(document).on('click','.remove',function(){ $(this).closest('tr').remove(); calculate(); });

    // Recalculate totals
    $(document).on('keyup change','input',function(){ calculate(); });

    function calculate(){
        let total=0;
        $('.product_id').each(function(){
            let id = $(this).val();
            let price = +$(`input[name='price[${id}]']`).val();
            let commission = +$(`input[name='commission[${id}]']`).val();
            let qty = +$(`input[name='qty[${id}]']`).val();
            let rate = Math.round(price - (price*(commission/100)));
            $(`input[name='rate[${id}]']`).val(rate);
            let amount = rate*qty;
            $(`input[name='amount[${id}]']`).val(amount);
            total+=amount;
        });
        $('#total_amount').val(total);
        let discount = +$('#discount').val();
        $('#net_amount').val(total-discount);
    }

});
</script>
@endpush
