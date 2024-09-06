<?php

namespace App\Http\Controllers;

use App\Models\Commune;
use App\Models\District;
use App\Models\Formationsanitaire;
use App\Models\Motif;
use App\Models\Profession;
use App\Models\Quartier;
use App\Models\Recensement;
use App\Models\Referencement;
use App\Models\Region;
use App\Models\Village;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB as FacadesDB;

class ReferencementController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

     public function listeRecensement()
     {
       // cette methode affiche la liste
        $idquartierAscRc = 1; //auth()->user()->idquartierAscRc;
        //$listrecensements = FacadesDB::table('recensements')->where('Idquartier', $idquartierAscRc) ->get();
       $referencement = Recensement::where('Idquartier', $idquartierAscRc)->orderBy('membrenomrec', 'asc')->get();
       return view('referencementView.listerecencement', compact('referencement'));
     }

    public function index()
    {
      // cette methode affiche la liste
      $idquartierAscRc = 1; //auth()->user()->idquartierAscRc;
      //$listrecensements = FacadesDB::table('recensements')->where('Idquartier', $idquartierAscRc) ->get();
      $referencement = Referencement::where('idquartierref', $idquartierAscRc)->get();
      return view('referencementView.index', compact('referencement'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $listRegion = FacadesDB::table('regions')->get(); //recupère tous les Régions
    
        $listDistrict = FacadesDB::table('districts')->get(); // recupère tous les districts
    
        $listcommune = FacadesDB::table('communes')->get(); // recupère tous les cepe

        $listfs = FacadesDB::table('formationsanitaires') ->get(); 
    
        $listvillage = FacadesDB::table('villages')->get(); // recupère tous les cepe

        $listquartier = FacadesDB::table('quartiers') -> get() ;//recupère tous les clients
        
        $listrecensements = FacadesDB::table('recensements')->get(); // recupère tous les cepe

        $listmotif = FacadesDB::table('motifs')->get(); // recupère tous les cepe

        $listprofession = FacadesDB::table('professions')->get(); // recupère tous les cepe
    
     //   $idquartierAscRc = auth()->user()->idquartierAscRc;

       // $listrecensements = FacadesDB::table('recensements')->where('Idquartier', $idquartierAscRc) ->get();

        $data = [
          'listRegion' => $listRegion,
          'listDistrict' => $listDistrict,
          'listcommune' => $listcommune,
          'listfs' => $listfs,
          'listvillage' => $listvillage,
          'listquartier' => $listquartier,
          'listrecensements' => $listrecensements,
          'listmotif' => $listmotif,
          'listprofession' => $listprofession
        ];
    
        return view('referencementView.create', $data);
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
              'idmenageRecensRef' => ['bail', 'required'],
              'motifRef' => ['bail',  'required'],
              'dateref' => ['bail','required'],
              'idAscRcRef' => ['required'],
              'idFsref' => ['bail', 'required'],
              'idquartierref' => ['bail', 'required'],
              'idvillageref' => ['bail', 'required'],
            ]);
            $referencement = new Referencement();
            $referencement->idmenageRecensRef =  $request->idrecencement; //$request->codeLabo . $request->codePatientLabo;
            $referencement->idmotifRef =  $request->idmotifRef;
            $referencement->dateref = $request->dateref; //copie la propriete contenu de l'objet request dans la propriete contenu de l'objet article
            $referencement->idAscRcRef = 1;// Auth::id();
            $referencement->idFsref = $request->idFsref;
            $referencement->idquartierref =  intval($request->idquartierref);
            $referencement->idvillageref = intval($request->idvillageref); 
            $referencement->commentaireref = $request->commentaireref; 
            $referencement->statutref = $request->statutref;   
            $referencement->urgence = $request->urgence;     
            $referencement->userEnreg = 1;//Auth::id();
            $referencement->idprofessionref =$request->idprofessionref;    
            $referencement->save();   
                
            return redirect()
            ->route('referencement.index') //methode de controleur
            ->with('success', 'client référé  avec succès');  
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */


     public function editidRecencement($id)
     {
      $referencement = Recensement::findOrFail($id); // Récupération du district spécifique depuis la base de données
      $allregion = Region::all(); // Récupération de tous les regions pour la zone de liste déroulante
      $allDistrict = District::all(); // Récupération de tous les regions pour la zone de liste déroulante   
      $allcommune = Commune::all();
      $allformationsanitaire = Formationsanitaire::all();
      $allvillage = Village::all();
      $allquartier = Quartier::all();
      $allprofession = Profession::all();
      $allmotif = Motif::all();
      $allfrrefere = Formationsanitaire::all();
  
   //   $idlabo = auth()->user()->idlabo;
   //   $laboratoire = Laboratoire::where('id', $idlabo)->first();
  
      return view('referencementView.create', compact(
        'referencement',
        'allregion',
        'allDistrict',
        'allcommune',
        'allformationsanitaire',
        'allquartier',
        'allvillage',
        'allprofession',
        'allmotif',
        'allfrrefere'
      ));
     }

    public function edit($id)
    {
     
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
        'idmenageRecensRef' => ['bail', 'required'],
        'motifRef' => ['bail',  'required'],
        'dateref' => ['bail','required'],
        'idAscRcRef' => ['required'],
        'idFsref' => ['bail', 'required'],
        'idquartierref' => ['bail', 'required'],
        'idvillageref' => ['bail', 'required'],
      ]);

      $referencement = Referencement::find($id);
     
      $referencement->idmotifRef =  $request->idmotifRef;
      $referencement->dateref = $request->dateref;
      $referencement->idAscRcRef =  Auth::id();; 
      $referencement->idFsref = $request->idFsref;
      $referencement->idquartierref =  intval($request->idquartierref);
      $referencement->idvillageref = intval($request->idvillageref); 
      $referencement->commentaireref = $request->commentaireref; 
      $referencement->statutref = $request->statutref;   
      $referencement->urgence = $request->urgence;     
      $referencement->userEnreg = Auth::id();
      $referencement->idprofessionref =$request->idprofessionref;    
      $referencement->save();   

// si tout se passe bien on retourne cette fonction qui est la page de la liste des articles
return redirect()
-> route('referencement.index') //methode de controleur
-> with('success',' modifiée avec succès');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
      Referencement::find($id)->delete();
      return redirect()
      -> route('referencement.index')
      -> with('success',' supprimée avec succès');
    }
}
