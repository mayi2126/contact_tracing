import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tracking/API/constants_urls.dart';

class QuartierRepository {
  

  Future<List<Map<String, dynamic>>> fetchVillageQuartier(int idVillage) async {
    print('-------------------');
    print(idVillage);
    final response = await http.post(Uri.parse("$baseUrl$getQuartier"),
    headers: {
        'Content-Type': 'application/json',
      },
        body: jsonEncode({
          "idvillagequartier":idVillage
        }) 
        
        );

    if (response.statusCode == 200) {

      final data = json.decode(response.body);
          final List<Map<String, dynamic>> quartiers = List<Map<String, dynamic>>.from(data['data']);
      return quartiers;

    } else {
     
      throw Exception("Failed to load quartiers");

    }
  }
}
