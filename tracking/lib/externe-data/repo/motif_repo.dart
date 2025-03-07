import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tracking/API/constants_urls.dart';

class MotifsRepository {
// Remplacez par l'URL de votre API

  Future<List<Map<String, dynamic>>> fetchMotifs() async {
    final response = await http.get(Uri.parse('$baseUrl$getMotifs'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

     

      // Filtrer les thèmes par type
      final List<Map<String, dynamic>> motifs = List<Map<String, dynamic>>.from(data['data']);

      
      return motifs;

    } else {
      throw Exception("Erreur lors de la récupération des motifs");
    }
  }
}
