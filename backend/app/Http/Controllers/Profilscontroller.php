<?php

namespace App\Http\Controllers;

use App\Models\Profil;
use Illuminate\Http\Request;

class Profilscontroller extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
           $profil = Profil ::all(); //recupère tous les clients
           return view('maintenance.profil.index', compact('profil'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('maintenance.profil.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        /// cette methode permet de recuperer une donnée methode du bouton créer
        $request ->validate([
            'libProfile' =>['required', 'Unique:profils'],
        ]);
  
    //$data = $request-> all();
    $profil = new profil;
    $profil -> libProfile = $request -> libProfile;  //copie la propriete title de l'objet request dans la propriete title de l'objet article
    $profil -> description = $request -> description; 
    $profil -> save();   // si tout se passe bien on enregistre la saisie

    return redirect()
    -> route('profil.index') //methode de controleur
    -> with('success','Profil créé avec succès');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $profil =Profil :: findorFail($id); //pour recupérer l'article
        return view('maintenance.profil.show', compact(('profil'))); // ensuite on le passe en argument ici pour l'affichage
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
        'libProfile' =>'required',
    ]);
    
    //$data = $request-> all();
    $profil = Profil::find($id); //reccupère le id de l'article a modifier
    $profil -> libProfile = $request -> libProfile;  //copie la propriete title de l'objet request dans la propriete title de l'objet article
    $profil -> description = $request -> description; 
    $profil -> save();   // si tout se passe bien on enregistre la saisie

    return redirect()
    -> route('profil.index') //methode de controleur
    -> with('success','Profil créé avec succès');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Profil::find($id)->delete();
        return redirect()
        -> route('profil.index')
        -> with('success','profil supprimé avec succès');
    }
}
