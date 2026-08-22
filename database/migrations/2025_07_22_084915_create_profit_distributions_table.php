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
        Schema::create('profit_distributions', function (Blueprint $table) {
            $table->id();
            $table->string('serial_no')->unique();
            $table->integer('year');
            $table->string('month');
            $table->date('date');
            $table->foreignId('product_id')->constrained()->cascadeOnDelete();
            $table->decimal('invest_qty', 16, 0);
            $table->decimal('invest_amount', 16, 0);
            $table->decimal('profit_amount', 16, 0);
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
        Schema::dropIfExists('profit_distributions');
    }
};
