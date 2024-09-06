<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Quartier extends Model
{
    use HasFactory;

    public function village(){
        return $this->belongsTo(Village::class, 'idvillagequartier'); //plusieurs instances de la table district dans la table cpecm
    }
  
    public function recensement(){
        return $this->hasMany(Recensement::class); //plusieurs instances de la table district dans la table cpecm
    }

    public function referencement(){
        return $this->hasMany(Referencement::class); //plusieurs instances de la table district dans la table cpecm
    }

}
