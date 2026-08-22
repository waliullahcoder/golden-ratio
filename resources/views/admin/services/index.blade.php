@extends('layouts.admin.app')

@section('content')

@if(session('success'))
<div class="alert alert-success alert-dismissible fade show">
    {{ session('success') }}
    <button class="btn-close" data-bs-dismiss="alert"></button>
</div>
@endif

{{-- HEADER --}}
<div class="d-flex justify-content-between align-items-center mb-4">
    <h4 class="fw-bold mb-0">
        <i class="bi bi-gear"></i> Service/Page Management
    </h4>

    <button class="btn btn-primary"
        data-bs-toggle="modal"
        data-bs-target="#serviceModal"
        onclick="resetServiceForm()">
        <i class="bi bi-plus-circle"></i> Add Service
    </button>
</div>

{{-- TABLE --}}
<div class="card shadow-sm">
<div class="card-body table-responsive">

<table class="table table-hover align-middle text-center">
<thead class="table-dark">
<tr>
    <th>ID</th>
    <th>Image</th>
    <th>Name</th>
    <th>Room</th>
    <th>Type</th>
    <th width="200">Action</th>
</tr>
</thead>

<tbody>
@forelse($services as $service)
<tr>
    <td>SVC{{ $service->id }}</td>

    <td>
        @if($service->image)
            <img src="{{ asset('storage/'.$service->image) }}"
                 width="45"
                 height="45"
                 style="object-fit:cover"
                 class="rounded border">
        @else
            -
        @endif
    </td>

    <td>{{ $service->name }}</td>
    <td>{{ $service->room->name ?? '-' }}</td>
    <td class="text-capitalize">{{ $service->type }}</td>

    <td>

        {{-- EDIT --}}
        <button class="btn btn-sm btn-outline-primary editServiceBtn"
            data-id="{{ $service->id }}"
            data-name="{{ $service->name }}"
            data-room="{{ $service->room_id }}"
            data-type="{{ $service->type }}"
            data-icon="{{ $service->icon }}"
            data-description="{{ $service->description }}"
            data-image="{{ $service->image }}"
            data-bs-toggle="modal"
            data-bs-target="#serviceModal">
            Edit
        </button>

        {{-- VIEW --}}
        <button class="btn btn-sm btn-outline-success"
            onclick='viewService(@json($service))'>
            View
        </button>

        {{-- DELETE --}}
        <form action="{{ route('admin.services.destroy',$service->id) }}"
              method="POST"
              class="d-inline"
              onsubmit="return confirm('Delete this service?')">
            @csrf
            @method('DELETE')
            <button class="btn btn-sm btn-outline-danger">
                X
            </button>
        </form>

    </td>
</tr>
@empty
<tr>
    <td colspan="6" class="text-muted">No services found</td>
</tr>
@endforelse
</tbody>
</table>

</div>
</div>

{{-- ADD / EDIT MODAL --}}
<div class="modal fade" id="serviceModal">
<div class="modal-dialog modal-lg">
<div class="modal-content">

<form id="serviceForm" method="POST" enctype="multipart/form-data">
@csrf
<input type="hidden" id="form_method" name="_method" value="POST">

<div class="modal-header bg-dark text-white">
    <h5 class="modal-title">Service Information</h5>
    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
</div>

<div class="modal-body">
<div class="row g-3">

    <div class="col-md-6">
        <label class="fw-bold">Service Name</label>
        <input type="text" name="name" id="edit_name"
               class="form-control" required>
    </div>

    <div class="col-md-6">
        <label class="fw-bold">Room</label>
        <select name="room_id" id="room_id"
                class="form-select">
                <option value="">Select Room</option>
            @foreach($rooms as $room)
                <option value="{{ $room->id }}">
                    {{ $room->name }}
                </option>
            @endforeach
        </select>
    </div>

    <div class="col-md-4">
        <label class="fw-bold">Type</label>
        <select name="type" id="type"
                class="form-select">
            <option value="room">Room Services</option>
            <option value="menu">Menu Services</option>
            <option value="home">Home Services</option>
            <option value="gallery">Gallery</option>
            <option value="testimonial">Testimonial</option>
            <option value="about">About</option>
            <option value="footer_col1">Footer Col1</option>
            <option value="footer_col2">Footer Col2</option>
        </select>
    </div>

    <div class="col-md-4">
        <label class="fw-bold">Icon</label>
        <input type="text" name="icon" id="icon"
               class="form-control"
               placeholder="bi bi-wifi">
    </div>

    <div class="col-md-4">
        <label class="fw-bold">Image</label>
        <input type="file" name="image"
               class="form-control">
        <div id="preview_image" class="mt-2"></div>
    </div>

    <div class="col-12">
        <label class="fw-bold">Description</label>
        <textarea name="description"
                  id="description"
                  rows="3"
                  class="form-control"></textarea>
    </div>

</div>
</div>

<div class="modal-footer">
    <button type="button"
            class="btn btn-secondary"
            data-bs-dismiss="modal">
        Cancel
    </button>
    <button type="submit"
            class="btn btn-success">
        Save
    </button>
</div>

</form>

</div>
</div>
</div>

{{-- VIEW MODAL --}}
<div class="modal fade" id="viewServiceModal">
<div class="modal-dialog modal-md">
<div class="modal-content">

<div class="modal-header bg-primary text-white">
    <h5 class="modal-title">Service Details</h5>
    <button type="button"
            class="btn-close btn-close-white"
            data-bs-dismiss="modal"></button>
</div>

<div class="modal-body text-center">

    <img id="v_image"
         class="img-fluid rounded mb-3"
         style="max-height:200px">

    <p><strong>Name:</strong> <span id="v_name"></span></p>
    <p><strong>Room:</strong> <span id="v_room"></span></p>
    <p><strong>Type:</strong> <span id="v_type"></span></p>
    <p><strong>Icon:</strong> <i id="v_icon"></i></p>
    <p><strong>Description:</strong> <span id="v_description"></span></p>

</div>

</div>
</div>
</div>

{{-- JS --}}
<script>

const serviceForm = document.getElementById('serviceForm');
const formMethod = document.getElementById('form_method');
const editName = document.getElementById('edit_name');
const roomSelect = document.getElementById('room_id');
const typeSelect = document.getElementById('type');
const iconInput = document.getElementById('icon');
const descInput = document.getElementById('description');
const previewImage = document.getElementById('preview_image');

function resetServiceForm(){
    serviceForm.reset();
    serviceForm.action = "{{ route('admin.services.store') }}";
    formMethod.value = "POST";
    previewImage.innerHTML = '';
}

document.querySelectorAll('.editServiceBtn').forEach(btn=>{
    btn.addEventListener('click', function(){

        serviceForm.action = `/admin/services/${this.dataset.id}`;
        formMethod.value = "PUT";

        editName.value = this.dataset.name || '';
        roomSelect.value = this.dataset.room || '';
        typeSelect.value = this.dataset.type || '';
        iconInput.value = this.dataset.icon || '';
        descInput.value = this.dataset.description || '';

        previewImage.innerHTML = this.dataset.image
            ? `<img src="/storage/${this.dataset.image}"
                    width="80"
                    class="img-fluid rounded">`
            : '';
    });
});

function viewService(s){
    document.getElementById('v_image').src =
        s.image ? '/storage/'+s.image : '';

    document.getElementById('v_name').innerText = s.name ?? '-';
    document.getElementById('v_room').innerText =
        s.room?.name ?? '-';
    document.getElementById('v_type').innerText =
        s.type ?? '-';
    document.getElementById('v_icon').className =
        s.icon ?? '';
    document.getElementById('v_description').innerText =
        s.description ?? 'N/A';

    new bootstrap.Modal(
        document.getElementById('viewServiceModal')
    ).show();
}

</script>

@endsection
