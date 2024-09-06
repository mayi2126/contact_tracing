<?php

namespace App\Http\Controllers;

use App\Models\Recensement;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Formationsanitaire;
use App\Models\Quartier;
use App\Models\Recensementaddchefmenage;
use App\Models\Recensementaddchefmenages;
use App\Models\Recensementinfogeneral;
use App\Models\Village;
use Carbon\Carbon;


use Illuminate\Support\Facades\DB as FacadesDB;

class RecensementController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
         // cette methode affiche la liste
      $idquartierAscRc = 1; //auth()->user()->idquartierAscRc;
      //$listrecensements = FacadesDB::table('recensements')->where('Idquartier', $idquartierAscRc) ->get();
      $recensement = Recensement::where('idquartierref', $idquartierAscRc)->get();
      return view('referencementView.index', compact('referencement'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
      $idfsuser = 56;//auth()->user()->//idfsuser;
      $formationsanitaire = Formationsanitaire::where('id', $idfsuser)->first();
  
      if ($idfsuser) {
           $libcpecm = $formationsanitaire->libcpecm; // Supposons que la colonne s'appelle codelabo
           $idfs = $formationsanitaire->id; // Supposons que la colonne s'appelle codelabo
           $listvillage = FacadesDB::table('villages')
           ->where('idfsvillage', $idfs)
           ->get();
           $listquartier = FacadesDB::table('quartiers') -> get() ;//recupère tous les clients

         } else {
           $libcpecm = 'Formation sanitaire introuvable';
         }

      $data = [
        'libcpecm' => $libcpecm,
        'listvillage' => $listvillage,
        'listquartier' => $listquartier,
      ];
  
      return view('recensementView.create', $data);
    }


    public function createchefmenage()
    {
      $idfsuser = 56;//auth()->user()->//idfsuser;
      $maxidRecensementinfogeneral = Recensementinfogeneral::where('Idformationsanitaire', $idfsuser)
      ->where('boucle', '') // Filtrer les enregistrements où 'boucle' est NULL
      ->orderBy('Idformationsanitaire', 'desc')
      ->first();

//dd($maxidRecensementinfogeneral);

      $maxnummenage = Recensementaddchefmenage::where('Idformationsanitaire', $idfsuser)
      ->where('boucle', '')  // Filtrer les enregistrements où 'boucle' est NULL
      ->orderBy('Idformationsanitaire', 'desc')
      ->first();
  
      $formationsanitaire = Formationsanitaire::where('id', $idfsuser)->first();

      if ($idfsuser) {
           $annee = Carbon::now()->year;
           $libcpecm = $formationsanitaire->codecpecm; // Supposons que la colonne s'appelle codelabo
           
           $Idvillage = $maxidRecensementinfogeneral->Idvillage; // Supposons que la colonne s'appelle codelabo
           $listvillage = FacadesDB::table('villages')
           ->where('id', $Idvillage)
           ->first();
       
         //  dd($listvillage);
           $nomvillage = $listvillage->nomvillage; 

           $Idquartier = $maxidRecensementinfogeneral->Idquartier; // Supposons que la colonne s'appelle codelabo
           $listquartier = FacadesDB::table('quartiers')
           ->where('id', $Idquartier)
           ->first();
           $nomquartier = $listquartier->nomquartier;

           $idmaxrecinfogeneral = $maxidRecensementinfogeneral->id; // Supposons que la colonne s'appelle codelab
           $nummenagerec = 'MNG-'.'C'.'-'.$libcpecm . substr($nomvillage, 0, 3) . substr($nomquartier, 0, 3)  . $annee . '-000' . ($maxnummenage + 1);

         } else {
           $maxidRecensementinfogeneral = 'Ligne introuvable';
         }

      $data = [
        'libcpecm' => $libcpecm,
        'listvillage' => $listvillage,
        'listquartier' => $listquartier,
        'libcpecm' => $libcpecm,
        'listvillage' => $listvillage,
        'listquartier' => $listquartier,

        'idmaxrecinfogeneral' => $idmaxrecinfogeneral,
        'nummenagerec' => $nummenagerec,
        'Idquartier' => $Idquartier,
        'Idvillage' => $Idvillage,
        'annee' => $annee,
        'idmaxrecinfogeneral' => $idmaxrecinfogeneral,
        'nomvillage' => $nomvillage
        
      ];
  
      return view('recensementView.ajoutermenage', $data);
    
    }

    public function createmembre()
    {
      $idfsuser = 56;//auth()->user()->//idfsuser;
      $maxidRecensementaddchefmenage = Recensementaddchefmenage::where('Idformationsanitaire', $idfsuser)
      ->where('boucle', '')  // Filtrer les enregistrements où 'boucle' est NULL
      ->orderBy('Idformationsanitaire', 'desc')
      ->first();

      $idfsuser = 56;//auth()->user()->//idfsuser;
      $maxidRecensementinfogeneral = Recensementinfogeneral::where('Idformationsanitaire', $idfsuser)
      ->where('boucle', '') // Filtrer les enregistrements où 'boucle' est NULL
      ->orderBy('Idformationsanitaire', 'desc')
      ->first();

//dd($maxidRecensementinfogeneral);

      if ($idfsuser) {
           $Idvillage = $maxidRecensementaddchefmenage->Idvillage; // Supposons que la colonne s'appelle codelabo
           $Idquartier = $maxidRecensementaddchefmenage->Idquartier; // Supposons que la colonne s'appelle codelabo
           $idinfogeneral = $maxidRecensementaddchefmenage->idinfogeneral; // Supposons que la colonne s'appelle codelab
           $nummenagerec = $maxidRecensementaddchefmenage ->nummenagerec;
           $nomchefmenagerec = $maxidRecensementaddchefmenage->nomchefmenagerec; // Supposons que la colonne s'appelle codelab
           $prenomchefmenagerec = $maxidRecensementaddchefmenage ->prenomchefmenagerec;
           $idchefmenagerec = $maxidRecensementaddchefmenage ->id;
           $prenomchefmenagerec = $maxidRecensementaddchefmenage ->prenomchefmenagerec;
           $idchefmenagerec = $maxidRecensementaddchefmenage ->id;
           $daterecensement = $maxidRecensementinfogeneral ->daterecensement;
           $localisationgpsrec = $maxidRecensementinfogeneral ->localisationgpsrec;

         } else {
           $maxidRecensementaddchefmenage = 'Ligne introuvable';
         }

      $data = [
        'idinfogeneral' => $idinfogeneral,
        'nummenagerec' => $nummenagerec,
        'Idquartier' => $Idquartier,
        'Idvillage' => $Idvillage ,
        'nomchefmenagerec' => $nomchefmenagerec,
        'prenomchefmenagerec' => $prenomchefmenagerec,        
        'idchefmenagerec' => $idchefmenagerec  ,
        'daterecensement' => $daterecensement,        
        'localisationgpsrec' => $localisationgpsrec       
      ];
  
      return view('recensementView.ajoutermembre', $data);
  
    }




    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
  // Validation des données
  $validatedData = $request->validate([
    'Idformationsanitaire' => ['bail', 'required'],
    'Idvillage' => ['bail', 'required'],
    'Idquartier' => ['bail', 'required'],
    'daterecensement' => ['required'],
]);

      // Débogage des données validées
         // dd($validatedData);
    
        $idfsuser = 56;//auth()->user()->idfsuser;
        $formationsanitaire = Formationsanitaire::where('id', $idfsuser)->first();
    
        if ($idfsuser) {
          $libcpecm = $formationsanitaire->libcpecm; // Supposons que la colonne s'appelle codelabo
          $idfs = $formationsanitaire->id; // Supposons que la colonne s'appelle codelabo

          $existingrecinfogeneral = Recensementinfogeneral::where('Idformationsanitaire', $idfsuser)
          ->where('boucle', '')
          ->first(); // Filtrer les enregistrements où 'boucle' est NULL
          if ($existingrecinfogeneral) {
            $url = url()->previous();
            // Le code Biolim existe déjà, vous pouvez gérer l'action à effectuer ici (renvoyer une erreur, afficher un message, etc.)
            return redirect()->to($url)
            ->with('notification', ['type' => 'danger', 'message' => 'il existe un enrégistrement encours']);
          }


       } else {
         $libcpecm = 'Formation sanitaire introuvable';
        }
    
        //$data = $request-> all();
        $recensementinfogeneral = new Recensementinfogeneral();
        $recensementinfogeneral->Idformationsanitaire = $idfs;
        $recensementinfogeneral->Idvillage = intval($request->Idvillage);
        $recensementinfogeneral->Idquartier = intval($request->Idquartier);
        $recensementinfogeneral->daterecensement = $request->daterecensement;
        $recensementinfogeneral->localisationgpsrec = $request->localisationgpsrec;
        $recensementinfogeneral -> dateEnreg =  Carbon::now(); 
        $recensementinfogeneral->userEnreg =1; //Auth::id();

        $recensementinfogeneral->save();   

        return redirect()
          ->route('createchefmenage') //methode de controleur
          ->with('success', 'Etape 1/3 créée avec succès');
      }


      public function storechefmenage(Request $request)
    {
      $request->validate([
        'nomchefmenagerec' => ['bail', 'required'],
        'prenomchefmenagerec' => ['bail', 'required'],
        'nummenagerec' => ['bail', 'required'],
      ]);
    
         // Débogage des données validées
         // dd($validatedData);
    
         $idfsuser = 56;//auth()->user()->idfsuser;
         $formationsanitaire = Formationsanitaire::where('id', $idfsuser)->first();
     
         if ($idfsuser) {
           $libcpecm = $formationsanitaire->libcpecm; // Supposons que la colonne s'appelle codelabo
           $idfs = $formationsanitaire->id; // Supposons que la colonne s'appelle codelabo
 
           $existingrecaddchefmenage = Recensementaddchefmenage::where('Idformationsanitaire', $idfsuser)
           ->where('boucle', '')
           ->first(); // Filtrer les enregistrements où 'boucle' est NULL
           if ($existingrecaddchefmenage) {
             $url = url()->previous();
             // Le code Biolim existe déjà, vous pouvez gérer l'action à effectuer ici (renvoyer une erreur, afficher un message, etc.)
             return redirect()->to($url)
             ->with('notification', ['type' => 'danger', 'message' => 'il existe un enrégistrement encours']);
           }
 
 
        } else {
          $libcpecm = 'Formation sanitaire introuvable';
         }
    
        //$data = $request-> all();
        $recensementaddchefmenage = new Recensementaddchefmenage();
        $recensementaddchefmenage->nomchefmenagerec = $request->nomchefmenagerec;
        $recensementaddchefmenage->prenomchefmenagerec = $request->prenomchefmenagerec;
        $recensementaddchefmenage->nummenagerec = $request->nummenagerec;
        $recensementaddchefmenage->Idformationsanitaire = $idfs;
        $recensementaddchefmenage->Idvillage = $request->Idvillage;
        $recensementaddchefmenage->Idquartier = $request->Idquartier;
        $recensementaddchefmenage->idinfogeneral = $request->idinfogeneral;
        $recensementaddchefmenage -> dateEnreg =  Carbon::now(); 
        $recensementaddchefmenage->userEnreg = 1;//Auth::id();
        $recensementaddchefmenage->save();   

        return redirect()
          ->route('createmembre') //methode de controleur
          ->with('success', 'Etape 2/3 créée avec succès');
      }


      public function storemembre(Request $request)
      {
    
         // Débogage des données validées
         // dd($validatedData);
    
           $idfsuser = 56;//auth()->user()->idfsuser;
           $formationsanitaire = Formationsanitaire::where('id', $idfsuser)->first();
     
         if ($idfsuser) {
           $idfs = $formationsanitaire->id; // Supposons que la colonne s'appelle codelabo
           } else {
             $libcpecm = 'Formation sanitaire introuvable';
           }
          //$data = $request-> all();
          $recensement = new Recensement();
          $recensement->membrenomrec = $request->membrenomrec;
          $recensement->membreprenomrec = $request->membreprenomrec;
          $recensement->membredatenaissrec = $request->membredatenaissrec;  //copie la propriete title de l'objet request dans la propriete title de l'objet article
          $recensement->membreagerec = $request->membreagerec;
          $recensement->agemois = $request->agemois;
          $recensement->sexezerovingtquatremoisrec = $request->sexezerovingtquatremoisrec;
          $recensement->membrefarec = $request->typedefemmeFA;
          $recensement->membreferec = $request->typedefemmeFE; //copie la propriete contenu de l'objet request dans la propriete contenu de l'objet article
          $recensement->membreafrec = $request->typedefemmeAF;
          $recensement->contactrec = $request->contactrec;
          $recensement->observationrec = $request->observationrec;  //copie la propriete title de l'objet request dans la propriete title de l'objet article
          $recensement->nomchefmenagerec = $request->nomchefmenagerec;
          $recensement->prenomchefmenagerec = $request->prenomchefmenagerec;
          $recensement->nummenagerec = $request->nummenagerec;
          $recensement->daterecensement = $request->daterecensement;
          $recensement->localisationgpsrec = $request->localisationgpsrec;
          $recensement->Idformationsanitaire = $idfs;
          $recensement->Idvillage = $request->Idvillage;
          $recensement->Idquartier = $request->Idquartier;
          $recensement->idinfogeneral = $request->idinfogeneral;
          $recensement->idchefmenagerec = $request->idchefmenagerec;
          $recensement -> dateEnreg =  Carbon::now(); 
          $recensement->userEnreg = 1;//Auth::id();
          $recensement->save();   
  
          return redirect()
            ->route('createmembre') //methode de controleur
            ->with('success', 'Etape 3/3 créée avec succès');
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
