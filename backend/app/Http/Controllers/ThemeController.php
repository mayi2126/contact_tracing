<?php

namespace App\Http\Controllers;

use App\Models\Theme;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ThemeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
             // cette methode affiche la liste
             $theme = Theme::all(); //recupère tous les clients
             return view('maintenance.themeView.index', compact('theme'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('maintenance.themeView.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // cette methode permet de recuperer une donnée methode du bouton créer
        $request->validate([
            'typetheme' => ['bail', 'required'],
            'libtheme' => ['bail', 'required'],
          ]);
      
          $theme = new Theme();
          $theme->typetheme =  $request->typetheme;
          $theme->libtheme = $request->libtheme; //copie la propriete contenu de l'objet request dans la propriete contenu de l'objet article
          $theme->userEnreg = Auth::id();
          $theme->save();   
               
          return redirect()
            ->route('theme.index') //methode de controleur
            ->with('success', 'Thème créée avec succès');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $theme =Theme :: findorFail($id); //pour recupérer l'article
        return view('maintenance.themeView.show', compact(('theme'))); // e
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
        //
         // cette methode permet de recuperer une donnée methode du bouton créer
         $request->validate([
            'typetheme' => ['bail', 'required'],
            'libtheme' => ['bail', 'required'],
          ]);
      
          $theme = Theme::find($id);
          $theme->typetheme =  $request->typetheme;
          $theme->libtheme = $request->libtheme; //copie la propriete contenu de l'objet request dans la propriete contenu de l'objet article
          $theme->userEnreg = Auth::id();
          $theme->save();   
               
          return redirect()
            ->route('theme.index') //methode de controleur
            ->with('success', 'Thème créée avec succès');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Theme::find($id)->delete();
        return redirect()
        -> route('theme.index')
        -> with('success','theme supprimé avec succès');
    }
}
