import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tracking/API/constants_urls.dart';
import 'package:tracking/Presentation/Auth/data/Models/user_token.dart';
import 'package:tracking/Presentation/Auth/data/Repositories/auth_user.dart';
import 'package:tracking/app/storage/local_storage.dart';

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
      print(token);
      final userRepository = UserRepository();

      await storeToken(token);
      // Assuming you got the JSON response from the server:
      Map<String, dynamic> userJson = jsonDecode(response.body)['user'];
      print(userJson);
      User user = User.fromJson(userJson);

// Save user data
      await userRepository.saveUser(user);

      return token;
    } else {
      print("ERROR IN API CALL ${response.statusCode}");
      throw Exception('Failed to load API data');
    }
  }
}
