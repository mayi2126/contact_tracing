import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:tracking/API/constants_urls.dart';
import 'package:tracking/Presentation/Auth/data/Models/user_token.dart';
import 'package:http/http.dart' as http;
import 'package:tracking/Presentation/recencement/data/Models/menage.dart';
import 'package:tracking/components/utils/load_user.dart';
import 'package:tracking/db/inserts/recensement.dart';

abstract class AddMenageRepository {
  Future<bool> addMenage(Menage menage);
}

class AddMenageRepositoryImpl implements AddMenageRepository {
  @override
  Future<bool> addMenage(Menage menage) async {

      final connectivityResult = await Connectivity().checkConnectivity();
    try {
      if (connectivityResult.first == ConnectivityResult.none) {
        int result = await insertIntoMenages(menage.nomchefmenagerec, menage.prenomchefmenagerec, menage.userEnreg);
        if (result >= 1) {
          // print("success");
          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      print(e.toString());
    }
    final url = Uri.parse("$baseUrl$addMenagePath");

    // TODO: Implement the actual API call to store the menage
    // You can use a package like http or dio to make the API call
    // and handle the response accordingly
    User? user = await loadUserData();

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "nomchefmenagerec": menage.nomchefmenagerec,
        "prenomchefmenagerec": menage.prenomchefmenagerec,
        "userEnreg": user!.id
      }),
    );

    if (response.statusCode == 201) {
      print('Chef menage créé avec succès !');
      return true;
    } else {
      print('Échec de la création de Chef menage : ${response.statusCode}');
      return false;
    }
  }
}
