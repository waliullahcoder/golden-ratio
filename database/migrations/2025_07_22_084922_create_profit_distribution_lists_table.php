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
        Schema::create('profit_distribution_lists', function (Blueprint $table) {
            $table->id();
            $table->foreignId('profit_distribution_id')->constrained()->cascadeOnDelete();
            $table->foreignId('invest_id')->constrained()->cascadeOnDelete();
            $table->foreignId('investor_id')->constrained()->cascadeOnDelete();
            $table->foreignId('product_id')->constrained()->cascadeOnDelete();
            $table->decimal('profit_per_sale', 16, 0);
            $table->decimal('sales_qty', 16, 0);
            $table->decimal('invest_qty', 16, 0);
            $table->decimal('invest_amount', 16, 0);
            $table->decimal('amount', 16, 0);
            $table->decimal('paid_amount', 16, 0)->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('profit_distribution_lists');
    }
};
