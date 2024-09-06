@extends('admin')

@section('content')

<div id="wrapper">
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">INFORMATIONS DE CONTRE-RÉFÉRENCE</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Fiche de contre référence</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>


<div class="container">
  <div class="row">
    <!-- Premier cadre à gauche -->
 
      <div class="card card-default">
        <div class="card-header">
          <div class="card card-primary">
            <div class="card-header">
                  <h3 class="card-title">INFORMATIONS SUR LA FEMME ENCEINTE/FA/ENFANT DE 0 A 24 MOIS /AUTRES…………. REFEREE</h3>
            </div>
            <!-- /.card-header -->
            <form  id="referencement-form" action="{{ route('referencement.store') }}" method="POST">
            @csrf
              <div class="card-body">

                <div class="form-group">
                   <label>Statut</label>
                   <input type="text" class="form-control" id="statutref" placeholder="statutref" value="Contre-Référé" readonly style="color: red;">
                </div>
                
                <div class="form-group">
                  <label for="membrenomrec">Nom</label>
                  <input type="text" class="form-control" id="membrenomrec" placeholder="Nom" value="{{ $referencement->membrenomrec }}" readonly>
                  <input type="text" class="form-control" id="idrecencement", 
                  name="idrecencement" placeholder="id" value="{{ $referencement->id }}" readonly>
                </div>

                <div class="form-group">
                  <label for="membreprenomrec">Prénom(s)</label>
                  <input type="text" class="form-control" id="membreprenomrec" placeholder="Prenom(s)" value="{{ $referencement->membreprenomrec }}" readonly>
                </div>

                <div class="form-group">
                  <label for="membreagerec">Age*</label>
                  <input type="number" class="form-control" id="membreagerec" placeholder="Age" value="{{ $referencement->membreagerec }}"  readonly>
                </div>

                <div class="form-group">
                  <label for="idprofessionref">Profession</label>
                  <select class="form-control select2" name="idprofessionref" id="idprofessionref"
                                data-dependent="id" required>
                                <option value="">Sélectionnez une profession</option>
                                @foreach ($allprofession as $listprofession)
                                   <option value="{{ $listprofession->id }}">{{ $listprofession->libprofession }}</option>
                                @endforeach 
                            </select>
                </div>

                <div class="form-group">
                   <label>Date de réception du référé : *</label>
                    <input type="date" class="form-control" id="dateref" placeholder="dateref" value="" required>
                </div>

                <div class="form-group">
                  <label for="motifRef">Recommandations à l’ASC/RC*</label>
                  <input type="text" class="form-control" id="dateref" placeholder="dateref" value="" required>
                </div>

                <div class="form-group">
                     <label for="motifRef">Nom et prénoms du prestataire *</label>
                     <input type="text" class="form-control" id="dateref" placeholder="dateref" value="" required>
                </div>

                <div class="form-group">
                     <label for="motifRef">Signature *</label>
                     <input type="text" class="form-control" id="dateref" placeholder="dateref" value="" required>
                </div>


              </div>  <!-- /.card-body -->
          </div> 
       </div>
    </div>

    </div>
    </div>

    {{ csrf_field() }} 
                <button type="submit" class="btn btn-primary">Contre référer</button>
                <button type="reset" class="btn btn-primary">Nouveau</button>
                <a href="{{ route('referencement.index') }}" class="btn btn-primary">Liste</a>
            </form>
<script src="{{ asset('js/jquery.min.js') }}"></script>
<script src="{{ asset('js/bootstrap.bundle.min.js') }}"></script>

@endsection
