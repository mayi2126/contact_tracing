<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Recensement extends Model
{
    use HasFactory;

    
    public function formationsanitaire(){
        return $this->belongsTo(Formationsanitaire::class, 'Idformationsanitaire');
    }

        
    public function village(){
        return $this->belongsTo(Village::class, 'Idvillage');
    }

        
    public function quartier(){
        return $this->belongsTo(Quartier::class, 'Idquartier');
    }
}
