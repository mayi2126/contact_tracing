<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Motif extends Model
{
    use HasFactory;

    public function referencement(){
        return $this->hasMany(Referencement::class); //plusieurs instances de la table district dans la table cpecm
    }
}
