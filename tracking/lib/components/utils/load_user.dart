import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking/Presentation/Auth/data/Models/user_token.dart';

Future<User?> loadUserData() async {
  try {
    // Récupérer les préférences partagées
    final prefs = await SharedPreferences.getInstance();
    
    // Tenter de récupérer les données utilisateur sous forme de chaîne JSON
    String? userJson = prefs.getString('user_info');

    if (userJson != null) {
      // Si les données sont disponibles, on décode le JSON et on retourne un objet User
      return User.fromJson(jsonDecode(userJson));
    } else {
      // Si aucune donnée utilisateur n'est trouvée
      print('Aucune donnée utilisateur trouvée.');
      return null;
    }
  } catch (e) {
    // En cas d'erreur (par exemple JSON invalide ou échec de récupération)
    print('Erreur lors du chargement des données utilisateur : $e');
    return null;
  }
}
