               <form  id="motif-form" action="{{ route('motif.store') }}" method="POST">
               @csrf
                    <!-- Contenu spécifique pour la Région -->
                    <div class="mb-3">
                        <label for="libmotif" class="col-sm-3 col-form-label">Motif*:</label>
                        <input type="text" class="form-control" id="libmotif" name="libmotif">

                            </div>
              
                    <button type="submit" class="btn btn-primary">Soumettre</button>
                    <a href="{{ route('motif.index') }}" class="btn btn-primary">Liste</a>
                </form>