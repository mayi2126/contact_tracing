import 'package:meta/meta.dart';
import 'dart:convert';

class InfoGenRec {
    int idquartier;
    DateTime daterecensement;
    String localisationgpsrec;
    int userEnreg;

    InfoGenRec({
        required this.idquartier,
        required this.daterecensement,
        required this.localisationgpsrec,
        required this.userEnreg,
    });

    InfoGenRec copyWith({
        int? idquartier,
        DateTime? daterecensement,
        String? localisationgpsrec,
        int? userEnreg,
    }) => 
        InfoGenRec(
            idquartier: idquartier ?? this.idquartier,
            daterecensement: daterecensement ?? this.daterecensement,
            localisationgpsrec: localisationgpsrec ?? this.localisationgpsrec,
            userEnreg: userEnreg ?? this.userEnreg,
        );

    factory InfoGenRec.fromJson(String str) => InfoGenRec.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory InfoGenRec.fromMap(Map<String, dynamic> json) => InfoGenRec(
        idquartier: json["Idquartier"],
        daterecensement: DateTime.parse(json["daterecensement"]),
        localisationgpsrec: json["localisationgpsrec"],
        userEnreg: json["userEnreg"],
    );

    Map<String, dynamic> toMap() => {
        "Idquartier": idquartier,
        "daterecensement": "${daterecensement.year.toString().padLeft(4, '0')}-${daterecensement.month.toString().padLeft(2, '0')}-${daterecensement.day.toString().padLeft(2, '0')}",
        "localisationgpsrec": localisationgpsrec,
        "userEnreg": userEnreg,
    };
}
