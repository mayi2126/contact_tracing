import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tracking_pregnant/API/constants_urls.dart';

class ProfessionsRepository {
// Remplacez par l'URL de votre API

  Future<List<Map<String, dynamic>>> fetchProfessions() async {
    final response = await http.get(Uri.parse('$baseUrl$getProfessions'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

     

      // Filtrer les thèmes par type
      final List<Map<String, dynamic>> professions = List<Map<String, dynamic>>.from(data['data']);

      
      return professions;

    } else {
      throw Exception("Erreur lors de la récupération des professions");
    }
  }
}
