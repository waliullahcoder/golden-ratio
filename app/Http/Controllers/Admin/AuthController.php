<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use App\Models\Invest;
use App\Models\ProfitDistribution;
use App\Models\ProductionList;
use App\Models\Booking;
use App\Models\Room;
use App\Models\Sales;
use App\Models\SalesList;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class AuthController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (Auth::check()) {
            return redirect()->route('admin.dashboard');
        }

        return view('admin.auth.login');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function login(Request $request)
    {
        if ($request->isMethod('GET')) {
            return redirect()->route('admin.login.index');
        }

        $request->validate([
            'user_name' => 'required|string',
            'password' => 'required|string',
        ]);

        $user = User::where('user_name', $request->user_name)->where('status', 1)->first();
        if (!$user) {
            return redirect()->back()->withErrors('User does not exist or is inactive!')->withInput();
        }

        if (Auth::attempt($request->only('user_name', 'password'), $request->filled('remember'))) {
            $intendedUrl = Session::pull('url.intended', route('admin.dashboard'));
            return redirect()->intended($intendedUrl)->with('success', 'Logged in successfully!');
        }

        return redirect()->back()->withErrors('Invalid username or password!')->withInput();
    }

    public function dashboard(Request $request)
    {
        if ($request->ajax() && $request->get_investors) {
            $invests = Invest::with(['investor'])->where('product_id', $request->product_id)->groupBy('investor_id')->select('*', DB::raw('SUM(qty) as sumQty'), DB::raw('SUM(amount) as sumAmount'))->get();
            return response()->json([
                'status' => 'success',
                'data'   => view('admin.auth.investorlist-modal', compact('invests'))->render()
            ]);
        }

        $query = Room::where('status', true);
        if (Auth::user()->hasRole('Investor')) {
            $query->whereHas('invests', function ($query) {
                $query->where('investor_id', Auth::user()->investor->id);
            });
        }
        $rooms = $query->where('show_dashboard', true)->orderBy('serial', 'asc')->get();
        
        $data = [];
        foreach ($rooms as $item) {
            $sales = SalesList::where('product_id', $item->id)->get();
            $salesQty = round($sales->sum('qty'));
            $salesAmount = round(($sales->sum('net_amount')));
            $totalProfit = $salesQty * $item->profit;
            $totalShare = Invest::where('product_id', $item->id)->sum('qty');
            $sattledQty = Invest::where('product_id', $item->id)->where('sattled', true)->sum('qty');

            $distribution = ProfitDistribution::where('product_id', $item->id)->first();
            if($distribution){
                $productionQty  = $distribution->production_qty??0;
                $salesQty       = $salesQty??0;
                $salesAmount    = $distribution->sales_amount??0;
                $totalProfit    = $distribution->profit_amount??0;
            }

            $data[] = [
                'product'           => $item??[],
                'price_per_seat'    => $item->price??0,
                'production_qty'    => $item->capacity??0,
                'sales_qty'         => $salesQty??0,
                'sales_amount'      => $salesAmount??0,
                'investor_profit'   => $totalProfit??0,
                'share_qty'         => $totalShare??0,
                'sattled_qty'       => $sattledQty??0,
                'per_share_profit' => round($totalProfit > 0 && $item->required_share > 0 ? $totalProfit / $item->required_share : 0, 2)
            ];
        }

        if (Auth::user()->hasRole('Investor')) {
            return view('admin.auth.investor-dashbaord', compact('data'));
        } else {
            return view('admin.auth.dashbaord', compact('data'));
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
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
    public function edit()
    {
        return view('admin.profile.index');
    }

    public function changeImages(Request $request)
    {
        $user = Auth::user();

        $user->update([
            'cover_image' => $request->hasFile('cover_image') ? HelperClass::saveImage($request->cover_image, 1200, 'admin/avatar', $user->cover_image) : $user->cover_image,
            'image' => $request->hasFile('profile_image') ? HelperClass::saveImage($request->profile_image, 300, 'admin/avatar', $user->image) : $user->image,
        ]);

        return back()->withSuccessMessage('Images updated successfully!');
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        $user = Auth::user();

        $request->validate([
            'email' => 'required|email|unique:users,email,' . $user->id,
            'name' => 'required|string|max:255',
            'phone' => 'nullable|string|max:20',
            'address' => 'nullable|string|max:255',
        ]);

        $user->update($request->only(['name', 'email', 'phone', 'address']));

        return back()->withSuccessMessage('Information updated successfully!');
    }

    public function changePassword(Request $request)
    {
        $request->validate([
            'old_password' => 'required',
            'new_password' => 'required|string|min:8|confirmed',
        ]);

        $user = Auth::user();

        if (!Hash::check($request->old_password, $user->password)) {
            return back()->withErrors('Old password does not match!');
        }

        $user->update(['password' => bcrypt($request->new_password)]);

        return back()->withSuccessMessage('Password updated successfully!');
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->route('admin.login.index');
    }

    public function sidebar()
    {
        $key = 'session-sidebar';

        if (!Session::has($key)) {
            Session::put($key, 'session-sidebar');
        } else {
            Session::forget($key);
        }

        return response()->json(['status' => 'toggled']);
    }
}
