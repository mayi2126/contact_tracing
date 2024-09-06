@extends('master')

@section('content')
    <h1>Editer un district</h1>
    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>

        </div>
    @endif

    <form action="{{ route('district.update', $district->id) }}" method="POST">
        <br>
        @csrf
        @method('PATCH')

        <div class="form-group row">
            <label for="id" class="col-sm-3 col-form-label">Région*:</label>
            <div class="col-sm-9">
                <select class="form-control input-lg dynamic" name="IdregionDistrict" id="IdregionDistrict"
                    data-dependent="id">
                    <option value="">Sélectionnez un district</option>
                    @foreach ($listRegion as $listRegion)
                        <option value="{{ $listRegion->id }}">{{ $listRegion->IdregionDistrict }}</option>
                    @endforeach

                </select>
            </div>
        </div>

        <div class="form-group row">
            <label for="libDistrict" class="col-sm-3 col-form-label">District*:</label>
            <div class="col-sm-9">
                <input id="libDistrict" type="text" name="libDistrict" class="form-control"
                    value="{{ old('libDistrict') }}" placeholder="Entrer le nom du district"
                    oninput="convertirEnMajuscules(this)">
            </div>
        </div>



        <div class="form-group row">
            <label for="libDistrict" class="col-sm-3 col-form-label">District*:</label>
            <div class="col-sm-9">
                <input id="libDistrict" type="text" name="libDistrict" class="form-control"
                    value="{{ old('libDistrict') }}" placeholder="Entrer le nom du district"
                    oninput="convertirEnMajuscules(this)">
            </div>
        </div>


        <input type="submit" value="Modifier">
    </form>

    <script>
        function convertirEnMajuscules(element) {
            element.value = element.value.toUpperCase();
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {

            $('.dynamic').change(function() {
                if ($(this).val() != '') {
                    var select = $(this).attr("IdregionDistrict");
                    var select = $(this).val();
                    var dependent = $(this).data('dependent');
                    var _token = $('input[name="_token"]').val();
                    $.ajax({
                        url: "{{ route('districtcontroller.fetch') }}",
                        method: "POST",
                        data: {
                            select: select,
                            value: value,
                            _token: _token,
                            dependent: dependent
                        },
                        success: function(result) {
                            $('#' + dependent).html(result);
                        }
                    })
                }
            });


        });
    </script>
@endsection
