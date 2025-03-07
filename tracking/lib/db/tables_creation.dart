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
      libelementdedonnee TEXT,
      created_at DATE DEFAULT (DATE('now'))
    )
  ''');
}
Future<void> createTableCauseries(Database db) async {
  await db.execute(''' 
    CREATE TABLE IF NOT EXISTS causeries(
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
      libelementdedonnee TEXT,
      created_at DATE DEFAULT (DATE('now'))
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
      id_village INTEGER,
      created_at DATE DEFAULT (DATE('now')),
      updated_at DATE DEFAULT (DATE('now')),
      FOREIGN KEY (id_village) REFERENCES villages(id)
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
Future<void> createTableElements(Database db) async {
await db.execute('''
CREATE TABLE IF NOT EXISTS elements(
      id INTEGER PRIMARY KEY,
      libelementdedonnee TEXT,
      type TEXT NULL
    )
  ''');
}


Future<void> createTables(Database db) async {
    // Crée la table Eklou
    await db.execute('''
      CREATE TABLE IF NOT EXISTS infos (
        id INTEGER PRIMARY KEY,
        idquartier INTEGER,
        daterecensement TEXT,
        localisationgpsrec TEXT,
        userEnreg INTEGER DEFAULT 0,
        created_at DATE DEFAULT (DATE('now'))
      )
    ''');

    // Crée la table Menage
    await db.execute('''
      CREATE TABLE IF NOT EXISTS menages (
        id INTEGER PRIMARY KEY,
        nomchefmenagerec TEXT,
        prenomchefmenagerec TEXT,
        userEnreg INTEGER DEFAULT 0,
        info_id INTEGER,
        FOREIGN KEY (info_id) REFERENCES infos(id)
      )
    ''');

    // Crée la table Recencement
    await db.execute('''
      CREATE TABLE IF NOT EXISTS membres (
        id INTEGER PRIMARY KEY,
        membredatenaissrec TEXT,
        userEnreg INTEGER DEFAULT 0,
        membrenomrec TEXT,
        membreprenomrec TEXT,
        membreagerec INTEGER,
        sexezerovingtquatremoisrec TEXT,
        contactrec TEXT,
        observationrec TEXT,
        agemois INTEGER,
        idprofessionref INTEGER,
        menage_id INTEGER,
        FOREIGN KEY (menage_id) REFERENCES menages(id)
      )
    ''');
  }

