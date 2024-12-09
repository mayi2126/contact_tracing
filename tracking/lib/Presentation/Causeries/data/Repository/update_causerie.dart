import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tracking/API/constants_urls.dart';
import 'package:tracking/Presentation/Auth/data/Models/user_token.dart';
import 'package:tracking/Presentation/Causeries/data/Models/causerie.dart';
import 'package:tracking/components/utils/load_user.dart';

abstract class UpdateCauserie {
  Future<void> updateCauserie(Causerie causerie,int id);
}

class UpdateCauserieImpl extends UpdateCauserie {
  @override
  Future<bool> updateCauserie(Causerie causerie,int id) async {
    final url = Uri.parse("$baseUrl$updateCauseriePath/$id"); // Remplace par ton URL
    print(url);

    User? user = await loadUserData();

    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "idFsAp": causerie.idFsAp,
        "Idquartier": causerie.idquartier,
        "Idvillage": causerie.idvillage,
        "IdelementDonnee": causerie.idelementDonnee,
        "lieuAp": causerie.lieuAp,
        "dateAp": causerie.dateAp,
        "nbrepersonnetoucheeFnq": causerie.nbrepersonnetoucheeFnq,
        "nbrepersonnetoucheeFE": causerie.nbrepersonnetoucheeFe,
        "nbrepersonnetoucheeFA": causerie.nbrepersonnetoucheeFa,
        "nbrepersonnetoucheeH":  causerie.nbrepersonnetoucheeH,
        "nbreenfantzvtouche": causerie.nbreenfantzvtouche,
        "nbreautrestouche": causerie.nbreautrestouche,
        // "dateEnreg":DateTime.now().toString(),
        "userEnreg": user!.id,
        "idAscAp": user.idFsUser,
      }),
    );

    if (response.statusCode == 200) {
      print('Post créé avec succès !');
      return true;
    } else {
      print('Échec s : ${response.statusCode}');
      return false;
    }
  }
}
