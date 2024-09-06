<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Commune extends Model
{
    use HasFactory;

    protected $fillable = ['nomCommune', 'iddistrictCom'];

    public function district(){
        return $this->belongsTo(District::class, 'iddistrictCom');
    }

    public function formationsanitaire(){
        return $this->hasMany(Formationsanitaire::class); //plusieurs instances de la table district dans la table cpecm
    }

    public function recensement(){
        return $this->belongsTo(Recensement::class, 'idcomSanitaire');
    }


}
