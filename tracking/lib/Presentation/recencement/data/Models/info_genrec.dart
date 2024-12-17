import 'dart:convert';

class InfoGenRec {
    int idquartier;
    String daterecensement;
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
        String? daterecensement,
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
        daterecensement: json["daterecensement"],
        localisationgpsrec: json["localisationgpsrec"],
        userEnreg: json["userEnreg"],
    );

    Map<String, dynamic> toMap() => {
        "Idquartier": idquartier,
        "daterecensement": daterecensement,
        "localisationgpsrec": localisationgpsrec,
        "userEnreg": userEnreg,
    };
}
