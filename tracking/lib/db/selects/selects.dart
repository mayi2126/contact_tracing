import 'package:tracking/Presentation/visite/data/Models/visite_model.dart';
import 'package:tracking/db/database_helper.dart';
import 'model.dart';

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



/* ------------------------------- RECENSEMent ------------------------------ */

Future<List<Map<String, dynamic>>> fetchInfosWithMenagesAndRecensements() async {

    final db = await DatabaseHelper.instance.database;

  return await db.rawQuery('''
    SELECT 
      infos.id AS info_id,
      infos.idquartier,
      infos.daterecensement,
      infos.localisationgpsrec,
      menages.id AS menage_id,
      menages.nomchefmenagerec,
      menages.prenomchefmenagerec,
      membres.id AS membre_id,
      membres.membrenomrec,
      membres.membreprenomrec,
      membres.membreagerec,
      membres.sexezerovingtquatremoisrec,
      membres.contactrec,
      membres.observationrec
    FROM infos
    LEFT JOIN menages ON infos.id = menages.info_id
    LEFT JOIN membres ON menages.id = membres.menage_id;
  ''');
}



Future<List<Info>> fetchInfos() async {

  final List<Map<String, dynamic>> results = await fetchInfosWithMenagesAndRecensements();

  Map<int, Info> infosMap = {};

  for (var row in results) {
    // Récupérer ou créer un Info
    if (!infosMap.containsKey(row['info_id'])) {
      infosMap[row['info_id']] = Info(
        id: row['info_id'],
        idQuartier: row['idquartier'],
        dateRecensement: row['daterecensement'],
        localisationGpsRec: row['localisationgpsrec'],
        menages: [],
      );
    }

    // Récupérer l'info courante
    Info info = infosMap[row['info_id']]!;

    // Ajouter un Menage
    if (row['menage_id'] != null) {
      Menage menage = Menage(
        id: row['menage_id'],
        nomChef: row['nomchefmenagerec'],
        prenomChef: row['prenomchefmenagerec'],
        membres: [],
      );

      if (!info.menages.any((m) => m.id == menage.id)) {
        info.menages.add(menage);
      }

      // Ajouter un Membre
      if (row['membre_id'] != null) {
        Membre membre = Membre(
          id: row['membre_id'],
          nom: row['membrenomrec'],
          prenom: row['membreprenomrec'],
          age: row['membreagerec'],
          sexe: row['sexezerovingtquatremoisrec'],
          contact: row['contactrec'],
          observation: row['observationrec'],
        );

        Menage currentMenage = info.menages.firstWhere((m) => m.id == menage.id);
        if (!currentMenage.membres.any((mb) => mb.id == membre.id)) {
          currentMenage.membres.add(membre);
        }
      }
    }
  }

  return infosMap.values.toList();
}


void fetchAndPrintInfos() async {

      

  List<Info> infos = await fetchInfos();

  for (var info in infos) {
    print('Info ID: ${info.id}, Quartier: ${info.idQuartier}, Date: ${info.dateRecensement}');
    for (var menage in info.menages) {
      print('  Menage ID: ${menage.id}, Chef: ${menage.nomChef} ${menage.prenomChef}');
      for (var membre in menage.membres) {
        print('    Membre ID: ${membre.id}, Nom: ${membre.nom} ${membre.prenom}, Age: ${membre.age}');
      }
    }
  }
}

