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
        Schema::create('invest_renews', function (Blueprint $table) {
            $table->id();
            $table->string('serial_no');
            $table->string('month');
            $table->string('year');
            $table->date('date')->nullable();
            $table->text('remarks')->nullable();
            $table->boolean('approved')->default(0);
            $table->string('status')->default('Pending');
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
        Schema::dropIfExists('invest_renews');
    }
};
