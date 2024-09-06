<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class District extends Model
{
    use HasFactory;

    public function region(){
        return $this->belongsTo(Region::class, 'IdregionDistrict');
    }

    public function recensement(){
        return $this->hasMany(Recensement::class); //plusieurs instances de la table district dans la table cpecm
    }

    public function commune(){
        return $this->hasMany(Commune::class); //plusieurs instances de la table district dans la table cpecm
    }

}
