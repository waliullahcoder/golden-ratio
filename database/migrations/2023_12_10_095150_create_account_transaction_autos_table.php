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
        Schema::create('account_transaction_autos', function (Blueprint $table) {
            $table->id();
            $table->string('voucher_no');
            $table->string('voucher_type', 20);
            $table->date('date');
            $table->foreignId('coa_id')->constrained()->cascadeOnDelete();
            $table->bigInteger('coa_head_code');
            $table->text('narration')->nullable();
            $table->decimal('debit_amount', 16, 2)->default(0.00);
            $table->decimal('credit_amount', 16, 2)->default(0.00);
            $table->string('document')->nullable();
            $table->boolean('posted')->default(false);
            $table->boolean('approved')->default(false);
            $table->foreignId('approved_by')->nullable()->constrained('users')->nullOnDelete();
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
        Schema::dropIfExists('account_transaction_autos');
    }
};
