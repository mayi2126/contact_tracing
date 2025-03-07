
import 'package:sqflite/sqflite.dart';
import 'package:tracking/db/database_helper.dart';
import 'package:tracking/externe-data/repo/professions_repo.dart';

Future<void> insertProfessions(List<Map<String, dynamic>> professions) async {
  final db = await DatabaseHelper.instance.database;
  final batch = db.batch();

  for (var profession in professions) {
    batch.insert('professions', profession,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  await batch.commit();
}

Future<void> inserProfessionsFromApi() async {
  // DatabaseHelper.instance.database;
  ProfessionsRepository motifRepository = ProfessionsRepository();
  final professions = await motifRepository.fetchProfessions();
  await insertProfessions(professions);
}

