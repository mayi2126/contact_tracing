import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tracking/API/constants_urls.dart';
import 'package:tracking/Presentation/Auth/data/Models/user_token.dart';
import 'package:tracking/components/utils/load_user.dart';

class VillageRepository {
  Future<List<Map<String, dynamic>>> fetchVillage() async {
    User? user = await loadUserData();
    final response = await http.post(Uri.parse("$baseUrl$getVillage"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({"idfsuser": user!.idFsUser}));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Map<String, dynamic>> villages =
          List<Map<String, dynamic>>.from(data['data']);

// Supposons que chaque village ait un identifiant unique "id"
      final uniqueVillages = <Map<String, dynamic>>[];

      final seenIds = <int>{}; // Set pour stocker les ids déjà rencontrés

      for (var village in villages) {
        final id = village['id'];
        if (!seenIds.contains(id)) {
          seenIds.add(id); // Ajouter l'id au Set
          uniqueVillages
              .add(village); // Ajouter le village à la liste des uniques
        }
      }

      return uniqueVillages;
    } else {
      throw Exception("Failed to load users");
    }
  }
}
