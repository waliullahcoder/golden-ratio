@extends('layouts.admin.app')

@section('content')

{{-- ================= ALERT ================= --}}
@if(session('success'))
<div class="alert alert-success alert-dismissible fade show">
    {{ session('success') }}
    <button class="btn-close" data-bs-dismiss="alert"></button>
</div>
@endif

{{-- ================= HEADER ================= --}}
<div class="d-flex justify-content-between align-items-center mb-4">
    <h4 class="fw-bold mb-0">
        <i class="bi bi-house-door"></i> Room Management
    </h4>
    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#roomModal" onclick="resetRoomForm()">
        <i class="bi bi-plus-circle"></i> Add Room
    </button>
</div>

{{-- ================= TABLE ================= --}}
<div class="card shadow-sm">
    <div class="card-body table-responsive">
        <table class="table table-hover align-middle">
            <thead class="table-dark text-center">
                <tr>
                    {{-- <th>SL#</th> --}}
                    <th width="100">Room ID</th>
                    <th>Images</th>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Price</th>
                    <th>Capacity</th>
                    <th>Available</th>
                    <th>Status</th>
                    <th width="160">Action</th>
                </tr>
            </thead>
            <tbody>
                @forelse($rooms as $room)
                <tr class="text-center">
                    {{-- <td>{{ $loop->iteration }}</td> --}}
                    <td>{{ 'ROOMID'.$room->id }}</td>
                    <td>
                        <div class="d-flex gap-1 justify-content-center">
                            @foreach(['image','image2','image3','image4'] as $img)
                                @if($room->$img)
                                <img src="{{ asset('storage/'.$room->$img) }}"
                                     class="rounded border"
                                     style="width:42px;height:42px;object-fit:cover">
                                @endif
                            @endforeach
                        </div>
                    </td>

                    <td>{{ $room->name }}</td>
                    <td>{{ $room->category->name ?? 'N/A' }}</td>
                    <td>৳ {{ number_format($room->price) }}</td>
                    <td>{{ $room->capacity }}</td>
                    <td>{{ $room->available }}</td>
                    <td><span class="badge bg-success">Active</span></td>

                    <td>
                        {{-- EDIT --}}
                        <button class="btn btn-sm btn-outline-primary editRoom"
                            data-bs-toggle="modal"
                            data-bs-target="#roomModal"

                            data-id="{{ $room->id }}"
                            data-name="{{ $room->name }}"
                            data-price="{{ $room->price }}"
                            data-capacity="{{ $room->capacity }}"
                            data-available="{{ $room->available }}"
                            data-profit="{{ $room->profit }}"
                            data-required_share="{{ $room->required_share }}"
                            data-show_dashboard="{{ $room->show_dashboard }}"
                            data-serial="{{ $room->serial }}"
                            data-description="{{ $room->description }}"
                            data-category="{{ $room->category_id }}"
                            data-image="{{ $room->image }}"
                            data-image2="{{ $room->image2 }}"
                            data-image3="{{ $room->image3 }}"
                            data-image4="{{ $room->image4 }}"
                            data-meta_title="{{ $room->meta_title }}"
                            data-meta_keywords="{{ $room->meta_keywords }}"
                            data-meta_description="{{ $room->meta_description }}">
                            Edit
                        </button>

                        {{-- VIEW --}}
                        <button class="btn btn-sm btn-outline-success"
                            onclick='viewRoom(@json($room))'>
                            View
                        </button>

                        {{-- DELETE --}}
                        <form action="{{ route('admin.rooms.destroy',$room->id) }}"
                              method="POST" class="d-inline"
                              onsubmit="return confirm('Delete this room?')">
                            @csrf @method('DELETE')
                            <button class="btn btn-sm btn-outline-danger">
                                X
                            </button>
                        </form>
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="8" class="text-center text-muted">No rooms found</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</div>

{{-- ================= ADD / EDIT MODAL ================= --}}
<div class="modal fade" id="roomModal">
    <div class="modal-dialog modal-xl modal-dialog-scrollable">
        <div class="modal-content">

            <form id="roomForm" method="POST" enctype="multipart/form-data">
                @csrf
                <input type="hidden" name="_method" id="form_method" value="POST">

                <div class="modal-header bg-dark text-white">
                    <h5 class="modal-title">
                        <i class="bi bi-house"></i> Room Information
                    </h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">

                    {{-- Tabs --}}
                    <ul class="nav nav-pills mb-3 gap-2">
                        <li class="nav-item">
                            <button type="button" class="nav-link active" data-bs-toggle="tab" data-bs-target="#general">
                                General
                            </button>
                        </li>
                        <li class="nav-item">
                            <button type="button" class="nav-link" data-bs-toggle="tab" data-bs-target="#price">
                                Pricing
                            </button>
                        </li>
                        <li class="nav-item">
                            <button type="button" class="nav-link" data-bs-toggle="tab" data-bs-target="#seo">
                                SEO
                            </button>
                        </li>
                    </ul>

                    <div class="tab-content">

                        {{-- GENERAL --}}
                        <div class="tab-pane fade show active" id="general">
                            <div class="row g-3">
                                <div class="col-md-4">
                                    <label class="fw-bold">Room Name</label>
                                    <input type="text" name="name" id="room_name" class="form-control">
                                </div>

                                <div class="col-md-4">
                                    <label class="fw-bold">Room Type</label>
                                    <select name="category_id" id="room_category_id" class="form-select">
                                        @foreach($categories as $category)
                                            <option value="{{ $category->id }}">{{ $category->name }}</option>
                                        @endforeach
                                    </select>
                                </div>

                                @foreach(['image','image2','image3','image4'] as $img)
                                <div class="col-md-4">
                                    <label class="fw-bold">{{ strtoupper($img) }}</label>
                                    <input type="file" name="{{ $img }}" class="form-control">
                                    <div class="mt-2" id="preview_{{ $img }}"></div>
                                </div>
                                @endforeach

                                <div class="col-12">
                                    <label class="fw-bold">Description</label>
                                    <textarea name="description" id="room_description" rows="3" class="form-control"></textarea>
                                </div>
                            </div>
                        </div>

                        {{-- PRICE --}}
                        <div class="tab-pane fade" id="price">
                            <div class="row g-3">
                                <div class="col-md-4">
                                    <label class="fw-bold">Price</label>
                                    <input type="number" name="price" id="room_price" class="form-control">
                                </div>
                                <div class="col-md-4">
                                    <label class="fw-bold">Capacity</label>
                                    <input type="number" name="capacity" id="room_capacity" class="form-control">
                                </div>
                                <div class="col-md-4">
                                    <label class="fw-bold">Available</label>
                                    <input type="number" name="available" id="available" class="form-control">
                                </div>
                                <div class="col-md-4">
                                    <label class="fw-bold">Profit</label>
                                    <input type="number" name="profit" id="profit" class="form-control">
                                </div>
                                <div class="col-md-4">
                                    <label class="fw-bold">Required Share</label>
                                    <input type="number" name="required_share" id="required_share" class="form-control">
                                </div>
                                <div class="col-md-4">
                                    <label class="fw-bold">Serial</label>
                                    <input type="number" name="serial" id="serial" class="form-control">
                                </div>
                                <div class="col-md-4">
                                    <label class="fw-bold">Show on Dashboard</label>
                                    <input type="checkbox" name="show_dashboard" id="show_dashboard" class="form-check-input">
                                </div>
                            </div>
                        </div>

                        {{-- SEO --}}
                        <div class="tab-pane fade" id="seo">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="fw-bold">Meta Title</label>
                                    <input type="text" name="meta_title" id="meta_title" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <label class="fw-bold">Meta Keywords</label>
                                    <input type="text" name="meta_keywords" id="meta_keywords" class="form-control">
                                </div>
                                <div class="col-12">
                                    <label class="fw-bold">Meta Description</label>
                                    <textarea name="meta_description" id="meta_description" rows="3" class="form-control"></textarea>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button class="btn btn-success">Save</button>
                </div>

            </form>
        </div>
    </div>
</div>

{{-- ================= VIEW MODAL ================= --}}
<div class="modal fade" id="viewRoomModal">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content">

            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title">
                    <i class="bi bi-eye"></i> Room Details
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body">
                <div class="row g-2 mb-3">
                    <div class="col-3"><img id="v_img1" class="img-fluid rounded"></div>
                    <div class="col-3"><img id="v_img2" class="img-fluid rounded"></div>
                    <div class="col-3"><img id="v_img3" class="img-fluid rounded"></div>
                    <div class="col-3"><img id="v_img4" class="img-fluid rounded"></div>
                </div>

                <p><strong>Name:</strong> <span id="v_name"></span></p>
                <p><strong>Price:</strong> <span id="v_price"></span></p>
                <p><strong>Capacity:</strong> <span id="v_capacity"></span></p>
                <p><strong>Profit:</strong> <span id="v_profit"></span></p>
                <p><strong>Required Share:</strong> <span id="v_required_share"></span></p>
                <p><strong>Show on Dashboard:</strong> <span id="v_show_dashboard"></span></p>
                <p><strong>Serial:</strong> <span id="v_serial"></span></p>
                <p><strong>Available:</strong> <span id="v_available"></span></p>
                <p><strong>Description:</strong> <span id="v_description"></span></p>
            </div>

            <div class="modal-footer">
                <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>

{{-- ================= JS ================= --}}
<script>
function resetRoomForm(){
    roomForm.reset();
    roomForm.action = "{{ route('admin.rooms.store') }}";
    form_method.value = "POST";

    ['image','image2','image3','image4'].forEach(i=>{
        document.getElementById('preview_'+i).innerHTML = '';
    });

    // Clear checkbox manually
    show_dashboard.checked = false;
}

document.querySelectorAll('.editRoom').forEach(btn=>{
    btn.onclick = ()=>{

        // Update form action to PUT
        roomForm.action = `/admin/rooms/${btn.dataset.id}`;
        form_method.value = "PUT";

        // General
        room_name.value = btn.dataset.name ?? '';
        room_description.value = btn.dataset.description ?? '';
        room_category_id.value = btn.dataset.category ?? '';

        // Price Tab
        room_price.value = btn.dataset.price ?? '';
        room_capacity.value = btn.dataset.capacity ?? '';
        available.value = btn.dataset.available ?? '';
        profit.value = btn.dataset.profit ?? '';
        required_share.value = btn.dataset.required_share ?? '';
        serial.value = btn.dataset.serial ?? '';

        // Checkbox
        show_dashboard.checked = btn.dataset.show_dashboard == '1' ? true : false;

        // SEO Tab
        meta_title.value = btn.dataset.meta_title ?? '';
        meta_keywords.value = btn.dataset.meta_keywords ?? '';
        meta_description.value = btn.dataset.meta_description ?? '';

        // Images preview
        ['image','image2','image3','image4'].forEach(i=>{
            document.getElementById('preview_'+i).innerHTML =
                btn.dataset[i] ? `<img src="/storage/${btn.dataset[i]}" class="img-fluid rounded" width="50">` : '';
        });
    }
});

// View modal stays the same
function viewRoom(r){
    ['image','image2','image3','image4'].forEach((i,idx)=>{
        document.getElementById('v_img'+(idx+1)).src = r[i] ? '/storage/'+r[i] : '/no-image.png';
    });

    v_name.innerText = r.name;
    v_price.innerText = '৳ '+Number(r.price).toLocaleString();
    v_capacity.innerText = r.capacity;
    v_available.innerText = r.available;
    v_profit.innerText = r.profit;
    v_required_share.innerText = r.required_share;
    v_show_dashboard.innerText = r.show_dashboard == 1 ? 'Yes' : 'No';
    v_serial.innerText = r.serial;
    v_description.innerText = r.description ?? 'N/A';

    new bootstrap.Modal(viewRoomModal).show();
}
</script>

{{-- ================= CSS ================= --}}
<style>
.modal-content{border-radius:14px}
.table img{transition:.2s}
.table img:hover{transform:scale(1.2)}
</style>

@endsection
