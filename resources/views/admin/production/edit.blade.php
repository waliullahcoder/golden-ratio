@extends('layouts.admin.edit_app')

@section('content')
<div class="row g-3">

    <div class="col-md-4 col-sm-6">
        <label class="form-label"><b>Production No.</b></label>
        <input type="text" class="form-control" value="{{ $data->production_no }}" readonly>
    </div>

    <div class="col-md-4 col-sm-6">
        <label class="form-label"><b>Date</b></label>
        <input type="text" class="form-control date_picker"
               name="date"
               value="{{ date('d-m-Y', strtotime(old('date', $data->date))) }}"
               required>
    </div>

    <div class="col-md-4 col-sm-6">
        <label class="form-label"><b>Store</b></label>
        <select name="store_id" class="form-select" required>
            @foreach ($additionalData['stores'] as $item)
                <option value="{{ $item->id }}"
                    {{ $data->store_id == $item->id ? 'selected' : '' }}>
                    {{ $item->name }}
                </option>
            @endforeach
        </select>
    </div>

    <div class="col-md-4 col-sm-6">
        <label class="form-label"><b>Rooms</b></label>
        <select id="product_id" class="form-select">
            <option value="">Select Room</option>
            @foreach ($additionalData['products'] as $item)
                <option value="{{ $item->id }}">{{ $item->name }}</option>
            @endforeach
        </select>
    </div>

    <div class="col-md-2 col-6">
        <label class="form-label"><b>Quantity</b></label>
        <input type="number" id="quantity" class="form-control" value="1" min="1">
    </div>

    <div class="col-md-2 col-6">
        <label class="form-label text-white">Add</label>
        <button type="button" class="btn btn-primary w-100" id="add_item">
            Add Room
        </button>
    </div>

    <div class="col-12">
        <div class="table-responsive">
            <table class="table table-striped">
                <thead class="bg-primary text-white">
                    <tr>
                        <th width="40">SL</th>
                        <th>Room</th>
                        <th width="200">Quantity</th>
                        <th width="50"></th>
                    </tr>
                </thead>
                <tbody id="tbody">

                    @foreach ($data->list as $item)
                        <tr id="product_{{ $item->product_id }}">
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $item->product->name }}</td>
                            <td>
                                <input type="number"
                                       class="form-control qty"
                                       min="1"
                                       id="qty_{{ $item->product_id }}"
                                       name="qty[{{ $item->product_id }}]"
                                       value="{{ $item->qty }}">
                            </td>
                            <td class="text-center">
                                <input type="hidden"
                                       name="product_id[]"
                                       value="{{ $item->product_id }}">
                                <button type="button"
                                        class="btn btn-sm btn-danger remove">
                                    <i class="far fa-times"></i>
                                </button>
                            </td>
                        </tr>
                    @endforeach

                </tbody>

                <tfoot>
                    <tr>
                        <td colspan="2" class="text-end"><b>Total Qty</b></td>
                        <td>
                            <input type="number"
                                   id="totalQty"
                                   name="total_qty"
                                   class="form-control text-end"
                                   value="{{ $data->total_qty }}"
                                   readonly>
                        </td>
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
$(document).ready(function() {

    calculate();

    $('#add_item').click(function() {

        var product_id = $('#product_id').val();
        var product = $('#product_id option:selected').text();
        var qty = +$('#quantity').val();
        var sl = $('#tbody tr').length + 1;

        if(product_id == ''){
            alert('Please select a room');
            return;
        }

        if($('#product_' + product_id).length){
            alert('Room already added');
            return;
        }

        var tr = `
        <tr id="product_${product_id}">
            <td>${sl}</td>
            <td>${product}</td>
            <td>
                <input type="number"
                       class="form-control qty"
                       min="1"
                       id="qty_${product_id}"
                       name="qty[${product_id}]"
                       value="${qty}">
            </td>
            <td class="text-center">
                <input type="hidden" name="product_id[]" value="${product_id}">
                <button type="button" class="btn btn-sm btn-danger remove">
                    <i class="far fa-times"></i>
                </button>
            </td>
        </tr>`;

        $('#tbody').append(tr);
        $('#quantity').val(1);
        calculate();
    });

    $(document).on('keyup change', '.qty', function(){
        calculate();
    });

    $(document).on('click', '.remove', function(){
        $(this).closest('tr').remove();
        reSerial();
        calculate();
    });

    function calculate(){
        var total = 0;
        $('.qty').each(function(){
            total += +$(this).val();
        });
        $('#totalQty').val(total);
    }

    function reSerial(){
        $('#tbody tr').each(function(index){
            $(this).find('td:first').text(index+1);
        });
    }

});
</script>
@endpush

