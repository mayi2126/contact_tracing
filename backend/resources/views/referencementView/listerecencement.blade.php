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
            <div class="card-header">
             
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>Formation sanitaire</th>
                    <th>Village</th>
                    <th>Quartier</th>
                    <th>Nom et prénom(s)</th>
                
                    <th>Age</th>
                    <th>Sexe enfant (0 à24 mois)</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                
                  <tbody>
                  @foreach ($referencement as $referencement)
                  <tr>
                    <td>{{ $referencement->formationsanitaire->libcpecm }}</td>
                    <td>{{ $referencement->village->nomvillage }}</td>
                    <td>{{ $referencement->quartier->nomquartier }}</td>
                    <td>{{ $referencement->membrenomrec }}  {{ $referencement->membreprenomrec }}</td>
                
                    <td>{{ $referencement->membreagerec }}</td>
                    <td>{{ $referencement->sexezerovingtquatremoisrec }}</td>
                    <td>
                          <div class="btn-group" role="group" aria-label="Actions">
                            
                            <a href="{{ route('referencement.editidRecencement', $referencement->id) }}"
                            class="btn btn-danger" title="Modifier">Référer</a>
                          </div>
                    </td>
                
                  </tr>
                  
                  @endforeach
                  </tbody>
                  <tfoot>
                  <tr>
                    <th>Formation sanitaire</th>
                    <th>Village</th>
                    <th>Quartier</th>
                    <th>Nom</th>
                    <th>Age</th>
                    <th>Sexe enfant (0 à24 mois)</th>
                    <th>Action</th>
                  </tr>
                  </tfoot>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
</div>       
@endsection