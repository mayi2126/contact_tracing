import 'dart:convert';
import 'package:tracking/API/constants_urls.dart';
import 'package:tracking/Presentation/Auth/data/Models/user_token.dart';
import 'package:tracking/Presentation/Suivi/data/Models/patient_suivi.dart';
import 'package:tracking/components/utils/load_user.dart';
import 'package:http/http.dart' as http;

abstract class RetrievePatientsSuivisRepository {
  // Mise à jour de la signature de la méthode pour retourner une liste de VisiteModel
  Future<List<PatientSuivi>> fetchAll();
}

class RetrievePatientsSuivisRepositoryImpl
    implements RetrievePatientsSuivisRepository {
  @override
  Future<List<PatientSuivi>> fetchAll() async {
    // Construction de l'URL pour l'API
    final url = Uri.parse("$baseUrl$getPatientsSuiviPath");

    // Chargement des données utilisateur
    User? user = await loadUserData();

    // Envoi de la requête POST
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },

      //TODOS: Remplacer l'ID utilisateur par celui de l'utilisateur connecté
      body: jsonEncode({
        "userEnreg": user!.id, // Assurez-vous que l'ID utilisateur est valide
        "min":"2023-01-01",
        "max":DateTime.now().toString().substring(0, 10)
      }),
    );

    // Vérification de la réponse
    if (response.statusCode == 200) {
      // Si la requête réussit, parsez la réponse en JSON
      final Map<String, dynamic> responseJson =
          jsonDecode(response.body); // Décode le corps de la réponse JSON
      final List<dynamic> data =
          responseJson['data']; // Accède à la clé 'data' du JSON

//  print(data);
      List<PatientSuivi> patientsSuivis =
          data.map((json) => PatientSuivi.fromMap(json)).toList();

      // Retourner la liste des Referencement à partir de la réponse
      return patientsSuivis;
    } else {
      // En cas d'erreur, lancez une exception ou retournez une valeur vide
      throw Exception('Failed to load Patients Suivis');
    }
  }
}
