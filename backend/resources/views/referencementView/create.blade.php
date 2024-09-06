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
            <form  id="referencement-form" action="{{ route('referencement.store') }}" method="POST">
            @csrf
              <div class="card-body">
                <div class="form-group">
                  <label>Formation sanitaire</label>
                
                  <select class="form-control input-lg dynamic" name="idFsref" id="idFsref" 
                        data-dependent="id" disabled>
                                <option value="">Sélectionnez une Formation sanitaire</option>
                                @foreach ($allformationsanitaire as $fsOption)
                                    <option value="{{ $fsOption->id }}"
                                        {{ $fsOption->id == $referencement->Idformationsanitaire ? 'selected' : '' }}>
                                        {{ $fsOption->libcpecm }}
                                    </option>
                                @endforeach
                            </select>
                  </div>

                <div class="form-group">
                  <label>Village*</label>
                  <select class="form-control input-lg dynamic" name="idvillageref" id="idvillageref"  
                  data-dependent="id" disabled>
                                <option value="">Sélectionnez un village</option>
                                @foreach ($allvillage as $villageOption)
                                    <option value="{{ $villageOption->id }}"
                                        {{ $villageOption->id == $referencement->Idvillage ? 'selected' : '' }}>
                                        {{ $villageOption->nomvillage }}
                                    </option>
                                @endforeach
                            </select>
                </div>

                <div class="form-group">
                  <label>Quartier*</label>
                          <select class="form-control input-lg dynamic" name="idquartierref" id="idquartierref" 
                           data-dependent="id" disabled>
                                <option value="">Sélectionnez un quartier</option>
                                @foreach ($allquartier as $quartierOption)
                                    <option value="{{ $quartierOption->id }}"
                                        {{ $quartierOption->id == $referencement->Idquartier ? 'selected' : '' }}>
                                        {{ $quartierOption->nomquartier }}
                                    </option>
                                @endforeach
                            </select>
                </div>

                <div class="form-group">
                  <label for="membrenomrec">Nom</label>
                  <input type="text" class="form-control" id="membrenomrec" placeholder="Nom" value="{{ $referencement->membrenomrec }}" readonly>
                  <input type="text" class="form-control" id="idrecencement", 
                  name="idrecencement" placeholder="id" value="{{ $referencement->id }}" readonly>
                </div>

                <div class="form-group">
                  <label for="membreprenomrec">Prenom(s)</label>
                  <input type="text" class="form-control" id="membreprenomrec" placeholder="Prenom(s)" value="{{ $referencement->membreprenomrec }}" readonly>
                </div>

                <div class="icheck-danger">
                    <input type="checkbox" class="form-check-input" id="inputUrgence" >
                    <label class="form-check-label" for="inputUrgence">Urgence</label>
                  </div>
                  <input type="hidden" id="urgence" name="urgence" value="non">

              </div>
              <!-- /.card-body -->
         
          </div>
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
       
            <div class="card-body">
             <div class="form-group">
                <label>Statut</label>
                <input type="text" class="form-control" id="statutref" placeholder="statutref" value="Référé" readonly style="color: red;">
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
                <label>Date *</label>
                    <input type="date" class="form-control" id="dateref" placeholder="dateref" value="" required>
              </div>

              <div class="form-group">
                <label>Référé au centre de santé de *</label>
                          <select class="form-control select2" name="idFsref" id="idFsref"
                                data-dependent="id" required>
                                <option value="">Sélectionnez une formation sanitaire</option>
                                @foreach ($allfrrefere as $listfs)
                                   <option value="{{ $listfs->id }}">{{ $listfs->libcpecm }}</option>
                                @endforeach 
                            </select>
              </div>
            
                <div class="form-group">
                  <label for="motifRef">MOTIFS DE LA RÉFÉRENCE*</label>
                            <select class="form-control select2" name="idmotifRef" id="idmotifRef"
                                data-dependent="id"   required>
                                <option value="">Sélectionnez le motif de référence</option>
                                @foreach ($allmotif as $listmotif)
                                   <option value="{{ $listmotif->id }}">{{ $listmotif->libmotif }}</option>
                                @endforeach 
                            </select>

                </div>
              </div>

              <!-- /.card-body -->
              </div>
          
          </div>
        </div>
       
      </div>
            
    </div>
    <!-- /.col-md-6 -->
    {{ csrf_field() }} 
                <button type="submit" class="btn btn-primary">Référer</button>
                <button type="reset" class="btn btn-primary">Nouveau</button>
                <a href="{{ route('referencement.index') }}" class="btn btn-primary">Liste</a>
            </form>
<script src="{{ asset('js/jquery.min.js') }}"></script>
<script src="{{ asset('js/bootstrap.bundle.min.js') }}"></script>

<script>
  document.getElementById('inputUrgence').addEventListener('change', function() {
    var urgence = document.getElementById('inputUrgence');
    if (this.checked) {
      urgence.value = 'oui';
    } else {
      urgence.value = 'non';
    }
});

</script>


@endsection
