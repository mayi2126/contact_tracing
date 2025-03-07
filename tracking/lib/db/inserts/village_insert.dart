import 'package:sqflite/sqflite.dart';
import 'package:tracking/db/database_helper.dart';
import 'package:tracking/externe-data/repo/village_repo.dart';



// Insérer un village
Future<int> insertVillage(Map<String, dynamic> village) async {
  final db = await DatabaseHelper.instance.database;
  return await db.insert('villages', village);
}

// Insérer plusieurs villages en une fois
Future<void> insertVillages(List<Map<String, dynamic>> villages) async {
  final db = await DatabaseHelper.instance.database;
  final batch = db.batch();

  for (var village in villages) {
    batch.insert('villages', village,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  await batch.commit();
}

Future<void> insertVillagesFromApi() async {
  // DatabaseHelper.instance.database;
  VillageRepository villageRepository = VillageRepository();
  final villages = await villageRepository.fetchVillage();
  await insertVillages(villages);
}



