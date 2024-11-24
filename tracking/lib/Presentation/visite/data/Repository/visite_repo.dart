import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tracking_pregnant/API/constants_urls.dart';
import 'package:tracking_pregnant/Presentation/visite/data/Models/visite.dart';

abstract class VisiteRepository {
  Future<void> addVisiteDomicile(Visite visite);
}

class VisiteRepositoryImpl extends VisiteRepository {
  @override
  Future<void> addVisiteDomicile(Visite visite) async {
    final url = Uri.parse("$baseUrl$createVisite"); // Remplace par ton URL

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(visite.toJson()),
    );

    if (response.statusCode == 201) {
      print('Post créé avec succès !');
    } else {
      print('Échec de la création du post : ${response.statusCode}');
    }
  }
}
