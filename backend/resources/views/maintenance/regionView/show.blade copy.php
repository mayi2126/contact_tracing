@extends('admin')

@section('content')

    <div class="container  mt-4">
        <div class="card mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between ">
                <!--bg-info text-white-->
                <h3>Modifier un thème</h3> <!--class="m-0 font-weight-bold text-primary" -->
            </div>

            <div class="div card-body">

                <form action="{{ route('theme.update', $theme->id) }}" method="POST">
                    @csrf
                    @method('PATCH')

                    <div class="form-group row">
                        <label for="id" class="col-sm-3 col-form-label">Catégorie de Thème*:</label>
                        <div class="col-sm-9">
                            <select class="form-control input-lg dynamic" name="Idregiontheme" id="Idregiontheme"
                                data-dependent="id">
                                <option value="">Sélectionnez une Région</option>
                                @foreach ($allRegions as $regionOption)
                                    <option value="{{ $regionOption->id }}"
                                        {{ $regionOption->id == $theme->Idregiontheme ? 'selected' : '' }}>
                                        {{ $regionOption->libRegion }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="libtheme" class="col-sm-3 col-form-label">theme*:</label>
                        <div class="col-sm-9">
                            <input id="libtheme" type="text" name="libtheme" class="form-control"
                                value="{{ $theme->libtheme }}" placeholder="Entrer le nom du theme"
                                oninput="convertirEnMajuscules(this)">
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-10">
                            <input type="submit" class="btn btn-primary" value="Modifier">
                            <a href="{{ route('theme.index') }}" class="btn btn-secondary">Liste</a>
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
