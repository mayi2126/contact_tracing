// lib/db/database_helper.dart

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'tables_creation.dart'; // Importer le fichier de création des tables

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  // Récupérer l'instance de la base de données
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();

    return _database!;
  }

  // Initialiser la base de données
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'tracks.db');
    // await deleteDatabase(path); // supprimer la base de données existante
    print("Chemin de la base de données: $path");

    final db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );

    // Vérifier les tables
    await checkTables(db);

    return db;
  }

  // Fonction pour créer les tables
  Future _onCreate(Database db, int version) async {
    print('Création des tables...');
    await createTableVisites(db);
    await createTableVillages(db);
    await createTableMotifs(db);
    await createTableProfessions(db);
    await createTables(db);
    await createTableCauseries(db);
    print('Création des tables terminée');
  }

  // Vérifier l'existence des tables
  Future<void> checkTables(Database db) async {
    List<Map<String, dynamic>> result =
        await db.rawQuery('SELECT name FROM sqlite_master WHERE type="table"');
    print('Tables dans la base de données: $result');
  }

  // Fermer la base de données
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
