<?php

namespace App\Http\Controllers;

use App\Models\Commune;
use App\Models\Formationsanitaire;
use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\DB as FacadesDB;

class FormationsanitaireController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
          // cette methode affiche la liste
          $formationsanitaire = Formationsanitaire::all(); //recupère tous les clients
          return view('maintenance.formationsanitaire.index', compact('formationsanitaire'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
          // cette methode affiche la liste
          $listcommune = FacadesDB::table('communes') // -> groupBy('id') recupère tous les clients
          -> get() ;//recupère tous les clients
         return view('maintenance.formationsanitaire.create')-> with('listcommune',  $listcommune);
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
            'libcpecm' =>['required', 'Unique:formationsanitaires'],
            'idcommunefs' =>'required',
             // Ajoutez les autres règles de validation pour les autres champs du formulaire
        ]);
       
          $formationsanitaire = new Formationsanitaire;
          $formationsanitaire -> libcpecm = $request -> libcpecm;  //copie la propriete title de l'objet request dans la propriete title de l'objet article
          $formationsanitaire -> idcommunefs = intval($request ->  idcommunefs);  //copie la propriete title de l'objet request dans la propriete title de l'objet article
          $formationsanitaire -> codecpecm = $request -> idcommunefs.'%'.$request -> libcpecm;
          $formationsanitaire -> typecentre = $request -> typecentre;
          $formationsanitaire -> save();   // si tout se passe bien on enregistre la saisie

    return redirect()
    -> route('formationsanitaire.index') //methode de controleur
    -> with('success','Formation  créée avec succès');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $formationsanitaire = Formationsanitaire::findOrFail($id); // Récupération du district spécifique depuis la base de données
        $allcommune = Commune::all(); // Récupération de tous les regions pour la zone de liste déroulante
        // return view('formationsanitaire.show', compact('formationsanitaire')); 
         return view('maintenance.formationsanitaire.show', compact('formationsanitaire', 'allcommune'));
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
            'libcpecm' =>['required'],
            'idcommunefs' =>'required',
             // Ajoutez les autres règles de validation pour les autres champs du formulaire
        ]);

          $formationsanitaire = Formationsanitaire::find($id);
          $formationsanitaire -> libcpecm = $request -> libcpecm;  //copie la propriete title de l'objet request dans la propriete title de l'objet article
          $formationsanitaire -> idcommunefs = intval($request ->  idDistrictcpecm);  //copie la propriete title de l'objet request dans la propriete title de l'objet article
          $formationsanitaire -> codecpecm = $request -> idcommunefs.'%'.$request -> libcpecm;
          $formationsanitaire -> typecentre = $request -> typecentre;
          $formationsanitaire -> save();   // se bien on enregistre la saisie

    // si tout se passe bien on retourne cette fonction qui est la page de la liste des articles
    return redirect()
    -> route('formationsanitaire.index') //methode de controleur
    -> with('success','Formation sanitaire modifiée avec succès');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
             Formationsanitaire::find($id)->delete();
             return redirect()
             -> route('formationsanitaire.index')
             -> with('success','Formation sanitaire supprimée avec succès');
    }
}
