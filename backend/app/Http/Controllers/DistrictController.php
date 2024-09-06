<?php

namespace App\Http\Controllers;

use App\Models\District;
use App\Models\Region;
use Illuminate\Http\Request;

class DistrictController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
               // cette methode affiche la liste
               $district = District::all(); //recupère tous les clients
               return view('maintenance.districtView.index', compact('district'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
              // cette methode affiche la liste
              $listRegions = Region::all();//recupère tous les clients
              return view('maintenance.districtView.create')->with('listRegions',  $listRegions);
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
            'libDistrict' =>['required', 'Unique:districts'],
            'IdregionDistrict' =>'required',
             // Ajoutez les autres règles de validation pour les autres champs du formulaire
        ]);
          $district = new District();
          $district -> libDistrict = $request -> libDistrict;  //copie la propriete title de l'objet request dans la propriete title de l'objet article
          $district -> IdregionDistrict = intval($request ->  IdregionDistrict);  //copie la propriete title de l'objet request dans la propriete title de l'objet article
          $district -> save();   // si tout se passe bien on enregistre la saisie

        return redirect()
        -> route('district.index') //methode de controleur
        -> with('success','District créée avec succès');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $district = District::findOrFail($id); // Récupération du district spécifique depuis la base de données
        $listRegion = Region::all(); // Récupération de tous les regions pour la zone de liste déroulante
        return view('maintenance.districtView.show', compact('district', 'listRegion'));
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
        // cette methode permet de recuperer une donnée methode du bouton créer
    $request ->validate([
        'libDistrict' =>['required', 'Unique:districts'],
        'IdregionDistrict' =>'required',
    ]);
    
    //$data = $request-> all();

          $district = District::find($id);
          $district -> libDistrict = $request -> libDistrict;  //copie la propriete title de l'objet request dans la propriete title de l'objet article
          $district -> IdregionDistrict = intval($request ->IdregionDistrict);  //copie la propriete title de l'objet request dans la propriete title de l'objet article
          $district -> save();   // si tout se passe bien on enregistre la saisie

    // si tout se passe bien on retourne cette fonction qui est la page de la liste des articles
    return redirect()
    -> route('district.index') //methode de controleur
    -> with('success','District modifié avec succès');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        District::find($id)->delete();
        return redirect()
        -> route('district.index')
        -> with('success','District supprimé avec succès');
    }
}
