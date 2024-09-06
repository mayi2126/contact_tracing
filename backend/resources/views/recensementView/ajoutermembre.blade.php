@extends('admin')

@section('content')

<div id="wrapper">

<div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12 text-center">
                    <h1 class="m-0">AJOUTER LE(S) MEMBRE(S) DE FAMILLE</h1>
                </div>
               
            </div>
        
        </div>
    </div>
    
    <div class="container d-flex justify-content-center">
        <div class="card" style="width: 50%;">
            <div class="card-body">
                <form id="recensement-form" action="{{ route('storemembre') }}" method="POST">
                    @csrf

                    <div class="form-group">
                        <label>N° DE MÉNAGE *</label>
                        <input id="nummenagerec" type="text" name="nummenagerec" class="form-control"
                               value="{{ $nummenagerec }}" readonly>
                    </div>

                    <input id="idinfogeneral" type="text" name="idinfogeneral" 
                            class="form-control" value="{{ $idinfogeneral }}" hidden>
                    <input id="Idvillage" type="text" name="Idvillage" 
                            class="form-control" value="{{ $Idvillage}}" hidden>
                    <input id="Idquartier" type="text" name="Idquartier" 
                            class="form-control" value="{{ $Idquartier }}" hidden>
                    <input id="prenomchefmenagerec" type="text" name="prenomchefmenagerec" 
                            class="form-control" value="{{ $prenomchefmenagerec}}" hidden>
                    <input id="nomchefmenagerec" type="text" name="nomchefmenagerec" 
                            class="form-control" value="{{ $nomchefmenagerec }}" hidden>
                    <input id="idchefmenagerec" type="text" name="idchefmenagerec" 
                            class="form-control" value="{{ $idchefmenagerec }}" hidden>
                    <input id="daterecensement" type="text" name="daterecensement" 
                            class="form-control" value="{{ $daterecensement }}" hidden>
                    <input id="localisationgpsrec" type="text" name="localisationgpsrec" 
                            class="form-control" value="{{ $localisationgpsrec }}" hidden>

                    <div class="form-group">
                        <label>Nom *</label>
                        <input id="membrenomrec" type="text" name="membrenomrec" class="form-control"
                               value="{{ old('membrenomrec') }}" placeholder="Entrer le nom et prénoms du membre"
                               oninput="convertirEnMajuscules(this)" required>
                    </div>

                    <div class="form-group">
                        <label>Prénom(s)*</label>
                        <input id="membreprenomrec" type="text" name="membreprenomrec" class="form-control"
                               value="{{ old('membreprenomrec') }}" placeholder="Entrer le nom et prénoms du membre"
                               oninput="convertirEnMajuscules(this)" required>
                    </div>

                    <div class="form-group">
                        <label>Date de Naissance *</label>
                        <input id="membredatenaissrec" type="date" name="membredatenaissrec" class="form-control"
                         value="{{ old('membredatenaissrec') }}" placeholder="Entrer la date de naissance" required
                           max="{{ date('Y-m-d') }}">
                    </div>

                    <div class="form-group">
                        <label>Âge en année*</label>
                        <input id="membreagerec" type="number" name="membreagerec" class="form-control"
                               value="{{ old('membreagerec') }}" placeholder="Entrer l'âge" required>
                    </div>

                    <div class="form-group">
                        <label>Âge en mois*</label>
                        <input id="agemois" type="number" name="agemois" class="form-control"
                               value="{{ old('agemois') }}"  readonly>
                    </div>

                    <div class="form-group">
                        <label>Sexe (0 à 24 mois) *</label>
                        <select id="sexezerovingtquatremoisrec" name="sexezerovingtquatremoisrec" class="form-control" required>
                            <option value="">Sélectionnez le sexe</option>
                            <option value="M">Masculin</option>
                            <option value="F">Féminin</option>
                        </select>
                    </div>

                    <div class="form-group">
                         <div class="input-group">
                              <span class="input-group-text">* FA &nbsp;<input type="radio" name="option" value="FA"></span>
                              <span class="input-group-text">** FE &nbsp;<input type="radio" name="option" value="FE"></span>
                              <span class="input-group-text">*** AF &nbsp;<input type="radio" name="option" value="AF"></span>
                              <input id="textselect" type="text" class="form-control" readonly>
                              <input id="typedefemmeFA" type="text" class="form-control" name="typedefemmeFA" value="{{ old('typedefemmeFA') }} " hidden>
                              <input id="typedefemmeFE" type="text" class="form-control" name="typedefemmeFE" value="{{ old('typedefemmeFE') }} " hidden>
                              <input id="typedefemmeAF" type="text" class="form-control" name="typedefemmeAF" value="{{ old('typedefemmeAF') }} " hidden>
                         </div>
                    </div>

                  <div class="form-group">
                         <label>Contact</label>
                            <div class="input-group">
                               <div class="input-group-prepend">
                                   <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                </div>
                               <input id="contactrec" type="text" class="form-control" name="contactrec" value="{{ old('contactrec') }} " maxlength="8">
                            </div>
                             <!-- /.input group -->
                  </div>

                  <div class="form-group text-center">
                        <button type="submit" class="btn btn-primary">Ajouter un membre de famille</button>

                        <!--a href="{{ route('createchefmenage') }}"
                            class="btn btn-primary">  Passer à un autre ménage  </a-->

                        <button type="button" class="btn btn-primary" >Passer à un autre ménage</button>
                        <button type="reset" class="btn btn-secondary">Liste</button>
                    </div>

                    <div class="form-group text-center mt-4">
                        <button type="submit" class="btn btn-success">Enrégistrer tout et quitter</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="{{ asset('js/jquery.min.js') }}"></script>
<script src="{{ asset('js/bootstrap.bundle.min.js') }}"></script>

<script>
  document.getElementById('inputUrgence').addEventListener('change', function() {
    var urgence = document.getElementById('inputUrgence');
    if (this.checked) {
      urgence.value = 'oui';
    } else {
      urgence.value = 'non';
    }
  });
</script>

<script>
    document.getElementById('membredatenaissrec').addEventListener('change', function() {
        var birthDate = new Date(this.value);
        var today = new Date();
        var membreagerec = today.getFullYear() - birthDate.getFullYear();
        var month = today.getMonth() - birthDate.getMonth();

        // Adjust if the current month is before the birth month or the current day is before the birth day
        if (month < 0 || (month === 0 && today.getDate() < birthDate.getDate())) {
            membreagerec--;
        }
        document.getElementById('membreagerec').value = membreagerec;
    });

     // Function to calculate birth date from age
     document.getElementById('membreagerec').addEventListener('input', function() {
        var age = parseInt(this.value);
        if (!isNaN(membreagerec)) {
            var today = new Date();
            var birthYear = today.getFullYear() - membreagerec;

            // Defaulting birth date to today’s month and day if they haven't passed yet
            var birthDate = new Date(birthYear, today.getMonth(), today.getDate());

            document.getElementById('membredatenaissrec').valueAsDate = birthDate;
        }
    });
</script>

<script>
    // Function to update the text field based on the selected radio button
    function updateText() {
        var selectedOption = document.querySelector('input[name="option"]:checked').value;
        var textField = document.getElementById('textselect');
        var typeFemmeFieldFA = document.getElementById('typedefemmeFA');
        var typeFemmeFieldFE = document.getElementById('typedefemmeFE');
        var typeFemmeFieldAF = document.getElementById('typedefemmeAF');

        if (selectedOption === 'FA') {
            textField.value = 'Femme Allaitante';
            typeFemmeFieldFA.value = 'FA';
        } else if (selectedOption === 'FE') {
            textField.value = 'Femme Enceinte';
            typeFemmeFieldFE.value = 'FE';
        } else if (selectedOption === 'AF') {
            textField.value = 'Autres Femmes';
            typeFemmeFieldAF.value = 'AF';
        } else {
            textField.value = '';
            typeFemmeFieldFA.value = '';
            typeFemmeFieldFE.value = '';
            typeFemmeFieldAF.value = '';
        }
    }

    // Attach event listeners to the radio buttons
    var radioButtons = document.querySelectorAll('input[name="option"]');
    radioButtons.forEach(function(radio) {
        radio.addEventListener('change', updateText);
    });
</script>


<script>
    function convertirEnMajuscules(input) {
        input.value = input.value.toUpperCase();
    }
</script>

<script>
    document.getElementById('membredatenaissrec').addEventListener('change', function() {
        const birthDate = new Date(this.value);
        const today = new Date();

        // Calculate the difference in months
        let ageInMonths = (today.getFullYear() - birthDate.getFullYear()) * 12;
        ageInMonths -= birthDate.getMonth();
        ageInMonths += today.getMonth();

        // Update the age in months input field
        document.getElementById('agemois').value = ageInMonths;
    });
</script>

<script>
    document.getElementById('sexezerovingtquatremoisrec').addEventListener('change', function() {
        var selectedSex = this.value;
        var radioButtons = document.querySelectorAll('input[name="option"]');

        if (selectedSex === 'M') {
            radioButtons.forEach(function(radio) {
                radio.disabled = true;
                radio.checked = false;
            });
            document.getElementById('textselect').value = ''; // Clear the text fields
            document.getElementById('typedefemme').value = '';
        } else {
            radioButtons.forEach(function(radio) {
                radio.disabled = false;
            });
        }
    });
</script>

@endsection
