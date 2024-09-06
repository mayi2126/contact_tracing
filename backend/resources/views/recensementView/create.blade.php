@extends('admin')

@section('content')


@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif


<div id="wrapper">
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2 justify-content-center">
                <div class="col-md-8">
                    <h3 class="m-0 text-center">FICHE DE RECENSEMENT DES MEMBRES DU MÉNAGE</h3>
                </div>
            </div>
        </div>
    </div>

    <div class="container d-flex justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
                    <form id="recensement-form" action="{{ route('recensement.store') }}" method="POST">
                        @csrf
                        <div class="form-group">
                            <label>Formation sanitaire</label>
                            <input id="Idformationsanitaire" type="text" name="Idformationsanitaire" 
                            class="form-control" value="{{ $libcpecm }}" readonly required>
                        </div>

                        <div class="form-group">
                            <label>Village*</label>
                            <select class="form-control input-lg dynamic" name="Idvillage" id="Idvillage" data-dependent="id" required>
                                <option value="">Sélectionnez un village</option>
                                @foreach ($listvillage as $listvillage)
                                    <option value="{{ $listvillage->id }}">{{ $listvillage->nomvillage }}</option>
                                @endforeach 
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Quartier*</label>
                            <select class="form-control input-lg dynamic" name="Idquartier" id="Idquartier" data-dependent="id" required>
                                <option value="">Sélectionnez un quartier</option>
                                @foreach ($listquartier as $listquartier)
                                    <option value="{{ $listquartier->id }}">{{ $listquartier->nomquartier }}</option>
                                @endforeach 
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Date*</label>
                            <input id="daterecensement" type="date" name="daterecensement" 
                            class="form-control" value="{{ old('daterecensement') }}" placeholder="Entrer la date de recensement" required>
                        </div>

                        <div class="form-group">
                            <label>Localisation GPS*</label>
                            <div class="input-group">
                                <input id="localisationgpsrec" type="text" name="localisationgpsrec" class="form-control" 
                                value="{{ old('localisationgpsrec') }}" placeholder="Entrer la localisation GPS ou cliquer sur le bouton" required>   
                                <div class="input-group-append">
                                <button type="button" id="getLocationBtn" class="btn btn-success">Obtenir ma position</button>

                                </div>
                            </div>
                        </div>

                        {{ csrf_field() }}
                        <div class="d-flex justify-content-between">
                            <button type="submit" class="btn btn-primary">Enrégistrer et Ajouter Chef de ménage</button>
                            <button type="reset" class="btn btn-secondary">Effacer</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="{{ asset('js/jquery.min.js') }}"></script>
<script src="{{ asset('js/bootstrap.bundle.min.js') }}"></script>

<script>
    document.getElementById('getLocationBtn').addEventListener('click', function() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                var latitude = position.coords.latitude;
                var longitude = position.coords.longitude;
                document.getElementById('localisationgpsrec').value = latitude + ', ' + longitude;
            }, function(error) {
                alert('Erreur lors de la récupération de la position : ' + error.message);
            });
        } else {
            alert('La géolocalisation n\'est pas supportée par ce navigateur.');
        }
    });
</script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var today = new Date().toISOString().split('T')[0];
        document.getElementById('daterecensement').setAttribute('min', today);
    });
</script>

@endsection
