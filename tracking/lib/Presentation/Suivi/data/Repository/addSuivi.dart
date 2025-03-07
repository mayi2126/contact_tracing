import 'dart:convert';

import 'package:tracking/API/constants_urls.dart';
import 'package:tracking/Presentation/Auth/data/Models/user_token.dart';
import 'package:http/http.dart' as http;
import 'package:tracking/Presentation/Suivi/data/Models/suivi.dart';
import 'package:tracking/components/utils/load_user.dart';

abstract class AddSuiviRepository {
  Future<bool> addSuivi(Suivi suivi);
}

class AddSuiviRepositoryImpl implements AddSuiviRepository {
  @override
  Future<bool> addSuivi(Suivi suivi) async {
    final url = Uri.parse("$baseUrl$addSuiviPath");

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
       "idFsref":user!.idFsUser,
        "idcontrereference":suivi.idRef,
        "statutref":"SuiviFe",
        "datesuivi":DateTime.now().toString(),
        "rdvrespecte":suivi.rdvrespecte,
        "cpnavantdouzsa":suivi.cpnavantdouzsa,
        "dispomedicament":suivi.dispomedicament,
        "palumiidisponible":suivi.palumiidisponible,
        "paludormirsousmii":suivi.paludormirsousmii,
        "palutpiun":suivi.palutpiun,
        "palutpideux":suivi.palutpideux,
        "palutpitrois":suivi.palutpitrois,
        "palutpiquatre":suivi.palutpiquatre,
        "statuvaccorrect":suivi.statuvaccorrect,
        "analysemedrealise":suivi.analysemedrealise,
        "recherchesignedanger":suivi.recherchesignedanger,
        "grossesseconfirme":"Oui",
        "agegrossesse":"6SA",
        "issusaccouchement":suivi.issusaccouchement,
        "lieuaccouchementfs":suivi.lieuaccouchementfs,
        "sirdvrespectenon":suivi.sirdvrespectenon,
        "userEnreg":user.id
}
      ),
    );

    if (response.statusCode == 201) {
      print('Suivi créé avec succès !');
      return true;
    } else {
      print('Échec de Suivi : ${response.body}');
      return false;
    }
  }
}
