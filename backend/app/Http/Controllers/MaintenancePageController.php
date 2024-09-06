<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\District;
use App\Models\Region;
use DB;
use Illuminate\Support\Facades\DB as FacadesDB;

class MaintenancePageController extends Controller
{
    //
  public function showMaintenancePage()
    {
       $listRegions = FacadesDB::table('regions')->get(); //recupère tous les Régions
       
        $listDistrict = FacadesDB::table('districts')->get(); // recupère tous les districts
    
        $listcommune = FacadesDB::table('communes')->get(); // recupère tous les cepe

        $listfs = FacadesDB::table('formationsanitaires') ->get(); 
    
        $listvillage = FacadesDB::table('villages')->get(); // recupère tous les cepe

        $listquartier = FacadesDB::table('quartiers') -> get() ;//recupère tous les clients
        
        $listrecensements = FacadesDB::table('recensements')->get(); // recupère tous les cepe

        $listvillage = FacadesDB::table('villages')->get(); // recupère tous les cepe

        $data = [
          'listRegions' => $listRegions,
          'listDistrict' => $listDistrict,
          'listcommune' => $listcommune,
          'listfs' => $listfs,
          'listvillage' => $listvillage,
          'listquartier' => $listquartier,
          'listrecensements' => $listrecensements,
        ];

      //  return view('maintenance.maintenancepage')->with('listRegions',  $listRegions);
    
        return view('maintenance.maintenancepage', $data);
    }

    
}
