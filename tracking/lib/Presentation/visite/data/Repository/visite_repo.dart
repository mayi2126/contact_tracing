import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tracking/API/constants_urls.dart';
import 'package:tracking/Presentation/Auth/data/Models/user_token.dart';
import 'package:tracking/Presentation/visite/data/Models/visite.dart';
import 'package:tracking/components/utils/load_user.dart';

abstract class VisiteRepository {
  Future<void> addVisiteDomicile(Visite visite);
}

class VisiteRepositoryImpl extends VisiteRepository {
  @override
  Future<bool> addVisiteDomicile(Visite visite) async {
    final url = Uri.parse("$baseUrl$createVisite"); // Remplace par ton URL

    User? user = await loadUserData();

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "idFsAp": visite.idFsAp,
        "Idquartier": visite.idquartier,
        "Idvillage": visite.idvillage,
        "IdelementDonnee": visite.idelementDonnee,
        "lieuAp": visite.lieuAp,
        "dateAp": visite.dateAp,
        "nbrepersonnetoucheeFnq": visite.nbrepersonnetoucheeFnq,
        "nbrepersonnetoucheeFE": visite.nbrepersonnetoucheeFe,
        "nbrepersonnetoucheeFA": visite.nbrepersonnetoucheeFa,
        "nbrepersonnetoucheeH":  visite.nbrepersonnetoucheeH,
        "nbreenfantzvtouche": visite.nbreenfantzvtouche,
        "nbreautrestouche": visite.nbreautrestouche,
        // "dateEnreg":DateTime.now().toString(),
        "userEnreg": user!.id,
        "idAscAp": user.idFsUser,
      }),
    );

    if (response.statusCode == 201) {
      print('Post créé avec succès !');
      return true;
    } else {
      print('Échec de la création du post : ${response.statusCode}');
      return false;
    }
  }
}
