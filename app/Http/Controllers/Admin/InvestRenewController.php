<?php

namespace App\Http\Controllers\Admin;

use DataTables;
use Carbon\Carbon;
use App\HelperClass;
use App\Models\Invest;
use App\Models\InvestMonth;
use App\Models\InvestRenew;
use Illuminate\Http\Request;
use App\Models\InvestRenewList;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use App\Services\ActionButtons\ActionButtons;

class InvestRenewController extends Controller
{
    public $path;
    public $title;
    public $create_title;
    public $edit_title;
    public $model;
    public function __construct()
    {
        $this->path = 'invest-renew';
        $this->title = 'All Invest Renews';
        $this->create_title = 'Add Renew';
        $this->edit_title = 'Update Renew';
        $this->model = InvestRenew::class;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (request()->ajax()) {
            $model = $this->model::with(['list'])->orderBy('id', 'desc');
            $type = request('type');
            if (!empty($type) && $type == 'trash') {
                $model->onlyTrashed();
            }
            return DataTables::eloquent($model)
                ->addIndexColumn()
                ->addColumn('date', function ($row) {
                    return date('d-m-Y', strtotime($row->date));
                })
                ->addColumn('qty', function ($row) {
                    return number_format($row->list->sum('qty'));
                })
                ->addColumn('amount', function ($row) {
                    return number_format($row->list->sum('amount'));
                })
                ->addColumn('investors', function ($row) {
                    return implode(' | ', $row->list->pluck('investor.name')->toArray());
                })
                ->addColumn('actions', function ($row) {
                    $type = request('type');
                    $data = [
                        'id' => $row->id,
                        'edit' => !empty($type) && $type == 'trash' ? false : true,
                    ];
                    $addiotional_buttons = '<a class="btn btn-sm border-0 px-10px btn-primary mw-fit text-white tt" href="' . Route('admin.invest-renew.show', $row->id) . '" style="min-height: 28px;" data-bs-toggle="tooltip" data-bs-placement="top" title="View"><i class="fas fa-eye"></i></a>';
                    $check_data = InvestRenewList::where('invest_renew_id', $row->id)->whereHas('investMonth', function ($q) {
                        $q->where('distributed', 1);
                    })->count();
                    if ($check_data == 0) {
                        return ActionButtons::actions($data, $addiotional_buttons);
                    }
                    return $addiotional_buttons;
                })
                ->rawColumns(['checkbox', 'actions'])
                ->make(true);
        }

        return view("admin.{$this->path}.index", ['title' => $this->title]);
    }

    public function serialNo()
    {
        $first = date('Y-m-01');
        $last = new Carbon('last day of this month');
        $data = $this->model::select(['serial_no'])->where('created_at', '>=', $first)->where('created_at', '<=', $last)->orderBy('id', 'desc')->first();
        if ($data) {
            $trim = str_replace("FDIR", '', $data->serial_no);
            $dataPrefix = (int)$trim + 1;
            $serial_no = "FDIR" . $dataPrefix;
        } else {
            $serial_no = "FDIR" . date('y') . date('m') . '001';
        }
        return $serial_no;
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $title = $this->create_title;
        // $investor_ids = InvestRenewList::where('month', date('F'))->where('year', date('Y'))->pluck('investor_id')->toArray();
        $invests = Invest::with(['investor'])
            // ->whereNotIn('investor_id', $investor_ids)
            ->get();
        $serial_no = $this->serialNo();
        return view("admin.{$this->path}.create", compact('title', 'invests', 'serial_no'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'serial_no' => 'required',
            'year' => 'required',
            'month' => 'required',
            'date' => 'required'
        ]);

        DB::transaction(function () use ($request) {
            $data = $this->model::create([
                'serial_no' => $this->serialNo(),
                'month' => date('F'),
                'year' => date('Y'),
                'date' => date('Y-m-d', strtotime($request->date)),
                'remarks' => $request->remarks,
                'approved' => 1,
                'status' => 'Approved',
                'created_by' => Auth::user()->id,
            ]);

            foreach ($request->invest_id as $invest_id) {
                $invest = Invest::find($invest_id);
                $invest_month = InvestMonth::create([
                    'investor_id' => $invest->investor_id,
                    'invest_id' => $invest_id,
                    'date' => date('Y-m-d', strtotime($request->date)),
                    'invest_month' => date('Y-m-01', strtotime($request->date)),
                    'month' => date('F'),
                    'year' => date('Y'),
                    'qty' => $request->qty[$invest_id],
                    'amount' => $request->amount[$invest_id],
                ]);

                InvestRenewList::create([
                    'invest_renew_id' => $data->id,
                    'invest_month_id' => $invest_month->id,
                    'investor_id' => $invest->investor_id,
                    'invest_id' => $invest_id,
                    'date' => date('Y-m-d', strtotime($request->date)),
                    'invest_month' => date('Y-m-01'),
                    'month' => date('F'),
                    'year' => date('Y'),
                    'qty' => $request->qty[$invest_id],
                    'amount' => $request->amount[$invest_id],
                    'calculate' => $invest->calculate,
                ]);
            }
        });
        return redirect()->route("admin.{$this->path}.index")->withSuccessMessage('Created Successfully!');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $data = $this->model::findOrFail($id);
        $title = 'View Renew List';
        $list = InvestRenewList::with('investor')->where('invest_renew_id', $id)->groupBy('investor_id')->select('*', DB::raw('SUM(qty) as sumQty, SUM(amount) as sumAmount'))->get();
        return view("admin.{$this->path}.view", compact('title', 'data', 'list'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $title = $this->edit_title;
        $data = $this->model::findOrFail($id);        
        $invests = Invest::with(['investor'])
            // ->whereNotIn('investor_id', $investor_ids)
            ->get();
        $additionalData = [
            'invests' => $invests,
        ];
        return HelperClass::resourceDataEdit($this->model, $id, $this->path, $title, $additionalData);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'serial_no' => 'required',
            'year' => 'required',
            'month' => 'required',
            'date' => 'required'
        ]);

        DB::transaction(function () use ($request, $id) {
            $data = $this->model::findOrFail($id);
            $data->update([
                'date' => date('Y-m-d', strtotime($request->date)),
                'remarks' => $request->remarks,
                'updated_by' => Auth::user()->id,
            ]);

            InvestMonth::whereIn('id', $data->list->pluck('invest_month_id')->toArray())->delete();
            InvestRenewList::where('invest_renew_id', $id)->delete();

            foreach ($request->invest_id as $invest_id) {
                $invest = Invest::find($invest_id);
                $invest_month = InvestMonth::create([
                    'investor_id' => $invest->investor_id,
                    'invest_id' => $invest_id,
                    'date' => date('Y-m-d', strtotime($request->date)),
                    'invest_month' => date('Y-m-01', strtotime($request->date)),
                    'month' => date('F'),
                    'year' => date('Y'),
                    'qty' => $request->qty[$invest_id],
                    'amount' => $request->amount[$invest_id],
                ]);

                InvestRenewList::create([
                    'invest_renew_id' => $data->id,
                    'invest_month_id' => $invest_month->id,
                    'investor_id' => $invest->investor_id,
                    'invest_id' => $invest_id,
                    'date' => date('Y-m-d', strtotime($request->date)),
                    'invest_month' => date('Y-m-01'),
                    'month' => date('F'),
                    'year' => date('Y'),
                    'qty' => $request->qty[$invest_id],
                    'amount' => $request->amount[$invest_id],
                    'calculate' => $invest->calculate,
                ]);
            }
        });

        return redirect()->route("admin.{$this->path}.index")->withSuccessMessage('Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        // Delete Single Item
        $data = $this->model::findOrFail($id);
        InvestMonth::whereIn('id', $data->list->pluck('invest_month_id')->toArray())->delete();
        $data->update(['deleted_by' => Auth::user()->id]);
        $data->forceDelete();

        return response()->json(['status' => 'success']);
    }
}
