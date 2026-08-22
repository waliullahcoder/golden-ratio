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
        Schema::create('invests', function (Blueprint $table) {
            $table->id();
            $table->foreignId('investor_id')->constrained()->cascadeOnDelete();
            $table->foreignId('product_id')->constrained()->cascadeOnDelete();
            $table->string('invest_no')->unique();
            $table->date('date');
            $table->integer('qty');
            $table->decimal('amount', 16, 0);
            $table->string('deposit_type')->nullable();
            $table->string('bkash')->nullable();
            $table->string('rocket')->nullable();
            $table->string('nagad')->nullable();
            $table->string('bank_account')->nullable();
            $table->text('remarks')->nullable();
            $table->boolean('approved')->default(false);
            $table->boolean('sattled')->default(false);
            $table->foreignId('coa_id')->constrained();
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
        Schema::dropIfExists('invests');
    }
};
