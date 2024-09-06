@extends('admin')

@section('content')


    <div class="container  mt-4">
        <div class="card mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between ">
                <!--bg-info text-white-->
                <h3>Modifier une commune</h3> <!--class="m-0 font-weight-bold text-primary" -->
            </div>

            <div class="div card-body">

                <form action="{{ route('commune.update', $commune->id) }}" method="POST">
                    @csrf
                    @method('PATCH')

                    <div class="form-group row">
                        <label for="id" class="col-sm-3 col-form-label">District*:</label>
                        <div class="col-sm-9">
                            <select class="form-control select2" name="iddistrictCom" id="iddistrictCom"
                                data-dependent="id">
                                <option value="">Sélectionnez un district</option>
                                @foreach ($allDistrict2 as $district2Option)
                                    <option value="{{ $district2Option->id }}"
                                        {{ $district2Option->id == $commune->iddistrictCom ? 'selected' : '' }}>
                                        {{ $district2Option->libDistrict }}
                                    </option>
                                @endforeach

                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="nomCommune" class="col-sm-3 col-form-label">Commune*:</label>
                        <div class="col-sm-9">
                        <input id="nomCommune" type="text" name="nomCommune" class="form-control"
                                value="{{ $commune->nomCommune }}"
                                placeholder="Entrer le nom du centre de prise en charge"
                                oninput="convertirEnMajuscules(this)">
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-10">

                            <input type="submit" class="btn btn-primary" value="Modifier">
                            <a href="{{ route('commune.index') }}" class="btn btn-secondary">Liste</a>

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
