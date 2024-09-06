<?php

namespace App\Http\Controllers;

use App\Models\Formationsanitaire;
use App\Models\Village;
use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\DB as FacadesDB;

class VillageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $village = Village::all(); //recupère tous les clients
        return view('maintenance.villageView.index', compact('village'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $listfs = FacadesDB::table('formationsanitaires')  -> get() ;// -> groupBy('id') recupère tous les clients
        return view('maintenance.villageView.create')-> with('listfs',  $listfs);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request ->validate([
            'nomvillage' =>['required', 'Unique:villages'],
            'idfsvillage' =>'required',
        ]);
          $village = new Village;
          $village -> nomvillage = $request -> nomvillage;  
          $village -> idfsvillage = intval($request ->  idfsvillage);  
          $village -> save();   

          return redirect()
          -> route('village.index') //methode de controleur
          -> with('success','Village  créé avec succès');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function show($id)
    {
        $village = Village::findOrFail($id); // Récupération du district spécifique depuis la base de données
        $allformationsanitaire = Formationsanitaire::all(); // Récupération de tous les regions pour la zone de liste déroulante
        // return view('village.show', compact('village')); 
         return view('maintenance.villageView.show', compact('village', 'allformationsanitaire'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request ->validate([
            'nomvillage' =>['required', 'Unique:villages'],
            'idfsvillage' =>'required',
        ]);

          $village = Village::find($id);
          $village -> nomvillage = $request -> nomvillage;  
          $village -> idfsvillage = intval($request ->  idfsvillage);  
          $village -> save();   

          return redirect()
          -> route('village.index') //methode de controleur
          -> with('success','Village  créé avec succès');

    // si tout se passe bien on retourne cette fonction qui est la page de la liste des articles
    return redirect()
    -> route('village.index') //methode de controleur
    -> with('success','village modifiée avec succès');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Village::find($id)->delete();
        return redirect()
        -> route('village.index')
        -> with('success','Village supprimé avec succès');
    }
}
