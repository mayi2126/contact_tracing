import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tracking/API/constants_urls.dart';
import 'package:tracking/Presentation/Auth/data/Models/user_token.dart';
import 'package:tracking/Presentation/visite/data/Models/visite.dart';
import 'package:tracking/components/utils/load_user.dart';

abstract class UpdateVisite {
  Future<void> updateVisiteDomicile(Visite visite,int id);
}

class UpdateVisiteImpl extends UpdateVisite {
  @override
  Future<bool> updateVisiteDomicile(Visite visite,int id) async {
    final url = Uri.parse("$baseUrl$updateViste/$id"); // Remplace par ton URL

    User? user = await loadUserData();

    final response = await http.put(
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

    if (response.statusCode == 200) {
      print('Post créé avec succès !');
      return true;
    } else {
      print('Échec s : ${response.statusCode}');
      return false;
    }
  }
}
