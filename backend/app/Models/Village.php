<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Village extends Model
{
    use HasFactory;

    public function quartier(){
        return $this->hasMany(Quartier::class);
    }

    public function formationsanitaire(){
        return $this->belongsTo(Formationsanitaire::class, 'idfsvillage');
    }

    public function formationsanitaire2(){
        return $this->hasMany(Formationsanitaire::class); //plusieurs instances de la table district dans la table cpecm
    }
  
    public function recensement(){
        return $this->hasMany(Recensement::class); //plusieurs instances de la table district dans la table cpecm

    }

    public function referencement(){
        return $this->hasMany(Referencement::class); //plusieurs instances de la table district dans la table cpecm
    }
}
