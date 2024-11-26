import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tracking_pregnant/API/constants_urls.dart';

class QuartierRepository {
  

  Future<List<Map<String, dynamic>>> fetchVillageQuartier() async {
    final response = await http.get(Uri.parse("$baseUrl$getVillageQuarter"));

    if (response.statusCode == 200) {

      final data = json.decode(response.body);
          final List<Map<String, dynamic>> quartiers = List<Map<String, dynamic>>.from(data['quartiers']);
      return quartiers;

    } else {
      throw Exception("Failed to load users");
    }
  }
}