               <form  id="theme-form" action="{{ route('theme.store') }}" method="POST">
               @csrf
                    <!-- Contenu spécifique pour la Région -->
                    <div class="mb-3">
                        <label for="libtheme" class="col-sm-3 col-form-label">Thème*:</label>
                        <input type="text" class="form-control" id="libtheme" name="libtheme">

                        <label for="typetheme" class="col-sm-3 col-form-label">Catégorie*:</label>
                        
                                <select class="select2-single-placeholder form-control" name="typetheme" id="typetheme">
                                    <option value="">Catégorie*:</option>
                                    <option value="CAUSERIE EDUCATIVE">CAUSERIE EDUCATIVE</option>
                                    <option value="VISITE A DOMICILE">VISITE A DOMICILE</option>
                                    <option value="CPN">CPN</option>
                                    <option value="ACTIVITÉS PROMOTIONNELLES">ACTIVITÉS PROMOTIONNELLES</option>
                                    <option value="DIALOGUES COMMUNAUTAIRES">DIALOGUES COMMUNAUTAIRES</option>
                                    <option value="ACTIVITÉS PRÉVENTIVES">ACTIVITÉS PRÉVENTIVES</option>
                                    <option value="COMMUN">COMMUN</option>
                                </select>
                            </div>
              
                    <button type="submit" class="btn btn-primary">Soumettre</button>
                    <a href="{{ route('theme.index') }}" class="btn btn-primary">Liste</a>
                </form>