import 'package:tracking/Presentation/visite/data/Models/visite_model.dart';
import 'package:tracking/db/database_helper.dart';

Future<List<Map<String, dynamic>>> retrievedVillagesData() async {
  final db = await DatabaseHelper.instance.database;

  // Récupérer toutes les lignes insérées
  List<Map<String, dynamic>> result = await db.query('villages');

  return result;
}

/* --------------------------------- Motifs --------------------------------- */

Future<List<Map<String, dynamic>>> retrievedMotifsData() async {
  final db = await DatabaseHelper.instance.database;

  // Récupérer toutes les lignes insérées
  List<Map<String, dynamic>> result = await db.query('motifs');

  return result;
}

/* --------------------------------- Visite --------------------------------- */
Future<List<VisiteModel>> retrievedVisiteData() async {
  final db = await DatabaseHelper.instance.database;

  // Récupérer toutes les lignes insérées
  List<Map<String, dynamic>> result = await db.query('visites');

  List<VisiteModel> visites =
      result.map((json) => VisiteModel.fromMap(json)).toList();

  return visites;
}

/* ------------------------------- Professions ------------------------------ */

Future<List<Map<String, dynamic>>> retrievedProfessionsData() async {
  final db = await DatabaseHelper.instance.database;

  // Récupérer toutes les lignes insérées
  List<Map<String, dynamic>> result = await db.query('professions');

  return result;
}
