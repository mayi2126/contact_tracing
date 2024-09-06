<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Siteprelevement;
use App\Models\District;

use DB;
use Illuminate\Support\Facades\DB as FacadesDB;

class siteprelevementcontroller extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $siteprelevement = Siteprelevement ::all(); //recupère tous les clients
        return view('siteprelevement.index', compact('siteprelevement'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $listDistrict = FacadesDB::table('districts') // -> groupBy('id') recupère tous les clients
         -> get() ;//recupère tous les clients
       return view('siteprelevement.create')-> with('listDistrict',  $listDistrict);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
         //
         $request ->validate([
            'libsitep' =>['required', 'Unique:siteprelevements'],
            'idDistrictsitep' =>'required',
             // Ajoutez les autres règles de validation pour les autres champs du formulaire
        ]);
       
          $siteprelevement = new Siteprelevement;
          $siteprelevement -> libsitep = $request -> libsitep;  //copie la propriete title de l'objet request dans la propriete title de l'objet article
          $siteprelevement -> idDistrictsitep = intval($request ->  idDistrictsitep);  //copie la propriete title de l'objet request dans la propriete title de l'objet article
          $siteprelevement -> save();   // si tout se passe bien on enregistre la saisie

    return redirect()
    -> route('siteprelevement.index') //methode de controleur
    -> with('success','site de prélèvement  créé avec succès');
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
        $siteprelevement = Siteprelevement::findOrFail($id); // Récupération du district spécifique depuis la base de données
        $allDistrict = District::all(); // Récupération de tous les regions pour la zone de liste déroulante
        return view('siteprelevement.show', compact('siteprelevement', 'allDistrict'));
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
        $siteprelevement = Siteprelevement :: findorFail($id); //pour recupérer l'article
        return view('siteprelevement.edit', compact(('siteprelevement'))); // ensuite on le passe en argument ici pour l'affichage
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
        //
         //
         $request ->validate([
            'libsitep' =>['required', 'Unique:siteprelevements'],
            'idDistrictsitep' =>'required',
             // Ajoutez les autres règles de validation pour les autres champs du formulaire
        ]);
    //$data = $request-> all();

          $siteprelevement = siteprelevement::find($id);
          $siteprelevement -> libsitep = $request -> libsitep;  //copie la propriete title de l'objet request dans la propriete title de l'objet article
          $siteprelevement -> idDistrictsitep = intval($request ->  idDistrictsitep);  //copie la propriete title de l'objet request dans la propriete title de l'objet article
          $siteprelevement -> save();   // se bien on enregistre la saisie

    // si tout se passe bien on retourne cette fonction qui est la page de la liste des articles
    return redirect()
    -> route('siteprelevement.index') //methode de controleur
    -> with('success','Site de prélèvement modifié avec succès');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        Siteprelevement::find($id)->delete();
        return redirect()
        -> route('siteprelevement.index')
        -> with('success','site de prélèvement supprimé avec succès');
    }
}
