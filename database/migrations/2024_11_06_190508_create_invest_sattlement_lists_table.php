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
        Schema::create('invest_sattlement_lists', function (Blueprint $table) {
            $table->id();
            $table->foreignId('invest_sattlement_id')->constrained()->onDelete('cascade');
            $table->foreignId('invest_id')->constrained()->onDelete('cascade');
            $table->integer('qty');
            $table->decimal('amount', 16, 0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('invest_sattlement_lists');
    }
};
