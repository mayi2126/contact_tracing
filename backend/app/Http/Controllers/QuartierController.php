<?php

namespace App\Http\Controllers;

use App\Models\Quartier;
use App\Models\Village;
use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\DB as FacadesDB;

class QuartierController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $quartier = Quartier::all(); //recupère tous les clients
        return view('maintenance.quartierView.index', compact('quartier'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $listvillage = FacadesDB::table('villages')     -> get() ;
        return view('maintenance.quartierView.create')-> with('listvillage',  $listvillage);
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
            'nomquartier' =>['required', 'Unique:quartiers'],
            'idvillagequartier' =>'required',
        ]);
          $quartier = new Quartier;
          $quartier -> nomquartier = $request -> nomquartier;  
          $quartier -> idvillagequartier = intval($request ->  idvillagequartier);  
          $quartier -> save();   

          return redirect()
          -> route('quartier.index') //methode de controleur
          -> with('success','quartier  créé avec succès');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $quartier = quartier::findOrFail($id); // Récupération du district spécifique depuis la base de données
        $allvillage = Village::all(); // Récupération de tous les regions pour la zone de liste déroulante
         return view('maintenance.quartierView.show', compact('quartier', 'allvillage'));
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
            'nomquartier' =>['required'],
            'idvillagequartier' =>'required',
        ]);
          $quartier = Quartier::find($id);
          $quartier -> nomquartier = $request -> nomquartier;  
          $quartier -> idvillagequartier = intval($request ->  idvillagequartier);  
          $quartier -> save();      

          return redirect()
          -> route('quartier.index') //methode de controleur
          -> with('success','quartier  créé avec succès');

    // si tout se passe bien on retourne cette fonction qui est la page de la liste des articles
    return redirect()
    -> route('quartier.index') //methode de controleur
    -> with('success','quartier modifié avec succès');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Quartier::find($id)->delete();
        return redirect()
        -> route('quartier.index')
        -> with('success','quartier supprimé avec succès');
    }
}
