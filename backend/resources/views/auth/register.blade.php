@extends('master')

@section('content')



    <div class="container-fluid" id="container-wrapper">
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1> </h1> <!--c'est moi mm pour avoir du vide-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('pageacceuil.index') }}",
                        title="Retourner à la page d acceuil">Acceuil</a></li>
                <li class="breadcrumb-item">Gestion des utilisateurs</li>
                <li class="breadcrumb-item active" aria-current="page"> <a
                        href="{{ route('user.index') }}",title="Retourner à la liste">Liste des comptes </a></li>
            </ol>
        </div>

        <div class="container  mt-4">
            <div class="card mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between ">
                    <!--bg-info text-white-->
                    <h5> <strong>***Nouveau compte***</strong></h5>

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

                    <form method="POST" action="{{ route('register') }}">
                        @csrf

                        <div class="form-group row">
                            <label for="id" class="col-sm-3 col-form-label">Profil*:</label>
                            <div class="col-sm-9">
                                <select class="form-control input-lg dynamic" name="idprofil" id="idprofil"
                                    data-dependent="id" required autocomplete="idprofil" autofocus>
                                    <option value="">Sélectionnez un profil utilisateur</option>
                                    @foreach ($listProfil as $listProfil)
                                        <option value="{{ $listProfil->id }}">{{ $listProfil->libProfile }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label">Nom*:</label>
                            <div class="col-sm-9">
                                <input id="name" type="text" name="name"
                                    class="form-control @error('name') is-invalid @enderror" value="{{ old('name') }}"
                                    placeholder="Entrer le nom de l'utilisateur" required autocomplete="name" autofocus
                                    oninput="convertirEnMajuscules(this)">

                                @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="prenom" class="col-sm-3 col-form-label">Prénom(s)*:</label>
                            <div class="col-sm-9">
                                <input id="prenom" type="text" name="prenom"
                                    class="form-control @error('name') is-invalid @enderror" value="{{ old('prenom') }}"
                                    placeholder="Entrer le Prénom(s) de l utilisateur" oninput="convertirEnMajuscules(this)"
                                    required autocomplete="prenom" autofocus>

                                @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="email" class="col-sm-3 col-form-label">Email*:</label>
                            <div class="col-sm-9">
                                <input id="email" type="email"
                                    class="form-control @error('email') is-invalid @enderror" name="email"
                                    value="{{ old('email') }}" placeholder="Entrer le email" required
                                    autocomplete="email">

                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password" class="col-sm-3 col-form-label">Password*:</label>
                            <div class="col-sm-9">
                                <input id="password" type="password" name="password"
                                    class="form-control @error('password') is-invalid @enderror"
                                    value="{{ old('password') }}" placeholder="Entrer le password" required
                                    autocomplete="new-password">

                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password-confirm"
                                class="col-sm-3 col-form-label ">{{ __('Confirmer Password*:') }}</label>

                            <div class="col-sm-9">
                                <input id="password-confirm" type="password" class="form-control"
                                    name="password_confirmation" required autocomplete="new-password">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="id" class="col-sm-3 col-form-label">Centre de prise en charge*:</label>
                            <div class="col-sm-9">
                                <select class="form-control input-lg dynamic" name="idcpecm"
                                    id="idcpecm" data-dependent="id">
                                    <option value="">Sélectionnez un centre de prise en charge</option>
                                    @foreach ($listcpecm as $listcpecm)
                                        <option value="{{ $listcpecm->id }}">{{ $listcpecm->libcpecm }}</option>
                                    @endforeach

                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="etat" class="col-sm-3 col-form-label">Etat*:</label>
                            <div class="col-sm-9">
                                <select class="select2-single-placeholder form-control" name="etat" id="etat"
                                    required autocomplete="etat" autofocus>
                                    <option value="">Select l'etat</option>
                                    <option value="Actif">Actif(ve)</option>
                                    <option value="Inactif">Inactif(ve)</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="idlabo" class="col-sm-3 col-form-label">Code labo*:</label>
                            <div class="col-sm-9">
                                <select class="form-control input-lg dynamic" name="idlabo" id="idlabo"
                                    data-dependent="id" required autocomplete="idlabo" autofocus>
                                    <option value="">Sélectionnez le code labo affilié</option>
                                    @foreach ($listLabo as $listLabo)
                                        <option value="{{ $listLabo->id }}">{{ $listLabo->codelabo }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        {{ csrf_field() }}

                        <div class="form-group row">
                            <div class="col-sm-10">
                                <button type="reset" class="btn btn-secondary">Nouveau</button>
                                <button type="submit" class="btn btn-primary">Enrégistrer</button>
                                <a href="{{ route('user.index') }}" class="btn btn-secondary">Liste</a>

                                @if ($message = Session::get('success'))
                                    <p style="color: green;">{{ $message }}</p>
                                @endif

                                <!--  <a href="{{ url()->previous() }}" class="btn btn-secondary">Annuler</a> -->
                                <!--pour recharger la page-->
                            </div>

                            <!-- <button type="submit" class="btn btn-primary btn-block" >Enrégistrer</button>-->
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection


<script>
    function convertirEnMajuscules(element) {
        element.value = element.value.toUpperCase();
    }
</script>
