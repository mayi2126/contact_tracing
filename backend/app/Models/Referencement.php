<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Referencement extends Model
{
    use HasFactory;

    public function village(){
        return $this->belongsTo(Village::class, 'idvillageref');
    }

    public function formationsanitaire(){
        return $this->belongsTo(Formationsanitaire::class, 'Idformationsanitaire');
    }

    public function quartier(){
        return $this->belongsTo(Quartier::class, 'idquartierref');
    }

    public function motif(){
        return $this->belongsTo(Motif::class, 'idmotifRef');
    }

    public function profession(){
        return $this->belongsTo(Profession::class, 'idprofessionref');
    }

  
}
