import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SecretInfo {
  Future<Map<String, dynamic>> decodeToken() async {
   String? token = await retrieveToken();
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
      return decodedToken;
   
  }

  /// Checks if the given token has expired.
  ///
  /// Returns a boolean indicating whether the token has expired.
  ///
  /// Returns:
  /// - `bool`: A boolean indicating whether the token has expired.
 Future<bool> refreshToken() async {
  String? token = await retrieveToken();

  if (token==null) {
    // Token is empty, consider it as invalid
    return true;
  } else {
    bool hasExpired = JwtDecoder.isExpired(token);
    return hasExpired;
  }
}

    
  

  /// Retrieves the expiration date of the token.
  ///
  /// Returns a `DateTime` object representing the expiration date of the token.
  Future<DateTime> expirationDate() async{
    String? value = await retrieveToken();
    DateTime expirationDate = JwtDecoder.getExpirationDate(value!);

    return expirationDate;
  }

  removeToken() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: "token");
  }

  /// Stores the given token in secure storage.
  ///
  /// Parameters:
  /// - `value`: The token value to be stored.
  ///
  /// Returns:
  /// - `Future<void>`: A Future that completes when the token is stored successfully.
  ///
  /// Throws:
  /// - `Exception`: If there is an error storing the token.
  void storeToken(String value) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: "token", value: value);
  }

// Retrieves the token from storage asynchronously and yields the token if it is not empty. Throws an error if the token is empty.
  Future<String?> retrieveToken() async {
    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: "token");
      return value;
   
  }
}
