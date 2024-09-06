<?php

namespace App\Http\Controllers;

use App\Models\Profession;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProfessionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $profession = Profession ::all(); //recupère tous les clients
        return view('maintenance.professionView.index', compact('profession'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('maintenance.professionView.create');
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
            'libprofession' =>['required', 'Unique:professions'],
        ]);
  
    //$data = $request-> all();
    $profession = new profession;
    $profession -> libprofession = $request -> libprofession;  
    $profession->userEnreg = Auth::id();
    $profession -> save();   // si tout se passe bien on enregistre la saisie

    return redirect()
    -> route('profession.index') //methode de controleur
    -> with('success','profession créé avec succès');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $profession =Profession :: findorFail($id); //pour recupérer l'article
        return view('maintenance.professionView.show', compact(('profession'))); // ensui
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
        'libprofession' =>'required',
    ]);
    
    //$data = $request-> all();
    $profession = Profession::find($id); //reccupère le id de l'article a modifier
    $profession -> libprofession = $request -> libprofession;  //copie la propriete title de l'objet request dans la propriete title de l'objet article
    $profession -> save();   // si tout se passe bien on enregistre la saisie
    return redirect()
    -> route('profession.index') //methode de controleur
    -> with('success','profession créé avec succès');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Profession::find($id)->delete();
        return redirect()
        -> route('profession.index')
        -> with('success','profession supprimé avec succès');
    }
}
