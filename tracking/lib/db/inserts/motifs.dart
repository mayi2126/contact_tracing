
import 'package:sqflite/sqflite.dart';
import 'package:tracking/db/database_helper.dart';
import 'package:tracking/externe-data/repo/motif_repo.dart';

Future<void> insertMotifs(List<Map<String, dynamic>> motifs) async {
  final db = await DatabaseHelper.instance.database;
  final batch = db.batch();

  for (var motif in motifs) {
    batch.insert('motifs', motif,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  await batch.commit();
}

Future<void> insertMotifsFromApi() async {
  // DatabaseHelper.instance.database;
  MotifsRepository motifRepository = MotifsRepository();
  final motifs = await motifRepository.fetchMotifs();
  await insertMotifs(motifs);
}

