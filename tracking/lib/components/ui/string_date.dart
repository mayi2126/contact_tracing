import 'package:intl/intl.dart';

String dateStringFormat(String? date) {
  if (date == null) {
    return '';
  }
  DateTime dateTime = DateTime.parse(date);

    // Formater la date sans l'heure en utilisant 'd MMMM yyyy'
    String formattedDate = DateFormat('d MMMM yyyy','fr').format(dateTime);

    return formattedDate;
}