<form id="village-form" action="{{ route('village.store') }}" method="POST">
                 @csrf
                    <div class="class=mb-3">
                        <label for="id" class="col-sm-3 col-form-label">Formation sanitaire*:</label>
                     
                            <select class="form-control select2" name="idfsvillage" id="idfsvillage"
                                data-dependent="id">
                                <option value="">Sélectionnez une formation sanitaire</option>
                                @foreach ($listfs as $listfs)
                                <option value="{{ $listfs->id }}">{{ $listfs->libcpecm }}</option>
                                @endforeach 
                            </select>

                        <label for="nomvillage" class="col-sm-3 col-form-label">Nom du village*:</label>
                            <input id="nomvillage" type="text" name="nomvillage" class="form-control"
                                value="{{ old('nomvillage') }}" placeholder="Entrer le nom du village" oninput="convertirEnMajuscules(this)">
                    </div>
                    {{ csrf_field() }} <br>
                    <button type="submit" class="btn btn-primary">Soumettre</button>
                    <a href="{{ route('village.index') }}" class="btn btn-secondary">Liste</a>
                 
                            @if ($message = Session::get('success'))
                                <p style="color: green;">{{ $message }}</p>
                            @endif
                </form>

    <script>
        function convertirEnMajuscules(element) {
            element.value = element.value.toUpperCase();
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</form>

  