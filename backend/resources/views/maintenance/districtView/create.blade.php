              <form id="district-form" action="{{ route('district.store') }}" method="POST">
                 @csrf
                    <div class="class=mb-3">
                        <label for="id" class="col-sm-3 col-form-label">Région*:</label>
                     
                            <select class="form-control input-lg dynamic" name="IdregionDistrict" id="IdregionDistrict"
                                data-dependent="id">
                                <option value="">Sélectionnez une région</option>
                                @foreach ($listRegions as $listRegion)
                                    <option value="{{ $listRegion->id }}">{{ $listRegion->libRegion }}</option>
                                @endforeach 
                            </select>
                    
                        <label for="libDistrict" class="col-sm-3 col-form-label">District*:</label>
                            <input id="libDistrict" type="text" name="libDistrict" class="form-control"
                                value="{{ old('libDistrict') }}" placeholder="Entrer le nom du district"
                                oninput="convertirEnMajuscules(this)">
                    </div>
                    {{ csrf_field() }} <br>
                    <button type="submit" class="btn btn-primary">Soumettre</button>
                    <a href="{{ route('district.index') }}" class="btn btn-secondary">Liste</a>
                 
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

  