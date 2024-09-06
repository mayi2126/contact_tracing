<?php

namespace App\Http\Controllers;

use App\Models\Recensement;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RecensementController extends Controller
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
          'Idformationsanitaire' => ['bail', 'required'],
          'Idvillage' => ['bail', 'required'],
          'Idquartier' => ['bail', 'required'],
          'daterecensement' => ['required','before_or_equal:dateReceptionLabo'], 
        ]);
    
        $idvillageAscRc = auth()->user()->idvillageAscRc;
       // $laboratoire = Laboratoire::where('id', $idvillageAscRc)->first();
    
     //   if ($idvillageAscRc) {
     //     $localite = $laboratoire->localite; // Supposons que la colonne s'appelle codelabo
      //    $codelaboannee = $laboratoire->codelaboannee; // Supposons que la colonne s'appelle codelabo
      //  } else {
       //   $localite = 'localite introuvable';
      //  }
    
       // $codeBiolim =  $codelaboannee . $request->codePatientLabo;
       // $existingBiolim = DB::table('recensements')->where('codePatientLabo', $codeBiolim)->first();
    
     //   if ($existingBiolim) {
      //    $url = url()->previous();
          // Le code Biolim existe déjà, vous pouvez gérer l'action à effectuer ici (renvoyer une erreur, afficher un message, etc.)
      //    return redirect()->to($url)->with('notification', ['type' => 'danger', 'message' => 'Le code patient existe déjà']);
       // }
    
        //$data = $request-> all();
        $recensement = new Recensement();
        $recensement->Idformationsanitaire = intval($request->Idformationsanitaire);
        $recensement->Idvillage = intval($request->Idvillage);
        $recensement->Idquartier = intval($request->Idquartier);
        $recensement->daterecensement = $request->daterecensement;
        $recensement->localisationgpsrec = $request->localisationgpsrec;
        $recensement -> dateEnreg = $request ->  Carbon::now(); 
        $recensement->userEnreg = Auth::id();
        $recensement->save();   

        return redirect()
          ->route('recensement.create') //methode de controleur
          ->with('success', 'Recensement créé avec succès');
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
        $request->validate([
            'nummenagerec' => ['bail', 'required', 'size:12'],
            'Idregion' => ['bail', 'required'],
            'Iddistrict' => ['bail', 'required'],
            'Idcommune' => ['bail', 'required'],
            'Idformationsanitaire' => ['bail', 'required'],
            'Idvillage' => ['bail', 'required'],
            'Idquartier' => ['bail', 'required'],
    
            'nomchefmenagerec' => ['bail', 'required'],
            'prenomchefmenagerec' => ['bail', 'required'],
            'contactrec' => ['bail', 'required'],
            'daterecensement' => ['required','before_or_equal:dateReceptionLabo'], 
  
            'membrenomrec' => ['bail', 'required'],
            'membreprenomrec' => ['bail', 'required'],
            'membredatenaissrec' => ['bail',  'required'],
            'membreagerec' => ['bail'],
            'sexezerovingtquatremoisrec' => ['bail', 'required'],
            'prenomP' => ['bail', 'required'],
            'ageP' => ['bail', 'required', 'numeric'],
          ]);
    
        $recensement = Recensement::find($id);
    
        $recensement->nummenagerec =  $request->nummenagerec; //$codelaboannee . $request->codePatientLabo; //$request->codeLabo . $request->codePatientLabo;
        $recensement->Idregion = intval($request->Idregion);  //copie la propriete title de l'objet request dans la propriete title de l'objet article
        $recensement->Iddistrict = intval($request->Iddistrict);
        $recensement->Idcommune = intval($request->Idcommune);
        $recensement->Idformationsanitaire = intval($request->Idformationsanitaire);
        $recensement->Idvillage = intval($request->Idvillage);
        $recensement->Idquartier = intval($request->Idquartier);
        $recensement->nomchefmenagerec = $request->nomchefmenagerec;
        $recensement->prenomchefmenagerec =  $request->prenomchefmenagerec;
        $recensement->contactrec = $request->contactrec; //copie la propriete contenu de l'objet request dans la propriete contenu de l'objet article
        $recensement->daterecensement = $request->daterecensement;
        $recensement->membrenomrec = $request->membrenomrec;
    
        $recensement->membreprenomrec = $request->membreprenomrec;
        
        $recensement->membredatenaissrec = $request->membredatenaissrec;  //copie la propriete title de l'objet request dans la propriete title de l'objet article
        $recensement->membreagerec = $request->membreagerec;

        $recensement->sexezerovingtquatremoisrec = $request->sexezerovingtquatremoisrec;
        $recensement->membrefarec = $request->membrefarec;

        $recensement->membreferec = $request->membreferec; //copie la propriete contenu de l'objet request dans la propriete contenu de l'objet article
        $recensement->membreafrec = $request->membreafrec;
        $recensement->contactrec = $request->contactrec;
    
        $recensement->observationrec = $request->observationrec;  //copie la propriete title de l'objet request dans la propriete title de l'objet article

        $recensement->localisationgpsrec = $request->localisationgpsrec;
        $recensement->daterecensement = $request->daterecensement;
       
        $recensement -> dateEnreg = $request ->  Carbon::now(); 
        $recensement->codeLabo = $request->codeLabo;
        $recensement->userEnreg = Auth::id();
        $recensement->save();   
        
        // si tout se passe bien on enregistre la saisie
    
        // si tout se passe bien on retourne cette fonction qui est la page de la liste des articles
    
        return redirect()
          ->route('recensement.index') //methode de controleur
          ->with('success', 'Recensement créé avec succès');
      
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
        Recensement::find($id)->delete();
        return redirect()
          ->route('recensement.index')
          ->with('success', 'Recensement supprimé avec succès');
    }
}
