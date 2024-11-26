import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tracking_pregnant/API/constants_urls.dart';

class VillageRepository {
  

  Future<List<Map<String, dynamic>>> fetchVillage() async {
    final response = await http.get(Uri.parse("$baseUrl$getVillageQuarter"));

    if (response.statusCode == 200) {

      final data = json.decode(response.body);
          final List<Map<String, dynamic>> villages = List<Map<String, dynamic>>.from(data['villages']);
      return villages;

    } else {
      throw Exception("Failed to load users");
    }
  }
}
