<?php

namespace App\Http\Controllers\Admin;

use App\Models\CoaSetup;
use App\Models\Invest;
use App\Models\Investor;
use Carbon\CarbonPeriod;
use App\Models\TrialBalance;
use Illuminate\Http\Request;
use App\Models\InvestorPayment;
use Barryvdh\DomPDF\Facade\Pdf;
use App\Models\InvestSattlement;
use App\Models\MonthlyProfitList;
use Illuminate\Support\Facades\DB;
use App\Models\AccountTransaction;
use App\DataTables\CoaListDataTable;
use App\Http\Controllers\Controller;
use App\DataTables\voucherListDataTable;
use App\Models\Expense;
use App\Models\ReferralWallet;
use App\Models\ServiceInvoice;
use App\Models\Room;
use App\Models\Store;
use App\Models\ProductionList;
use App\Models\SalesList;
use App\Models\SalesReturnList;

class ReportController extends Controller
{
    public function coaList(Request $request, CoaListDataTable $dataTable)
    {
        if ($request->ajax() && $request->has('getHeads')) {
            $value = $request->head_type;
            if ($value == 'gl') {
                $heads = CoaSetup::where('general', 1)->orderBy('head_name', 'asc')->get();
            } else {
                $heads = CoaSetup::whereNull('parent_id')->orderBy('head_name', 'asc')->get();
            }
            return response()->json(['status' => 'success', 'heads' => $heads]);
        }

        if (!is_null($request->print)) {
            $query = CoaSetup::query();
            $parent_head = $request->parent_head;
            if ($parent_head) {
                $query->where('head_code', 'LIKE', $parent_head . '%')->where('transaction', 1);
            }
            $data = $query->orderBy('head_name', 'asc')->get();

            $report_title = 'Chart of Accounts';
            $pdf = Pdf::loadView('admin.reports.coa-list.print', compact('report_title', 'data'));
            return $pdf->stream('coa_list_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Chart of Accounts';
        return $dataTable->render('admin.reports.coa-list.index', compact('title'));
    }

    public function stockStatus(Request $request)
{
    if ($request->ajax()) {
        $term = $request->get('q');

        $results = Room::where('name', 'LIKE', "%$term%")
            ->select('id', 'name', 'code')
            ->get();

        return response()->json($results);
    }

    $title = 'Stock Status';
    $data = [];

    $date_range = explode('to', $request->date_range);

    $start_date = !is_null($request->date_range)
        ? date('Y-m-d', strtotime($date_range[0]))
        : date('Y-m-01');

    $end_date = !is_null($request->date_range)
        ? date('Y-m-d', strtotime($date_range[1]))
        : date('Y-m-t');

    $store_ids = $request->has('store_id')
        ? (array)$request->store_id
        : Store::where('status', true)->pluck('id')->toArray();

    $product_ids = $request->has('product_id')
        ? (array)$request->product_id
        : Room::pluck('id')->toArray();

    if ($request->has('filter')) {

        $products = Room::whereIn('id', $product_ids)->get();

        // Production (IN)
        $productions = ProductionList::whereIn('product_id', $product_ids)
            ->whereIn('store_id', $store_ids)
            ->whereHas('production', function ($q) use ($start_date, $end_date) {
                $q->whereBetween('date', [$start_date, $end_date]);
            })->get();

        // Sales (OUT)
        $sales = SalesList::whereIn('product_id', $product_ids)
            ->whereIn('store_id', $store_ids)
            ->whereHas('sales', function ($q) use ($start_date, $end_date) {
                $q->whereBetween('date', [$start_date, $end_date]);
            })->get();

        // Sales Return (IN)
        $sales_returns = SalesReturnList::whereIn('product_id', $product_ids)
            ->whereIn('store_id', $store_ids)
            ->whereHas('return', function ($q) use ($start_date, $end_date) {
                $q->whereBetween('date', [$start_date, $end_date]);
            })->get();

        // Opening (Before start_date)
        $opening_productions = ProductionList::whereIn('product_id', $product_ids)
            ->whereIn('store_id', $store_ids)
            ->whereHas('production', function ($q) use ($start_date) {
                $q->where('date', '<', $start_date);
            })->get();

        $opening_sales = SalesList::whereIn('product_id', $product_ids)
            ->whereIn('store_id', $store_ids)
            ->whereHas('sales', function ($q) use ($start_date) {
                $q->where('date', '<', $start_date);
            })->get();

        $opening_sales_returns = SalesReturnList::whereIn('product_id', $product_ids)
            ->whereIn('store_id', $store_ids)
            ->whereHas('return', function ($q) use ($start_date) {
                $q->where('date', '<', $start_date);
            })->get();

        foreach ($products as $product) {

            $opening =
                $opening_productions->where('product_id', $product->id)->sum('qty')
                - $opening_sales->where('product_id', $product->id)->sum('qty')
                + $opening_sales_returns->where('product_id', $product->id)->sum('qty');

            $production = $productions->where('product_id', $product->id)->sum('qty');
            $sale = $sales->where('product_id', $product->id)->sum('qty');
            $sale_return = $sales_returns->where('product_id', $product->id)->sum('qty');

            $data[] = [
                'room_id' => $product->id,
                'product' => $product->name,
                'opening' => $product->capacity,
                'production' => $production,
                'sales' => $sale,
                'sales_return' => $sale_return,
                'stock' => $product->available
            ];
        }
    }

    if (!is_null($request->print)) {

        $report_title = 'Stock Status Report <br>
            <span class="text-sm">' .
            date('d-m-Y', strtotime($start_date)) .
            ' To ' .
            date('d-m-Y', strtotime($end_date)) .
            '</span>';

        $pdf = Pdf::loadView(
            'admin.reports.stock-status.print',
            compact('report_title', 'data')
        );

        return $pdf->stream('stock_status_' . date('d_m_Y_h_i_s') . '.pdf');
    }

    $stores = Store::where('status', true)
        ->orderBy('name', 'asc')
        ->get();

    return view(
        'admin.reports.stock-status.index',
        compact('title', 'stores', 'start_date', 'end_date', 'data')
    );
}


    public function voucherList(Request $request, voucherListDataTable $dataTable)
    {
        if ($request->ajax() && $request->has('getHeads')) {
            $value = $request->head_type;
            if ($value == 'gl') {
                $heads = CoaSetup::where('general', 1)->orderBy('head_name', 'asc')->get();
            } else {
                $heads = CoaSetup::whereNull('parent_id')->orderBy('head_name', 'asc')->get();
            }
            return response()->json(['status' => 'success', 'heads' => $heads]);
        }

        if (!is_null($request->print)) {
            $query = AccountTransaction::query();
            $voucher_type = $request->voucher_type;
            $date_range = explode('to', $request->date_range);
            $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
            $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
            if (!is_null($voucher_type)) {
                $query->where('voucher_type', $voucher_type);
            }
            if (!is_null($start_date) && !is_null($end_date)) {
                $query->where('date', '>=', $start_date)->where('date', '<=', $end_date);
            }

            $data = $query->select('*', DB::raw('SUM(debit_amount) as amount'))->orderBY('id', 'desc')
                ->orderBY('date', 'desc')
                ->groupBy('voucher_no')->get();
            $report_title = 'Voucher List';
            $pdf = Pdf::loadView('admin.reports.voucher-list.print', compact('report_title', 'data'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('voucher_list_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Voucher List';
        $voucher_types = AccountTransaction::groupBy('voucher_type')->orderBy('voucher_type', 'asc')->get();
        return $dataTable->render('admin.reports.voucher-list.index', compact('title', 'voucher_types'));
    }

    public function cashBook(Request $request)
    {
        $previousBalance = 0;
        $data = array();
        $coa_id = $request->coa_id;
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
        if ($request->has('filter')) {
            if (!is_null($request->coa_id)) {
                $previousBalance = AccountTransaction::where('coa_id', $request->coa_id)->where('date', '<', $start_date)->sum(DB::raw('debit_amount - credit_amount'));
                $data = AccountTransaction::where('coa_id', $request->coa_id)->where('date', '>=', $start_date)->where('date', '<=', $end_date)->orderBy('date', 'asc')->get();
            }
        }

        if (!is_null($request->print)) {
            $report_title = 'Cash book Report <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
            $pdf = Pdf::loadView('admin.reports.cash-book.print', compact('report_title', 'previousBalance', 'data'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('cash_book_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Cash Book';
        $coas = CoaSetup::where('transaction', 1)->where('head_code', 'LIKE', '10102%')->orderBy('head_name', 'asc')->get();
        return view('admin.reports.cash-book.index', compact('title', 'coas', 'start_date', 'end_date', 'previousBalance', 'data'));
    }

    public function bankBook(Request $request)
    {
        $previousBalance = 0;
        $data = array();
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
        if ($request->has('filter')) {
            if (!is_null($request->coa_id)) {
                $previousBalance = AccountTransaction::where('coa_id', $request->coa_id)->where('date', '<', $start_date)->sum(DB::raw('debit_amount - credit_amount'));
                $data = AccountTransaction::where('coa_id', $request->coa_id)->where('date', '>=', $start_date)->where('date', '<=', $end_date)->orderBy('date', 'asc')->get();
            }
        }

        if (!is_null($request->print)) {
            $report_title = 'Bank book Report <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
            $pdf = Pdf::loadView('admin.reports.bank-book.print', compact('report_title', 'previousBalance', 'data'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('bank_book_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Bank Book';
        $coas = CoaSetup::where('transaction', 1)->where('head_code', 'LIKE', '10103%')->orderBy('head_name', 'asc')->get();
        return view('admin.reports.bank-book.index', compact('title', 'coas', 'start_date', 'end_date', 'previousBalance', 'data'));
    }

    public function transactionLedger(Request $request)
    {
        $previousBalance = 0;
        $data = array();
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
        if ($request->has('filter')) {
            if (!is_null($request->coa_id)) {
                $previousBalance = AccountTransaction::where('coa_id', $request->coa_id)->where('date', '<', $start_date)->sum(DB::raw('debit_amount - credit_amount'));
                $data = AccountTransaction::where('coa_id', $request->coa_id)->where('date', '>=', $start_date)->where('date', '<=', $end_date)->orderBy('date', 'asc')->get();
            }
        }

        if (!is_null($request->print)) {
            $report_title = 'Transaction Ledger Report <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
            $pdf = Pdf::loadView('admin.reports.transaction-ledger.print', compact('report_title', 'previousBalance', 'data'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('transaction_ledger_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Transaction Ledger';
        $coas = CoaSetup::where('transaction', 1)->orderBy('head_name', 'asc')->get();
        return view('admin.reports.transaction-ledger.index', compact('title', 'coas', 'start_date', 'end_date', 'previousBalance', 'data'));
    }

    public function generalLedger(Request $request)
    {
        $previousBalance = 0;
        $data = array();
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
        if ($request->has('filter')) {
            if (!is_null($request->coa_id)) {
                $previousBalance = AccountTransaction::whereHas('coa', function ($query) use ($request) {
                    $query->where('parent_id', $request->coa_id);
                })->where('date', '<', $start_date)->sum(DB::raw('debit_amount - credit_amount'));
                $data = AccountTransaction::whereHas('coa', function ($query) use ($request) {
                    $query->where('parent_id', $request->coa_id);
                })->where('date', '>=', $start_date)->where('date', '<=', $end_date)->orderBy('date', 'asc')->get();
            }
        }

        if (!is_null($request->print)) {
            $report_title = 'General Ledger Report <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
            $pdf = Pdf::loadView('admin.reports.general-ledger.print', compact('report_title', 'previousBalance', 'data'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('general_ledger_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'General Ledger';
        $coas = CoaSetup::where('general', 1)->orderBy('head_name', 'asc')->get();
        return view('admin.reports.general-ledger.index', compact('title', 'coas', 'start_date', 'end_date', 'previousBalance', 'data'));
    }

    public function cashFlowStatement(Request $request)
    {
        $data = array();
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
        $generalLedgerHeadCash = 10102;
        $generalLedgerHeadBank = 10103;

        if ($request->has('filter')) {
            $data = AccountTransaction::where('date', '>=', $start_date)->where('date', '<=', $end_date)->groupBy('date')->orderBy('date', 'desc')->get('date');
        }

        if (!is_null($request->print)) {
            $report_title = 'Cash Flow Statement <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';;
            $pdf = Pdf::loadView('admin.reports.cash-flow-statement.print', compact('report_title', 'data', 'generalLedgerHeadCash', 'generalLedgerHeadBank'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('cash_flow_statement_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Cash Flow Statement';
        return view('admin.reports.cash-flow-statement.index', compact('title', 'start_date', 'end_date', 'data', 'generalLedgerHeadCash', 'generalLedgerHeadBank'));
    }

    public function trialBalance(Request $request)
    {
        $coaLists = array();
        $coaLists1 = array();
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
        if ($request->has('filter')) {
            $coaLists = TrialBalance::with('coa')->where('date', '>=', $start_date)->where('date', '<=', $end_date)->where('transaction', 1)->where('general', 1)->groupBy('coa_id')->select('*', DB::raw('SUM(debit_amount) as debit_amount'), DB::raw('SUM(credit_amount) as credit_amount'))->get();
            $coaLists1 = TrialBalance::with('parent_head')->where('date', '>=', $start_date)->where('date', '<=', $end_date)->where('transaction', 1)->where('general', 0)->groupBy('parent_id')->select('*', DB::raw('SUM(debit_amount) as debit_amount'), DB::raw('SUM(credit_amount) as credit_amount'))->get();
        }

        if (!is_null($request->print)) {
            $report_title = 'Trial Balance <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
            $pdf = Pdf::loadView('admin.reports.trial-balance.print', compact('report_title', 'coaLists', 'coaLists1'));
            return $pdf->stream('trial_balance_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Trial Balance';
        return view('admin.reports.trial-balance.index', compact('title', 'start_date', 'end_date', 'coaLists', 'coaLists1'));
    }

    public function incomeStatement(Request $request)
    {
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');

        $incomes = array();
        $expenses = array();
        if ($request->has('filter')) {
            $incomes = AccountTransaction::with('coa')
                ->where('date', '>=', $start_date)
                ->where('date', '<=', $end_date)
                ->whereHas('coa', function ($q) {
                    $q->whereIn('head_type', ['I']);
                })
                ->groupBy('coa_id')
                ->select('coa_head_code', 'coa_id', DB::raw('SUM(debit_amount) as debit_amount'), DB::raw('SUM(credit_amount) as credit_amount'))
                ->get();

            $expenses = AccountTransaction::with('coa')->select('*', DB::raw('SUM(debit_amount - credit_amount) as amount'))
                ->where('date', '>=', $start_date)
                ->where('date', '<=', $end_date)
                ->whereHas('coa', function ($q) {
                        $q->whereIn('head_type', ['E']);
                    })
                ->groupBy('coa_id')
                ->get();
        }

        if (!is_null($request->print)) {
            $report_title = 'Income Statement Report <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
            $pdf = Pdf::loadView('admin.reports.income-statement.print', compact('report_title', 'incomes', 'expenses'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('income_statement_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Income Statement';
        $print_buttons = '<button type="button" class="btn btn-sm btn-primary text-uppercase getPdf">Print</button>';
        return view('admin.reports.income-statement.index', compact('title', 'start_date', 'end_date', 'incomes', 'expenses', 'print_buttons'));
    }

    public function headDetails(Request $request)
    {
        if ($request->has('income_statement')) {
            $title = 'Head Transactions';
            $data = AccountTransaction::with('coa')
                ->where('date', '>=', $request->start_date)
                ->where('date', '<=', $request->end_date)
                ->where('coa_id', $request->coa_id)
                ->orderBy('date', 'asc')
                ->get();

            if ($request->has('details_print')) {
                $report_title = 'Head Transactions Details <br> <span class="text-sm">' . date('d-m-Y', strtotime($request->start_date)) . ' To ' . date('d-m-Y', strtotime($request->end_date)) . '</span>';
                $pdf = Pdf::loadView('admin.reports.income-statement.details_print', compact('report_title', 'data'));
                return $pdf->stream('transaction_details' . date('d_m_Y_h_i_s') . '.pdf');
            }
            return view('admin.reports.income-statement.details', compact('title', 'data'));
        }
        if ($request->has('balance_sheet')) {
            $title = 'Head Transactions';
            $data = AccountTransaction::with('coa')
                ->where('coa_id', $request->coa_id)
                ->orderBy('date', 'asc')
                ->get();

            if ($request->has('details_print')) {
                $report_title = 'Head Transactions Details <br> <span class="text-sm">' . date('d-m-Y', strtotime($request->start_date)) . ' To ' . date('d-m-Y', strtotime($request->end_date)) . '</span>';
                $pdf = Pdf::loadView('admin.reports.income-statement.details_print', compact('report_title', 'data'));
                return $pdf->stream('transaction_details' . date('d_m_Y_h_i_s') . '.pdf');
            }
            return view('admin.reports.income-statement.details', compact('title', 'data'));
        }

        $title = 'Head Transactions';
        $coa_ids = CoaSetup::where('parent_id', $request->id)->pluck('id')->toArray();
        $child_coa_ids = CoaSetup::whereIn('parent_id', $coa_ids)->pluck('id')->toArray();
        $coa_ids = array_merge($coa_ids, $child_coa_ids);
        $data = AccountTransaction::with('coa')->select('*', DB::raw('SUM(debit_amount) as debit_amount'), DB::raw('SUM(credit_amount) as credit_amount'))
            ->whereIn('coa_id', $coa_ids)
            ->groupBy('coa_id')
            ->orderBy('date', 'asc')
            ->get();

        if ($request->has('details_print')) {
            $report_title = 'Head Transactions Details';
            $pdf = Pdf::loadView('admin.reports.balance-sheet.details_print', compact('report_title', 'data'));
            return $pdf->stream('transaction_details' . date('d_m_Y_h_i_s') . '.pdf');
        }
        return view('admin.reports.balance-sheet.details', compact('title', 'data'));
    }

    public function balanceSheet(Request $request)
    {
        $assets = $this->assets('Assets');
        $liabilities = $this->assets('Liabilities');
        $currentPFL = $this->profitLoss();
        $data = [
            'assets' => $assets,
            'liabilities' => $liabilities,
            'currentPFL' => $currentPFL,
        ];

        if (!is_null($request->print)) {
            $report_title = 'Balance Sheet';
            $pdf = Pdf::loadView('admin.reports.balance-sheet.print', compact('report_title', 'data'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('balance_sheet_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Balance Sheet';
        $coas = CoaSetup::where('general', 1)->orderBy('head_name', 'asc')->get();
        return view('admin.reports.balance-sheet.index', compact('title', 'coas', 'data'));
    }

    public function getAmount($headCode)
    {
        $balance = 0;
        $headReports = TrialBalance::select('*')
            ->where('coa_head_code', 'LIKE', $headCode . '%')
            ->get();

        foreach ($headReports as $headReport) {
            if ($headReport->head_type == 'I' || $headReport->head_type == 'L') {
                $balance += $headReport->credit_amount - $headReport->debit_amount;
            } else {
                $balance += $headReport->debit_amount - $headReport->credit_amount;
            }
        }
        return $balance;
    }

    public function assets($parent_head)
    {
        $parents = CoaSetup::with('parent')->whereHas('parent', function ($query) use ($parent_head) {
            $query->where('head_name', $parent_head);
        })->orderBy('head_name', 'asc')->get();

        $info = [];
        foreach ($parents as $parent) {
            $childs = CoaSetup::select('head_name', 'head_code', 'id')
                ->where('parent_id', $parent->id)
                ->get();
            $childInfo = [];
            foreach ($childs as $child) {
                $childInfo[] = [
                    'id' => $child->id,
                    'headCode' => $child->head_code,
                    'headName' => $parent->head_name,
                    'name' => $child->head_name,
                    'amount' => $this->getAmount($child->head_code)
                ];
            }

            $info[] = [
                'id' => $parent->id,
                'headCode' => $parent->head_code,
                'head' => $parent->head_name,
                'childs' => $childInfo
            ];
        }
        return $info;
    }

    private function profitLoss()
    {
        $totalIncome = trialBalance::where('head_type', 'I')->sum(DB::raw('credit_amount - debit_amount'));
        $totalExpanse = trialBalance::where('head_type', 'E')->sum(DB::raw('debit_amount - credit_amount'));
        return $totalIncome - $totalExpanse;
    }

    public function dailyTransaction(Request $request)
    {
        $statements = [];

        $date_range = explode('to', $request->date_range);
        $start_date = $request->date_range ? date('Y-m-d', strtotime(trim($date_range[0]))) : date('Y-m-01');
        $end_date = $request->date_range ? date('Y-m-d', strtotime(trim($date_range[1]))) : date('Y-m-t');

        $dateRange = CarbonPeriod::create($start_date, $end_date);
        foreach ($dateRange as $date) {
            $d = $date->format('Y-m-d');
            $invoices = ServiceInvoice::with('items')->where('date', $d)->get();
            foreach ($invoices as $item) {
                $sparePartExpense = $item->items()->where('type', 'Spare Part')->sum('subtotal');
                $serviceIncome = $item->grand_total - $sparePartExpense;
                $serviceExpense = $item->items()->withSum('mechanics', 'charge')->get()->sum('mechanics_sum_charge');
                $row = [
                    'date' => $date->format('d-m-Y'),
                    'narration' => 'Daily Invoice Income Expense against invoice no - ' . $item->invoice_no,
                    'invoice_amount' => $item->grand_total,
                    'spare_part_expense' => $sparePartExpense,
                    'service_income' => $serviceIncome,
                    'service_expense' => $serviceExpense,
                    'service_profit' => $serviceIncome - $serviceExpense,
                    'operational_expense' => 0
                ];
                array_push($statements, $row);
            }
            $expenses = Expense::with('items')->where('date', $d)->get();
            foreach ($expenses as $item) {
                $row = [
                    'date' => $date->format('d-m-Y'),
                    'narration' => 'Daily Common Expense by transaction no - ' . $item->transaction_no,
                    'invoice_amount' => 0,
                    'spare_part_expense' => 0,
                    'service_income' => 0,
                    'service_expense' => 0,
                    'service_profit' => 0,
                    'operational_expense' => $item->amount
                ];
                array_push($statements, $row);
            }
        }

        $title = 'Daily Transaction';

        // ✅ Use HEREDOC syntax to store HTML safely
        $filter_form = <<<HTML
            <form action="{$request->url()}" method="GET">
                <div class="d-flex">
                    <input type="hidden" name="print" value="">
                    <input type="hidden" name="filter" value="1">
                    <input
                        type="text"
                        class="form-control date-range input-sm me-2"
                        name="date_range"
                        id="date_range"
                        placeholder="Select Date Range"
                        data-time-picker="true"
                        data-format="DD-MM-Y"
                        data-separator=" to "
                        autocomplete="off"
                        value="{$this->formatDateRange($start_date,$end_date)}"
                        style="max-width: 170px;"
                        required
                    >
                    <button type="submit" class="btn btn-sm btn-primary flex-shrink-0">Search</button>
                </div>
            </form>
        HTML;

        return view('admin.reports.daily-transaction.index', compact('title', 'filter_form', 'start_date', 'end_date', 'statements'));
    }

    // Helper method for cleaner formatting
    private function formatDateRange($start_date, $end_date)
    {
        return date('d-m-Y', strtotime($start_date)) . ' to ' . date('d-m-Y', strtotime($end_date));
    }

    public function investorStatement(Request $request)
    {
        $previous_balance = 0;
        $statements = [];
        $investor_id = $request->investor_id ?? null;
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');

        if ($request->has('filter') && $investor_id) {
            $investAmount = Invest::where('investor_id', $investor_id)->where('date', '<', $start_date)->where('sattled', false)->sum('amount');
            $profitAmount = MonthlyProfitList::where('investor_id', $investor_id)->whereHas('monthlyProfit', function ($query) use ($start_date) {
                $query->where('date', '<', $start_date);
            })->sum('profit_amount');
            $paymentAmount = InvestorPayment::where('investor_id', $investor_id)->where('date', '<', $start_date)->sum('amount');
            $previous_balance = $investAmount + $profitAmount - $paymentAmount;
            $balance = $previous_balance;
            $dateRange = CarbonPeriod::create($start_date, $end_date);
            foreach ($dateRange as $date) {
                $d = $date->format('Y-m-d');
                $invests = Invest::where('investor_id', $investor_id)->where('date', $d)->get();
                foreach ($invests as $item) {
                    $balance += $item->amount;
                    $row = [
                        'date' => $date->format('d-m-Y'),
                        'remarks' => 'Invest against invest no - ' . $item->invest_no,
                        'amount_in' => $item->amount,
                        'amount_out' => 0.00,
                        'balance' => $balance,
                    ];
                    array_push($statements, $row);
                }

                $profits = MonthlyProfitList::whereHas('monthlyProfit', function ($query) use ($d) {
                    $query->where('date', $d);
                })->where('investor_id', $investor_id)->get();
                foreach ($profits as $item) {
                    $balance += $item->profit_amount;
                    $row = [
                        'date' => $date->format('d-m-Y'),
                        'remarks' => 'Profit against serial no - ' . ($item->monthlyProfit->serial_no ?? ''),
                        'amount_in' => $item->profit_amount,
                        'amount_out' => 0.00,
                        'balance' => $balance,
                    ];
                    array_push($statements, $row);
                }

                $paymentsList = InvestorPayment::where('date', $d)->where('investor_id', $investor_id)->get();
                foreach ($paymentsList as $item) {
                    $balance -= $item->amount;
                    $row = [
                        'date' => $date->format('d-m-Y'),
                        'remarks' => 'Payment against payment no - ' . $item->payment_no,
                        'amount_in' => 0.00,
                        'amount_out' => $item->amount,
                        'balance' => $balance,
                    ];
                    array_push($statements, $row);
                }

                $sattlementsList = InvestSattlement::where('date', $d)->where('investor_id', $investor_id)->get();
                foreach ($sattlementsList as $item) {
                    $balance -= $item->amount;
                    $row = [
                        'date' => $date->format('d-m-Y'),
                        'remarks' => 'Invest Sattlement against Sattlement no - ' . $item->sattlement_no,
                        'amount_in' => 0.00,
                        'amount_out' => $item->amount,
                        'balance' => $balance,
                    ];
                    array_push($statements, $row);
                }
            }
        }

        if (!is_null($request->print) && $investor_id) {
            $investor = Investor::find($investor_id);
            $report_title = 'Investor Statement <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
            $pdf = Pdf::loadView('admin.reports.investor-statement.print', compact('report_title', 'investor', 'statements', 'previous_balance', 'start_date', 'end_date'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('investor_statement_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Investor Statement';
        $investors = Investor::orderBy('name', 'asc')->get();
        return view('admin.reports.investor-statement.index', compact('title', 'start_date', 'end_date', 'investors', 'statements', 'previous_balance'));
    }

    public function discountWallet(Request $request)
    {
        $previous_balance = 0;
        $statements = collect();
        $investor_id = $request->investor_id ?? null;
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');

        if ($request->has('filter') && $investor_id) {
            $previous_balance = ReferralWallet::where('investor_id', $investor_id)->where('date', '<', $start_date)->sum('amount');
            $statements = ReferralWallet::where('investor_id', $investor_id)->whereBetween('date', [$start_date, $end_date])->get();
        }

        if (!is_null($request->print) && $investor_id) {
            $investor = Investor::find($investor_id);
            $report_title = 'Discount Wallet <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
            $pdf = Pdf::loadView('admin.reports.discount-wallet.print', compact('report_title', 'investor', 'statements', 'previous_balance', 'start_date', 'end_date'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('discount_wallet' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Discount Wallet';
        $investors = Investor::orderBy('name', 'asc')->get();
        return view('admin.reports.discount-wallet.index', compact('title', 'start_date', 'end_date', 'investors', 'statements', 'previous_balance'));
    }
}
