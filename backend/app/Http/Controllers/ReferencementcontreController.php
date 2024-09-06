<?php

namespace App\Http\Controllers;

use App\Models\Referencement;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB as FacadesDB;

class ReferencementcontreController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       $idfsuser = 56; //auth()->user()->idvillageAscRc;
       //$listrecensements = FacadesDB::table('referencements')->where('idFsref', $idFsref) ->get();
      $referencementcontre = Referencement::where('idFsref', $idfsuser)->orderBy('dateref', 'asc')->get();
      return view('referencementcontreView.index', compact('referencementcontre'));
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
       // $village = Village::findOrFail($id); // Récupération du district spécifique depuis la base de données
       // $allformationsanitaire = Formationsanitaire::all(); // Récupération de tous les regions pour la zone de liste déroulante
        // return view('village.show', compact('village')); 
      //   return view('maintenance.villageView.show', compact('village', 'allformationsanitaire'));
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
        //
    }
}
