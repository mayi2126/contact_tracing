import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:tracking/API/constants_urls.dart';
import 'package:tracking/Presentation/Auth/data/Models/user_token.dart';
import 'package:tracking/Presentation/Causeries/data/Models/causerie.dart';
import 'package:tracking/components/utils/load_user.dart';
import 'package:tracking/db/inserts/visite_causerie.dart';

abstract class CauserieRepository {
  Future<void> addCauserie(Causerie causerie);
}

class CauserieRepositoryImpl extends CauserieRepository {
  @override
  Future<bool> addCauserie(Causerie causerie) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    try {
      if (connectivityResult.first == ConnectivityResult.none) {
        int result = await insertCauserie(causerie);
        print(result);
        if (result >= 1) {
          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      print(e.toString());
    }
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
        "dateAp": causerie.dateAp,
        "nbrepersonnetoucheeFnq": causerie.nbrepersonnetoucheeFnq,
        "nbrepersonnetoucheeFE": causerie.nbrepersonnetoucheeFe,
        "nbrepersonnetoucheeFA": causerie.nbrepersonnetoucheeFa,
        "nbrepersonnetoucheeH":  causerie.nbrepersonnetoucheeH,
        "nbreenfantzvtouche": causerie.nbreenfantzvtouche,
        "nbreautrestouche": causerie.nbreautrestouche,
        // "dateEnreg":DateTime.now().toString(),
        "userEnreg": user.id,
        "idAscAp": user.idFsUser,
      })
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
