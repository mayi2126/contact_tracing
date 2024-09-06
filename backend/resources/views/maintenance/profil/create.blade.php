<form  id="profil-form" action="{{ route('profil.store') }}" method="POST">
               @csrf
                    <!-- Contenu spécifique pour la Région -->
                    <div class="mb-3">
                        <label for="libprofil" class="form-label">Profil*</label>
                        <input type="text" class="form-control" id="libprofil" name="libprofil" require>
                    </div>
                    <button type="submit" class="btn btn-primary">Soumettre</button>
                    <a href="{{ route('profil.index') }}" class="btn btn-primary">Liste</a>
                </form>