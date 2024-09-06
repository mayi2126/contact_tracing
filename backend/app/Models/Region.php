<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Region extends Model
{
    use HasFactory;


    public function district(){
        return $this-> hasMany(district::class);
    }
        
    public function recensement(){
        return $this->hasMany(Recensement::class); //plusieurs instances de la table district dans la table cpecm
    }
    
}
