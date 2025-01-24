import 'package:tracking/Presentation/recencement/data/Models/info_genrec.dart';
import 'package:tracking/Presentation/recencement/data/Models/offline_recensement.dart';
import 'package:tracking/Presentation/recencement/data/Repository/add_member_menage.dart';
import 'package:tracking/Presentation/recencement/data/Repository/add_menage.dart';
import 'package:tracking/Presentation/recencement/data/Repository/add_recensement.dart';
import 'package:tracking/Presentation/recencement/data/Repository/confirmation.dart';
import 'package:tracking/Presentation/visite/data/Models/visite_model.dart';
import 'package:tracking/db/database_helper.dart';
import 'model.dart';
import 'package:intl/intl.dart';
import 'package:tracking/Presentation/recencement/data/Models/menage.dart'
    as menage_rec;
import 'package:tracking/Presentation/recencement/data/Models/member.dart'
    as member_rec;

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
  List<Map<String, dynamic>> result = await db.query('visites', where: 'created_at = ?',
  whereArgs: [DateFormat('yyyy-MM-dd').format(DateTime.now())]);

  print(result);

  List<VisiteModel> visites =
      result.map((json) => VisiteModel.fromMap(json)).toList();

  return visites;
}

/* -------------------------------- Causerie -------------------------------- */

Future<List<VisiteModel>> retrievedCauserieData() async {
  final db = await DatabaseHelper.instance.database;

  // Récupérer toutes les lignes insérées
  List<Map<String, dynamic>> result = await db.query('causeries', where: 'created_at = ?',
  whereArgs: [DateFormat('yyyy-MM-dd').format(DateTime.now())]);

  print(result);

  List<VisiteModel> causeries =
      result.map((json) => VisiteModel.fromMap(json)).toList();

  return causeries;
}

/* ------------------------------- Professions ------------------------------ */

Future<List<Map<String, dynamic>>> retrievedProfessionsData() async {
  final db = await DatabaseHelper.instance.database;

  // Récupérer toutes les lignes insérées
  List<Map<String, dynamic>> result = await db.query('professions');

  return result;
}

/* ------------------------------- RECENSEMent ------------------------------ */

Future<List<Map<String, dynamic>>>
    fetchInfosWithMenagesAndRecensements() async {
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
      membres.observationrec,
      membres.membredatenaissrec,
      membres.agemois,
      membres.idprofessionref
    FROM infos
    LEFT JOIN menages ON infos.id = menages.info_id
    LEFT JOIN membres ON menages.id = membres.menage_id;
  ''');
}

Future<List<OffLineRecensement>>
    fetchTodaysInfosWithMenagesAndRecensements() async {
  final db = await DatabaseHelper.instance.database;

  List<Map<String, dynamic>> result = await db.rawQuery('''
    SELECT 
      infos.id AS id,
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
      membres.observationrec,
      membres.membredatenaissrec,
      membres.agemois,
      membres.idprofessionref 
    FROM infos
    LEFT JOIN menages ON infos.id = menages.info_id
    LEFT JOIN membres ON menages.id = membres.menage_id
    WHERE infos.created_at = DATE('now');
  ''');
  try {
   List<OffLineRecensement> infos = result.map((json) => OffLineRecensement.fromMap(json)).toList();
      return infos;
    
  } catch (e) {
    print(e.toString());
    return [];
  }



}

Future<List<Info>> fetchInfos() async {
  final List<Map<String, dynamic>> results =
      await fetchInfosWithMenagesAndRecensements();

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
            dateNaissance: row['membredatenaissrec'],
            ageMois: row['agemois'],
            idProfession: row['idprofessionref']);

        Menage currentMenage =
            info.menages.firstWhere((m) => m.id == menage.id);
        if (!currentMenage.membres.any((mb) => mb.id == membre.id)) {
          currentMenage.membres.add(membre);
        }
      }
    }
  }

  return infosMap.values.toList();
}

Future<void> fetchAndPrintInfos() async {
  List<Info> infos = await fetchInfos();

  for (var info in infos) {
    print('Info ID: ${info.id}, Quartier: ${info.idQuartier}, Date: ${info.dateRecensement}');
    //info object
    InfoGenRec infoGenRec = InfoGenRec(idquartier: info.idQuartier, daterecensement: info.dateRecensement, localisationgpsrec: info.localisationGpsRec, userEnreg: 1);
    // //send to api
    await AddRecensementRepositoryImpl().storeInfoGenRec(infoGenRec);

    for (var menage in info.menages) {
      print(
          '  Menage ID: ${menage.id}, Chef: ${menage.nomChef} ${menage.prenomChef}');
      //menage object
      menage_rec.Menage menageGenRec = menage_rec.Menage(nomchefmenagerec: menage.nomChef, prenomchefmenagerec: menage.prenomChef, userEnreg: 1);
      // //send to api
      await AddMenageRepositoryImpl().addMenage(menageGenRec);

      for (var membre in menage.membres) {
        print(
            '    Membre ID: ${membre.id}, Nom: ${membre.nom} ${membre.prenom}, Age: ${membre.dateNaissance}');
        //membre object
        member_rec.Member membreGenRec = member_rec.Member(membreagerec: membre.age, membrenomrec: membre.nom, membreprenomrec: membre.prenom, userEnreg: 1,membredatenaissrec: DateTime.parse( membre.dateNaissance),agemois: membre.ageMois,sexezerovingtquatremoisrec: membre.sexe,contactrec: membre.contact,observationrec: membre.observation,idprofessionref: membre.idProfession);
        // //send to api
        await AddMemberImpl().addMemberMenage(membreGenRec);
      }
    }

    try {
    bool result = await RecConfRepositoryImpl().recConf();
      if (result) {
        final db = await DatabaseHelper.instance.database;
        db.delete("membres");
        db.delete('menages');
        db.delete("infos");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
