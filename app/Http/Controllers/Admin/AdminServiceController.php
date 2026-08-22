<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Service;
use App\Models\Room;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;

class AdminServiceController extends Controller
{
    /* ================= LIST ================= */
    public function services()
    {
        $services = Service::with('room')->latest()->get();
        $rooms = Room::where('status', 1)->get();

        return view('admin.services.index', compact('services', 'rooms'));
    }

    /* ================= STORE ================= */
    public function serviceStore(Request $request)
    {

        $data = $request->validate([
            'name'        => 'required|string|max:255',
            'description' => 'nullable|string',
            'icon'        => 'nullable|string|max:255',
            'room_id'     => 'nullable',
            'type'        => 'required',
            'image'       => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
        ]);

     

        // Image Upload
        if ($request->hasFile('image')) {
            $data['image'] = $request->file('image')
                ->store('services', 'public');
        }

        Service::create($data);

        return back()->with('success', 'Service Created Successfully');
    }

    /* ================= UPDATE ================= */
    public function serviceUpdate(Request $request, Service $service)
    {
        $data = $request->validate([
            'name'        => 'required|string|max:255',
            'description' => 'nullable|string',
            'icon'        => 'nullable|string|max:255',
            'room_id'     => 'nullable',
            'type'        => 'required',
            'image'       => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
        ]);

        // Image Replace
        if ($request->hasFile('image')) {

            if ($service->image && Storage::disk('public')->exists($service->image)) {
                Storage::disk('public')->delete($service->image);
            }

            $data['image'] = $request->file('image')
                ->store('services', 'public');
        }

        $service->update($data);

        return back()->with('success', 'Service Updated Successfully');
    }

    /* ================= DELETE ================= */
    public function serviceDelete(Service $service)
    {
        if ($service->image && Storage::disk('public')->exists($service->image)) {
            Storage::disk('public')->delete($service->image);
        }

        $service->delete();

        return back()->with('success', 'Service Deleted Successfully');
    }
}
