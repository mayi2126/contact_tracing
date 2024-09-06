@extends('admin')

@section('content')

<div id="wrapper">
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">FICHE DE REFERENCE</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Fiche de référence</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
<div class="container">
  <div class="row">
    <!-- Premier cadre à gauche -->
    <div class="col-md-6">
      <div class="card card-default">
        <div class="card-header">
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">INFORMATIONS SUR LA FEMME ENCEINTE/FA/ENFANT DE 0 A 24 MOIS /AUTRES…………. REFEREE</h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <form>
              <div class="card-body">
                <div class="form-group">
                  <label>Formation sanitaire</label>
                    <input type="text" class="form-control" id="libcpecm" placeholder="Formation sanitaire" value="" readonly>
                </div>

                <div class="form-group">
                  <label>Village*</label>
                    <input type="text" class="form-control" id="nomvillage" placeholder="Village" value="" readonly>
                </div>

                <div class="form-group">
                  <label>Quartier*</label>
                  <input type="text" class="form-control" id="nomquartier" placeholder="Quartier" value="" readonly>
                </div>

                <div class="form-group">
                  <label for="membrenomrec">Nom</label>
                  <input type="text" class="form-control" id="membrenomrec" placeholder="Nom" value="" readonly>
                </div>

                <div class="form-group">
                  <label for="membreprenomrec">Prenom(s)</label>
                  <input type="text" class="form-control" id="membreprenomrec" placeholder="Prenom(s)" readonly>
                </div>

                <div class="icheck-danger">
                    <input type="checkbox" class="form-check-input" id="urgence" >
                    <label class="form-check-label" for="urgence">Urgence</label>
                  </div>
              </div>
              <!-- /.card-body -->

            
            </form>
          </div>
        </div> <br>
              <div >
                <button type="submit" class="btn btn-primary">Référer</button>
                <button type="submit" class="btn btn-primary">Nouveau</button>
                <button type="submit" class="btn btn-secondary">Retour</button>
              </div>
      </div>
    </div>
    <!-- /.col-md-6 -->


     <!-- Premier cadre à gauche -->
     <div class="col-md-6">
      <div class="card card-default">
        <div class="card-header">
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">INFORMATIONS SUR LA FEMME ENCEINTE/FA/ENFANT DE 0 A 24 MOIS /AUTRES…………. REFEREE</h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <form>
            <div class="card-body">
             <div class="form-group">
                <label>Statut</label>
                <input type="text" class="form-control" id="statutref" placeholder="statutref" value="Référé" readonly style="color: red;">

              </div>


                <div class="form-group">
                  <label for="exampleInputPassword1">Age*</label>
                  <input type="number" class="form-control" id="exampleInputPassword1" placeholder="Age" readonly>
                </div>

                <div class="form-group">
                  <label for="professionref">Profession</label>
                  <input type="text" class="form-control" id="professionref" placeholder="professionref" value="" readonly>
                </div>

                <div class="form-group">
                <label>Date *</label>
                    <input type="date" class="form-control" id="dateref" placeholder="dateref" value="" require>
              </div>

              <div class="form-group">
                <label>Référé au centre de santé de *</label>
                <select class="form-control select2" id="idFsref" name="idFsref" require style="width: 100%;">
                  
                </select>
              </div>

           
            
                <div class="form-group">
                  <label for="motifRef">MOTIFS DE LA RÉFÉRENCE*</label>
                  <select class="form-control select2" name="motifRef" id="motifRef" required autofocus style="width: 100%;">
                       <option value="">Select type VIH</option>
                       <option value="A terme" @if (old('motifRef') == 'A terme') selected @endif>A terme</option>
                       <option value="Atteinte du paludisme" @if (old('motifRef') == 'Atteinte du paludisme') selected @endif>Atteinte du paludisme</option>
                       <option value="Autre motif" @if (old('motifRef') == 'Autre motif') selected @endif>Autre motif</option>
                       <option value="Atteinte de la tuberculose" @if (old('motifRef') == 'Atteinte de la tuberculose') selected @endif>Atteinte de la tuberculose</option>
                       <option value="Forte fièvre avec vomissement" @if (old('motifRef') == 'Forte fièvre avec vomissement') selected @endif>Forte fièvre avec vomissement</option>
                  </select>

                </div>
              </div>

              <!-- /.card-body -->
              </div>
            </form>
          </div>
        </div>
       
      </div>
            
    </div>
    <!-- /.col-md-6 -->

    
<script src="{{ asset('js/jquery.min.js') }}"></script>
<script src="{{ asset('js/bootstrap.bundle.min.js') }}"></script>



@endsection
