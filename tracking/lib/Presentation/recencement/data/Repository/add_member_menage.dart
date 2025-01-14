import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:tracking/API/constants_urls.dart';
import 'package:tracking/Presentation/Auth/data/Models/user_token.dart';
import 'package:http/http.dart' as http;
import 'package:tracking/Presentation/recencement/data/Models/member.dart';
import 'package:tracking/components/utils/load_user.dart';
import 'package:tracking/db/inserts/recensement.dart';

abstract class AddMember {
  Future<bool> addMemberMenage(Member member);
}

class AddMemberImpl implements AddMember {
  @override
  Future<bool> addMemberMenage(Member member) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    try {
      if (connectivityResult.first == ConnectivityResult.none) {
        int result = await insertIntoMembres(
            member.membrenomrec,
            member.membreprenomrec,
            member.membreagerec,
            member.sexezerovingtquatremoisrec,
            member.contactrec,
            member.observationrec,
            member.agemois,
            member.idprofessionref,
            member.userEnreg);
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
    final url = Uri.parse("$baseUrl$addMemberMenagePath");

    // TODO: Implement the actual API call to store the member
    // You can use a package like http or dio to make the API call
    // and handle the response accordingly
    User? user = await loadUserData();

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "membredatenaissrec": member.membredatenaissrec.toString(),
        "membrenomrec": member.membrenomrec,
        "membreprenomrec": member.membreprenomrec,
        "membreagerec": member.membreagerec,
        "agemois": member.agemois,
        "sexezerovingtquatremoisrec": member.sexezerovingtquatremoisrec,
        "contactrec": member.contactrec,
        "idprofessionref": member.idprofessionref,
        "observationrec": member.observationrec,
        "userEnreg": user!.id
      }),
    );

    if (response.statusCode == 201) {
      print('Membre créé avec succès !');
      return true;
    } else {
      print('Échec de la création du Membre : ${response.statusCode}');
      return false;
    }
  }
}
