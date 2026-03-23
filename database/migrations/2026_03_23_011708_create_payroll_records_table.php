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
        Schema::create('payroll_records', function (Blueprint $table) {
            $table->id();
            $table->string('payroll_code')->nullable()->unique();

            $table->foreignId('payroll_period_id')->constrained()->cascadeOnDelete();

            $table->string('employee_id', 6);
            $table->foreign('employee_id')->references('employee_id')->on('employees')->cascadeOnDelete();

            $table->decimal('basic_salary', 12, 2);
            $table->decimal('gross_pay', 12, 2);
            $table->decimal('total_earnings', 12, 2)->default(0);
            $table->decimal('total_deductions', 12, 2)->default(0);
            $table->decimal('net_pay', 12, 2);

            $table->enum('status', ['draft','review','approval','paid'])->default('draft');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('payroll_records');
    }
};
