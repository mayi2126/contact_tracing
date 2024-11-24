import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking_pregnant/Presentation/Auth/data/Models/user_token.dart';

class UserRepository {
  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user.toJson());  // Convert user object to JSON string
    await prefs.setString('user_info', userJson); // Save the JSON string
  }

  Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user_info'); // Retrieve the JSON string
    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson); // Convert back to Map
      return User.fromJson(userMap); // Return User object
    }
    return null;
  }

  Future<void> removeUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_info'); // Remove the saved user info
  }
}
