@extends('admin')

@section('content')

    <div class="container  mt-4">
        <div class="card mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between ">
                <!--bg-info text-white-->
                <h3>Modifier une formation sanitaire</h3> <!--class="m-0 font-weight-bold text-primary" -->
            </div>

            <div class="div card-body">

                <form action="{{ route('formationsanitaire.update', $formationsanitaire->id) }}" method="POST">
                    @csrf
                    @method('PATCH')

                    <div class="form-group row">
                        <label for="id" class="col-sm-3 col-form-label">Commune*:</label>
                        <div class="col-sm-9">
                            <select class="form-control select2" name="idcommunefs" id="idcommunefs"
                                data-dependent="id">
                                <option value="">Sélectionnez une commune</option>
                                @foreach ($allcommune as $communeOption)
                                    <option value="{{ $communeOption->id }}"
                                        {{ $communeOption->id == $formationsanitaire->idcommunefs ? 'selected' : '' }}>
                                        {{ $communeOption->nomCommune }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="libcpecm" class="col-sm-3 col-form-label">Formation sanitaire*:</label>
                        <div class="col-sm-9">
                            <input id="libcpecm" type="text" name="libcpecm" class="form-control"
                                value="{{ $formationsanitaire->libcpecm }}" placeholder="Entrer le nom"
                                oninput="convertirEnMajuscules(this)">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="typecentre" class="col-sm-3 col-form-label">Type Formation sanitaire*:</label>
                        <div class="col-sm-9">
                            <input id="typecentre" type="text" name="typecentre" class="form-control"
                                value="{{ $formationsanitaire->typecentre }}" placeholder="Entrer le Type Formation sanitaire"
                                oninput="convertirEnMajuscules(this)">
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-10">

                            <input type="submit" class="btn btn-primary" value="Modifier">
                            <a href="{{ route('formationsanitaire.index') }}" class="btn btn-secondary">Liste</a>

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
