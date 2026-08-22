<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Room;
use App\Models\Service;
use App\Models\Category;
use App\Models\Booking;
use App\Models\Testimonial;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
class CategoryController extends Controller
{
   public function index()
    {
        $categories = Category::all();
        return view('admin.categories.index', compact('categories'));
    }


    public function categoryStore(Request $request)
    {
        $data = $request->validate([
            'name'             => 'required|string|max:255',
        ]);

        if(Category::where('name', $request->name)->exists()) {
            return back()->with('error','Category already exists!')->withInput();
        }

        Category::create($data);

        return back()->with('success', 'Category Created Successfully');
    }

    public function categoryUpdate(Request $request, Category $category)
    {
        $data = $request->validate([
            'name'             => 'required|string|max:255',
        ]);
    
        /* ---------- UPDATE ---------- */
        $category->update($data);

        return back()->with('success', 'Category Updated Successfully');
    }



    public function categoryDelete(Category $category)
    {
        $category->delete();
        return redirect()->route('admin.categiries')->with('success', 'Category Deleted Successfully');
    }

    
}
