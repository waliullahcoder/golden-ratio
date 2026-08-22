<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Slider;
use App\Models\HomeSection;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\User;
use App\Models\Client;
use App\Models\CoaSetup;
use App\Models\Booking;
use App\Models\Room;
use App\Models\Collection;
use App\Models\CollectionList;
use App\Models\Sales;
use App\Models\SalesList;
use App\Models\ExpenseItem;
use App\HelperClass;
use App\Http\Controllers\Controller;
use App\Services\FrontEndService;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use RealRashid\SweetAlert\Facades\Alert;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Session;
class UserController extends Controller
{
    protected $frontEndService;
    public function __construct(FrontEndService $frontEndService)
    {
        $this->frontEndService = $frontEndService;
    }

    public function signinPost(Request $request)
    {
        $request->validate([
            'email'    => 'required|email',
            'password' => 'required',
        ]);

        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {

            if (auth()->user()->role_status != 0) {
                Auth::logout();
                return redirect()->back()->with('success', 'You are not allowed here');
            }
            //Booking pending after login booking confirmed
           
        /* 🔥 LOGIN SUCCESS — CHECK PENDING BOOKING */
        if (Session::has('pending_booking')) {

            $data = Session::get('pending_booking');
            $room = Room::findOrFail($data['room_id']);

            DB::transaction(function () use ($data, $room) {

                Booking::create([
                    'user_id'     => Auth::id(),
                    'room_id'     => $room->id,
                    'check_in'    => $data['check_in'],
                    'check_out'   => $data['check_out'],
                    'guests'      => $data['guests'],
                    'total_price' => $room->price * $data['guests'],
                    'status'      => 'pending',
                ]);

                // capacity কমানো
                $room->decrement('available', $data['guests']);
            });

            Session::forget('pending_booking');

            return redirect()
                ->route('booking.index')
                ->with('success', 'Booking confirmed successfully after login 🎉');
        }


            return redirect()->route('frontend.user.dashboard')->with('success', 'Logged in successfully');
        }

        return back()
            ->withErrors(['email' => 'Invalid email or password'])
            ->withInput();
    }


        public function signupPost(Request $request)
        {
           
            $request->validate([
                'name'     => 'required|string|max:255',
                'email'    => 'required|email|unique:users,email',
                'phone' => 'required|min:11',
                'password' => 'required|min:6|confirmed', // 👈 confirm handled here
            ]);

             try {
        DB::transaction(function () use ($request) {

        
            $user = User::create([
                'name'        => $request->name,
                'phone'        => $request->phone,
                'user_name'   => strtolower(str_replace(' ', '', $request->name)),
                'email'       => $request->email,
                'password'    => Hash::make($request->password),
                'role_status' => 0,
            ]);
            Auth::login($user);

            // ================= CLIENT CREATE FIRST =================
            $client = Client::create([
                'user_id'        => $user->id,
                'region_id'      => 1,
                'area_id'        => 1,
                'territory_id'   => 1,
                'code'           => 'code'.$request->name,
                'name'           => $request->name,
                'contact_person' => $request->name,
                'phone'          => $request->phone,
                'email'          => $request->email,
                'address'        => $request->phone,
                'bin_no'         => null,
                'credit_limit'   => 0,
                'created_by'     => Auth::id(),
            ]);
            // ================= COA CREATE USING CLIENT ID =================
            $parent = CoaSetup::findOrFail(4);

            $account = CoaSetup::create([
                'parent_id'   => $parent->id,
                'head_code'   => $client->id, // 🔥 Client ID as Head Code
                'head_name'   => $client->name,
                'transaction' => true,
                'general'     => false,
                'head_type'   => 'E',
                'status'      => true,
                'updateable'  => false,
                'created_by'  => Auth::id(),
            ]);

            // ================= UPDATE CLIENT WITH COA ID =================
            $client->update([
                'coa_id' => $account->id
            ]);

        });

    } catch (\Exception $e) {
        return back()->withErrors($e->getMessage());
    }

            return redirect()
                ->route('frontend.user.dashboard')
                ->with('success', 'Welcome 🎉 Account created successfully');
        }


    public function dashboard()
    {
        if (auth()->user()->role_status != 0) {
            abort(403);
        }
        $client = Client::where('user_id', Auth::id())->first();

        $orders = Booking::where('user_id', Auth::id())->get();
        $orders_count = Booking::where('user_id', Auth::id())->count();

        $sales = Sales::where('client_id', $client->id)->get();
        $sales_count = SalesList::where('client_id', $client->id)->sum('qty');
        $sales_amount = SalesList::where('client_id', $client->id)->sum('net_amount');

        $expenses = ExpenseItem::where('client_id', $client->id)->get();
        $expense_amount = ExpenseItem::where('client_id', $client->id)->sum('amount');

        $collections = Collection::where('client_id', $client->id)->get();
        $collection_amount = Collection::where('client_id', $client->id)->sum('amount');

        return view('frontend.user.dashboard', compact(
            'orders',
            'sales',
            'sales_count',
            'sales_amount',
            'expenses',
            'expense_amount',
            'collections',
            'orders_count',
            'client',
            'collections',
            'collection_amount'
            ));
    }

    public function updateEditProfile()
    {
        //$menus = $this->frontEndService->getMenu();
        return view('frontend.user.profile_edit');
    }

    public function bookingList(Request $request)
        {
            $query = Booking::where('user_id', auth()->id());
            // 🔍 Search by order number or status
            
            if ($request->filled('search')) {
                $search = str_replace('ORDNO', '', $request->search);
              //  dd($search, $request->search);
                $query->where(function ($q) use ($search) {
                    $q->where('id', 'like', '%' . $search . '%')
                    ->orWhere('status', 'like', '%' . $search . '%');
                });
            }

            $bookings = $query->latest()->paginate(100)->withQueryString();

            return view('frontend.order.orderList', compact('bookings'));
        }

        public function walletHistory(Request $request)
        {
            if (auth()->user()->role_status != 0) {
            abort(403);
            }
            $client = Client::where('user_id', Auth::id())->first();
            $sales = SalesList::where('client_id', $client->id)->get();
            $expenses = ExpenseItem::where('client_id', $client->id)->get();
            return view('frontend.user.walletHistory', compact('sales','expenses'));
        }

       public function show(Booking $order)
        {
            abort_if($order->user_id !== auth()->id(), 403);

            $order->load('room');

            return view('frontend.order.show', compact('order'));
        }

        public function invoice(Booking $order)
        {
            abort_if($order->user_id !== auth()->id(), 403);

            $order->load('room');

            return view('frontend.order.invoice', compact('order'));
        }




        public function updateProfile(Request $request)
        {
            $user = Auth::user();

            $request->validate([
                'name'  => 'required|string|max:255',
                'email' => 'required|email|unique:users,email,' . $user->id,
                'phone' => 'nullable|string|max:20',
                'image' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
            ]);

            $user->name  = $request->name;
            $user->email = $request->email;
            $user->phone = $request->phone;
            $user->address = $request->address;

            /* ===== IMAGE UPDATE ===== */
            if ($request->hasFile('image')) {

                // delete old image
                if ($user->image && Storage::disk('public')->exists($user->image)) {
                    Storage::disk('public')->delete($user->image);
                }

                // save new image
                $user->image = HelperClass::saveImage(
                    $request->file('image'),
                    800,
                    'users/profile',
                    $user->image
                );
            }
            $user->save();

            return back()->with('success', 'Profile updated successfully');
        }




    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->route('auth.signinPage')->with('success', 'You have been logged out successfully');
    }

    
}