@extends('master')

@section('content')
    <h1>Editer une Région</h1>
    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>

        </div>
    @endif

    <form action="{{ route('region.update', $region->id) }}" method="POST">
        <br>
        @csrf
        @method('PATCH')

        <div class="form-group row">
            <label for="nom" class="col-sm-3 col-form-label">Nom:</label>
            <div class="col-sm-9">
                <input id="libRegion" type="text" name="libRegion" class="form-control" value="{{ old('libRegion') }}"
                    placeholder="Entrer la région" oninput="convertirEnMajuscules(this)">
            </div>
        </div>


        <input type="submit" value="Modifier">
    </form>

    <script>
        function convertirEnMajuscules(element) {
            element.value = element.value.toUpperCase();
        }
    </script>
@endsection
