<form id="quartier-form" action="{{ route('quartier.store') }}" method="POST">
                 @csrf
                    <div class="class=mb-3">
                        <label for="id" class="col-sm-3 col-form-label">Village*:</label>
                     
                        <select class="form-control select2" name="idvillagequartier" id="idvillagequartier"
                                data-dependent="id">
                                <option value="">Sélectionnez un village</option>
                                @foreach ($listvillage as $listvillage)
                                <option value="{{ $listvillage->id }}">{{ $listvillage->nomvillage }}</option>
                                @endforeach 
                         </select>

                        <label for="nomquartier" class="col-sm-3 col-form-label">Nom du quartier*:</label>
                            <input id="nomquartier" type="text" name="nomquartier" class="form-control"
                                value="{{ old('nomquartier') }}" placeholder="Entrer le nom du quartier" oninput="convertirEnMajuscules(this)">
                    </div>
                    {{ csrf_field() }} <br>
                    <button type="submit" class="btn btn-primary">Soumettre</button>
                    <a href="{{ route('quartier.index') }}" class="btn btn-secondary">Liste</a>
                 
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

  