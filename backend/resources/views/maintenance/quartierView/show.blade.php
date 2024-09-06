@extends('admin')

@section('content')

    <div class="container  mt-4">
        <div class="card mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between ">
                <!--bg-info text-white-->
                <h3>Modifier un Quartier</h3> <!--class="m-0 font-weight-bold text-primary" -->
            </div>

            <div class="div card-body">

                <form action="{{ route('quartier.update', $quartier->id) }}" method="POST">
                    @csrf
                    @method('PATCH')

                    <div class="form-group row">
                        <label for="id" class="col-sm-3 col-form-label">Village*:</label>
                        <div class="col-sm-9">
                            <select class="form-control select2" name="idvillagequartier" id="idvillagequartier"
                                data-dependent="id">
                                <option value="">Sélectionnez un village</option>
                                @foreach ($allvillage as $villageOption)
                                    <option value="{{ $villageOption->id }}"
                                        {{ $villageOption->id == $quartier->idvillagequartier ? 'selected' : '' }}>
                                        {{ $villageOption->nomvillage }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="nomquartier" class="col-sm-3 col-form-label">Quartier*:</label>
                        <div class="col-sm-9">
                            <input id="nomquartier" type="text" name="nomquartier" class="form-control"
                                value="{{ $quartier->nomquartier }}" placeholder="Entrer le nom"
                                oninput="convertirEnMajuscules(this)">
                        </div>
                    </div>

              

                    <div class="form-group row">
                        <div class="col-sm-10">

                            <input type="submit" class="btn btn-primary" value="Modifier">
                            <a href="{{ route('quartier.index') }}" class="btn btn-secondary">Liste</a>

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
