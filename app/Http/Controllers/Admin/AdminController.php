<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Room;
use App\Models\Service;
use App\Models\Category;
use App\Models\Booking;
use App\Models\User;
use App\Models\Testimonial;
use App\Models\CoaSetup;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\HelperClass;
class AdminController extends Controller
{

 public $path;
    public $title;
    public $create_title;
    public $edit_title;
    public $model;
    public function __construct()
    {
        $this->path = 'user';
        $this->title = 'Admin Setup';
        $this->create_title = 'Add Admin';
        $this->edit_title = 'Update Admin';
        $this->model = User::class;
    }
    // Dashboard
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $addition_btns = [[
            'parameter' => true,
            'target' => '_self',
            'title' => 'Change Password',
            'route' => 'admin.user.password',
            'icon' => '<i class="fal fa-key"></i>',
            'class' => 'btn btn-sm btn-primary mw-fit border-0 fs-15',
        ]];

        $query = $this->model::with('roles');
        if (!Auth::user()->can('Investors')) {
            $query->whereDoesntHave('roles', function ($q) {
                $q->where('name', 'Investor');
            });
        }

        return HelperClass::resourceDataView($query->whereNotIn('id', [Auth::user()->id])->whereNotIn('user_name', ['admin'])->orderBy('id', 'desc'), null, $addition_btns, $this->path, $this->title, 'investors', 'conditional');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $title = $this->create_title;
        $roles = Role::whereNotIn('name', ['Software Admin', 'Investor'])->orderBy('name', 'asc')->get();
        return view("admin.{$this->path}.create", compact('title', 'roles'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name'       => ['required', 'string', 'max:255'],
            'user_name'  => ['required', 'string', 'unique:users,user_name'],
            'email'      => ['nullable', 'email', 'unique:users,email'],
            'phone'      => ['nullable', 'unique:users,phone'],
            'password'   => ['required', Password::min(8), 'confirmed'],
            // 'password'   => ['required', Password::min(8)->letters()->mixedCase()->numbers()->symbols(), 'confirmed'],
            'role_id'    => ['required', 'exists:roles,id'],
            'image'      => ['nullable', 'image'],
        ]);

        $userData = [
            'name'        => $validated['name'],
            'user_name'   => $validated['user_name'],
            'email'       => $validated['email'],
            'phone'       => $validated['phone'],
            'password'    => Hash::make($validated['password']),
            'image'       => isset($validated['image']) ? HelperClass::saveImage($validated['image'], 300, $this->path) : null,
            'created_by'  => Auth::id(),
        ];

        $user = $this->model::create($userData);

        $user->assignRole(Role::findById($validated['role_id']));

        return redirect()->route("admin.{$this->path}.index")->withSuccessMessage('Created Successfully!');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $additionalData = ['roles' => Role::whereNotIn('name', ['Software Admin', 'Investor'])->orderBy('name', 'asc')->get()];
        return HelperClass::resourceDataEdit($this->model, $id, $this->path, $this->edit_title, $additionalData);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'user_name' => ['required', 'string', Rule::unique('users', 'user_name')->ignore($id)],
            'email' => ['nullable', 'email', Rule::unique('users', 'email')->ignore($id)],
            'phone' => ['nullable', Rule::unique('users', 'phone')->ignore($id)],
            'role_id' => ['required', 'exists:roles,id'],
            'image'      => ['nullable', 'image'],
        ]);

        $data = $this->model::findOrFail($id);
        $data->update([
            'name'       => $request->name,
            'user_name'  => $request->user_name,
            'email'      => $request->email,
            'phone'      => $request->phone,
            'image'       => isset($validated['image']) ? HelperClass::saveImage($validated['image'], 300, $this->path, $data->image) : $data->image,
            'updated_by' => Auth::id(),
        ]);

        $role = Role::findById($request->role_id);
        $data->syncRoles($role);

        return redirect()->route("admin.{$this->path}.index")->withSuccessMessage('Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        return HelperClass::resourceDataDelete($this->model, $id, ['image', 'cover_image']);
    }

    public function changePassword(string $id)
    {
        $data = $this->model::findOrFail($id);
        return view('admin.user.password', compact('data'));
    }

    public function passwordUpdate(Request $request, string $id)
    {
        $request->validate([
            'password'   => ['required', Password::min(8), 'confirmed']
            // 'password'   => ['required', Password::min(8)->letters()->mixedCase()->numbers()->symbols(), 'confirmed']
        ]);

        $user = $this->model::findOrFail($id);
        $user->password = Hash::make($request->password);
        $user->save();
        return redirect()->route("admin.{$this->path}.index")->withSuccessMessage('Password Updated Successfully!');
    }
    public function dashboard()
    {
        $rooms = Room::count();
        $services = Service::count();
        $bookings = Booking::count();
        $testimonials = Testimonial::count();

        return view('admin.dashboard', compact('rooms', 'services', 'bookings', 'testimonials'));
    }

    // ================= ROOMS =================
    public function rooms()
    {
        $rooms = Room::orderBy('id', 'desc')->get();
        $categories = Category::all();
        return view('admin.rooms.index', compact('rooms','categories'));
    }

    public function roomCreate()
    {
        return view('admin.rooms.create');
    }


    public function roomStore(Request $request)
    {
        $data = $request->validate([
            'name'             => 'required|string|max:255',
            'category_id'      => 'required',
            'price'            => 'required|numeric',
            'capacity'         => 'required|integer',
            'description'      => 'nullable|string',
            'available'        => 'nullable',
            'profit'           => 'required|numeric',
            'required_share'   => 'required|integer',
            'show_dashboard'   => 'nullable',
            'serial'           => 'required|integer',

            // room image
            'image'            => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
            'image2'           => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
            'image3'           => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
            'image4'           => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',

            // SEO
            'meta_title'       => 'nullable|string|max:255',
            'meta_description' => 'nullable|string',
            'meta_keywords'    => 'nullable|string',
            'meta_image'       => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
        ]);

        if(Room::where('name', $request->name)->exists()) {
            return back()->with('error','Room already exists!')->withInput();
        }

             $parent = CoaSetup::findOrFail(4);
                $account = CoaSetup::create([
                    'parent_id'   => $parent->head_code,
                    'head_code'   => $room->id,
                    'head_name'   => $request->name,
                    'transaction' => true,
                    'general'     => false,
                    'head_type'   => 'E',
                    'status'      => true,
                    'updateable'     => false,
                    'created_by'  => Auth::id(),
                ]);

        /* ---------- SLUG ---------- */
        $data['slug'] = Str::slug($request->name);

        /* ---------- ROOM IMAGE ---------- */
        if ($request->hasFile('image')) {
            $data['image'] = $request->file('image')
                ->store('rooms', 'public');   // storage/app/public/rooms
        }
        if ($request->hasFile('image2')) {
            $data['image2'] = $request->file('image2')
                ->store('rooms', 'public');
        }
        if ($request->hasFile('image3')) {
            $data['image3'] = $request->file('image3')
                ->store('rooms', 'public');
        }
        if ($request->hasFile('image4')) {
            $data['image4'] = $request->file('image4')
                ->store('rooms', 'public');
        }

        /* ---------- SEO IMAGE ---------- */
        if ($request->hasFile('meta_image')) {
            $data['meta_image'] = $request->file('meta_image')
                ->store('rooms/seo', 'public');
        }

        Room::create($data);

        return back()->with('success', 'Room Created Successfully');
    }



    public function roomEdit(Room $room)
    {
        return view('admin.rooms.edit', compact('room'));
    }


    public function roomUpdate(Request $request, Room $room)
    {
        $data = $request->validate([
            'name'             => 'required|string|max:255',
            'category_id'      => 'required',
            'price'            => 'required|numeric',
            'capacity'         => 'required|integer',
            'description'      => 'nullable|string',
            'available'        => 'nullable',
            'profit'           => 'required|numeric',
            'required_share'   => 'required|integer',
            'show_dashboard'   => 'nullable',
            'serial'           => 'required|integer',

            // Room image
            'image'            => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
            'image2'           => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
            'image3'           => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
            'image4'           => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',

            // SEO
            'meta_title'       => 'nullable|string|max:255',
            'meta_description' => 'nullable|string',
            'meta_keywords'    => 'nullable|string',
            'meta_image'       => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
        ]);

        $coasetup = CoaSetup::where(function ($query) use ($request, $room) {
        $query->where('head_name', $request->name)
              ->orWhere('head_name', $room->name);
            })
            ->where('head_type', 'E')
            ->first();

        if (!$coasetup) {

            $parent = CoaSetup::findOrFail(4);

            $account = CoaSetup::create([
                'parent_id'   => $parent->id,          // id use করা ভালো
                'head_code'   => $room->id,   // চাইলে নতুন code generate করতে পারো
                'head_name'   => $request->name,
                'transaction' => true,
                'general'     => false,
                'head_type'   => 'E',
                'status'      => true,
                'updateable'  => false,
                'created_by'  => Auth::id(),
            ]);
        }
        

    
        /* ---------- SLUG ---------- */
        $data['slug'] = Str::slug($request->name);

        /* ---------- ROOM IMAGE ---------- */
        if ($request->hasFile('image')) {
            if ($room->image && Storage::disk('public')->exists($room->image)) {
                Storage::disk('public')->delete($room->image);
            }
            $data['image'] = $request->file('image')
                ->store('rooms', 'public');
        }
        if ($request->hasFile('image2')) {
            if ($room->image2 && Storage::disk('public')->exists($room->image2)) {
                Storage::disk('public')->delete($room->image2);
            }
            $data['image2'] = $request->file('image2')
                ->store('rooms', 'public');
        }
        if ($request->hasFile('image3')) {
            if ($room->image3 && Storage::disk('public')->exists($room->image3)) {
                Storage::disk('public')->delete($room->image3);
            }
            $data['image3'] = $request->file('image3')
                ->store('rooms', 'public');
        }
        if ($request->hasFile('image4')) {
            if ($room->image4 && Storage::disk('public')->exists($room->image4)) {
                Storage::disk('public')->delete($room->image4);
            }
            $data['image4'] = $request->file('image4')
                ->store('rooms', 'public');
        }


        /* ---------- SEO IMAGE ---------- */
        if ($request->hasFile('meta_image')) {
            // পুরানো meta_image delete
            if ($room->meta_image && Storage::disk('public')->exists($room->meta_image)) {
                Storage::disk('public')->delete($room->meta_image);
            }

            $data['meta_image'] = $request->file('meta_image')
                ->store('rooms/seo', 'public');
        }

        /* ---------- UPDATE ---------- */
        $room->update($data);

        return back()->with('success', 'Room Updated Successfully');
    }



    public function roomDelete(Room $room)
    {
        $room->delete();
        return redirect()->route('admin.rooms')->with('success', 'Room Deleted Successfully');
    }

    // ================= SERVICES =================
    // public function services()
    // {
    //     $services = Service::all();
    //     return view('admin.services.index', compact('services'));
    // }

    // public function serviceCreate()
    // {
    //     return view('admin.services.create');
    // }

    // public function serviceStore(Request $request)
    // {
    //     $request->validate([
    //         'name'=>'required',
    //     ]);

    //     Service::create($request->all());
    //     return redirect()->route('admin.services')->with('success', 'Service Created Successfully');
    // }

    // public function serviceEdit(Service $service)
    // {
    //     return view('admin.services.edit', compact('service'));
    // }

    // public function serviceUpdate(Request $request, Service $service)
    // {
    //     $request->validate([
    //         'name'=>'required',
    //     ]);

    //     $service->update($request->all());
    //     return redirect()->route('admin.services')->with('success', 'Service Updated Successfully');
    // }

    // public function serviceDelete(Service $service)
    // {
    //     $service->delete();
    //     return redirect()->route('admin.services')->with('success', 'Service Deleted Successfully');
    // }

    // ================= BOOKINGS =================
    public function bookings()
    {
        $bookings = Booking::with('room')->get();
        return view('admin.bookings.index', compact('bookings'));
    }

    public function bookingView(Booking $booking)
    {
        return view('admin.bookings.view', compact('booking'));
    }

    public function bookingStatus(Request $request, Booking $booking)
    {
        $request->validate([
            'status'=>'required|in:pending,confirmed,cancelled'
        ]);

        $booking->update(['status'=>$request->status]);
        return redirect()->route('admin.bookings')->with('success','Booking Status Updated');
    }

    // ================= TESTIMONIALS =================
    public function testimonials()
    {
        $testimonials = Testimonial::all();
        return view('admin.testimonials.index', compact('testimonials'));
    }

    public function testimonialCreate()
    {
        return view('admin.testimonials.create');
    }

    public function testimonialStore(Request $request)
    {
        $request->validate([
            'name'=>'required',
            'message'=>'required',
        ]);

        Testimonial::create($request->all());
        return redirect()->route('admin.testimonials')->with('success', 'Testimonial Created Successfully');
    }

    public function testimonialEdit(Testimonial $testimonial)
    {
        return view('admin.testimonials.edit', compact('testimonial'));
    }

    public function testimonialUpdate(Request $request, Testimonial $testimonial)
    {
        $request->validate([
            'name'=>'required',
            'message'=>'required',
        ]);

        $testimonial->update($request->all());
        return redirect()->route('admin.testimonials')->with('success', 'Testimonial Updated Successfully');
    }

    public function testimonialDelete(Testimonial $testimonial)
    {
        $testimonial->delete();
        return redirect()->route('admin.testimonials')->with('success', 'Testimonial Deleted Successfully');
    }
}
