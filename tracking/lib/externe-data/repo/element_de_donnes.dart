import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tracking/API/constants_urls.dart';


class ElementsRepository {
  Future<List<Map<String, dynamic>>> fetchElements() async {
  
    final response = await http.get(Uri.parse("$baseUrl$getElementDeDonne"),
        headers: {
          'Content-Type': 'application/json',
        },
);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Map<String, dynamic>> elements =
          List<Map<String, dynamic>>.from(data['data']);

// Supposons que chaque village ait un identifiant unique "id"
     

      return elements;
    } else {
      throw Exception("Failed to load elements");
    }
  }
}
