<?php

namespace App\Http\Controllers;

use App\Models\Region;
use Illuminate\Http\Request;

class RegionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
           // cette methode affiche la liste
           $region = Region::all(); //recupère tous les clients
           return view('maintenance.regionView.index', compact('region'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return view('maintenance.regionView.create');
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
            'libRegion' =>['required', 'Unique:regions'],
        ]);

           $region = new Region;
           $region -> libRegion = $request -> libRegion;  //copie la propriete title de l'objet request dans la propriete title de l'objet article
           $region -> save();   // si tout se passe bien on enregistre la saisie

           return redirect()
           -> route('region.index') //methode de controleur
           -> with('success','Région créée avec succès');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $region =Region :: findorFail($id); //pour recupérer l'article
        return view('maintenance.regionView.show', compact(('region'))); // ensuite on le passe en argument ici pour l'affichage
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
        $region = Region :: findorFail($id); //pour recupérer l'article
        return view('Region.edit', compact(('region'))); // ensuite on le passe en argument ici pour l'affichage
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
        'libRegion' =>'required',
    ]);
    
    //$data = $request-> all();
    $region = Region::find($id); //reccupère le id de l'article a modifier
    $region -> libRegion = $request -> libRegion;  //copie la propriete title de l'objet request dans la propriete title de l'objet article
   
    $region -> save();   // si tout se passe bien on enregistre la saisie

    // si tout se passe bien on retourne cette fonction qui est la page de la liste des articles
    return redirect()
    -> route('region.index') //methode de controleur
    -> with('success','Région modifié avec succès');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Region::find($id)->delete();
        return redirect()
        -> route('region.index')
        -> with('success','region supprimée avec succès');
    }
}
