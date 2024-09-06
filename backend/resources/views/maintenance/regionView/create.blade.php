               <form  id="region-form" action="{{ route('region.store') }}" method="POST">
               @csrf
                    <!-- Contenu spécifique pour la Région -->
                    <div class="mb-3">
                        <label for="libRegion" class="form-label">Nom de la Région</label>
                        <input type="text" class="form-control" id="libRegion" name="libRegion">
                    </div>
                    <button type="submit" class="btn btn-primary">Soumettre</button>
                    <a href="{{ route('region.index') }}" class="btn btn-primary">Liste</a>
                </form>