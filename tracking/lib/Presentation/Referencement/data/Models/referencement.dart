
import 'dart:convert';

class Referencement {
    String? fullName;
    String? nomquartier;
    String? nomvillage;
    String? libcpecm;
    String? sexezerovingtquatremoisrec;
    int? membreagerec;
    String? recommandation;
    String? agegrossesse;
    String? dateref;
    String? libmotif;
    String? refereVers;
    String? prestatairesoins;
    String? dateprochainrdv;
    String? grossesseconfirme;

    Referencement({
        required this.fullName,
        required this.nomquartier,
        required this.nomvillage,
        required this.libcpecm,
        required this.sexezerovingtquatremoisrec,
        required this.membreagerec,
        required this.recommandation,
        required this.agegrossesse,
        required this.dateref,
        required this.libmotif,
        required this.refereVers,
        required this.prestatairesoins,
        required this.dateprochainrdv,
        required this.grossesseconfirme,
    });

    Referencement copyWith({
String? grossesseconfirme,
        String? fullName,
        String? nomquartier,
        String? nomvillage,
        String? libcpecm,
        String? sexezerovingtquatremoisrec,
        int? membreagerec,
        String? recommandation,
        String? agegrossesse,
        String? dateref,
        String ? libmotif,
        String? refereVers,
        String? prestatairesoins,
        String? dateprochainrdv,
    }) => 
        Referencement(
          grossesseconfirme: grossesseconfirme ?? this.grossesseconfirme,
          dateprochainrdv: dateprochainrdv ?? this.dateprochainrdv,
          prestatairesoins: prestatairesoins ?? this.prestatairesoins,
          refereVers: refereVers ?? this.refereVers,
          libmotif: libmotif ?? this.libmotif,
          dateref: dateref ?? this.dateref,
          agegrossesse: agegrossesse ?? this.agegrossesse,
          recommandation: recommandation ?? this.recommandation,
            fullName: fullName ?? this.fullName,
            nomquartier: nomquartier ?? this.nomquartier,
            nomvillage: nomvillage ?? this.nomvillage,
            libcpecm: libcpecm ?? this.libcpecm,
            sexezerovingtquatremoisrec: sexezerovingtquatremoisrec ?? this.sexezerovingtquatremoisrec,
            membreagerec: membreagerec ?? this.membreagerec,
        );

    factory Referencement.fromJson(String str) => Referencement.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Referencement.fromMap(Map<String, dynamic> json) => Referencement(
      grossesseconfirme: json["grossesseconfirme"],
      dateprochainrdv: json["dateprochainrdv"],
      prestatairesoins: json["prestatairesoins"],
      refereVers: json["refereVers"],
      libmotif: json["libmotif"],
      dateref: json["dateref"],
      agegrossesse: json["agegrossesse"],
      recommandation: json["recommandation"],
        fullName: json["full_name"],
        nomquartier: json["nomquartier"],
        nomvillage: json["nomvillage"],
        libcpecm: json["libcpecm"],
        sexezerovingtquatremoisrec: json["sexezerovingtquatremoisrec"],
        membreagerec: json["membreagerec"],
    );

    Map<String, dynamic> toMap() => {
      "grossesseconfirme": grossesseconfirme,
      "dateprochainrdv": dateprochainrdv,
      "prestatairesoins": prestatairesoins,
      "refereVers": refereVers,
      "libmotif": libmotif,
      "dateref": dateref,
      "agegrossesse":agegrossesse,
        "full_name": fullName,
        "nomquartier": nomquartier,
        "nomvillage": nomvillage,
        "libcpecm": libcpecm,
        "sexezerovingtquatremoisrec": sexezerovingtquatremoisrec,
        "membreagerec": membreagerec,
        "recommandation": recommandation
    };
}
