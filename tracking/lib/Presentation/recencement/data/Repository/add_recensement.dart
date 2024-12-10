import 'dart:convert';

import 'package:tracking/API/constants_urls.dart';
import 'package:tracking/Presentation/Auth/data/Models/user_token.dart';
import 'package:tracking/Presentation/recencement/data/Models/info_genrec.dart';
import 'package:http/http.dart' as http;
import 'package:tracking/components/utils/load_user.dart';

abstract class AddRecensementRepository {
  Future<bool> storeInfoGenRec(InfoGenRec infoGenRec);
}

class AddRecensementRepositoryImpl implements AddRecensementRepository {
  @override
  Future<bool> storeInfoGenRec(InfoGenRec infoGenRec) async{
   final url = Uri.parse("$baseUrl$storeInfoGenRecPath");
   print(url);

   // TODO: Implement the actual API call to store the infoGenRec
   // You can use a package like http or dio to make the API call
   // and handle the response accordingly
    User? user = await loadUserData();

    print(user!.id);
    print(infoGenRec.daterecensement);


     final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "localisationgpsrec": infoGenRec.localisationgpsrec,
        "Idquartier": infoGenRec.idquartier,
        "daterecensement": infoGenRec.daterecensement,
        "userEnreg": user!.id,
     
      }),
    );

    if (response.statusCode == 201) {
      print('Genrec créé avec succès !');
      return true;
    } else {
      print('Échec de la création du Genrec : ${response.statusCode}');
      return false;
    }  
  }
}