import 'package:sqflite/sqflite.dart';

// Fonction pour créer les tables
Future<void> createTableVillages(Database db) async {
  // Création de la table "villages"
  await db.execute('''
    CREATE TABLE IF NOT EXISTS villages (
      id INTEGER PRIMARY KEY,
      nomvillage TEXT,
      idfsvillage INTEGER,
      created_at TEXT,
      updated_at TEXT,
      formation1 TEXT
    )
  ''');
  print("Tables créées avec succès !");
}

Future<void> createTableVisites(Database db) async {
  await db.execute(''' 
    CREATE TABLE IF NOT EXISTS visites(
      id INTEGER PRIMARY KEY,
      Idquartier INTEGER,
      Idvillage INTEGER,
      IdelementDonnee INTEGER,
      lieuAp TEXT,
      dateAp TEXT,
      nbrepersonnetoucheeFnq INTEGER,
      nbrepersonnetoucheeFE INTEGER,
      nbrepersonnetoucheeFA INTEGER,
      nbrepersonnetoucheeH INTEGER,
      nbreenfantzvtouche INTEGER,
      nbreautrestouche TEXT,
      libelementdedonnee TEXT
    )
  ''');
}


Future<void> createTableElementsDonnees(Database db) async {
  await db.execute('''
    CREATE TABLE IF NOT EXISTS elementsDonnees(
      id INTEGER PRIMARY KEY,
      nomElementDonnee TEXT,
      idfselementDonnee INTEGER,
      created_at TEXT,
      updated_at TEXT
    )
  ''');
}


Future<void> createTableQuartiers(Database db) async {
  await db.execute('''
    CREATE TABLE IF NOT EXISTS quartiers(
      id INTEGER PRIMARY KEY,
      nomquartier TEXT,
      idfsquartier INTEGER,
      created_at TEXT,
      updated_at TEXT
    )
  ''');
}

Future<void> createTableMotifs(Database db) async {

  await db.execute(''' 
  CREATE TABLE IF NOT EXISTS motifs (
      id INTEGER PRIMARY KEY,
      libmotif TEXT,
      userenreg TEXT NULL,
      created_at TEXT,
      updated_at TEXT
      )
  
  ''');
}

Future<void> createTableProfessions(Database db) async {
await db.execute('''
CREATE TABLE IF NOT EXISTS professions(
      id INTEGER PRIMARY KEY,
      userenreg INTEGER NULL,
      libprofession TEXT,
      created_at TEXT,
      updated_at TEXT
    )
  ''');
}

