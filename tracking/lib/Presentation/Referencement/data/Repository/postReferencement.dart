import 'dart:convert';

import 'package:tracking/API/constants_urls.dart';
import 'package:tracking/Presentation/Auth/data/Models/user_token.dart';
import 'package:http/http.dart' as http;
import 'package:tracking/components/utils/load_user.dart';

abstract class MakeReferencementRepository {
  Future<bool> makeReferencement(int idRecensement,String idMotif);
}

class MakeReferencementRepositoryImpl implements MakeReferencementRepository {
  @override
  Future<bool> makeReferencement(int idRecensement,String idMotif) async {
    final url = Uri.parse("$baseUrl$makeReferencementPath");

    // TODO: Implement the actual API call to store the referencement
    // You can use a package like http or dio to make the API call
    // and handle the response accordingly
    User? user = await loadUserData();

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "idrecencement": idRecensement,
        "statutref": "Référé",
        "userEnreg": user!.id,
        "idFsref": user.idFsUser,
        "dateref": DateTime.now().toString(),
        "idmotifRef":int.parse(idMotif)
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
