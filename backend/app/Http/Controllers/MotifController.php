<?php

namespace App\Http\Controllers;

use App\Models\Motif;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class MotifController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $motif = Motif ::all(); //recupère tous les clients
        return view('maintenance.motifView.index', compact('motif'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('maintenance.motifView.create');
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
            'libmotif' =>['required', 'Unique:motifs'],
        ]);
  
    //$data = $request-> all();
    $motif = new motif;
    $motif -> libmotif = $request -> libmotif;  
    $motif->userEnreg = Auth::id();
    $motif -> save();   // si tout se passe bien on enregistre la saisie

    return redirect()
    -> route('motif.index') //methode de controleur
    -> with('success','motif créé avec succès');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $motif =motif :: findorFail($id); //pour recupérer l'article
        return view('maintenance.motifView.show', compact(('motif'))); // ensui
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
        'libmotif' =>'required',
    ]);
    
    //$data = $request-> all();
    $motif = motif::find($id); //reccupère le id de l'article a modifier
    $motif -> libmotif = $request -> libmotif;  //copie la propriete title de l'objet request dans la propriete title de l'objet article
    $motif -> save();   // si tout se passe bien on enregistre la saisie
    return redirect()
    -> route('motif.index') //methode de controleur
    -> with('success','motif créé avec succès');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        motif::find($id)->delete();
        return redirect()
        -> route('motif.index')
        -> with('success','motif supprimé avec succès');
    }
}
