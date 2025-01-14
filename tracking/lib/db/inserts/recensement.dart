
import 'package:sqflite/sqflite.dart';
import 'package:tracking/db/database_helper.dart';

Future<int> insertIntoMembres( String nom, String prenom, int age, String sexe, String contact, String observation, int agemois, int idProfession,  int userEnreg) async {
  final db = await DatabaseHelper.instance.database;
  int? menageId = await getLastInsertedId(db, 'menages');

  return await db.insert(
    'membres',
    {
      'membrenomrec': nom,
      'membreprenomrec': prenom,
      'membreagerec': age,
      'sexezerovingtquatremoisrec': sexe,
      'contactrec': contact,
      'observationrec': observation,
      'agemois': agemois,
      'idprofessionref': idProfession,
      'menage_id': menageId,
      'userEnreg': userEnreg,
    },
  );
}

Future<int> insertIntoMenages( String nomchef, String prenomchef, int userEnreg) async {
final db = await DatabaseHelper.instance.database;

  int? infoId = await getLastInsertedId(db, 'infos');

  return await db.insert(
    'menages',
    {
      'nomchefmenagerec': nomchef,
      'prenomchefmenagerec': prenomchef,
      'userEnreg': userEnreg,
      'info_id': infoId,
    },
  );
}


Future<int> insertIntoInfos(int idquartier, String daterecensement, String localisationgpsrec, int userEnreg) async {

  final db = await DatabaseHelper.instance.database;
  
  return await db.insert(
    'infos',
    {
      'idquartier': idquartier,
      'daterecensement': daterecensement,
      'localisationgpsrec': localisationgpsrec,
      'userEnreg': userEnreg,
    },
  );
}


Future<int?> getLastInsertedId(Database db, String tableName) async {

  
  final result = await db.rawQuery('SELECT id FROM $tableName ORDER BY id DESC LIMIT 1');
  if (result.isNotEmpty) {
    return result.first['id'] as int?;
  }
  return null;
}
