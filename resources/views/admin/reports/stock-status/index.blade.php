@extends('layouts.admin.report_app')

@section('form')
    <div class="row g-3">
        <input type="hidden" name="print" value="">
        <input type="hidden" name="filter" value="1">
        <div class="col-md-3 col-sm-6">
            <label for="store_id" class="form-label"><b>Store</b></label>
            <select name="store_id[]" id="store_id" class="form-select select" data-placeholder="Select Store" multiple>
                <option value=""></option>
                @foreach ($stores as $store)
                    <option value="{{ $store->id }}"
                        {{ is_array(request('store_id')) && in_array($store->id, request('store_id')) ? 'selected' : '' }}>
                        {{ $store->name }}</option>
                @endforeach
            </select>
        </div>
        <div class="col-md-3 col-sm-6">
            <label for="date_range" class="form-label"><b>Date</b></label>
            <input type="text" class="form-control date-range" name="date_range" id="date_range"
                placeholder="Select Date Range" data-time-picker="true" data-format="DD-MM-Y" data-separator=" to "
                autocomplete="off" required
                value="{{ date('d-m-Y', strtotime($start_date)) . ' to ' . date('d-m-Y', strtotime($end_date)) }}">
        </div>
        <div class="col-md-6">
            <label for="product_id" class="form-label"><b>Rooms</b></label>
            <select name="product_id[]" id="product_id" class="form-select select" data-placeholder="Select Rooms" multiple>
                <option value=""></option>
                @if (is_array(request('product_id')) && count(request('product_id')) > 0)
                    @php
                        $selectedRooms = \App\Models\Room::whereIn('id', request('product_id'))->get();
                    @endphp
                    @foreach ($selectedRooms as $product)
                        <option value="{{ $product->id }}" selected>{{ $product->name }}{{ $product->code ? ' (' . $product->code . ')' : '' }}</option>
                    @endforeach
                @endif
            </select>
        </div>
    </div>
@endsection

@section('content')
    <table id="dataTable" class="table table-bordered w-100">
        <thead class="text-nowrap">
            <tr>
                <th class="text-center" width="30">SL#</th>
                <th>RoomID</th>
                <th>Room</th>
                <th class="text-center" width="50">Opening</th>
                <th class="text-center" width="50">Production</th>
                <th class="text-center" width="50">Sales</th>
                <th class="text-center" width="50">Stock</th>
            </tr>
        </thead>
        <tbody>
            @php $key = 1; @endphp
            @foreach ($data as $row)
                <tr>
                    <td class="text-center">{{ $key++ }}</td>
                    <td class="text-center">ROOMID{{ $row['room_id'] }}</td>
                    <td>{{ $row['product'] }}</td>
                    <td class="text-center">{{ number_format($row['opening']) }}</td>
                    <td class="text-center">{{ number_format($row['production']) }}</td>
                    <td class="text-center">{{ number_format($row['sales']) }}</td>
                    <td class="text-center">{{ number_format($row['stock']) }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $('#dataTable').DataTable({
                order: false,
                responsive: true,
                dom: "<'row g-2'<'col-sm-4'l><'col-sm-8 text-end'<'d-lg-flex justify-content-end'<'mb-2 mb-lg-0 me-1'f>B>>>t<'d-lg-flex align-items-center mt-2'<'me-auto mb-lg-0 mb-2'i><'mb-0'p>>",
                lengthMenu: [10, 20, 30, 40, 50],
                buttons: [{
                        extend: 'excel',
                        text: '<i class="fal fa-file-spreadsheet"></i> Excel'
                    },
                    {
                        text: '<i class="fal fa-file-pdf"></i> Print',
                        className: 'getPdf',
                        action: function(e, dt, node, config) {
                            $('input[name="print"]').val('true');
                            $('.filter_form')[0].setAttribute("target", "_blank");
                            $('.filter_form')[0].submit();
                        }
                    }
                ]
            });

            $('#product_id').select2({
                placeholder: 'Select Rooms',
                allowClear: true,
                ajax: {
                    url: '{{ request()->fullUrl() }}', // Create this route in your web.php
                    dataType: 'json',
                    delay: 250,
                    data: function(params) {
                        return {
                            q: params.term // search term
                        };
                    },
                    processResults: function(data) {
                        return {
                            results: $.map(data, function(item) {
                                return {
                                    id: item.id,
                                    text: item.name + (item.code ? ' (' + item.code + ')' : ''),
                                }
                            })
                        };
                    },
                    cache: true
                }
            });

            $(document).on('click', '#filter_btn', function(e) {
                $('input[name="print"]').val('');
                $('.filter_form')[0].setAttribute("target", "_self");
            });
        });
    </script>
@endpush
