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
                <h3>Modifier une profession</h3> <!--class="m-0 font-weight-bold text-primary" -->
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

                <form action="{{ route('profession.update', $profession->id) }}" method="POST">
                    @csrf
                    @method('PATCH')
                    <div class="form-group row">
                        <label for="nom" class="col-sm-3 col-form-label">Profession:</label>
                        <div class="col-sm-9">
                            <input id="libprofession" type="text" name="libprofession" class="form-control"
                                value="{{ $profession->libprofession }}" placeholder="Entrer le nom de la profession"
                                oninput="convertirEnMajuscules(this)">
                        </div>
                    </div>

            

                    <div class="form-group row">
                        <div class="col-sm-10">

                            <input type="submit" class="btn btn-primary" value="Modifier">

                            <a href="{{ route('profession.index') }}" class="btn btn-secondary">Liste</a>


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
