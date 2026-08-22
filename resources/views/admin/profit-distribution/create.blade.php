@extends('layouts.admin.create_app')

@section('content')
@if ($errors->any())
    <div class="alert alert-danger">
        <ul class="mb-0">
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

    <div class="row g-3">
        <div class="col-md-3 col-sm-6">
            <label for="date" class="form-label"><b>Date <span class="text-danger">*</span></b></label>
            <input type="text" class="form-control date_picker" id="date" name="date"
                value="{{ date('d-m-Y', strtotime(old('date', date('d-m-Y')))) }}" placeholder="Date" required>
        </div>
        <div class="col-md-3 col-sm-6">
            <label for="month" class="form-label"><b>Month <span class="text-danger">*</span></b></label>
            <select class="form-select select" name="month" id="month" data-placeholder="Select Month." required>
                @php
                    $months = [
                        'January',
                        'February',
                        'March',
                        'April',
                        'May',
                        'June',
                        'July',
                        'August',
                        'September',
                        'October',
                        'November',
                        'December',
                    ];
                @endphp
                @foreach ($months as $item)
                    <option value="{{ $item }}" {{ request('month', date('F')) == $item ? 'selected' : '' }}>
                        {{ $item }}</option>
                @endforeach
            </select>
        </div>
        <div class="col-md-3 col-sm-6">
            <label for="year" class="form-label"><b>Year <span class="text-danger">*</span></b></label>
            <select class="form-select select" name="year" id="year" data-placeholder="Select Year." required>
                @for ($i = 2015; $i <= 2055; $i++)
                    <option value="{{ $i }}" {{ request('year', date('Y')) == $i ? 'selected' : '' }}>
                        {{ $i }}</option>
                @endfor
            </select>
        </div>
        <div class="col-md-3 col-sm-6">
            <label for="product_id" class="form-label"><b>Room <span class="text-danger">*</span></b></label>
            <select name="product_id" id="product_id" class="form-select select" data-placeholder="Select Room" required>
                <option value=""></option>
                @foreach (\App\Models\Room::where('status', true)->orderBy('name', 'asc')->get() as $item)
                    <option value="{{ $item->id }}">{{ $item->name }}</option>
                @endforeach
            </select>
        </div>
        <div class="col-12">
            <div id="response">
                {{-- @include('admin.profit-distribution.partial.data', ['detailData' => $detailData]) --}}
            </div>
        </div>
    </div>
@endsection

@push('js')
    <script type="text/javascript">
      $(document).on('change', '#year,#month,#product_id', function () {

    let year = $('#year').val();
    let month = $('#month').val();
    let product_id = $('#product_id').val();

    if(product_id != '') {
        $.ajax({
            url: "{{ route('admin.profit-distribution.create') }}",
            type: "GET",
            data: {
                year: year,
                month: month,
                product_id: product_id
            },
            success: function (response) {
                if (response.status === 'success') {
                    $('#response').html(response.data);
                }
            }
        });
    }
});

    </script>
@endpush
