import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tracking_pregnant/API/constants_urls.dart';
import 'package:tracking_pregnant/Presentation/Auth/data/Models/user_token.dart';
import 'package:tracking_pregnant/Presentation/Causeries/data/Models/causerie.dart';
import 'package:tracking_pregnant/components/utils/load_user.dart';

abstract class CauserieRepository {
  Future<void> addCauserie(Causerie causerie);
}

class CauserieRepositoryImpl extends CauserieRepository {
  @override
  Future<bool> addCauserie(Causerie causerie) async {
    final url = Uri.parse("$baseUrl$createCauserie"); // Remplace par ton URL

    User? user = await loadUserData();

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "idFsAp": user!.idFsUser,
        "Idquartier": causerie.idquartier,
        "Idvillage": causerie.idvillage,
        "IdelementDonnee": causerie.idelementDonnee,
        "lieuAp": causerie.lieuAp,
        "dateAp": "2023-02-02",
        "nbrepersonnetoucheeFnq": causerie.nbrepersonnetoucheeFnq,
        "nbrepersonnetoucheeFE": causerie.nbrepersonnetoucheeFe,
        "nbrepersonnetoucheeFA": causerie.nbrepersonnetoucheeFa,
        "nbrepersonnetoucheeH":  causerie.nbrepersonnetoucheeH,
        "nbreenfantzvtouche": causerie.nbreenfantzvtouche,
        "nbreautrestouche": causerie.nbreautrestouche,
        "dateEnreg":DateTime.now().toString(),
        "userEnreg": user.id,
        "idAscAp": causerie.idAscAp,
      }),
    );

    if (response.statusCode == 201) {
      print('causerie créé avec succès !');
      return true;
    } else {
      print('Échec de la création d''une causerie : ${response.statusCode}');
      return false;
    }
  }
}
