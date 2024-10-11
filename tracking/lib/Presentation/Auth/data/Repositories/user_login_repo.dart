import 'dart:convert';




import 'package:http/http.dart' as http;
import 'package:tracking_pregnant/API/constants_urls.dart';


abstract class UserLoginRepository {
  Future<String> logUser(String pwd, String email);
}




class UserLoginRepo extends UserLoginRepository {
  @override
  Future<String> logUser(String pwd, String email) async {
    
    final response = await http.post(Uri.parse("$baseUrl$login"),
        body: {"password": pwd, "email": email});

        print(Uri.parse("$baseUrl$login"));
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body)['jwt'];
    } else {
      print("ERROR IN API CALL ${response.statusCode}");
      throw Exception('Failed to load API data');
    }
  }
}
