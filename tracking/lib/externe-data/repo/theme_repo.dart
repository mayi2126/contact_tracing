import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tracking/API/constants_urls.dart';

class ThemesRepository {
// Remplacez par l'URL de votre API

  Future<List<Map<String, dynamic>>> fetchThemesByType(String type) async {
    final response = await http.get(Uri.parse('$baseUrl$getThemes'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

     

      // Filtrer les thèmes par type
      final List<Map<String, dynamic>> themes = List<Map<String, dynamic>>.from(data['data']);

      
      return themes.where((theme) => theme['typetheme'] == type).toList();
    } else {
      throw Exception("Erreur lors de la récupération des thèmes");
    }
  }
}
