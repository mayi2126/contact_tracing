import 'dart:convert';

import 'package:tracking/API/constants_urls.dart';
import 'package:tracking/Presentation/Auth/data/Models/user_token.dart';
import 'package:http/http.dart' as http;
import 'package:tracking/components/utils/load_user.dart';

abstract class MakeContreReferencementRepository {
  Future<bool> makeContreReferencement( String prestataire,
   String recommendation,
   String grossesseconfirme,
   int idRef);
}

class MakeContreReferencementRepositoryImpl implements MakeContreReferencementRepository {
  @override
  Future<bool> makeContreReferencement(  String prestataire,
   String recommendation,
   String grossesseconfirme,
   int idRef) async {
    final url = Uri.parse("$baseUrl$makeContreReferencementPath");

    // You can use a package like http or dio to make the API call
    // and handle the response accordingly
    User? user = await loadUserData();

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "idreference": idRef,
        "prestatairesoins": prestataire,
        "userEnreg": user!.id,
        "recommandation": recommendation,
        "dateref": DateTime.now().toString(),
        "grossesseconfirme":grossesseconfirme
      }),
    );

    if (response.statusCode == 201) {
      print('referencement accompli avec succès !');
      return true;
    } else {
      print('Échec de referencement : ${response.body}');
      return false;
    }
  }
}
