import 'package:tracking/Presentation/visite/data/Models/visite.dart';
import 'package:tracking/Presentation/visite/data/Repository/visite_repo.dart';
import 'package:tracking/db/database_helper.dart';

Future<void> syncVisites() async {
  VisiteRepositoryImpl visiteRepository = VisiteRepositoryImpl();
  final db = await DatabaseHelper.instance.database;

  // Récupérer toutes les lignes insérées
  List<Map<String, dynamic>> result = await db.query('visites');

  try {
    // Envoyer les données vers le serveur
    // ...
    List<Visite> visites = result.map((json) => Visite.fromMap(json)).toList();

    // Marquer les données comme synchronisées
    for (Visite visite in visites) {
      await visiteRepository.addVisiteDomicile(visite);

      db.delete("visites", where: 'id = ?', whereArgs: [visite.id]);
    }
  
  // ignore: empty_catches
  } catch (e) {
    
  
  }
}
