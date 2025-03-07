import 'dart:convert';

import 'package:tracking/API/constants_urls.dart';
import 'package:tracking/Presentation/Auth/data/Models/user_token.dart';
import 'package:http/http.dart' as http;
import 'package:tracking/components/utils/load_user.dart';

abstract class RecConfRepository {
  Future<bool> recConf();
}

class RecConfRepositoryImpl implements RecConfRepository {
  @override
  Future<bool> recConf() async {
    final url = Uri.parse("$baseUrl$recConfPath");

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
        
        "userEnreg": user!.id
      }),
    );

    if (response.statusCode == 201) {
      print('Rec créé avec succès !');
      return true;
    } else {
      print('Échec de la création de Rec : ${response.statusCode}');
      return false;
    }
  }
}
