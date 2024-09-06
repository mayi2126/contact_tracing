@extends('admin')

@section('content')

    <div class="container  mt-4">
        <div class="card mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between ">
                <!--bg-info text-white-->
                <h3>Modifier un profil</h3> <!--class="m-0 font-weight-bold text-primary" -->
            </div>

            <div class="div card-body">

                <form action="{{ route('profil.update', $profil->id) }}" method="POST">
                    @csrf
                    @method('PATCH')

                    <div class="form-group row">
                        <label for="nom" class="col-sm-3 col-form-label">Profil:</label>
                        <div class="col-sm-9">
                            <input id="libProfile" type="text" name="libProfile" class="form-control"
                                value="{{ $profil->libProfile }}" placeholder="Entrer la designation du profil"
                                oninput="convertirEnMajuscules(this)">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="nom" class="col-sm-3 col-form-label">Profil:</label>
                        <div class="col-sm-9">
                            <input id="description" type="text" name="description" class="form-control"
                                value="{{ $profil->description }}" placeholder="Entrer la designation du profil"
                                oninput="convertirEnMajuscules(this)">
                        </div>
                    </div>


                    <div class="form-group row">
                        <div class="col-sm-10">

                            <input type="submit" class="btn btn-primary" value="Modifier">
                            <a href="{{ route('profil.index') }}" class="btn btn-secondary">Liste</a>

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
