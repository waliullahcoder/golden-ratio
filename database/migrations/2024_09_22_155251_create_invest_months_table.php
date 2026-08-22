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
        Schema::create('invest_months', function (Blueprint $table) {
            $table->id();
            $table->foreignId('invest_id')->nullable()->constrained()->onDelete('cascade');
            $table->foreignId('investor_id')->constrained()->onDelete('cascade');
            $table->string('type')->default('renew');
            $table->date('date')->nullable();
            $table->date('invest_month')->nullable();
            $table->string('month');
            $table->string('year');
            $table->integer('qty');
            $table->decimal('amount', 16, 0);
            $table->boolean('distributed')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('invest_months');
    }
};
