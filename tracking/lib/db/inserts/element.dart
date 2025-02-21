
import 'package:sqflite/sqflite.dart';
import 'package:tracking/db/database_helper.dart';
import 'package:tracking/externe-data/repo/element_de_donnes.dart';
import 'package:tracking/externe-data/repo/motif_repo.dart';

Future<void> insertElements(List<Map<String, dynamic>> elements) async {
  final db = await DatabaseHelper.instance.database;
  final batch = db.batch();

  for (var el in elements) {
    batch.insert('elements', el,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  await batch.commit();
}

Future<void> insertElementsFromApi() async {
  // DatabaseHelper.instance.database;
  ElementsRepository elementRepository = ElementsRepository();
  final elements = await elementRepository.fetchElements();
  await insertElements(elements);
}

