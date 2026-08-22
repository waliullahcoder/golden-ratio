<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\{
    AuthController,
    AdminController,
    CategoryController,
    CoaSetupController,
    DebitVoucherEntryController,
    CreditVoucherEntryController,
    JournalVoucherEntryController,
    VoucherApproveController,
    VoucherRejectController,
    AutomationApproveController,
    AutomationRejectController,
    InvestorController,
    InvestController,
    InvestRenewController,
    ProfitDistributionController,
    PaymentController,
    InvestSattlementController,
    ReportController,
    AdminSettingController,
    AdminMenuController,
    AdminMenuActionController,
    RoleController,
    PermissionController,
    SettingController,
    AdminBookingController,
    AdminServiceController,
    ProductionController,
    StoreController,
    ClientController,
    SalesOfficerController,
    SalesController,
    CollectionController,
    SalesReturnController,
    InvestorPaymentController,
    ExpenseController,
    ExpenseItemController,
    CoaController,
    DebitVoucherController,
    CreditVoucherController,
    JournalVoucherController
    

};

Route::middleware('guest')->group(function () {
    Route::get('/', [AuthController::class, 'index'])->name('login.index');
    Route::match(['get', 'post'], '/login', [AuthController::class, 'login'])->name('login');
});
Route::post('/sidebar', [AuthController::class, 'sidebar'])->name('sidebar');


Route::group(['middleware' => ['admin']], function () {
    Route::get('/dashboard', [AuthController::class, 'dashboard'])->name('dashboard');
    Route::get('/profile', [AuthController::class, 'edit'])->name('profile.index');
    Route::put('/change-images', [AuthController::class, 'changeImages'])->name('change-images');
    Route::put('/change-password', [AuthController::class, 'changePassword'])->name('change-password');
    Route::put('/profile', [AuthController::class, 'update'])->name('profile.update');
    Route::get('/logout', [AuthController::class, 'logout'])->name('logout');


     // Categpries
    Route::get('categories', [CategoryController::class,'index'])->name('categories.index');
    Route::post('categories/store', [CategoryController::class,'categoryStore'])->name('categories.store');
    Route::put('categories/{category}', [CategoryController::class,'categoryUpdate'])->name('categories.update');
    Route::delete('categories/{category}', [CategoryController::class,'categoryDelete'])->name('categories.destroy');

    // Rooms
    Route::get('rooms', [AdminController::class,'rooms'])->name('rooms');
    Route::post('rooms/store', [AdminController::class,'roomStore'])->name('rooms.store');
    Route::put('rooms/{room}', [AdminController::class,'roomUpdate'])->name('rooms.update');
    Route::delete('rooms/{room}', [AdminController::class,'roomDelete'])->name('rooms.destroy');

     // Production
    Route::resource('/production', ProductionController::class);
    Route::get('/production/{id}/print', [ProductionController::class, 'print'])->name('production.print');

     // Store
    Route::resource('/store', StoreController::class);

    // Profit Distribution
    Route::resource('/profit-distribution', ProfitDistributionController::class);

     // Expense
    Route::resource('/expense', ExpenseController::class);

    // Stock Status
    Route::get('/stock-status', [ReportController::class, 'stockStatus'])->name('stock-status.index');

    // Services
    Route::get('services', [AdminServiceController::class,'services'])->name('services.index');
    Route::post('services/store', [AdminServiceController::class,'serviceStore'])->name('services.store');
    Route::put('services/{service}', [AdminServiceController::class,'serviceUpdate'])->name('services.update');
    Route::delete('services/{service}', [AdminServiceController::class,'serviceDelete'])->name('services.destroy');

    // Bookings
    Route::get('bookings', [AdminController::class,'bookings'])->name('bookings');
    Route::get('bookings/{booking}', [AdminController::class,'bookingView'])->name('bookings.view');
    Route::post('bookings/{booking}/status', [AdminController::class,'bookingStatus'])->name('bookings.status');

    // Testimonials
    Route::get('testimonials', [AdminController::class,'testimonials'])->name('testimonials');
    Route::get('testimonials/create', [AdminController::class,'testimonialCreate'])->name('testimonials.create');
    Route::post('testimonials/store', [AdminController::class,'testimonialStore'])->name('testimonials.store');
    Route::get('testimonials/{testimonial}/edit', [AdminController::class,'testimonialEdit'])->name('testimonials.edit');
    Route::put('testimonials/{testimonial}', [AdminController::class,'testimonialUpdate'])->name('testimonials.update');
    Route::delete('testimonials/{testimonial}', [AdminController::class,'testimonialDelete'])->name('testimonials.delete');

    //Bookings
    Route::get('bookings', [AdminBookingController::class,'index'])->name('bookings.index');
    Route::put('bookings/{booking}', [AdminBookingController::class, 'update'])->name('bookings.update');
    
    
    
    
    
    
    
    
    
    //===================Accounting and Investors======================
    
    // Accounting
    Route::resource('/coa-setup', CoaSetupController::class);

    // Accounts Transaction
    // Chart of Account

    // Debit Voucher
    Route::resource('/debit-voucher', DebitVoucherController::class);
    Route::get('/debit-voucher/{id}/print', [DebitVoucherController::class, 'print'])->name('debit-voucher.print');

    // Credit Voucher
    Route::resource('/credit-voucher', CreditVoucherController::class);
    Route::get('/credit-voucher/{id}/print', [CreditVoucherController::class, 'print'])->name('credit-voucher.print');

    // Journal Voucher
    Route::resource('/journal-voucher', JournalVoucherController::class);
    Route::get('/journal-voucher/{id}/print', [JournalVoucherController::class, 'print'])->name('journal-voucher.print');

    // Voucher Approve
    Route::resource('/voucher-approve', VoucherApproveController::class);
    // Voucher Refuse
    Route::resource('/voucher-refuse', VoucherRejectController::class);
    // Automation Approve
    Route::resource('/automation-approve', AutomationApproveController::class);
    // Automation Refuse
    Route::resource('/automation-refuse', AutomationRejectController::class);

    // Investor
    Route::resource('/investor', InvestorController::class);

    // Invest
    Route::resource('/invest', InvestController::class);

     // Investor Payment
    Route::resource('/investor-payment', InvestorPaymentController::class);

    // Invest Renew
    Route::resource('/invest-renew', InvestRenewController::class);

    // Profit Distribute
    Route::resource('/profit-distribute', ProfitDistributionController::class);
    Route::get('/profit-distribute/{id}/print', [ProfitDistributionController::class, 'print'])->name('profit-distribute.print');

    // Investor Payment
    Route::resource('/payment', PaymentController::class);

 // Client
    Route::resource('/client', ClientController::class);

    // Sales Officer
    Route::resource('/sales-officer', SalesOfficerController::class);

    // Sales
    Route::resource('/sales', SalesController::class);

    // Collection
    Route::resource('/collection', CollectionController::class);

    // Sales Return
    Route::resource('/sales-return', SalesReturnController::class);

        // User
    Route::resource('/user', AdminController::class);
    Route::get('/user/{id}/password', [AdminController::class, 'changePassword'])->name('user.password');
    Route::put('/user/password/{id}', [AdminController::class, 'passwordUpdate'])->name('user.password.update');

    // Invest Sattlement
    Route::resource('/invest-sattlement', InvestSattlementController::class);
    // Reports
    Route::get('/coa-list', [ReportController::class, 'coaList'])->name('coa-list.index');
    Route::get('/voucher-list', [ReportController::class, 'voucherList'])->name('voucher-list.index');
    Route::get('/cash-book', [ReportController::class, 'cashBook'])->name('cash-book.index');
    Route::get('/bank-book', [ReportController::class, 'bankBook'])->name('bank-book.index');
    Route::get('/transaction-ledger', [ReportController::class, 'transactionLedger'])->name('transaction-ledger.index');
    Route::get('/cash-flow-statement', [ReportController::class, 'cashFlowStatement'])->name('cash-flow-statement.index');
    Route::get('/general-ledger', [ReportController::class, 'generalLedger'])->name('general-ledger.index');
    Route::get('/income-statement', [ReportController::class, 'incomeStatement'])->name('income-statement.index');
    Route::get('/trial-balance', [ReportController::class, 'trialBalance'])->name('trial-balance.index');
    Route::get('/balance-sheet', [ReportController::class, 'balanceSheet'])->name('balance-sheet.index');
    Route::get('/head-details', [ReportController::class, 'headDetails'])->name('head-details.index');

    Route::get('/daily-transaction', [ReportController::class, 'dailyTransaction'])->name('daily-transaction.index');
    Route::get('/investor-statement', [ReportController::class, 'investorStatement'])->name('investor-statement.index');
    Route::get('/discount-wallet', [ReportController::class, 'discountWallet'])->name('discount-wallet.index');


    //===================Accounting and Investors end======================



      // Admin Setting
    Route::resource('/admin-settings', AdminSettingController::class);

    // Admin Menu
    Route::resource('/admin-menu', AdminMenuController::class);

    // Admin Menu Actions
    Route::get('/admin-menu-action/{id}', [AdminMenuActionController::class, 'index'])->name('admin-menu-action.index');
    Route::get('/admin-menu-action/{id}/create', [AdminMenuActionController::class, 'create'])->name('admin-menu-action.create');
    Route::post('/admin-menu-action/{id}/store', [AdminMenuActionController::class, 'store'])->name('admin-menu-action.store');
    Route::get('/admin-menu-action/{id}/edit', [AdminMenuActionController::class, 'edit'])->name('admin-menu-action.edit');
    Route::put('/admin-menu-action/{id}', [AdminMenuActionController::class, 'update'])->name('admin-menu-action.update');
    Route::delete('/admin-menu-action/{id}', [AdminMenuActionController::class, 'destroy'])->name('admin-menu-action.destroy');

    // Role
    Route::resource('/role', RoleController::class);

    // Permission
    Route::get('/permission/{id}/edit', [RoleController::class, 'rolePermissionEdit'])->name('role-permission.edit');
    Route::put('/permission/{id}', [RoleController::class, 'rolePermissionUpdate'])->name('role-permission.update');

      // Settings
    Route::resource('/settings', SettingController::class);
});

