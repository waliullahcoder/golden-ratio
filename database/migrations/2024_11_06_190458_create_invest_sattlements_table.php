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
        Schema::create('invest_sattlements', function (Blueprint $table) {
            $table->id();
            $table->foreignId('investor_id')->constrained()->onDelete('cascade');
            $table->string('sattlement_no');
            $table->date('date')->nullable();
            $table->integer('qty');
            $table->decimal('amount', 16, 0);
            $table->string('payment_type');
            $table->text('remarks')->nullable();
            $table->boolean('approved')->default(0);
            $table->string('status')->default('Pending');
            $table->foreignId('coa_id')->nullable();
            $table->foreignId('created_by')->nullable();
            $table->foreignId('updated_by')->nullable();
            $table->foreignId('deleted_by')->nullable();
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('invest_sattlements');
    }
};
