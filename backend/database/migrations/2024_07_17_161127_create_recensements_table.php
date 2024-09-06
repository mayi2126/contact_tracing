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
        Schema::create('recensements', function (Blueprint $table) {
            $table->id()-> autoIncrement();
            $table->string('nummenagerec');
            $table->string('nomchefmenagerec');
            $table->string('prenomchefmenagerec');
            $table->string('membrenomrec');
            $table->string('membreprenomrec');
            $table->date('membredatenaissrec');
            $table->integer('membreagerec');
            $table->string('membrefarec')-> nullable();
            $table->string('membreferec')-> nullable();
            $table->string('membreafrec')-> nullable();
            $table->string('sexezerovingtquatremoisrec')-> nullable();
            $table->string('contactrec')-> nullable();
            $table->string('observationrec')-> nullable();
            

            $table->foreignId('Idregion')->constrained('regions');
            $table->foreignId('Iddistrict')->constrained('districts');
            $table->foreignId('Idcommune')->constrained('communes');
            $table->foreignId('Idformationsanitaire')->constrained('formationsanitaires');
            $table->foreignId('Idvillage')->constrained('villages');
            $table->foreignId('Idquartier')->constrained('quartiers');
            $table->string('localisationgpsrec')-> nullable();
            $table->date('daterecensement');

            $table->string('Numtransfert')-> nullable();
            $table->date('dateEnreg');
            $table->date('dateModif')-> nullable();
            $table->integer('userEnreg');
            $table->integer('userModif')-> nullable();
      
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
        Schema::dropIfExists('recensements');
    }
};
