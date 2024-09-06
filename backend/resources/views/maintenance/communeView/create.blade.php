<form id="commune-form" action="{{ route('commune.store') }}" method="POST">
                 @csrf
                    <div class="class=mb-3">
                        <label for="id" class="col-sm-3 col-form-label">District*:</label>
                     
                             <select class="form-control  select2" name="iddistrictCom" id="iddistrictCom"
                                data-dependent="id">
                                <option value="">Sélectionnez un district</option>
                                @foreach ($listDistrict as $listDistrict)
                                <option value="{{ $listDistrict->id }}">{{ $listDistrict->libDistrict }}</option>
                                @endforeach 
                               </select>
                    
                        <label for="nomCommune" class="col-sm-3 col-form-label">Commune sanitaire*:</label>
                        <input id="nomCommune" type="text" name="nomCommune" class="form-control"
                                    value="{{ old('nomCommune') }}" placeholder="Entrer le nom de la Commune sanitaire"
                                    oninput="convertirEnMajuscules(this)">
                    </div>
                    {{ csrf_field() }} <br>
                    <button type="submit" class="btn btn-primary">Soumettre</button>
                    <a href="{{ route('commune.index') }}" class="btn btn-secondary">Liste</a>
                 
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

  