<?php

namespace App\Http\Controllers;

use App\Models\Causerieeducative;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CauserieeducativeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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
            'Idvillage' => ['bail', 'required'],
            'Idquartier' => ['bail', 'required'],
            'datece' => ['required','before_or_equal:dateReceptionLabo'], 
            'Idthemece' => ['bail', 'required'],
          ]);
      
      
          $idvillageAscRc = auth()->user()->idvillageAscRc;

          $causerieeducative = new Causerieeducative();
       //   $causerieeducative->Idformationsanitaire = intval($request->Idformationsanitaire);
          $causerieeducative->Idvillage = $idvillageAscRc;//intval($request->Idvillage);
          $causerieeducative->Idquartier = intval($request->Idquartier);
          $causerieeducative->Idthemece = intval($request->Idthemece);
          $causerieeducative->datece =  $request->datece;
          $causerieeducative->femmeenceintece = $request->femmeenceintece; //copie la propriete contenu de l'objet request dans la propriete contenu de l'objet article
          $causerieeducative->femmeallaitantece = $request->femmeallaitantece;
          $causerieeducative->autrefemmece = $request->autrefemmece;
          $causerieeducative->hommece = $request->hommece;
          $causerieeducative -> dateEnreg = $request ->  Carbon::now(); 
          $causerieeducative->codeLabo = $request->codeLabo;
          $causerieeducative->userEnreg = Auth::id();
          $causerieeducative->save();   
               
          return redirect()
            ->route('causerieeducative.create') //methode de controleur
            ->with('success', 'causerie éducative créée avec succès');
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
        //URL: localhost:8088/api/Causerieeducative
        $request->validate([
            'Idvillage' => ['bail', 'required'],
            'Idquartier' => ['bail', 'required'],
            'datece' => ['required','before_or_equal:dateReceptionLabo'], 
            'Idthemece' => ['bail', 'required'],
          ]);

          $idvillageAscRc = auth()->user()->idvillageAscRc;
    
          $causerieeducative = causerieeducative::find($id);
    
          $causerieeducative = new Causerieeducative();
       //   $causerieeducative->Idformationsanitaire = intval($request->Idformationsanitaire);
          $causerieeducative->Idvillage = $idvillageAscRc;//intval($request->Idvillage);
          $causerieeducative->Idquartier = intval($request->Idquartier);
          $causerieeducative->Idthemece = intval($request->Idthemece);
          $causerieeducative->datece =  $request->datece;
          $causerieeducative->femmeenceintece = $request->femmeenceintece; //copie la propriete contenu de l'objet request dans la propriete contenu de l'objet article
          $causerieeducative->femmeallaitantece = $request->femmeallaitantece;
          $causerieeducative->autrefemmece = $request->autrefemmece;
          $causerieeducative->hommece = $request->hommece;
          $causerieeducative -> datemodif = $request ->  Carbon::now(); 
        //  $causerieeducative->codeLabo = $request->codeLabo;
          $causerieeducative->userModif = Auth::id();
          $causerieeducative->save();   
        return redirect()
          ->route('causerieeducative.index') //methode de controleur
          ->with('success', 'Causerie Modifiée avec succès');
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
        $causerieeducative = Causerieeducative::find($id);

        if ($causerieeducative) {
            $causerieeducative->delete();
            return response()->json(['message' => 'Causerie supprimée avec succès'], 200);
        } else {
            return response()->json(['message' => 'Causerie non trouvée'], 404);
        }
    }
}
