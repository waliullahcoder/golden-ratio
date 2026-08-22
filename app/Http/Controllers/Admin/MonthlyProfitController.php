<?php

namespace App\Http\Controllers\Admin;

use App\HelperClass;
use App\Models\Invest;
use App\Models\Expense;
use Illuminate\Http\Request;
use App\Models\MonthlyProfit;
use App\Models\InvestRenewList;
use App\Models\MonthlyProfitList;
use Illuminate\Support\Facades\DB;
use App\Models\ServiceInvoiceItem;
use App\Http\Controllers\Controller;

class MonthlyProfitController extends Controller
{
    public $path;
    public $title;
    public $model;
    public $edit_title;
    public $create_title;
    public function __construct()
    {
        $this->path = 'monthly-profit';
        $this->title = 'Monthly Profit';
        $this->create_title = 'Distribute Monthly Profit';
        $this->edit_title = 'Update Monthly Profit';
        $this->model = MonthlyProfit::class;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $addition_btns = [[
            'parameter' => true,
            'target' => '_self',
            'title' => 'View Profit',
            'route' => "admin.{$this->path}.show",
            'icon' => '<i class="fas fa-eye"></i>',
            'class' => 'btn btn-sm btn-primary mw-fit',
        ]];
        return HelperClass::resourceDataView($this->model::orderBy('id', 'desc'), null, $addition_btns, $this->path, $this->title, ['payments'], 'conditional');
    }

    /**
     * Generate Serial No.
     */
    public function serialNo()
    {
        $data = $this->model::whereBetween('created_at', [now()->startOfMonth(), now()->endOfMonth()])
            ->latest('id')
            ->value('serial_no');

        // remove prefix if it exists already
        $lastNumber = $data ? (int) str_replace('MP-', '', $data) : null;

        $nextNumber = is_null($lastNumber)
            ? now()->format('ym') . '001'
            : ($lastNumber + 1);

        return 'MP-' . $nextNumber;
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request)
    {
        $title = $this->create_title;
        $serial_no = $this->serialNo();
        $detailData = [];

        $year  = $request->year ?: date('Y');   // default = current year
        $month = $request->month ?: date('F');  // default = current month
        $startDate = date("Y-m-01", strtotime("$year-$month-01"));
        $endDate   = date("Y-m-t", strtotime("$year-$month-01"));

        $checkData = $this->model::where('year', $year)->where('month', $month)->first();
        if (is_null($checkData)) {
            $profitAmount = ServiceInvoiceItem::where('type', 'Service')
                ->whereHas('invoice', function ($q) use ($startDate, $endDate) {
                    $q->whereBetween('date', [$startDate, $endDate]);
                })
                ->withSum('mechanics as mechanic_total', 'charge') // use JobCardServiceMechanic::charge
                ->get()
                ->sum(fn($item) => $item->subtotal - $item->mechanic_total);

            $expenseAmount = Expense::whereBetween('date', [$startDate, $endDate])->sum('amount');

            $publicInvests = InvestRenewList::with(['investor'])->whereHas('investRenew')->whereHas('invest', function ($query) {
                $query->where('calculate', true);
            })->where('month', date('F', strtotime($startDate)))->where('year', date('Y', strtotime($startDate)))->get();

            $privateInvests = InvestRenewList::with(['investor'])->whereHas('investRenew')->whereHas('invest', function ($query) {
                $query->where('calculate', false);
            })->where('month', date('F', strtotime($startDate)))->where('year', date('Y', strtotime($startDate)))->get();

            $netProfit = $profitAmount - $expenseAmount;
            $investorProfit = $netProfit * 0.30;

            $detailData = [
                'public_invests' => $publicInvests,
                'private_invests' => $privateInvests,
                'public_qty' => $publicInvests->sum('qty'),
                'private_qty' => $privateInvests->sum('qty'),
                'public_amount' => $publicInvests->sum('amount'),
                'private_amount' => $privateInvests->sum('amount'),
                'profit_amount' => $profitAmount,
                'expense_amount' => $expenseAmount,
                'net_profit' => $netProfit,
                'investor_profit' => $investorProfit,
                'per_share_profit' => $publicInvests->sum('qty') > 0 ? $investorProfit / $publicInvests->sum('qty') : 0,
                'startDate' => $startDate,
                'endDate' => $endDate
            ];
        }

        if ($request->ajax()) {
            return response()->json([
                'status' => 'success',
                'data' => view('admin.monthly-profit.partial.data', ['detailData' => $detailData])->render()
            ]);
        }

        return view("admin.{$this->path}.create", compact('title', 'serial_no', 'detailData'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'year' => 'required',
            'month' => 'required',
            'date' => 'required',
            'public_invest_id' => 'required'
        ]);

        try {
            DB::transaction(function () use ($request) {
                $startDate = date("Y-m-01", strtotime("$request->year-$request->month-01"));
                $endDate = date("Y-m-t", strtotime("$request->year-$request->month-01"));

                $profitAmount = ServiceInvoiceItem::where('type', 'Service')
                    ->whereHas('invoice', function ($q) use ($startDate, $endDate) {
                        $q->whereBetween('date', [$startDate, $endDate]);
                    })
                    ->withSum('mechanics as mechanic_total', 'charge') // use JobCardServiceMechanic::charge
                    ->get()
                    ->sum(fn($item) => $item->subtotal - $item->mechanic_total);

                $expenseAmount = Expense::whereBetween('date', [$startDate, $endDate])->sum('amount');

                $publicInvests = InvestRenewList::with(['investor'])->whereHas('investRenew')->whereHas('invest', function ($query) {
                    $query->where('calculate', true);
                })->where('month', date('F', strtotime($startDate)))->where('year', date('Y', strtotime($startDate)))->get();

                $privateInvests = InvestRenewList::with(['investor'])->whereHas('investRenew')->whereHas('invest', function ($query) {
                    $query->where('calculate', false);
                })->where('month', date('F', strtotime($startDate)))->where('year', date('Y', strtotime($startDate)))->get();
                $totalInvestQty = $publicInvests->sum('qty') + $privateInvests->sum('qty');
                $totalInvestAmount = $publicInvests->sum('amount') + $privateInvests->sum('amount');

                $netProfit = $profitAmount - $expenseAmount;
                $investorProfit = $netProfit * 0.30;
                $perShareProfit = $publicInvests->sum('qty') > 0 ? $investorProfit / $publicInvests->sum('qty') : 0;

                $data = $this->model::create([
                    'serial_no'         => $this->serialNo(),
                    'year'              => $request->year,
                    'month'             => $request->month,
                    'date'              => date('Y-m-d', strtotime($request->date)),
                    'invest_qty'        => $totalInvestQty,
                    'invest_amount'     => $totalInvestAmount,
                    'income_amount'     => $profitAmount,
                    'expense_amount'    => $expenseAmount,
                    'profit_amount'     => $profitAmount - $expenseAmount,
                    'profit_percentage' => 30,
                    'public_invest_profit'  => $investorProfit,
                    'private_invest_profit' => $perShareProfit * $privateInvests->sum('qty'),
                    'total_invest_profit'   => $investorProfit + $perShareProfit * $privateInvests->sum('qty'),
                ]);

                foreach ($request->public_invest_id as $public_invest_id) {
                    $invest = Invest::find($public_invest_id);
                    MonthlyProfitList::create([
                        'monthly_profit_id' => $data->id,
                        'invest_id'         => $public_invest_id,
                        'investor_id'       => $invest->investor_id,
                        'invest_qty'        => $invest->qty,
                        'invest_amount'     => $invest->amount,
                        'is_private'        => false,
                        'profit_amount'     => round($perShareProfit * $invest->qty, 2),
                    ]);
                }
                foreach ($request->private_invest_id as $private_invest_id) {
                    $invest = Invest::find($private_invest_id);
                    MonthlyProfitList::create([
                        'monthly_profit_id' => $data->id,
                        'invest_id'         => $public_invest_id,
                        'investor_id'       => $invest->investor_id,
                        'invest_qty'        => $invest->qty,
                        'invest_amount'     => $invest->amount,
                        'is_private'        => true,
                        'profit_amount'     => round($perShareProfit * $invest->qty, 2),
                    ]);
                }
            });
        } catch (\Exception $e) {
            return back()->withErrors($e->getMessage());
        }

        return redirect()->route("admin.{$this->path}.index")->withSuccessMessage('Created Successfully!');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $title = 'View ' . $this->title;
        $data = $this->model::findOrFail($id);
        return view("admin.{$this->path}.view", compact('data', 'title'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request, string $id)
    {
        $data = $this->model::find($id);
        $detailData = [];

        $year  = $request->year ?: $data->year;   // default = current year
        $month = $request->month ?: $data->month;  // default = current month
        $startDate = date("Y-m-01", strtotime("$year-$month-01"));
        $endDate   = date("Y-m-t", strtotime("$year-$month-01"));

        $checkData = $this->model::whereNot('id', $id)->where('year', $year)->where('month', $month)->first();
        if (is_null($checkData)) {
            $profitAmount = ServiceInvoiceItem::where('type', 'Service')
                ->whereHas('invoice', function ($q) use ($startDate, $endDate) {
                    $q->whereBetween('date', [$startDate, $endDate]);
                })
                ->withSum('mechanics as mechanic_total', 'charge') // use JobCardServiceMechanic::charge
                ->get()
                ->sum(fn($item) => $item->subtotal - $item->mechanic_total);

            $expenseAmount = Expense::whereBetween('date', [$startDate, $endDate])->sum('amount');

            $publicInvests = InvestRenewList::with(['investor'])->whereHas('investRenew')->whereHas('invest', function ($query) {
                $query->where('calculate', true);
            })->where('month', date('F', strtotime($startDate)))->where('year', date('Y', strtotime($startDate)))->get();

            $privateInvests = InvestRenewList::with(['investor'])->whereHas('investRenew')->whereHas('invest', function ($query) {
                $query->where('calculate', false);
            })->where('month', date('F', strtotime($startDate)))->where('year', date('Y', strtotime($startDate)))->get();

            $netProfit = $profitAmount - $expenseAmount;
            $investorProfit = $netProfit * 0.30;

            $detailData = [
                'public_invests' => $publicInvests,
                'private_invests' => $privateInvests,
                'public_qty' => $publicInvests->sum('qty'),
                'private_qty' => $privateInvests->sum('qty'),
                'public_amount' => $publicInvests->sum('amount'),
                'private_amount' => $privateInvests->sum('amount'),
                'profit_amount' => $profitAmount,
                'expense_amount' => $expenseAmount,
                'net_profit' => $netProfit,
                'investor_profit' => $investorProfit,
                'per_share_profit' => $publicInvests->sum('qty') > 0 ? $investorProfit / $publicInvests->sum('qty') : 0,
                'startDate' => $startDate,
                'endDate' => $endDate
            ];
        }

        if ($request->ajax()) {
            return response()->json([
                'status' => 'success',
                'data' => view('admin.monthly-profit.partial.data', ['detailData' => $detailData])->render()
            ]);
        }

        $additionalData = [
            'detailData' => $detailData,
        ];

        return HelperClass::resourceDataEdit($this->model, $id, $this->path, $this->edit_title, $additionalData);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'year' => 'required',
            'month' => 'required',
            'date' => 'required',
            'public_invest_id' => 'required'
        ]);

        try {
            DB::transaction(function () use ($request, $id) {
                $data = $this->model::findOrFail($id);

                $startDate = date("Y-m-01", strtotime("$request->year-$request->month-01"));
                $endDate = date("Y-m-t", strtotime("$request->year-$request->month-01"));

                $profitAmount = ServiceInvoiceItem::where('type', 'Service')
                    ->whereHas('invoice', function ($q) use ($startDate, $endDate) {
                        $q->whereBetween('date', [$startDate, $endDate]);
                    })
                    ->withSum('mechanics as mechanic_total', 'charge') // use JobCardServiceMechanic::charge
                    ->get()
                    ->sum(fn($item) => $item->subtotal - $item->mechanic_total);

                $expenseAmount = Expense::whereBetween('date', [$startDate, $endDate])->sum('amount');

                $publicInvests = InvestRenewList::with(['investor'])->whereHas('investRenew')->whereHas('invest', function ($query) {
                    $query->where('calculate', true);
                })->where('month', date('F', strtotime($startDate)))->where('year', date('Y', strtotime($startDate)))->get();

                $privateInvests = InvestRenewList::with(['investor'])->whereHas('investRenew')->whereHas('invest', function ($query) {
                    $query->where('calculate', false);
                })->where('month', date('F', strtotime($startDate)))->where('year', date('Y', strtotime($startDate)))->get();
                $totalInvestQty = $publicInvests->sum('qty') + $privateInvests->sum('qty');
                $totalInvestAmount = $publicInvests->sum('amount') + $privateInvests->sum('amount');

                $netProfit = $profitAmount - $expenseAmount;
                $investorProfit = $netProfit * 0.30;
                $perShareProfit = $publicInvests->sum('qty') > 0 ? $investorProfit / $publicInvests->sum('qty') : 0;

                $data->update([
                    'year'              => $request->year,
                    'month'             => $request->month,
                    'date'              => date('Y-m-d', strtotime($request->date)),
                    'invest_qty'        => $totalInvestQty,
                    'invest_amount'     => $totalInvestAmount,
                    'income_amount'     => $profitAmount,
                    'expense_amount'    => $expenseAmount,
                    'profit_amount'     => $profitAmount - $expenseAmount,
                    'profit_percentage' => 30,
                    'public_invest_profit'  => $investorProfit,
                    'private_invest_profit' => $perShareProfit * $privateInvests->sum('qty'),
                    'total_invest_profit'   => $investorProfit + $perShareProfit * $privateInvests->sum('qty'),
                ]);
                $data->list()->delete();

                foreach ($request->public_invest_id as $public_invest_id) {
                    $invest = Invest::find($public_invest_id);
                    MonthlyProfitList::create([
                        'monthly_profit_id' => $data->id,
                        'invest_id'         => $public_invest_id,
                        'investor_id'       => $invest->investor_id,
                        'invest_qty'        => $invest->qty,
                        'invest_amount'     => $invest->amount,
                        'is_private'        => false,
                        'profit_amount'     => round($perShareProfit * $invest->qty, 2),
                    ]);
                }
                foreach ($request->private_invest_id as $private_invest_id) {
                    $invest = Invest::find($private_invest_id);
                    MonthlyProfitList::create([
                        'monthly_profit_id' => $data->id,
                        'invest_id'         => $public_invest_id,
                        'investor_id'       => $invest->investor_id,
                        'invest_qty'        => $invest->qty,
                        'invest_amount'     => $invest->amount,
                        'is_private'        => true,
                        'profit_amount'     => round($perShareProfit * $invest->qty, 2),
                    ]);
                }
            });
        } catch (\Exception $e) {
            return back()->withErrors($e->getMessage());
        }

        return redirect()->route("admin.{$this->path}.index")->withSuccessMessage('Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        return HelperClass::resourceDataDelete($this->model, $id);
    }
}
