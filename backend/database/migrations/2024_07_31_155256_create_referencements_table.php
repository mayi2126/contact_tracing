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
        Schema::create('referencements', function (Blueprint $table) {
            $table->id()-> autoIncrement();
            $table->integer('idmenageRecensRef');
            $table->string('motifRef');
            $table->date('dateref');
            $table->integer('idAscRcRef');
            $table->integer('idFsref');
            $table->date('idquartierref');
            $table->integer('idvillageref');
            $table->integer('userenreg')-> nullable();
            $table->date('dateenreg')-> nullable();
            $table->integer('usermodif')-> nullable();
            $table->date('datemodif')-> nullable();
            $table->string('statutref')-> nullable();
            $table->string('commentaireref')-> nullable();
            $table->timestamps();     
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('referencements');
    }
};
