@extends('admin')

@section('content')

@if (session('notification'))
    @php
        $notification = session('notification');
    @endphp
    <div class="alert alert-{{ $notification['type'] }}">
        {{ $notification['message'] }}
    </div>
@endif


<div id="wrapper">
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12 text-center">
                    <h1 class="m-0">AJOUTER CHEF DU MÉNAGE</h1>
                </div>
                <div class="col-sm-12">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Précédent</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <div class="container d-flex justify-content-center">
        <div class="col-md-8">
            <div class="card card-primary">
                <div class="card-header text-center">
                    <h3 class="card-title">Formulaire de recensement</h3>
                </div>
                <form id="recensement-form" action="{{ route('storechefmenage') }}" method="POST">
                    @csrf
                    <div class="card-body">

                        <div class="form-group">
                            <label>N° DE MÉNAGE *</label>
                            <input id="nummenagerec" type="text" name="nummenagerec" 
                            class="form-control" value="{{ $nummenagerec }}" readonly>
                        </div>

                        <input id="idinfogeneral" type="text" name="idinfogeneral" 
                            class="form-control" value="{{ $idmaxrecinfogeneral }}" hidden>
                        <input id="Idvillage" type="text" name="Idvillage" 
                            class="form-control" value="{{ $Idvillage}}" hidden>
                        <input id="Idquartier" type="text" name="Idquartier" 
                            class="form-control" value="{{ $Idquartier }}" hidden>

                        <div class="form-group">
                            <label>NOM DU CHEF DE MÉNAGE *</label>
                            <input id="nomchefmenagerec" type="text" name="nomchefmenagerec" class="form-control" 
                            value="{{ old('nomchefmenagerec') }}" placeholder="Entrer le nom  du chef de ménage" oninput="convertirEnMajuscules(this)">
                        </div>

                        <div class="form-group">
                            <label>PRENOMS DU CHEF DE MÉNAGE *</label>
                            <input id="prenomchefmenagerec" type="text" name="prenomchefmenagerec" class="form-control" 
                            value="{{ old('prenomchefmenagerec') }}" 
                            placeholder="Entrer le(s) prénom(s) du chef de ménage" oninput="convertirEnMajuscules(this)">
                        </div>

                    </div>
                    <div class="card-footer d-flex justify-content-between">
                        <button type="submit" class="btn btn-primary">Ajouter un/des membre(s)</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
  
</div>

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

<script>
    function convertirEnMajuscules(input) {
        input.value = input.value.toUpperCase();
    }
</script>

@endsection
