<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::create('payroll_items', function (Blueprint $table) {
            $table->id(); // BIGINT UNSIGNED
            $table->foreignId('payroll_record_id')
                  ->constrained('payroll_records')
                  ->cascadeOnDelete(); // references payroll_records.id

            $table->enum('type', ['earning', 'deduction']);
            $table->string('name', 100);
            $table->decimal('amount', 12, 2);

            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('payroll_items');
    }
};