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
                <h3>Modifier un motif</h3> <!--class="m-0 font-weight-bold text-primary" -->
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

                <form action="{{ route('motif.update', $motif->id) }}" method="POST">
                    @csrf
                    @method('PATCH')
                    <div class="form-group row">
                        <label for="nom" class="col-sm-3 col-form-label">Motif:</label>
                        <div class="col-sm-9">
                            <input id="libmotif" type="text" name="libmotif" class="form-control"
                                value="{{ $motif->libmotif }}" placeholder="Entrer le motif"
                                oninput="convertirEnMajuscules(this)">
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-10">
                            <input type="submit" class="btn btn-primary" value="Modifier">
                            <a href="{{ route('motif.index') }}" class="btn btn-secondary">Liste</a>

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
