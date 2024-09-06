<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('formationsanitaires', function (Blueprint $table) {
            $table->id()-> autoIncrement();
            $table->string('libcpecm');

            $table->foreignId('idcommunefs')->constrained('communes');
           // $table->integer('idDistrictcpecm'); // cles etrangere
            $table->string('codecpecm')->unique(); //a generer
    
            $table->string('typecentre')->nullable(); //a generer
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('formationsanitaires');
    }
};
