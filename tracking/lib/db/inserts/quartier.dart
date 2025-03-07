import 'dart:convert';
import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:tracking/db/database_helper.dart';

class Quartier {
  final String nomquartier;
  final int idVillage;
  final String createdAt;
  final String updatedAt;

  Quartier({
    required this.nomquartier,
    required this.idVillage,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'nomquartier': nomquartier,
      'id_village': idVillage,
      // 'created_at': createdAt,
      // 'updated_at': updatedAt,
    };
  }
}

Future<List<Quartier>> loadQuartiersFromJson() async {
  final jsonList = [
  {
    "nomquartier": "Quartier A",
    "id_village": 68,
    "created_at": "2025-01-24",
    "updated_at": "2025-01-24"
  },
  {
    "nomquartier": "Quartier B",
    "id_village": 69,
    "created_at": "2025-01-24",
    "updated_at": "2025-01-24"
  },
  {
    "nomquartier": "Quartier C",
    "id_village": 327,
    "created_at": "2025-01-24",
    "updated_at": "2025-01-24"
  },
  {
    "nomquartier": "Quartier D",
    "id_village": 68,
    "created_at": "2025-01-24",
    "updated_at": "2025-01-24"
  },
  {
    "nomquartier": "Quartier E",
    "id_village": 69,
    "created_at": "2025-01-24",
    "updated_at": "2025-01-24"
  }
];

return jsonList
    .map((e) => Quartier(
          nomquartier: e['nomquartier'] as String,  // Cast explicite en String
          idVillage: e['id_village'] as int,       // Cast explicite en int
          createdAt: e['created_at'] as String,    // Cast explicite en String
          updatedAt: e['updated_at'] as String,    // Cast explicite en String
        ))
    .toList();

}

Future<void> insertQuartiers() async {
  final quartiers = await loadQuartiersFromJson();
  // Insert quartiers into the database
  final db = await DatabaseHelper.instance.database;
  for (var quartier in quartiers) {
    await db.insert(
      'quartiers',
      quartier.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
