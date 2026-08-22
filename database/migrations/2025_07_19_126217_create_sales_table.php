<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('sales', function (Blueprint $table) {
            $table->id();
            $table->foreignId('client_id')->constrained()->cascadeOnDelete();
            $table->foreignId('store_id')->nullable()->constrained()->cascadeOnDelete();
            $table->foreignId('sales_officer_id')->nullable()->constrained()->cascadeOnDelete();
            $table->foreignId('coa_id')->nullable()->constrained()->nullOnDelete();
            $table->enum('sale_type', ['Credit', 'Cash'])->default('Credit');
            $table->string('invoice')->unique();
            $table->string('date');
            $table->decimal('amount', 16, 2);
            $table->decimal('discount', 16, 2)->default(0.00);
            $table->decimal('net_amount', 16, 2);
            $table->decimal('paid', 16, 2)->default(0.00);
            $table->decimal('return_amount', 16, 2)->default(0.00);
            $table->decimal('return_paid', 16, 2)->default(0.00);
            $table->text('remarks')->nullable();
            $table->foreignId('created_by')->nullable()->constrained('users')->nullOnDelete();
            $table->foreignId('updated_by')->nullable()->constrained('users')->nullOnDelete();
            $table->foreignId('deleted_by')->nullable()->constrained('users')->nullOnDelete();
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sales');
    }
};
