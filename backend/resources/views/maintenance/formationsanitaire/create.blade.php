<form id="formationsanitaire-form" action="{{ route('formationsanitaire.store') }}" method="POST">
                 @csrf
                    <div class="class=mb-3">
                        <label for="id" class="col-sm-3 col-form-label">Commune sanitaire*:</label> 
                        <select class="form-control input-lg dynamic  select2" name="idcommunefs" id="idcommunefs"
                                data-dependent="id">
                                <option value="">Sélectionnez une commune sanitaire</option>
                                @foreach ($listcommune as $listcommune)
                                <option value="{{ $listcommune->id }}">{{ $listcommune->nomCommune }}</option>
                                @endforeach 
                         </select>
                    
                        <label for="libcpecm" class="col-sm-3 col-form-label">Nom de la formation sanitaire*:</label>
                            <input id="libcpecm" type="text" name="libcpecm" class="form-control"
                                value="{{ old('libcpecm') }}" placeholder="Entrer le nom de la formation sanitaire"
                                oninput="convertirEnMajuscules(this)">

                                <label for="typecentre" class="col-sm-3 col-form-label">Catégorie*:</label>
                      
                                <select class="select2-single-placeholder form-control" name="typecentre" id="typecentre">
                                    <option value="">Catégorie*:</option>
                                    <option value="CHU">CHU</option>
                                    <option value="CHR">CHR</option>
                                    <option value="CHP">CHP</option>
                                    <option value="CMS">CMS</option>
                                    <option value="USP">USP</option>
                                    <option value="ONG">ONG</option>
                                    <option value="CLINIQUE">CLINIQUE</option>
                                    <option value="LUCREATIF">LUCREATIF</option>
                                    <option value="USP">INFIRMERIE</option>
                                    <option value="ONG">PMI</option>
                                    <option value="CLINIQUE">CMA</option>
                                    <option value="LUCREATIF">CENTRE</option>
                                    <option value="LUCREATIF">CABINET</option>
                                    <option value="LUCREATIF">PROGRAMME</option>
                                    <option value="LUCREATIF">LABORATOIRE</option>
                                </select>
                   
                    </div>
                    {{ csrf_field() }} <br>
                    <button type="submit" class="btn btn-primary">Soumettre</button>
                    <a href="{{ route('formationsanitaire.index') }}" class="btn btn-secondary">Liste</a>
                 
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

  