@extends('layouts.admin.app')

@section('content')

{{-- SUCCESS ALERT --}}
@if(session('success'))
<div class="alert alert-success alert-dismissible fade show">
    {{ session('success') }}
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
</div>
@endif

@if(session('error'))
<div class="alert alert-danger alert-dismissible fade show">
    {{ session('error') }}
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
</div>
@endif
<div class="d-flex justify-content-between align-items-center mb-4">
    <h4 class="fw-bold mb-0">Category Management</h4>
    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#categoryModal" onclick="resetcategoryForm()">
        + Add category
    </button>
</div>

<div class="card shadow-sm">
    <div class="card-body table-responsive">
        <table class="table table-bordered table-hover align-middle mb-0">
            <thead class="table-light">
                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Status</th>
                    <th width="130">Action</th>
                </tr>
            </thead>
            <tbody>
                @forelse($categories as $category)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $category->name }}</td>
                    <td>
                        <span class="badge bg-success">Active</span>
                    </td>
                    <td>
                        <button
                            class="btn btn-sm btn-info editcategory"
                            data-id="{{ $category->id }}"
                            data-name="{{ $category->name }}"
                            data-bs-toggle="modal"
                            data-bs-target="#categoryModal">
                            Edit
                        </button>
                         <form action="{{ route('admin.categories.destroy', $category->id) }}" method="POST" class="d-inline" onsubmit="return confirm('Are you sure you want to delete this category?');">
                            @csrf
                            @method('DELETE')
                            <button class="btn btn-sm btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="7" class="text-center text-muted">No categories found</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</div>

{{-- ================= Add/EDIT MODAL ================= --}}
<div class="modal fade" id="categoryModal">
    <div class="modal-dialog modal-xl modal-dialog-scrollable">
        <div class="modal-content">

            <form method="POST"
                  action="{{ route('admin.categories.store') }}"
                  enctype="multipart/form-data"
                  id="categoryForm">
                @csrf
                <input type="hidden" name="_method" id="form_method" value="POST">
                <input type="hidden" name="id" id="category_id">

                <div class="modal-header">
                    <h5 class="modal-title">category Information</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">
                    <div class="tab-content">

                        {{-- GENERAL --}}
                        <div class="tab-pane fade show active" id="general">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">category Name</label>
                                    <input type="text" name="name" id="category_name" class="form-control" required>
                                </div>
                            </div>
                        </div>

                      

                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-success">Save</button>
                </div>

            </form>
        </div>
    </div>
</div>




{{-- ================= Add/Edit SCRIPT ================= --}}
<script>
function resetcategoryForm() {
    const form = document.getElementById('categoryForm');
    form.reset();
    form.action = "{{ route('admin.categories.store') }}";
    document.getElementById('form_method').value = "POST";
    document.getElementById('category_id').value = "";
}

document.querySelectorAll('.editcategory').forEach(btn => {
    btn.addEventListener('click', function () {
        // Fill form fields
        category_id.value = this.dataset.id;
        category_name.value = this.dataset.name;
       

        // Change submit button text to "Update"
        categoryForm.querySelector('button[type="submit"]').textContent = "Update";


        // Update form action and method
        categoryForm.action = "/admin/categories/" + this.dataset.id;
        document.getElementById('form_method').value = "PUT";
    });
});
</script>


@endsection
