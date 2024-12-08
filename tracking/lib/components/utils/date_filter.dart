import 'package:intl/intl.dart';
import 'package:tracking/Presentation/visite/data/Models/visite_model.dart';  // Importez ce package pour formater les dates

// Fonction pour filtrer les résultats
List<VisiteModel> filterResultsByToday(List<VisiteModel> result) {
  // Obtenez la date actuelle sous forme de chaîne formatée (ex: "2024-11-29")
  String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

  // Filtrer les éléments où 'created_at' est aujourd'hui
  return result.where((visite) {
    // Convertir la date 'created_at' en DateTime et formater uniquement la partie date
    String createdAtDate = DateFormat('yyyy-MM-dd').format(DateTime.parse(visite.createdAt));

    // Comparer la date d'enregistrement avec la date d'aujourd'hui
    return createdAtDate == today;
  }).toList();
}



