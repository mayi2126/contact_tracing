import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tracking_pregnant/API/constants_urls.dart';
import 'package:tracking_pregnant/app/storage/local_storage.dart';

abstract class UserLoginRepository {
  Future<String> logUser(String pwd, String email);
}

class UserLoginRepo extends UserLoginRepository {
  @override
  Future<String> logUser(String pwd, String email) async {
    final response = await http.post(Uri.parse("$baseUrl$login"),
        body: {"password": pwd, "email": email});

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final token = jsonResponse['authorisation']['token'];
      
      await storeToken(token);
      
      return token;
    } else {
      print("ERROR IN API CALL ${response.statusCode}");
      throw Exception('Failed to load API data');
    }
  }
}
