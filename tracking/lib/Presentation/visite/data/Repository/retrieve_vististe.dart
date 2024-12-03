import 'dart:convert';
import 'package:tracking/API/constants_urls.dart';
import 'package:tracking/Presentation/Auth/data/Models/user_token.dart';
import 'package:tracking/Presentation/visite/data/Models/visite_model.dart';
import 'package:tracking/components/utils/load_user.dart';
import 'package:http/http.dart' as http;

abstract class RetrieveVisiteRepository {
  // Mise à jour de la signature de la méthode pour retourner une liste de VisiteModel
  Future<List<VisiteModel>> fetchVisitesById( String dateMin, String dateMax);
}

class RetrieveVisiteRepositoryImpl implements RetrieveVisiteRepository {

  @override
  Future<List<VisiteModel>> fetchVisitesById( String dateMin, String dateMax) async{
    // Construction de l'URL pour l'API
    final url = Uri.parse("$baseUrl$getVisites");

    // Chargement des données utilisateur
    User? user = await loadUserData();

    

    // Envoi de la requête POST
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "userEnreg": user!.id,  // Assurez-vous que l'ID utilisateur est valide
        "min": dateMin,
        "max": dateMax
      }),
    );

    // Vérification de la réponse
    if (response.statusCode == 200) {
      // Si la requête réussit, parsez la réponse en JSON
      final Map<String, dynamic> responseJson = jsonDecode(response.body);  // Décode le corps de la réponse JSON
      final List<dynamic> data = responseJson['data'];  // Accède à la clé 'data' du JSON


    List<VisiteModel> visites = data.map((json) => VisiteModel.fromMap(json)).toList();


      // Retourner la liste des VisiteModel à partir de la réponse
      return visites;

    } else {
    
      // En cas d'erreur, lancez une exception ou retournez une valeur vide
      throw Exception('Failed to load visites');
    }
  }
}
