@extends('master')

@section('content')
    <h1>Editer un centre de prise en charge</h1>
    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>

        </div>
    @endif

    <form action="{{ route('centreprisencharge.update', $centreprisencharge->id) }}" method="POST">
        <br>
        @csrf
        @method('PATCH')

        <div class="form-group row">
            <label for="id" class="col-sm-3 col-form-label">Centre de prise en charge*:</label>
            <div class="col-sm-9">
                <select class="form-control input-lg dynamic" name="idDistrictcpecm" id="idDistrictcpecm" data-dependent="id">
                    <option value="">Sélectionnez un District*:</option>
                    @foreach ($listDistrict as $listDistrict)
                        <option value="{{ $listDistrict->id }}">{{ $listDistrict->listDistrict }}</option>
                    @endforeach

                </select>
            </div>
        </div>

        <div class="form-group row">
            <label for="libcpecm" class="col-sm-3 col-form-label">Centre de prise en charge*:</label>
            <div class="col-sm-9">
                <input id="libcpecm" type="text" name="libcpecm" class="form-control" value="{{ old('libcpecm') }}"
                    placeholder="Entrer le nom du centre de prise en charge" oninput="convertirEnMajuscules(this)">
            </div>
        </div>

        <div class="form-group row">
            <label for="codecpecm" class="col-sm-3 col-form-label">Code centre de prise en charge*:</label>
            <div class="col-sm-9">
                <input id="codecpecm" type="text" name="codecpecm" class="form-control" value="{{ old('codecpecm') }}"
                    placeholder="Entrer le nom du centre de prise en charge" oninput="convertirEnMajuscules(this)">
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
