import 'dart:convert';

import 'package:tracking/API/constants_urls.dart';
import 'package:tracking/Presentation/Auth/data/Models/user_token.dart';
import 'package:http/http.dart' as http;
import 'package:tracking/Presentation/recencement/data/Models/member.dart';
import 'package:tracking/components/utils/load_user.dart';

abstract class AddMember {
  Future<bool> addMemberMenage(Member member);
}

class AddMemberImpl implements AddMember {
  @override
  Future<bool> addMemberMenage(Member member) async{
   final url = Uri.parse("$baseUrl$addMemberMenagePath");
   print(url);

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
        "membredatenaissrec": member.membredatenaissrec,
        "membrenomrec": member.membreagerec,
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