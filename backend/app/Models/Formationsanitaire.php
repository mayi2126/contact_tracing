<?php

namespace App\Models;

use App\Http\Controllers\ReferencementController;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Formationsanitaire extends Model
{
    use HasFactory;

    public function commune(){
        return $this->belongsTo(Commune::class, 'idcommunefs');
    }
  
    public function recensement(){
        return $this->hasMany(Recensement::class); //plusieurs instances de la table district dans la table cpecm
    }

    public function referencementcontre(){
        return $this->hasMany(Referencementcontre::class); //plusieurs instances de la table district dans la table cpecm
    }


    public function communebis(){
        return $this->hasMany(Commune::class); //plusieurs instances de la table district dans la table cpecm
    }

    public function village(){
        return $this->hasMany(Village::class); //plusieurs instances de la table district dans la table cpecm
    }

    public function referencement(){
        return $this->hasMany(ReferencementController::class); //plusieurs instances de la table district dans la table cpecm
    }

}
