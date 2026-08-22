<?php

namespace App\Http\Controllers\Admin;

use App\HelperClass;
use App\Models\Store;
use App\Models\Room;
use App\Models\Production;
use App\Models\CoaSetup;
use Illuminate\Http\Request;
use App\Models\ProductionList;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;

class ProductionController extends Controller
{
    public $path;
    public $title;
    public $create_title;
    public $edit_title;
    public $model;
    public function __construct()
    {
        $this->path = 'production';
        $this->title = 'Productions';
        $this->create_title = 'Add Production';
        $this->edit_title = 'Update Production';
        $this->model = Production::class;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $addition_btns = [
            [
                'parameter' => true,
                'target' => '_self',
                'title' => 'View Voucher',
                'route' => "admin.{$this->path}.show",
                'icon' => '<i class="fas fa-eye"></i>',
                'class' => 'btn btn-sm btn-print-1 mw-fit border-0',
            ],
            [
                'parameter' => true,
                'target' => '_self',
                'title' => 'Print Voucher',
                'route' => "admin.{$this->path}.print",
                'icon' => '<i class="fal fa-print"></i>',
                'class' => 'btn btn-sm btn-print-2 mw-fit border-0',
            ]
        ];

        return HelperClass::resourceDataView($this->model::with(['store'])->orderBy('id', 'desc'), null, $addition_btns, $this->path, $this->title);
    }

    /**
     * Generate Purchase No.
     */
    public function productionNo()
    {
        $data = $this->model::withTrashed()->select(['production_no'])->whereDate('created_at', '>=', date('Y-m-01'))->whereDate('created_at', '<=', date('Y-m-t'))->orderBy('id', 'desc')->first();
        if ($data) {
            return "PP" . (int)str_replace("PP", '', $data->production_no) + 1;
        } else {
            return "PP" . date('ym') . '001';
        }
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request)
    {
      

        $title = $this->create_title;
        $production_no = $this->productionNo();
        $products = Room::where('status', true)->orderBy('name', 'asc')->get();
        $stores = Store::where('status', true)->orderBy('name', 'asc')->get();
        return view("admin.{$this->path}.create", compact('title', 'production_no', 'products', 'stores'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'date' => 'required',
            'store_id' => 'required',
            'product_id' => 'required|array',
            'qty' => 'required|array'
        ]);

        try {
            DB::transaction(function () use ($request) {

                // 🔎 Validate all selected rooms first
                foreach ($request->product_id as $product_id) {

                    $room = \App\Models\Room::find($product_id);

                    $coasetup = CoaSetup::where(function ($query) use ($request, $room) {
                        $query->where('head_name', $room->name);
                            })
                        ->where('head_type', 'A')
                        ->first();

                         if (!$coasetup) {

                            $parent = CoaSetup::findOrFail(4);

                            $account = CoaSetup::create([
                                'parent_id'   => $parent->id,          // id use করা ভালো
                                'head_code'   => $room->id,   // চাইলে নতুন code generate করতে পারো
                                'head_name'   => $room->name,
                                'transaction' => true,
                                'general'     => false,
                                'head_type'   => 'A',
                                'status'      => true,
                                'updateable'  => false,
                                'created_by'  => Auth::id(),
                            ]);
                        }

                    if (!$room) {
                        throw new \Exception("Room not found!");
                    }

                    $qty = $request->qty[$product_id] ?? 0;

                    // ❌ Logic-1: capacity check
                    if ($qty > $room->capacity) {
                        throw new \Exception("{$room->name} capacity exceeded! Max Capacity: {$room->capacity}");
                    }

                    // ❌ Logic-2: available check (available = capacity - already booked)
                    if ($qty > ($room->capacity-$room->available)) {
                        throw new \Exception("{$room->name} available only {$room->available}");
                    }
                }

                // ✅ Create Production
                $production = $this->model::create([
                    'store_id' => $request->store_id,
                    'production_no' => $this->productionNo(),
                    'date' => date('Y-m-d', strtotime($request->date)),
                    'total_qty' => $request->total_qty ?? 0,
                    'remarks' => $request->remarks,
                    'created_by' => Auth::id(),
                ]);

                // ✅ Insert Production List & Decrement Room Available
                foreach ($request->product_id as $product_id) {

                    $qty = $request->qty[$product_id] ?? 0;

                    ProductionList::create([
                        'production_id' => $production->id,
                        'store_id' => $request->store_id,
                        'product_id' => $product_id,
                        'qty' => $qty,
                    ]);

                    // Reduce available quantity of the room
                    \App\Models\Room::where('id', $product_id)->increment('available', $qty);
                }

            });

        } catch (\Exception $e) {
            return back()->withErrors($e->getMessage())->withInput();
        }

        return redirect()->route("admin.{$this->path}.index")
            ->withSuccessMessage('Created Successfully!');
    }




    /**
     * Display the specified resource.
     */
    public function print(string $id)
    {
        $data = $this->model::findOrFail($id);
        $report_title = 'Production Voucher';
        // return view("admin.{$this->path}.print", compact('report_title', 'data'));
        $pdf = Pdf::loadView("admin.{$this->path}.print", compact('report_title', 'data'));
        return $pdf->stream('production_chalan_' . date('d_m_Y_H_i_s') . '.pdf');
    }

    public function show(string $id)
    {
        $title = 'View Production';
        $data = $this->model::findOrFail($id);
        return view("admin.{$this->path}.view", compact('title', 'data'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request, string $id)
    {
       

        $additionalData = [
            'products' => Room::where('status', true)->orderBy('name', 'asc')->get(),
            'stores' => Store::where('status', true)->orderBy('name', 'asc')->get()
        ];
        return HelperClass::resourceDataEdit($this->model, $id, $this->path, $this->edit_title, $additionalData);
    }

    /**
     * Update the specified resource in storage.
     */
   public function update(Request $request, string $id)
{
    $request->validate([
        'date' => 'required',
        'store_id' => 'required',
        'product_id' => 'required|array',
        'qty' => 'required|array'
    ]);

    try {

        DB::transaction(function () use ($request, $id) {

            $production = $this->model::findOrFail($id);

            $production->update([
                'store_id' => $request->store_id,
                'date' => date('Y-m-d', strtotime($request->date)),
                'total_qty' => $request->total_qty ?? 0,
                'remarks' => $request->remarks,
                'updated_by' => Auth::id(),
            ]);

            // delete old list
            ProductionList::where('production_id', $id)->delete();

            // insert new list
            foreach ($request->product_id as $product_id) {

                ProductionList::create([
                    'production_id' => $production->id,
                    'store_id' => $request->store_id,
                    'product_id' => $product_id,
                    'qty' => $request->qty[$product_id] ?? 0,
                ]);
            }

        });

    } catch (\Exception $e) {
        return back()->withErrors($e->getMessage());
    }

    return redirect()->route("admin.{$this->path}.index")
        ->withSuccessMessage('Updated Successfully!');
}


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        return HelperClass::resourceDataDelete($this->model, $id);
    }
}
