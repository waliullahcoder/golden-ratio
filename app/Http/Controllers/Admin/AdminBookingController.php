<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;
use App\Models\Room;
use App\Models\Service;
use App\Models\Category;
use App\Models\Booking;
use App\Models\Testimonial;
use App\Models\CoaSetup;
use App\Models\Client;
use App\Models\Sales;
use App\Models\SalesList;
use App\Models\AccountTransactionAuto;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
class AdminBookingController extends Controller
{
 

public function index(Request $request)
{
    if($request->ajax()){
        $bookings = Booking::with(['room','user'])->select('bookings.*')
        ->orderBy('id', 'desc');

        return DataTables::of($bookings)
            ->addIndexColumn()
            ->addColumn('room_id', fn($b) => 'BOOKID'.$b->id ?? '-')
            ->addColumn('room_name', fn($b) => $b->room->name ?? '-')
            ->addColumn('user_name', fn($b) => $b->user->name ?? '-')
            ->addColumn('booked', fn($b) => $b->guests ?? '-')
            ->addColumn('available', fn($b) => $b->room->available ?? '-')
            ->addColumn('capacity', fn($b) => $b->room->capacity ?? '-')
            ->addColumn('status_badge', function($b){
                $color = match($b->status){
                    'pending'=>'warning',
                    'confirmed'=>'primary',
                    'checked_in'=>'success',
                    'checked_out'=>'secondary',
                    'cancelled'=>'danger',
                    default=>'info',
                };
                return '<span class="badge bg-'.$color.'">'.ucfirst(str_replace('_',' ',$b->status)).'</span>';
            })
            ->addColumn('action', function ($b) {
            $reservationBtn = '';
            if (!in_array($b->status, ['cancelled', 'checked_out'])) {
                $reservationBtn = '
                <button class="btn btn-sm btn-primary editBookingBtn"
                    data-id="'.$b->id.'"
                    data-status="'.$b->status.'">
                    Reservation
                </button>';
            }
            return '
                '.$reservationBtn.'
                <button class="btn btn-sm btn-success viewBookingBtn"
                    data-room="'.($b->room->name ?? '-').'"
                    data-user="'.($b->user->name ?? '-').'"
                    data-guests="'.$b->guests.'"
                    data-booked="'.($b->guests ?? '-').'"
                    data-available="'.($b->room->available ?? '-').'"
                    data-capacity="'.($b->room->capacity ?? '-').'"
                    data-checkin="'.$b->check_in.'"
                    data-checkout="'.$b->check_out.'"
                    data-total="'.$b->total_price.'"
                    data-status="'.$b->status.'">
                    <i class="fa fa-eye"></i>
                </button>
            ';
            })
            ->rawColumns(['status_badge','action'])
            ->make(true);
    }
    return view('admin.bookings.index');
}


  public function invoiceNo()
    {
        $data = Sales::withTrashed()->select(['invoice'])->whereDate('created_at', '>=', date('Y-m-01'))->whereDate('created_at', '<=', date('Y-m-t'))->orderBy('id', 'desc')->first();
        if ($data) {
            $trim = (int)str_replace("CS", '', $data->invoice) + 1;
            return "CS" . $trim;
        } else {
            return "CS" . date('ym') . '001';
        }
    }
   public function update(Request $request, Booking $booking)
    {
        $request->validate([
            'status' => 'required'
        ]);

        $oldStatus = $booking->status;
        $newStatus = $request->status;

        // Only when status is changing
        if ($oldStatus !== $newStatus && !in_array($oldStatus, ['cancelled', 'checked_out']) ) {
            // If booking is checked_out or cancelled
            if (in_array($newStatus, ['checked_out', 'cancelled'])) {
                // Increase room capacity by guests count
                if ($booking->room) {
                    $booking->room->increment('available', $booking->guests);
                }
            }

            
           if (in_array($newStatus, ['confirmed', 'checked_in'])) {

            $client = Client::where('user_id', $booking->user_id)->first();

            if (!$client) {
                dd('Client not found');
            }

            try {

                DB::transaction(function () use ($request, $booking, $client) {

                    $income_head = CoaSetup::where('head_name', 'Income')
                                        ->where('head_type', 'I')
                                        ->first();

                    if (!$income_head) {
                        throw new \Exception("Income head not found");
                    }

                    // ================= Create Sales =================
                    $sale = Sales::create([
                        'client_id'        => $client->id,
                        'store_id'         => 1,
                        'sales_officer_id' => null,
                        'coa_id'           => $income_head->id,
                        'sale_type'        => 'Credit',
                        'invoice'          => $this->invoiceNo(),
                        'date'             => date('Y-m-d', strtotime($request->date)),
                        'amount'           => $booking->total_price,
                        'discount'         => 0,
                        'net_amount'       => $booking->total_price,
                        'paid'             => 0,
                        'remarks'          => "Booking No # {$booking->id}",
                        'created_by'       => Auth::id(),
                    ]);

                    // ================= Create SalesList =================
                    if ($booking->room_id) {

                        SalesList::create([
                            'sales_id'          => $sale->id,
                            'store_id'          => 1,
                            'client_id'         => $client->id,
                            'product_id'        => $booking->room_id,
                            'price'             => $booking->total_price,
                            'commission'        => 0,
                            'commission_amount' => 0,
                            'rate'              => $booking->total_price,
                            'qty'               => $booking->guests,
                            'amount'            => $booking->total_price,
                            'discount'          => 0,
                            'net_amount'        => $booking->total_price,
                        ]);
                    }

                    // ================= Account Transaction =================
                    if ($client->coa) {

                        $postData = [

                            // Debit (Client Account)
                            [
                                'voucher_no'     => $sale->invoice,
                                'voucher_type'   => "Client Sales",
                                'date'           => date('Y-m-d', strtotime($request->date)),
                                'coa_id'         => $client->coa_id,
                                'coa_head_code'  => $client->coa->head_code,
                                'narration'      => 'Client Sales Against Invoice No - ' . $sale->invoice,
                                'debit_amount'   => $booking->total_price,
                                'credit_amount'  => 0,
                                'created_by'     => Auth::id(),
                                'created_at'     => now(),
                                'updated_at'     => now(),
                            ],

                            // Credit (Income Account)
                            [
                                'voucher_no'     => $sale->invoice,
                                'voucher_type'   => "Client Sales",
                                'date'           => date('Y-m-d', strtotime($request->date)),
                                'coa_id'         => $income_head->id,
                                'coa_head_code'  => $income_head->head_code,
                                'narration'      => 'Client Sales Against Invoice No - ' . $sale->invoice,
                                'debit_amount'   => 0,
                                'credit_amount'  => $booking->total_price,
                                'created_by'     => Auth::id(),
                                'created_at'     => now(),
                                'updated_at'     => now(),
                            ]
                        ];

                        AccountTransactionAuto::insert($postData);
                    }

                });

            } catch (\Exception $e) {
                dd($e->getMessage());
            }
        
            }
           }
        // Update booking status
        $booking->update([
            'status' => $newStatus
        ]);

        return back()->with('success', 'Booking status updated successfully');
    }



}