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
        Schema::create('sales_lists', function (Blueprint $table) {
            $table->id();
            $table->foreignId('sales_id')->constrained()->cascadeOnDelete();
            $table->foreignId('client_id')->constrained()->cascadeOnDelete();
            $table->foreignId('store_id')->constrained()->cascadeOnDelete();
            $table->foreignId('product_id')->constrained()->cascadeOnDelete();
            $table->foreignId('product_edition_id')->nullable()->constrained()->nullOnDelete();
            $table->decimal('price', 16, 2);
            $table->decimal('commission', 16, 2)->default(0.00);
            $table->decimal('commission_amount', 16, 2)->default(0.00);
            $table->decimal('rate', 16, 2);
            $table->decimal('qty', 16, 2);
            $table->decimal('amount', 16, 2);
            $table->decimal('discount', 16, 2)->default(0.00);
            $table->decimal('net_amount', 16, 2)->default(0.00);
            $table->decimal('return_qty', 16, 2)->default(0.00);
            $table->decimal('return_amount', 16, 2)->default(0.00);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sales_lists');
    }
};
