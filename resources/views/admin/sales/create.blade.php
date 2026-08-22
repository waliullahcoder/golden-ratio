@extends('layouts.admin.create_app')

@section('content')
<div class="row g-3">

    {{-- Sale Type --}}
    <div class="col-md-3 col-sm-6" id="sale_type_area">
        <label class="form-label"><b>Sale Type *</b></label>
        <select name="sale_type" id="sale_type" class="form-select select" required>
            <option value="Credit">Credit</option>
            <option value="Cash">Cash</option>
        </select>
    </div>

    {{-- Cash Account --}}
    <div class="col-md-3 col-sm-6" id="accounts_area" style="display:none;">
        <label class="form-label"><b>Cash Account *</b></label>
        <select name="coa_id" id="coa_id" class="form-select select">
            <option value="">Select Cash Account</option>
            @foreach ($cash_heads as $item)
                <option value="{{ $item->id }}">{{ $item->head_name }} - {{ $item->head_code }}</option>
            @endforeach
        </select>
    </div>

    {{-- Invoice --}}
    <div class="col-md-3 col-sm-6">
        <label class="form-label"><b>Invoice No *</b></label>
        <input type="text" class="form-control" name="invoice" value="{{ $invoice }}" readonly required>
    </div>

    {{-- Date --}}
    <div class="col-md-3 col-sm-6">
        <label class="form-label"><b>Date *</b></label>
        <input type="text" class="form-control date_picker" name="date" value="{{ date('d-m-Y') }}" required>
    </div>

    {{-- Store --}}
    <div class="col-md-3 col-sm-6">
        <label class="form-label"><b>Store *</b></label>
        <select name="store_id" id="store_id" class="form-select select" required>
            @foreach ($stores as $item)
                <option value="{{ $item->id }}">{{ $item->name }}</option>
            @endforeach
        </select>
    </div>

    {{-- Client --}}
    <div class="col-md-3 col-sm-6">
        <label class="form-label"><b>Client *</b></label>
        <select name="client_id" class="form-select select" required>
            <option value=""></option>
            @foreach ($clients as $item)
                <option value="{{ $item->id }}">{{ $item->name }}</option>
            @endforeach
        </select>
    </div>

    {{-- Product --}}
    <div class="col-md-3 col-sm-6">
        <label class="form-label"><b>Rooms</b></label>
        <select id="product_id" class="form-select select">
            <option value=""></option>
            @foreach ($products as $item)
                <option value="{{ $item->id }}"
                        data-price="{{ $item->price }}"
                        data-commission="{{ $item->commission }}"
                        data-stock="{{ $item->available }}">
                    {{ $item->name }}
                </option>
            @endforeach
        </select>
    </div>

    {{-- Stock --}}
    <div class="col-md-2 col-6">
        <label class="form-label"><b>Stock</b></label>
        <input type="number" id="stock" class="form-control" readonly value="0">
    </div>

    {{-- Quantity --}}
    <div class="col-md-2 col-6">
        <label class="form-label"><b>Quantity</b></label>
        <input type="number" id="quantity" class="form-control" value="1">
    </div>

    {{-- Add Button --}}
    <div class="col-md-2 col-sm-6">
        <label class="form-label text-white d-none d-sm-block">.</label>
        <button type="button" class="btn btn-primary w-100" id="add_item">Add Room</button>
    </div>

    {{-- TABLE --}}
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
                <tbody id="tbody"></tbody>
                <tfoot>
                    <tr>
                        <td colspan="5"></td>
                        <td><b>Total</b></td>
                        <td><input type="number" id="total_amount" name="total_amount" class="form-control text-end" readonly value="0"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="5"></td>
                        <td><b>Discount</b></td>
                        <td><input type="number" id="discount" name="discount" class="form-control text-end" value="0"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="5"></td>
                        <td><b>Net</b></td>
                        <td><input type="number" id="net_amount" name="net_amount" class="form-control text-end" readonly value="0"></td>
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

    // Select2 init
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

    // Update stock & price on product select
    $('#product_id').change(function(){
        let option = $(this).find('option:selected');
        $('#stock').val(option.data('stock') || 0);
    });

    // Add product to table
    $('#add_item').click(function(){
        let product_id = $('#product_id').val();
        let product_name = $('#product_id option:selected').text();
        let price = +$('#product_id option:selected').data('price');
        let commission = +$('#product_id option:selected').data('commission');
        let qty = +$('#quantity').val();
        let stock = +$('#stock').val();
        let sl = $('#tbody tr').length + 1;

        if(!product_id){ alert('Select a room'); return; }
        if(qty<=0 || qty>stock){ alert('Stock not available'); return; }
        if($('#product_'+product_id).length){ alert('Room already added'); return; }

        let rate = Math.round(price - (price*(commission/100)));
        let amount = rate * qty;

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
            let amount = rate * qty;
            $(`input[name='amount[${id}]']`).val(amount);
            total += amount;
        });

        $('#total_amount').val(total);
        let discount = +$('#discount').val();
        $('#net_amount').val(total - discount);
    }

});
</script>
@endpush
