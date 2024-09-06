               <form  id="profession-form" action="{{ route('profession.store') }}" method="POST">
               @csrf
                    <!-- Contenu spécifique pour la Région -->
                    <div class="mb-3">
                        <label for="libprofession" class="col-sm-3 col-form-label">Profession*:</label>
                        <input type="text" class="form-control" id="libprofession" name="libprofession"> <br>

                    <button type="submit" class="btn btn-primary">Soumettre</button>
                    <a href="{{ route('profession.index') }}" class="btn btn-primary">Liste</a>
                </form>