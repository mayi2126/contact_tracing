@extends('admin')

@section('content')

    <div class="container  mt-4">
        <div class="card mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between ">
                <!--bg-info text-white-->
                <h3>Modifier un village</h3> <!--class="m-0 font-weight-bold text-primary" -->
            </div>

            <div class="div card-body">

                <form action="{{ route('village.update', $village->id) }}" method="POST">
                    @csrf
                    @method('PATCH')

                    <div class="form-group row">
                        <label for="id" class="col-sm-3 col-form-label">Formation sanitaire*:</label>
                        <div class="col-sm-9">
                            <select class="form-control select2" name="idfsvillage" id="idfsvillage"
                                data-dependent="id">
                                <option value="">Sélectionnez une Formation sanitaire</option>
                                @foreach ($allformationsanitaire as $fsOption)
                                    <option value="{{ $fsOption->id }}"
                                        {{ $fsOption->id == $village->idfsvillage ? 'selected' : '' }}>
                                        {{ $fsOption->libcpecm }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="nomvillage" class="col-sm-3 col-form-label">Nom du village*:</label>
                        <div class="col-sm-9">
                            <input id="nomvillage" type="text" name="nomvillage" class="form-control"
                                value="{{ $village->nomvillage }}" placeholder="Entrer le nom"
                                oninput="convertirEnMajuscules(this)">
                        </div>
                    </div>

              

                    <div class="form-group row">
                        <div class="col-sm-10">

                            <input type="submit" class="btn btn-primary" value="Modifier">
                            <a href="{{ route('village.index') }}" class="btn btn-secondary">Liste</a>

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
