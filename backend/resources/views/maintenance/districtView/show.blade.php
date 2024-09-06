@extends('admin')

@section('content')


    <div class="container  mt-4">
        <div class="card mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between ">
                <!--bg-info text-white-->
                <h3>Modifier un district</h3> <!--class="m-0 font-weight-bold text-primary" -->
            </div>

            <div class="div card-body">

                <form action="{{ route('district.update', $district->id) }}" method="POST">
                    @csrf
                    @method('PATCH')

                    <div class="form-group row">
                        <label for="id" class="col-sm-3 col-form-label">Région*:</label>
                        <div class="col-sm-9">
                            <select class="form-control input-lg dynamic" name="IdregionDistrict" id="IdregionDistrict"
                                data-dependent="id">
                                <option value="">Sélectionnez une Région</option>
                                @foreach ($listRegion as $regionOption)
                                    <option value="{{ $regionOption->id }}"
                                        {{ $regionOption->id == $district->IdregionDistrict ? 'selected' : '' }}>
                                        {{ $regionOption->libRegion }}
                                    </option>
                                @endforeach

                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="libDistrict" class="col-sm-3 col-form-label">District*:</label>
                        <div class="col-sm-9">
                            <input id="libDistrict" type="text" name="libDistrict" class="form-control"
                                value="{{ $district->libDistrict }}" placeholder="Entrer le nom du district"
                                oninput="convertirEnMajuscules(this)">
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-10">

                            <input type="submit" class="btn btn-primary" value="Modifier">
                            <a href="{{ route('district.index') }}" class="btn btn-secondary">Liste</a>

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
