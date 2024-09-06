<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Recensementinfogeneral extends Model
{
    use HasFactory;

    protected $fillable = [
        'Idformationsanitaire',
        'Idvillage',
        'Idquartier',
        'daterecensement',
        'localisationgpsrec',
        'dateEnreg',
        'userEnreg',
    ];
    
}
