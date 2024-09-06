<?php

namespace App\Http\Controllers;

use App\Models\Commune;
use App\Models\District;
use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\DB as FacadesDB;

class CommuneController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
                $commune = Commune::all(); //recupère tous les clients
                return view('maintenance.communeView.index', compact('commune'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
            // cette methode affiche la liste
            $listDistrict = FacadesDB::table('districts') // -> groupBy('id') recupère tous les clients
            -> get() ;//recupère tous les clients
           return view('maintenance.communeView.create')-> with('listDistrict',  $listDistrict);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
       // ddd($request->all());
        $request ->validate([
                    'nomCommune' =>['required', 'Unique:communes'],
                    'iddistrictCom' =>'required'                ]);
          $commune = new Commune();
          $commune -> nomCommune = $request -> nomCommune; //copie la propriete title de l'objet request dans la propriete title de l'objet article
          $commune -> iddistrictCom = intval($request ->  iddistrictCom); //copie la propriete title de l'objet request dans la propriete title de l'objet article
          $commune -> save();   // si tout se passe bien on enregistre la saisie

    return redirect()
    -> route('commune.index') //methode de controleur
    -> with('success','Commune  créée avec succès');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        $commune = Commune::findOrFail($id); // Récupération du district spécifique depuis la base de données
        $allDistrict2 = District::all(); // Récupération de tous les regions pour la zone de liste déroulante
        // return view('centreprisencharge.show', compact('centreprisencharge')); 
         return view('maintenance.communeView.show', compact('commune', 'allDistrict2'));
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
            'nomCommune' =>['required'],
            'iddistrictCom' =>'required',
             // Ajoutez les autres règles de validation pour les autres champs du formulaire
        ]);
    //$data = $request-> all();

          $commune = Commune::find($id);
          $commune->nomCommune = $request->nomCommune;  //copie la propriete title de l'objet request dans la propriete title de l'objet article
          $commune->iddistrictCom = intval($request->iddistrictCom);  //copie la propriete title de l'objet request dans la propriete title de l'objet article
          $commune -> save();   // se bien on enregistre la saisie

    // si tout se passe bien on retourne cette fonction qui est la page de la liste des articles
    return redirect()
    -> route('commune.index') //methode de controleur
    -> with('success','Commune modifiée avec succès');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Commune::find($id)->delete();
        return redirect()
        -> route('commune.index')
        -> with('success','Commune supprimée avec succès');
    }
}
