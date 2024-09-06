@extends('admin')

@section('content')

<div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Maintenance</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Maintenance</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>

    <div class="container  mt-4">
        <div class="card mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between ">
                <!--bg-info text-white-->
                <h3>Modifier un thème</h3> <!--class="m-0 font-weight-bold text-primary" -->
            </div>

            <div class="div card-body">
                @if ($errors->any())
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <form action="{{ route('theme.update', $theme->id) }}" method="POST">
                    @csrf
                    @method('PATCH')
                    <div class="form-group row">
                        <label for="nom" class="col-sm-3 col-form-label">Thème:</label>
                        <div class="col-sm-9">
                            <input id="libtheme" type="text" name="libtheme" class="form-control"
                                value="{{ $theme->libtheme }}" placeholder="Entrer le nom de la région"
                                oninput="convertirEnMajuscules(this)">
                        </div>
                    </div>

                    <div class="form-group row">
                       <label for="typetheme" class="col-sm-3 col-form-label">Type thème*:</label>
                        <div class="col-sm-9">
                           <select id="typetheme" name="typetheme" class="form-control">
                              <option value="CAUSERIE EDUCATIVE" {{ $theme->typetheme == 'CAUSERIE EDUCATIVE' ? 'selected' : '' }}>CAUSERIE EDUCATIVE</option>
                              <option value="VISITE A DOMICILE" {{ $theme->typetheme == 'VISITE A DOMICILE' ? 'selected' : '' }}>VISITE A DOMICILE</option>
                              <option value="CPN" {{ $theme->typetheme == 'CPN' ? 'selected' : '' }}>CPN</option>
                              <option value="ACTIVITÉS PROMOTIONNELLES" {{ $theme->typetheme == 'ACTIVITÉS PROMOTIONNELLES' ? 'selected' : '' }}>ACTIVITÉS PROMOTIONNELLES</option>
                              <option value="DIALOGUES COMMUNAUTAIRES" {{ $theme->typetheme == 'DIALOGUES COMMUNAUTAIRES' ? 'selected' : '' }}>DIALOGUES COMMUNAUTAIRES</option>
                              <option value="ACTIVITÉS PRÉVENTIVES" {{ $theme->typetheme == 'ACTIVITÉS PRÉVENTIVES' ? 'selected' : '' }}>ACTIVITÉS PRÉVENTIVES</option>
                              <option value="COMMUN" {{ $theme->typetheme == 'COMMUN' ? 'selected' : '' }}>COMMUN</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-10">

                            <input type="submit" class="btn btn-primary" value="Modifier">

                            <a href="{{ route('theme.index') }}" class="btn btn-secondary">Liste</a>


                            <!--<a href="{{ url()->previous() }}" class="btn btn-secondary">Annuler</a> pour recharger la page-->

                            @if ($message = Session::get('success'))
                                <p style="color: green;">{{ $message }}</p>
                            @endif
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        function convertirEnMajuscules(element) {
            element.value = element.value.toUpperCase();
        }
    </script>
@endsection
