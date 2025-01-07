import 'package:tracking/Presentation/visite/data/Models/visite.dart';
import 'package:tracking/db/database_helper.dart';

Future<int> insertVisite(Visite visite) async {
  final db = await DatabaseHelper.instance.database;
  return await db.insert('visites', visite.toMap());
}
